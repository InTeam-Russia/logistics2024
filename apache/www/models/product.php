<?php

namespace models;


use \core\db;

class product
{
    // обязательно: name, price, amount,
    // дополнительно: size, img, category

    /**
     * @var int ID товара
     */
    public int $id;
    /**
     * @var int ID компании, поставлющей товар
     */
    public int $company_id;
    /**
     * @var string Название товара
     */
    public string $name;
    /**
     * @var float Цена товара в рублях
     */
    public float $price;
    /**
     * @var int Количество товара на складах
     */
    public int $amount = 0;
    /**
     * @var string|null Размер товара, если указан, иначе null
     */
    public ?string $size = null;
    /**
     * @var string|null Путь к фото товара, если оно есть, иначе null
     */
    public ?string $img = null;
    /**
     * @var int|null ID категории, к которой относится товар (по умолчанию ID1 - "Разное")
     */
    public int $category = 1;
    /**
     * @var bool Является ли товар в настоящее время скрытым от глаз людских
     */
    public bool $hidden = false;

    /**
     * @return int id нового продукта
     * @throws \Exception Не удалось выполнить SQL-запрос
     */
    public function add() : int {
        $db = db::getInstance();
        $sth = $db->pdo->prepare("INSERT INTO public.products(company_id, name, price, amount, size, img, category) VALUES(:company_id, :name, :price, :amount, :size, :img, :category) RETURNING id");
        $this->bindParams($sth);
        if(!$sth->execute()) {
            throw new \Exception("Не могу добавить продукт");
        }
        $this->id = (int)($sth->fetch(\PDO::FETCH_NUM)[0]);
        return $this->id;
    }

    /**
     * @return bool успешно ли
     */
    public function save() : bool {
        $db = db::getInstance();
        $sth = $db->pdo->prepare("UPDATE products SET company_id = :company_id,  name = :name, price = :price, amount = :amount, size = :size, img = :img, category = :category WHERE id = :id");
        $this->bindParams($sth);
        return $sth->execute();
    }

    public function bindParams(&$sth) {
        if(isset($this->id))
            $sth->bindParam(':id', $this->id, \PDO::PARAM_INT);
        $sth->bindParam(':company_id', $this->company_id, \PDO::PARAM_INT);
        $sth->bindParam(':name', $this->name, \PDO::PARAM_STR);
        $sth->bindParam(':price', $this->price);
        $sth->bindParam(':amount', $this->amount, \PDO::PARAM_INT);
        $sth->bindParam(':size', $this->size);
        $sth->bindParam(':img', $this->img);
        $sth->bindParam(':category', $this->category, \PDO::PARAM_INT);

    }

    public static function get(int $id) : self {
        $db = db::getInstance();
        $sth = $db->pdo->prepare("SELECT * FROM products WHERE id = ?");
        $sth->bindParam(1, $id, \PDO::PARAM_INT);
        $sth->setFetchMode(\PDO::FETCH_CLASS, '\models\product');
        if(!$sth->execute()) {
            throw new \Exception("Не могу получить продукт с данным ID");
        }
        $product = $sth->fetch();
        if($product === false) {
            throw new \Exception("Не могу прочитать продукт с данным ID");
        }
        return $product;
    }
}