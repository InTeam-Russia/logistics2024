--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Debian 16.2-1.pgdg120+2)
-- Dumped by pg_dump version 16.1

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
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart (
    client_id integer NOT NULL,
    product_id integer NOT NULL,
    amount integer NOT NULL
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    icon boolean NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cities_id_seq OWNER TO postgres;

--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    surname character varying(128),
    photo boolean NOT NULL
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clients_id_seq OWNER TO postgres;

--
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clients_id_seq OWNED BY public.clients.id;


--
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
-- Name: companies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.companies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.companies_id_seq OWNER TO postgres;

--
-- Name: companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.companies_id_seq OWNED BY public.companies.id;


--
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
-- Name: feedback_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.feedback_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.feedback_id_seq OWNER TO postgres;

--
-- Name: feedback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.feedback_id_seq OWNED BY public.feedback.id;


--
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
-- Name: TABLE orders; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.orders IS 'Заказы';


--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: path_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.path_types (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.path_types OWNER TO postgres;

--
-- Name: TABLE path_types; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.path_types IS 'Типы путей сообщения';


--
-- Name: path_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.path_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.path_types_id_seq OWNER TO postgres;

--
-- Name: path_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.path_types_id_seq OWNED BY public.path_types.id;


--
-- Name: paths; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paths (
    id integer NOT NULL,
    company_id integer NOT NULL,
    departure integer NOT NULL,
    destination integer NOT NULL,
    is_dest_transit boolean NOT NULL,
    type integer NOT NULL,
    duration double precision NOT NULL,
    distance double precision NOT NULL,
    price double precision NOT NULL
);


ALTER TABLE public.paths OWNER TO postgres;

--
-- Name: paths_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.paths_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.paths_id_seq OWNER TO postgres;

--
-- Name: paths_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.paths_id_seq OWNED BY public.paths.id;


--
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
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
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
-- Name: TABLE route; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.route IS 'Маршрутный лист товара';


--
-- Name: route_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.route_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.route_id_seq OWNER TO postgres;

--
-- Name: route_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.route_id_seq OWNED BY public.route.id;


--
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
-- Name: TABLE storage_products; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.storage_products IS 'Распределение продукции по складам';


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(320) NOT NULL,
    password character varying(1024) NOT NULL,
    role integer NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    is_superuser boolean DEFAULT false NOT NULL,
    is_verified boolean DEFAULT false NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: clients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.clients_id_seq'::regclass);


--
-- Name: companies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies ALTER COLUMN id SET DEFAULT nextval('public.companies_id_seq'::regclass);


--
-- Name: feedback id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedback ALTER COLUMN id SET DEFAULT nextval('public.feedback_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: path_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.path_types ALTER COLUMN id SET DEFAULT nextval('public.path_types_id_seq'::regclass);


--
-- Name: paths id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paths ALTER COLUMN id SET DEFAULT nextval('public.paths_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: route id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.route ALTER COLUMN id SET DEFAULT nextval('public.route_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart (client_id, product_id, amount) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name, icon) FROM stdin;
1	Разное	f
\.


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (id, name) FROM stdin;
\.


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clients (id, name, surname, photo) FROM stdin;
\.


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.companies (id, name, description, logo) FROM stdin;
1	ООО "ИнТим"	Легендарная команда из Саратовской области	https://avatars.githubusercontent.com/u/166201722?s=48&v=4
\.


--
-- Data for Name: feedback; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.feedback (id, client_id, product_id, rate, description, photos) FROM stdin;
\.


--
-- Data for Name: infrastructure; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.infrastructure (company_id, city, storage, dp) FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, company_id, client_id, order_type, product_id, price, amount, sum, start_time, end_time, "from", "to", stage_edge, stage_type, active) FROM stdin;
\.


--
-- Data for Name: path_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.path_types (id, name, description) FROM stdin;
\.


--
-- Data for Name: paths; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.paths (id, company_id, departure, destination, is_dest_transit, type, duration, distance, price) FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, company_id, category, name, img, size, price, amount, rating, hidden) FROM stdin;
1	1	1	Интим	\N	69 см x 300 см x 1488 см	300000	0	\N	t
\.


--
-- Data for Name: route; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.route (id, order_id, edge, prev_stage, next_stage, stage_num, end_time) FROM stdin;
\.


--
-- Data for Name: storage_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.storage_products (company_id, city_id, product_id, amount) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password, role) FROM stdin;
1	gremlin@kremlin.ru	wagner	0
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 1, true);


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cities_id_seq', 1, false);


--
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clients_id_seq', 1, false);


--
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.companies_id_seq', 1, false);


--
-- Name: feedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.feedback_id_seq', 1, false);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- Name: path_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.path_types_id_seq', 1, false);


--
-- Name: paths_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.paths_id_seq', 1, false);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 1, true);


--
-- Name: route_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.route_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: cart client_product; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT client_product PRIMARY KEY (client_id, product_id);


--
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- Name: infrastructure company_in_city; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.infrastructure
    ADD CONSTRAINT company_in_city PRIMARY KEY (company_id, city);


--
-- Name: CONSTRAINT company_in_city ON infrastructure; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT company_in_city ON public.infrastructure IS 'Строка есть представление об инфраструктуре заданной компании в заданном городе';


--
-- Name: feedback feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_pkey PRIMARY KEY (id);


--
-- Name: storage_products item; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storage_products
    ADD CONSTRAINT item PRIMARY KEY (company_id, product_id, city_id);


--
-- Name: CONSTRAINT item ON storage_products; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT item ON public.storage_products IS 'Информация о наименовании товара на складе';


--
-- Name: infrastructure one_per_city; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.infrastructure
    ADD CONSTRAINT one_per_city UNIQUE (company_id, city);


--
-- Name: CONSTRAINT one_per_city ON infrastructure; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT one_per_city ON public.infrastructure IS 'Информация о наличии инфраструктуры заданной компании в заданном поселении представляется единственной уникальной строкой';


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: paths paths_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paths
    ADD CONSTRAINT paths_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: route route_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.route
    ADD CONSTRAINT route_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: infrastructure city; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.infrastructure
    ADD CONSTRAINT city FOREIGN KEY (city) REFERENCES public.cities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: feedback client; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT client FOREIGN KEY (client_id) REFERENCES public.clients(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: orders client; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT client FOREIGN KEY (client_id) REFERENCES public.clients(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cart client; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT client FOREIGN KEY (client_id) REFERENCES public.clients(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: paths company; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paths
    ADD CONSTRAINT company FOREIGN KEY (company_id) REFERENCES public.companies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: infrastructure company; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.infrastructure
    ADD CONSTRAINT company FOREIGN KEY (company_id) REFERENCES public.companies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: orders company; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT company FOREIGN KEY (company_id) REFERENCES public.companies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: products company_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT company_id FOREIGN KEY (company_id) REFERENCES public.companies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: paths departure; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paths
    ADD CONSTRAINT departure FOREIGN KEY (departure) REFERENCES public.cities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: paths destination; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paths
    ADD CONSTRAINT destination FOREIGN KEY (destination) REFERENCES public.cities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: orders from; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "from" FOREIGN KEY ("from", company_id) REFERENCES public.infrastructure(city, company_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: clients id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT id FOREIGN KEY (id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: companies id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT id FOREIGN KEY (id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: route next_stage; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.route
    ADD CONSTRAINT next_stage FOREIGN KEY (next_stage) REFERENCES public.route(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: route order; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.route
    ADD CONSTRAINT "order" FOREIGN KEY (order_id) REFERENCES public.orders(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: CONSTRAINT "order" ON route; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT "order" ON public.route IS 'Заказ, к которому относится пункт маршрутного листа';


--
-- Name: route prev_stage; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.route
    ADD CONSTRAINT prev_stage FOREIGN KEY (prev_stage) REFERENCES public.route(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: feedback product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT product FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: storage_products product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storage_products
    ADD CONSTRAINT product FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: orders product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT product FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cart product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT product FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: products product_category; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT product_category FOREIGN KEY (category) REFERENCES public.categories(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: storage_products storage; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storage_products
    ADD CONSTRAINT storage FOREIGN KEY (company_id, city_id) REFERENCES public.infrastructure(company_id, city) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: orders to; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "to" FOREIGN KEY (company_id, "to") REFERENCES public.infrastructure(company_id, city) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

