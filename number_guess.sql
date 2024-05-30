--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1717096813586', 0, NULL);
INSERT INTO public.users VALUES (2, 'user_1717096813585', 0, NULL);
INSERT INTO public.users VALUES (5, 'user_1717097033057', 1, 795);
INSERT INTO public.users VALUES (23, 'user_1717098113295', 2, 312);
INSERT INTO public.users VALUES (4, 'user_1717097033058', 1, 793);
INSERT INTO public.users VALUES (22, 'user_1717098113296', 5, 10);
INSERT INTO public.users VALUES (7, 'user_1717097222854', 1, 486);
INSERT INTO public.users VALUES (6, 'user_1717097222855', 1, 778);
INSERT INTO public.users VALUES (9, 'user_1717097290544', 1, 973);
INSERT INTO public.users VALUES (25, 'user_1717098204622', 2, 107);
INSERT INTO public.users VALUES (8, 'user_1717097290545', 1, 526);
INSERT INTO public.users VALUES (24, 'user_1717098204623', 5, 131);
INSERT INTO public.users VALUES (11, 'user_1717097327741', 1, 578);
INSERT INTO public.users VALUES (10, 'user_1717097327742', 1, 375);
INSERT INTO public.users VALUES (27, 'user_1717098302768', 2, 392);
INSERT INTO public.users VALUES (13, 'user_1717097519612', 2, 475);
INSERT INTO public.users VALUES (12, 'user_1717097519613', 5, 78);
INSERT INTO public.users VALUES (14, 'user_1717097559000', 0, NULL);
INSERT INTO public.users VALUES (15, 'user_1717097558999', 0, NULL);
INSERT INTO public.users VALUES (26, 'user_1717098302769', 5, 181);
INSERT INTO public.users VALUES (17, 'user_1717097566304', 2, 465);
INSERT INTO public.users VALUES (16, 'user_1717097566305', 5, 139);
INSERT INTO public.users VALUES (29, 'user_1717098327551', 2, 558);
INSERT INTO public.users VALUES (19, 'user_1717097851674', 2, 204);
INSERT INTO public.users VALUES (28, 'user_1717098327552', 5, 328);
INSERT INTO public.users VALUES (18, 'user_1717097851675', 5, 82);
INSERT INTO public.users VALUES (3, 'eliina', 3, 4);
INSERT INTO public.users VALUES (21, 'user_1717097959591', 2, 582);
INSERT INTO public.users VALUES (31, 'user_1717098348501', 2, 229);
INSERT INTO public.users VALUES (20, 'user_1717097959592', 5, 582);
INSERT INTO public.users VALUES (30, 'user_1717098348502', 5, 46);
INSERT INTO public.users VALUES (33, 'user_1717098384425', 2, 20);
INSERT INTO public.users VALUES (32, 'user_1717098384426', 5, 101);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 33, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

