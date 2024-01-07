--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

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
-- Name: drinkslocations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.drinkslocations (
    drink_id integer NOT NULL,
    location_id integer NOT NULL
);


--
-- Name: energy_drinks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.energy_drinks (
    id integer NOT NULL,
    drink_name text NOT NULL,
    collected boolean NOT NULL,
    series_name text,
    collection_name text
);


--
-- Name: locations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.locations (
    id integer NOT NULL,
    location_name text NOT NULL
);


--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


--
-- Name: monster_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.monster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: monster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.monster_id_seq OWNED BY public.energy_drinks.id;


--
-- Name: energy_drinks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.energy_drinks ALTER COLUMN id SET DEFAULT nextval('public.monster_id_seq'::regclass);


--
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


--
-- Data for Name: drinkslocations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.drinkslocations (drink_id, location_id) FROM stdin;
1	1
1	2
1	3
2	1
2	2
3	1
39	1
40	1
41	3
\.


--
-- Data for Name: energy_drinks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.energy_drinks (id, drink_name, collected, series_name, collection_name) FROM stdin;
1	Original	t	Sugar Based	Monster
2	Assault	t	Sugar Based	Monster
3	The Doctor	t	Sugar Based	Monster
4	Mule	t	Sugar Based	Monster
5	Import	f	Sugar Based	Monster
6	Absolutely Zero	t	Ultra	Monster
7	Import Light	f	Ultra	Monster
8	Lo-Carb	f	Ultra	Monster
9	Nitro	t	Ultra	Monster
10	Ultra Black	t	Ultra	Monster
11	Ultra Blue	f	Ultra	Monster
12	Ultra Citron	f	Ultra	Monster
13	Ultra Fiesta Mango	t	Ultra	Monster
14	Ultra Gold	t	Ultra	Monster
15	Ultra Paradise	t	Ultra	Monster
16	Ultra Peachy Keen	t	Ultra	Monster
17	Ultra Red	t	Ultra	Monster
18	Ultra Rosa	t	Ultra	Monster
19	Ultra Sunrise	f	Ultra	Monster
20	Ultra Violet	f	Ultra	Monster
21	Ultra Watermelon	t	Ultra	Monster
22	Ultra Zero	t	Ultra	Monster
23	Zero Sugar	t	Ultra	Monster
24	Hydro Blue Ice	f	Hydro	Monster
25	Hydro Manic Melon	f	Hydro	Monster
26	Hydro Mean Green	f	Hydro	Monster
27	Hydro Purple Passion	f	Hydro	Monster
28	Hydro Tropical Thunder	f	Hydro	Monster
29	Hydro Zero Sugar	f	Hydro	Monster
30	Java Irish Blend	f	Coffee	Monster
31	Java Kona Blend	f	Coffee	Monster
32	Java Loca Moca	f	Coffee	Monster
33	Java Mean Bean	t	Coffee	Monster
34	Java Salted Caramel	t	Coffee	Monster
35	Java Vanilla Light	f	Coffee	Monster
36	Espresso Vanilla	t	Coffee	Monster
37	Espresso Espresso	t	Coffee	Monster
38	Espresso Salted	f	Coffee	Monster
39	Lo-carb	f	Ultra	Monster
40	Ultra Black	t	Ultra	Monster
41	Blizzard	t	\N	Sneak
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.locations (id, location_name) FROM stdin;
1	Asda
2	Local
3	Lidl
4	Aldi
5	Online
\.


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.locations_id_seq', 5, true);


--
-- Name: monster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.monster_id_seq', 41, true);


--
-- Name: drinkslocations drinkslocations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.drinkslocations
    ADD CONSTRAINT drinkslocations_pkey PRIMARY KEY (drink_id, location_id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: energy_drinks monster_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.energy_drinks
    ADD CONSTRAINT monster_pkey PRIMARY KEY (id);


--
-- Name: drinkslocations drinkslocations_drink_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.drinkslocations
    ADD CONSTRAINT drinkslocations_drink_id_fkey FOREIGN KEY (drink_id) REFERENCES public.energy_drinks(id);


--
-- Name: drinkslocations drinkslocations_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.drinkslocations
    ADD CONSTRAINT drinkslocations_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.locations(id);


--
-- PostgreSQL database dump complete
--

