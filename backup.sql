--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Debian 16.2-1.pgdg120+2)
-- Dumped by pg_dump version 16.2

-- Started on 2024-04-08 19:54:59 UTC

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 24766)
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart (
    client_id integer NOT NULL,
    product_id integer NOT NULL,
    amount integer NOT NULL
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 24769)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(128),
    icon boolean
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 24772)
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 24775)
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    id integer NOT NULL,
    name character varying(128),
    surname character varying(128),
    photo boolean
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24780)
-- Name: companies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.companies (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    logo character varying(255)
);


ALTER TABLE public.companies OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 24785)
-- Name: feedback; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.feedback (
    id integer NOT NULL,
    client_id integer NOT NULL,
    product_id integer NOT NULL,
    rate integer NOT NULL,
    description text NOT NULL,
    photos boolean NOT NULL
);


ALTER TABLE public.feedback OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24790)
-- Name: infrastructure; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.infrastructure (
    company_id integer NOT NULL,
    city integer NOT NULL,
    storage boolean NOT NULL,
    dp boolean NOT NULL
);


ALTER TABLE public.infrastructure OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 24793)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    company_id integer NOT NULL,
    client_id integer NOT NULL,
    order_type integer NOT NULL,
    product_id integer NOT NULL,
    price double precision NOT NULL,
    amount integer NOT NULL,
    sum double precision NOT NULL,
    start_time timestamp without time zone NOT NULL,
    end_time timestamp without time zone,
    "from" integer NOT NULL,
    "to" integer NOT NULL,
    stage_edge integer,
    stage_type integer NOT NULL,
    active boolean NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 3468 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE orders; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.orders IS 'Заказы';


--
-- TOC entry 223 (class 1259 OID 24796)
-- Name: path_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.path_types (
    id integer NOT NULL,
    name character varying(128),
    description text
);


ALTER TABLE public.path_types OWNER TO postgres;

--
-- TOC entry 3469 (class 0 OID 0)
-- Dependencies: 223
-- Name: TABLE path_types; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.path_types IS 'Типы путей сообщения';


--
-- TOC entry 224 (class 1259 OID 24801)
-- Name: paths; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paths (
    id integer NOT NULL,
    company_id integer,
    departure integer NOT NULL,
    destination integer NOT NULL,
    is_dest_transit boolean,
    type integer,
    duration double precision,
    distance double precision,
    price double precision
);


ALTER TABLE public.paths OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 24804)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    company_id integer NOT NULL,
    category integer,
    name character varying(255) NOT NULL,
    img character varying,
    size character varying(32),
    price double precision NOT NULL,
    amount integer NOT NULL,
    rating double precision,
    hidden boolean DEFAULT true NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 24810)
-- Name: route; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.route (
    id integer NOT NULL,
    order_id integer NOT NULL,
    edge integer NOT NULL,
    prev_stage integer,
    next_stage integer,
    stage_num integer NOT NULL,
    end_time timestamp without time zone NOT NULL
);


ALTER TABLE public.route OWNER TO postgres;

--
-- TOC entry 3470 (class 0 OID 0)
-- Dependencies: 226
-- Name: TABLE route; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.route IS 'Маршрутный лист товара';


--
-- TOC entry 227 (class 1259 OID 24813)
-- Name: storage_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.storage_products (
    company_id integer NOT NULL,
    city_id integer NOT NULL,
    product_id integer NOT NULL,
    amount integer NOT NULL
);


ALTER TABLE public.storage_products OWNER TO postgres;

--
-- TOC entry 3471 (class 0 OID 0)
-- Dependencies: 227
-- Name: TABLE storage_products; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.storage_products IS 'Распределение продукции по складам';


--
-- TOC entry 228 (class 1259 OID 24947)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(320) NOT NULL,
    password character varying(1024) NOT NULL,
    role integer NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 3449 (class 0 OID 24766)
-- Dependencies: 215
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart (client_id, product_id, amount) FROM stdin;
\.


--
-- TOC entry 3450 (class 0 OID 24769)
-- Dependencies: 216
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name, icon) FROM stdin;
\.


--
-- TOC entry 3451 (class 0 OID 24772)
-- Dependencies: 217
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (id, name) FROM stdin;
\.


--
-- TOC entry 3452 (class 0 OID 24775)
-- Dependencies: 218
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clients (id, name, surname, photo) FROM stdin;
\.


--
-- TOC entry 3453 (class 0 OID 24780)
-- Dependencies: 219
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.companies (id, name, description, logo) FROM stdin;
\.


--
-- TOC entry 3454 (class 0 OID 24785)
-- Dependencies: 220
-- Data for Name: feedback; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.feedback (id, client_id, product_id, rate, description, photos) FROM stdin;
\.


--
-- TOC entry 3455 (class 0 OID 24790)
-- Dependencies: 221
-- Data for Name: infrastructure; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.infrastructure (company_id, city, storage, dp) FROM stdin;
\.


--
-- TOC entry 3456 (class 0 OID 24793)
-- Dependencies: 222
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, company_id, client_id, order_type, product_id, price, amount, sum, start_time, end_time, "from", "to", stage_edge, stage_type, active) FROM stdin;
\.


--
-- TOC entry 3457 (class 0 OID 24796)
-- Dependencies: 223
-- Data for Name: path_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.path_types (id, name, description) FROM stdin;
\.


--
-- TOC entry 3458 (class 0 OID 24801)
-- Dependencies: 224
-- Data for Name: paths; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.paths (id, company_id, departure, destination, is_dest_transit, type, duration, distance, price) FROM stdin;
\.


--
-- TOC entry 3459 (class 0 OID 24804)
-- Dependencies: 225
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, company_id, category, name, img, size, price, amount, rating, hidden) FROM stdin;
\.


--
-- TOC entry 3460 (class 0 OID 24810)
-- Dependencies: 226
-- Data for Name: route; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.route (id, order_id, edge, prev_stage, next_stage, stage_num, end_time) FROM stdin;
\.


--
-- TOC entry 3461 (class 0 OID 24813)
-- Dependencies: 227
-- Data for Name: storage_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.storage_products (company_id, city_id, product_id, amount) FROM stdin;
\.


--
-- TOC entry 3462 (class 0 OID 24947)
-- Dependencies: 228
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password, role) FROM stdin;
\.


--
-- TOC entry 3258 (class 2606 OID 24817)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 3260 (class 2606 OID 24819)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- TOC entry 3256 (class 2606 OID 24821)
-- Name: cart client_product; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT client_product PRIMARY KEY (client_id, product_id);


--
-- TOC entry 3262 (class 2606 OID 24823)
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- TOC entry 3264 (class 2606 OID 24825)
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- TOC entry 3268 (class 2606 OID 24827)
-- Name: infrastructure company_in_city; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.infrastructure
    ADD CONSTRAINT company_in_city PRIMARY KEY (company_id, city);


--
-- TOC entry 3472 (class 0 OID 0)
-- Dependencies: 3268
-- Name: CONSTRAINT company_in_city ON infrastructure; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT company_in_city ON public.infrastructure IS 'Строка есть представление об инфраструктуре заданной компании в заданном городе';


--
-- TOC entry 3266 (class 2606 OID 24829)
-- Name: feedback feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_pkey PRIMARY KEY (id);


--
-- TOC entry 3280 (class 2606 OID 24831)
-- Name: storage_products item; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storage_products
    ADD CONSTRAINT item PRIMARY KEY (company_id, product_id, city_id);


--
-- TOC entry 3473 (class 0 OID 0)
-- Dependencies: 3280
-- Name: CONSTRAINT item ON storage_products; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT item ON public.storage_products IS 'Информация о наименовании товара на складе';


--
-- TOC entry 3270 (class 2606 OID 24833)
-- Name: infrastructure one_per_city; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.infrastructure
    ADD CONSTRAINT one_per_city UNIQUE (company_id, city);


--
-- TOC entry 3474 (class 0 OID 0)
-- Dependencies: 3270
-- Name: CONSTRAINT one_per_city ON infrastructure; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT one_per_city ON public.infrastructure IS 'Информация о наличии инфраструктуры заданной компании в заданном поселении представляется единственной уникальной строкой';


--
-- TOC entry 3272 (class 2606 OID 24835)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3274 (class 2606 OID 24837)
-- Name: paths paths_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paths
    ADD CONSTRAINT paths_pkey PRIMARY KEY (id);


--
-- TOC entry 3276 (class 2606 OID 24839)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 3278 (class 2606 OID 24841)
-- Name: route route_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.route
    ADD CONSTRAINT route_pkey PRIMARY KEY (id);


--
-- TOC entry 3282 (class 2606 OID 24953)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3289 (class 2606 OID 24842)
-- Name: infrastructure city; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.infrastructure
    ADD CONSTRAINT city FOREIGN KEY (city) REFERENCES public.cities(id);


--
-- TOC entry 3287 (class 2606 OID 24847)
-- Name: feedback client; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT client FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- TOC entry 3291 (class 2606 OID 24852)
-- Name: orders client; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT client FOREIGN KEY (client_id) REFERENCES public.clients(id) NOT VALID;


--
-- TOC entry 3283 (class 2606 OID 24857)
-- Name: cart client; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT client FOREIGN KEY (client_id) REFERENCES public.clients(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3296 (class 2606 OID 24862)
-- Name: paths company; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paths
    ADD CONSTRAINT company FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- TOC entry 3290 (class 2606 OID 24867)
-- Name: infrastructure company; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.infrastructure
    ADD CONSTRAINT company FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- TOC entry 3292 (class 2606 OID 24872)
-- Name: orders company; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT company FOREIGN KEY (company_id) REFERENCES public.companies(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3299 (class 2606 OID 24877)
-- Name: products company_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT company_id FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- TOC entry 3297 (class 2606 OID 24882)
-- Name: paths departure; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paths
    ADD CONSTRAINT departure FOREIGN KEY (departure) REFERENCES public.cities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3298 (class 2606 OID 24887)
-- Name: paths destination; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paths
    ADD CONSTRAINT destination FOREIGN KEY (destination) REFERENCES public.cities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3293 (class 2606 OID 24892)
-- Name: orders from; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "from" FOREIGN KEY ("from", company_id) REFERENCES public.infrastructure(city, company_id) NOT VALID;


--
-- TOC entry 3285 (class 2606 OID 24954)
-- Name: clients id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT id FOREIGN KEY (id) REFERENCES public.users(id) NOT VALID;


--
-- TOC entry 3286 (class 2606 OID 24959)
-- Name: companies id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT id FOREIGN KEY (id) REFERENCES public.users(id) NOT VALID;


--
-- TOC entry 3301 (class 2606 OID 24897)
-- Name: route next_stage; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.route
    ADD CONSTRAINT next_stage FOREIGN KEY (next_stage) REFERENCES public.route(id) NOT VALID;


--
-- TOC entry 3302 (class 2606 OID 24902)
-- Name: route order; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.route
    ADD CONSTRAINT "order" FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- TOC entry 3475 (class 0 OID 0)
-- Dependencies: 3302
-- Name: CONSTRAINT "order" ON route; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT "order" ON public.route IS 'Заказ, к которому относится пункт маршрутного листа';


--
-- TOC entry 3303 (class 2606 OID 24907)
-- Name: route prev_stage; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.route
    ADD CONSTRAINT prev_stage FOREIGN KEY (prev_stage) REFERENCES public.route(id) NOT VALID;


--
-- TOC entry 3288 (class 2606 OID 24912)
-- Name: feedback product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT product FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 3304 (class 2606 OID 24917)
-- Name: storage_products product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storage_products
    ADD CONSTRAINT product FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 3294 (class 2606 OID 24922)
-- Name: orders product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT product FOREIGN KEY (product_id) REFERENCES public.products(id) NOT VALID;


--
-- TOC entry 3284 (class 2606 OID 24927)
-- Name: cart product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT product FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3300 (class 2606 OID 24932)
-- Name: products product_category; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT product_category FOREIGN KEY (category) REFERENCES public.categories(id);


--
-- TOC entry 3305 (class 2606 OID 24937)
-- Name: storage_products storage; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storage_products
    ADD CONSTRAINT storage FOREIGN KEY (company_id, city_id) REFERENCES public.infrastructure(company_id, city);


--
-- TOC entry 3295 (class 2606 OID 24942)
-- Name: orders to; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "to" FOREIGN KEY (company_id, "to") REFERENCES public.infrastructure(company_id, city) NOT VALID;


-- Completed on 2024-04-08 19:54:59 UTC

--
-- PostgreSQL database dump complete
--

