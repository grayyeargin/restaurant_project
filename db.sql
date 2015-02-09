--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: foods; Type: TABLE; Schema: public; Owner: gyeargin; Tablespace: 
--

CREATE TABLE foods (
    id integer NOT NULL,
    name character varying(255),
    course character varying(255),
    price integer,
    spicy boolean DEFAULT false,
    time_added timestamp without time zone
);


ALTER TABLE public.foods OWNER TO gyeargin;

--
-- Name: foods_id_seq; Type: SEQUENCE; Schema: public; Owner: gyeargin
--

CREATE SEQUENCE foods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.foods_id_seq OWNER TO gyeargin;

--
-- Name: foods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gyeargin
--

ALTER SEQUENCE foods_id_seq OWNED BY foods.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: gyeargin; Tablespace: 
--

CREATE TABLE orders (
    id integer NOT NULL,
    food_id integer,
    party_id integer,
    cook_status boolean DEFAULT false,
    order_time timestamp without time zone DEFAULT '4712-01-01 00:00:00 BC'::timestamp without time zone
);


ALTER TABLE public.orders OWNER TO gyeargin;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: gyeargin
--

CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO gyeargin;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gyeargin
--

ALTER SEQUENCE orders_id_seq OWNED BY orders.id;


--
-- Name: parties; Type: TABLE; Schema: public; Owner: gyeargin; Tablespace: 
--

CREATE TABLE parties (
    id integer NOT NULL,
    last_name character varying(255),
    table_number integer,
    guests integer,
    payment_status boolean DEFAULT false,
    checkout_time timestamp without time zone
);


ALTER TABLE public.parties OWNER TO gyeargin;

--
-- Name: parties_id_seq; Type: SEQUENCE; Schema: public; Owner: gyeargin
--

CREATE SEQUENCE parties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.parties_id_seq OWNER TO gyeargin;

--
-- Name: parties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gyeargin
--

ALTER SEQUENCE parties_id_seq OWNED BY parties.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: gyeargin; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO gyeargin;

--
-- Name: users; Type: TABLE; Schema: public; Owner: gyeargin; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    password_hash character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO gyeargin;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: gyeargin
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO gyeargin;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gyeargin
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gyeargin
--

ALTER TABLE ONLY foods ALTER COLUMN id SET DEFAULT nextval('foods_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gyeargin
--

ALTER TABLE ONLY orders ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gyeargin
--

ALTER TABLE ONLY parties ALTER COLUMN id SET DEFAULT nextval('parties_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gyeargin
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: foods; Type: TABLE DATA; Schema: public; Owner: gyeargin
--

COPY foods (id, name, course, price, spicy, time_added) FROM stdin;
1	Orange Peel Soup	appetizer	7	f	\N
2	Meat Sandwich	entree	11	f	\N
3	Sprinkles	dessert	6	f	\N
4	Cheese Stack	appetizer	7	f	\N
5	Hottest Soup	appetizer	15	t	\N
6	Spaghetti Surprise	entree	18	f	\N
7	Spicy Cereal	entree	11	t	\N
8	Jelly Beans	dessert	18	t	\N
\.


--
-- Name: foods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gyeargin
--

SELECT pg_catalog.setval('foods_id_seq', 8, true);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: gyeargin
--

COPY orders (id, food_id, party_id, cook_status, order_time) FROM stdin;
1	2	6	f	4712-01-01 00:00:00 BC
2	2	1	f	4712-01-01 00:00:00 BC
3	7	5	f	4712-01-01 00:00:00 BC
4	6	3	f	4712-01-01 00:00:00 BC
5	8	2	f	4712-01-01 00:00:00 BC
6	3	1	f	4712-01-01 00:00:00 BC
7	8	5	f	4712-01-01 00:00:00 BC
8	6	1	f	4712-01-01 00:00:00 BC
9	6	4	f	4712-01-01 00:00:00 BC
10	3	4	f	4712-01-01 00:00:00 BC
11	3	4	f	4712-01-01 00:00:00 BC
12	3	2	f	4712-01-01 00:00:00 BC
\.


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gyeargin
--

SELECT pg_catalog.setval('orders_id_seq', 12, true);


--
-- Data for Name: parties; Type: TABLE DATA; Schema: public; Owner: gyeargin
--

COPY parties (id, last_name, table_number, guests, payment_status, checkout_time) FROM stdin;
1	Crona	4	6	f	\N
2	Kuhn	2	2	f	\N
3	Christiansen	8	8	f	\N
4	Blick	9	3	f	\N
5	Casper	10	3	f	\N
6	Kub	5	2	f	\N
\.


--
-- Name: parties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gyeargin
--

SELECT pg_catalog.setval('parties_id_seq', 6, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: gyeargin
--

COPY schema_migrations (version) FROM stdin;
20141020215514
20141020220917
20141020221530
20141020222653
20141020233412
20141020233906
20141026194437
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: gyeargin
--

COPY users (id, username, password_hash, created_at, updated_at) FROM stdin;
1	Gray	$2a$10$05KTKuP34TAyRbT7LLnem.trw48deZCTshdCyM/3KVHgVix18Uiuq	2014-11-02 00:32:33.502348	2014-11-02 00:32:33.502348
2	gray	$2a$10$qoxYoijfWBMR3PCp.ksWdeER/rlwAMkDhoj5NUXY5tEN38MZ/Lfby	2015-01-05 06:28:28.930987	2015-01-05 06:28:28.930987
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gyeargin
--

SELECT pg_catalog.setval('users_id_seq', 2, true);


--
-- Name: foods_pkey; Type: CONSTRAINT; Schema: public; Owner: gyeargin; Tablespace: 
--

ALTER TABLE ONLY foods
    ADD CONSTRAINT foods_pkey PRIMARY KEY (id);


--
-- Name: orders_pkey; Type: CONSTRAINT; Schema: public; Owner: gyeargin; Tablespace: 
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: parties_pkey; Type: CONSTRAINT; Schema: public; Owner: gyeargin; Tablespace: 
--

ALTER TABLE ONLY parties
    ADD CONSTRAINT parties_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: gyeargin; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: gyeargin; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: gyeargin
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM gyeargin;
GRANT ALL ON SCHEMA public TO gyeargin;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

