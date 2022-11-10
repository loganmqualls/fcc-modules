--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    num_guess integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
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
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, NULL);
INSERT INTO public.games VALUES (2, 1, 21);
INSERT INTO public.games VALUES (3, 2, 11);
INSERT INTO public.games VALUES (4, 2, 14);
INSERT INTO public.games VALUES (5, 1, 16);
INSERT INTO public.games VALUES (6, 3, 112);
INSERT INTO public.games VALUES (7, 3, 905);
INSERT INTO public.games VALUES (8, 4, 435);
INSERT INTO public.games VALUES (9, 4, 824);
INSERT INTO public.games VALUES (10, 3, 663);
INSERT INTO public.games VALUES (11, 3, 531);
INSERT INTO public.games VALUES (12, 3, 984);
INSERT INTO public.games VALUES (13, 5, 794);
INSERT INTO public.games VALUES (14, 5, 111);
INSERT INTO public.games VALUES (15, 6, 37);
INSERT INTO public.games VALUES (16, 6, 450);
INSERT INTO public.games VALUES (17, 5, 256);
INSERT INTO public.games VALUES (18, 5, 160);
INSERT INTO public.games VALUES (19, 5, 763);
INSERT INTO public.games VALUES (20, 7, 150);
INSERT INTO public.games VALUES (21, 7, 861);
INSERT INTO public.games VALUES (22, 8, 880);
INSERT INTO public.games VALUES (23, 8, 825);
INSERT INTO public.games VALUES (24, 7, 363);
INSERT INTO public.games VALUES (25, 7, 588);
INSERT INTO public.games VALUES (26, 7, 371);
INSERT INTO public.games VALUES (27, 2, 9);
INSERT INTO public.games VALUES (28, 9, 909);
INSERT INTO public.games VALUES (29, 9, 330);
INSERT INTO public.games VALUES (30, 10, 286);
INSERT INTO public.games VALUES (31, 10, 87);
INSERT INTO public.games VALUES (32, 9, 38);
INSERT INTO public.games VALUES (33, 9, 152);
INSERT INTO public.games VALUES (34, 9, 410);
INSERT INTO public.games VALUES (35, 11, 443);
INSERT INTO public.games VALUES (36, 11, 472);
INSERT INTO public.games VALUES (37, 12, 750);
INSERT INTO public.games VALUES (38, 12, 649);
INSERT INTO public.games VALUES (39, 11, 856);
INSERT INTO public.games VALUES (40, 11, 597);
INSERT INTO public.games VALUES (41, 11, 471);
INSERT INTO public.games VALUES (42, 13, 527);
INSERT INTO public.games VALUES (43, 13, 724);
INSERT INTO public.games VALUES (44, 14, 835);
INSERT INTO public.games VALUES (45, 14, 136);
INSERT INTO public.games VALUES (46, 13, 817);
INSERT INTO public.games VALUES (47, 13, 539);
INSERT INTO public.games VALUES (48, 13, 735);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'yukihaku');
INSERT INTO public.users VALUES (2, 'Seven');
INSERT INTO public.users VALUES (3, 'user_1668091559365');
INSERT INTO public.users VALUES (4, 'user_1668091559364');
INSERT INTO public.users VALUES (5, 'user_1668091589381');
INSERT INTO public.users VALUES (6, 'user_1668091589380');
INSERT INTO public.users VALUES (7, 'user_1668091868260');
INSERT INTO public.users VALUES (8, 'user_1668091868259');
INSERT INTO public.users VALUES (9, 'user_1668092068165');
INSERT INTO public.users VALUES (10, 'user_1668092068164');
INSERT INTO public.users VALUES (11, 'user_1668092211876');
INSERT INTO public.users VALUES (12, 'user_1668092211875');
INSERT INTO public.users VALUES (13, 'user_1668092236713');
INSERT INTO public.users VALUES (14, 'user_1668092236712');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 48, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 14, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--


