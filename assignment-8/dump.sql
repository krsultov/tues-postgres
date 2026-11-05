--
-- PostgreSQL database dump
--

\restrict jbJqHsAST1pfCIOGF11iY6f9AyCkT9TmtYgYqypprLaSPKuNzakb3m5t0uu5T2q

-- Dumped from database version 18.6 (Debian 18.6-1.pgdg13+2)
-- Dumped by pg_dump version 18.6 (Debian 18.6-1.pgdg13+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: devices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.devices (
    id integer NOT NULL,
    inventory_number text NOT NULL,
    kind_id integer NOT NULL,
    model text NOT NULL,
    room_id integer,
    purchase_date date NOT NULL
);


ALTER TABLE public.devices OWNER TO postgres;

--
-- Name: devices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.devices ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.devices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: kinds; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kinds (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.kinds OWNER TO postgres;

--
-- Name: kinds_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.kinds ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.kinds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: rooms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rooms (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.rooms OWNER TO postgres;

--
-- Name: rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.rooms ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: devices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.devices (id, inventory_number, kind_id, model, room_id, purchase_date) FROM stdin;
1	INV-00101	1	Dell OptiPlex 7010	1	2018-09-03
2	INV-00102	1	Dell OptiPlex 7090	1	2022-02-14
3	INV-00103	2	Dell P2419H	1	2019-03-20
4	INV-00104	2	LG 24MK430H	1	2023-09-11
5	INV-00105	3	Epson EB-X41	1	2020-01-15
6	INV-00201	1	Lenovo ThinkCentre M70q	2	2021-12-20
7	INV-00202	2	Samsung S24R350	2	2021-10-15
8	INV-00203	5	SMART Board 6075	2	2024-08-28
9	INV-00301	4	HP LaserJet Pro M404dn	3	2023-01-09
10	INV-00302	3	BenQ MW560	3	2022-11-02
11	INV-00901	3	Epson EB-S05	\N	2016-05-30
12	INV-00902	2	Philips 223V5	\N	2024-02-05
13	INV-00903	1	HP ProDesk 400 G4	\N	2019-11-25
\.


--
-- Data for Name: kinds; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kinds (id, name) FROM stdin;
1	computer
2	monitor
3	projector
4	printer
5	interactive whiteboard
\.


--
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rooms (id, name) FROM stdin;
1	Computer Lab 41
2	Room 301
3	Room 302
4	Library
\.


--
-- Name: devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.devices_id_seq', 17, true);


--
-- Name: kinds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kinds_id_seq', 5, true);


--
-- Name: rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rooms_id_seq', 4, true);


--
-- Name: devices devices_inventory_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_inventory_number_key UNIQUE (inventory_number);


--
-- Name: devices devices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_pkey PRIMARY KEY (id);


--
-- Name: kinds kinds_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kinds
    ADD CONSTRAINT kinds_name_key UNIQUE (name);


--
-- Name: kinds kinds_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kinds
    ADD CONSTRAINT kinds_pkey PRIMARY KEY (id);


--
-- Name: rooms rooms_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_name_key UNIQUE (name);


--
-- Name: rooms rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);


--
-- Name: devices devices_kind_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_kind_id_fkey FOREIGN KEY (kind_id) REFERENCES public.kinds(id);


--
-- Name: devices devices_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.rooms(id);


--
-- PostgreSQL database dump complete
--

\unrestrict jbJqHsAST1pfCIOGF11iY6f9AyCkT9TmtYgYqypprLaSPKuNzakb3m5t0uu5T2q

