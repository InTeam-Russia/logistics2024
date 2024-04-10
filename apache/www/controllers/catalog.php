<?php

namespace controllers;

use core\frontend;
use core\propertyException;
use models\category;
use models\company;
use models\product;

class catalog
{
    /**
     * проверяет корректность id категории и возвращает его
     * @return int|null id категории или null, если выборка по категории не требуется
     * @throws propertyException Ожидался id категории
     * @throws propertyException Категория с таким id не существует
     */
    private function checkCategory() : ?int {
        if(isset($_GET['category'])) {
            if (!is_numeric($_GET['category'])) {
                throw new propertyException('Ожидался id категории');
            }
            $id = (int)$_GET['category'];
            if (!category::exists($id)) {
                throw new propertyException('Категория с таким id не существует');
            }
            return $id;
        }
        return null;
    }

    /**
     * проверяет id компании и возвращает его
     * @return int|null id компании или null, если выборка по компании не требуется
     * @throws propertyException Ожидался id компании
     * @throws propertyException Компании с таким id не нашлось
     */
    private function checkCompany() : ?int {
        if(isset($_GET['company'])) {
            if(!is_numeric($_GET['company'])) {
                throw new propertyException('Ожидался id компании');
            }
            $id = (int)$_GET['company'];
            if(!company::exists($id)) {
                throw new propertyException('Компании с таким id не нашлось');
            }
            return $id;
        }
        return null;
    }

    /**
     * Проверяет корректность цены товара
     * @param string $tag ключ в массиве $_GET
     * @return float|null цена товара или null
     * @throws propertyException Цена должна являться целым или дробным неотрицательным числом, а не этим вот всем
     */
    private function checkPrice(string $tag) : ?float {
        if(isset($_GET[$tag])) {
            if(!is_float($_GET[$tag]) || (float)$_GET[$tag] < 0) {
                throw new propertyException('Цена ' . $tag . ' должна являться целым или дробным неотрицательным числом, а не этим вот всем');
            }
            return (float)$_GET[$tag];
        }
        return null;
    }

    /**
     * Проверяет корректность количества товара
     * @param string $tag ключ в массиве $_GET
     * @return int|null количество товара или null
     * @throws propertyException Количество должно являться целым неотрицательным числом, а не этим вот всем
     */
    private function checkAmount(string $tag) : ?int {
        if(isset($_GET[$tag])) {
            if(!is_int($_GET[$tag]) || (int)$_GET[$tag] < 0) {
                throw new propertyException('Количество ' . $tag . ' должно являться целым неотрицательным числом, а не этим вот всем');
            }
            return (int)$_GET[$tag];
        }
        return null;
    }


    /**
     * Определяет количество товаров на страницу
     * @return int количество товаров
     * @throws propertyException некорректное количество товаров
     */
    private function checkAmountPerPage() : int {
        $amount = 25;
        if(isset($_GET['per_page'])) {
            if(!is_int($_GET['per_page']) || (int)$_GET['per_page'] <= 0 || (int)$_GET['per_page'] > 25) {
                throw new propertyException('Количество товаров на страницу должно являться целым числом в отрезке [1, 25]');
            }
            $amount = (int)$_GET['per_page'];
        }
        return $amount;
    }

    /**
     * @param int $pagesCount количество страниц
     * @return int номер текущей страницы
     * @throws propertyException Номер страницы должен быть целым неотрицательным числом
     * @throws propertyException Номер страницы не может быть меньше единицы или превышать общее число страниц
     */
    private function getPageNumber(int $pagesCount) : int {
        $page = 1;
        if(isset($_GET['page'])) {
            if(!is_int($_GET['page'])) {
                throw new propertyException('Номер страницы должен быть целым неотрицательным числом');
            }
            $page = (int)$_GET['page'];
            if($page <= 0 || $page > $pagesCount) {
                throw new propertyException('Номер страницы не может быть меньше единицы или превышать общее число страниц');
            }
        }
        return $page;
    }

    /**
     * Получает товары с текущей страницы пагинации
     * @return void
     * @throws propertyException
     */
    public function search() {
        $allFilters = [
            'company_id'   => $this->checkCompany(),
            'category'     => $this->checkCategory(),
            'min_price'    => $this->checkPrice('min_price'),
            'max_price'    => $this->checkPrice('max_price'),
            'min_amount'   => $this->checkAmount('min_amount'),
            'max_amount'   => $this->checkAmount('max_amount'),
            'name'         => $_GET['name']
        ];
        $filters = array_filter($allFilters, function($value) {
            return !is_null($value);
        });
        $perPage = $this->checkAmountPerPage();
        $productsCount = product::filteredSearchCount($filters);
        $pagesCount = ceil($productsCount / $perPage);
        $page = $this->getPageNumber($pagesCount);
        $result = product::filteredSearch($filters, $page, $perPage);
        echo frontend::getInstance()->getResponseJson([
            'total_pages'    => $pagesCount,
            'total_products' => $productsCount,
            'result'         => $result
        ]);
    }
}