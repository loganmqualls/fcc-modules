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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type text,
    constellation character varying(20),
    alias character varying(20)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_gal_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_gal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_gal_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_gal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_gal_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    mean_density_g_cm3 numeric,
    year_discovered character varying(10)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer,
    confirmed boolean,
    potentially_habitable text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_plan_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_plan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_plan_id_seq OWNER TO freecodecamp;

--
-- Name: planet_plan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_plan_id_seq OWNED BY public.planet.planet_id;


--
-- Name: solar_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.solar_system (
    planet_id integer,
    solar_system_id integer NOT NULL,
    num_moons integer NOT NULL,
    rings boolean,
    name character varying(20),
    mean_t_k integer,
    grav_m_s2 numeric
);


ALTER TABLE public.solar_system OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    type text,
    alias character varying(20),
    constellation character varying(20)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_gal_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_plan_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (5, 'Comet', 'spiral', 'Sculptor', NULL);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'barred spiral', 'Sagittarius', 'the Galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'barred spiral', 'Andromeda', 'Messier 31');
INSERT INTO public.galaxy VALUES (3, 'Cigar', 'starburst', 'Ursa Major', 'Messier 82');
INSERT INTO public.galaxy VALUES (4, 'Tadpole', 'barred spiral', 'Draco', 'UGC 10214');
INSERT INTO public.galaxy VALUES (6, 'Fireworks', 'face-on spiral', 'Cepheus/Cygnus', 'NGC 6946');
INSERT INTO public.galaxy VALUES (7, 'Condor', 'barred spiral', 'Pavo', 'NGC 6872');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3.344, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 1.876, '1877');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 1.471, '1877');
INSERT INTO public.moon VALUES (4, 'Io', 5, 3.528, '1610');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3.013, '1610');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 1.936, '1610');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 1.8344, '1610');
INSERT INTO public.moon VALUES (8, 'Titan', 6, 1.8798, '1655');
INSERT INTO public.moon VALUES (9, 'Miranda', 7, 1.20, '1948');
INSERT INTO public.moon VALUES (10, 'Ariel', 7, 1.592, '1851');
INSERT INTO public.moon VALUES (11, 'Umbriel', 7, 1.39, '1851');
INSERT INTO public.moon VALUES (12, 'Titania', 7, 1.711, '1787');
INSERT INTO public.moon VALUES (13, 'Oberon', 7, 1.63, '1787');
INSERT INTO public.moon VALUES (14, 'Naiad', 8, 0.8, '1989');
INSERT INTO public.moon VALUES (15, 'Thalassa', 8, 1.23, '1989');
INSERT INTO public.moon VALUES (16, 'Despina', 8, 1.2, '1989');
INSERT INTO public.moon VALUES (17, 'Galatea', 8, 0.75, '1989');
INSERT INTO public.moon VALUES (18, 'Larissa', 8, 1.2, '1981');
INSERT INTO public.moon VALUES (19, 'Hippocamp', 8, NULL, '2013');
INSERT INTO public.moon VALUES (20, 'Proteus', 8, 1.3, '1989');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 'Earth', 1, true, 'Yes');
INSERT INTO public.planet VALUES (4, 'Mars', 1, true, 'Maybe');
INSERT INTO public.planet VALUES (16, 'g', 2, true, 'Maybe');
INSERT INTO public.planet VALUES (1, 'Mercury', 1, true, 'No');
INSERT INTO public.planet VALUES (2, 'Venus', 1, true, 'No');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, true, 'No');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, true, 'No');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, true, 'No');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, true, 'No');
INSERT INTO public.planet VALUES (9, 'b', 2, false, 'No');
INSERT INTO public.planet VALUES (11, 'i', 2, false, 'No');
INSERT INTO public.planet VALUES (14, 'j', 2, false, 'No');
INSERT INTO public.planet VALUES (10, 'c', 2, true, 'No');
INSERT INTO public.planet VALUES (12, 'd', 2, true, 'No');
INSERT INTO public.planet VALUES (13, 'e', 2, true, 'No');
INSERT INTO public.planet VALUES (15, 'f', 2, true, 'No');
INSERT INTO public.planet VALUES (17, 'h', 2, true, 'No');


--
-- Data for Name: solar_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.solar_system VALUES (1, 1, 0, false, 'Roman', 440, 3.7);
INSERT INTO public.solar_system VALUES (2, 2, 0, false, 'Roman', 737, 8.9);
INSERT INTO public.solar_system VALUES (3, 3, 1, false, 'English', 288, 9.8);
INSERT INTO public.solar_system VALUES (4, 4, 2, false, 'Roman', 208, 3.7);
INSERT INTO public.solar_system VALUES (5, 5, 80, true, 'Roman', 163, 23.1);
INSERT INTO public.solar_system VALUES (6, 6, 83, true, 'Roman', 133, 9.0);
INSERT INTO public.solar_system VALUES (7, 7, 27, true, 'Greek', 78, 8.7);
INSERT INTO public.solar_system VALUES (8, 8, 14, true, 'Roman', 72, 11.0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'yellow dwarf', 'Sol', NULL);
INSERT INTO public.star VALUES (2, 'HD 10180', 1, 'yellow main sequence', 'HIP 7599', 'Hydrus');
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 'red supergiant', 'HR 2061', 'Orion');
INSERT INTO public.star VALUES (5, 'UY Scuti', 1, 'red hypergiant', 'HV 3805', 'Scutum');
INSERT INTO public.star VALUES (6, '11 And', 2, 'orange giant', 'HR 8874', 'Andromeda');
INSERT INTO public.star VALUES (7, 'Altair', 1, 'white main sequence', 'LHS 3490', 'Aquila');


--
-- Name: galaxy_gal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_gal_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_plan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_plan_id_seq', 17, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: solar_system pos_from_sun; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT pos_from_sun UNIQUE (solar_system_id);


--
-- Name: solar_system solar_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_pkey PRIMARY KEY (solar_system_id);


--
-- Name: star star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id UNIQUE (star_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: solar_system solar_system_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_gal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_gal_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


