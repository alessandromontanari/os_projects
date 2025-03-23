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
    name character varying(30) NOT NULL,
    n_arms integer,
    galaxy_id integer NOT NULL,
    n_stars integer,
    n_black_holes integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: junction_galaxy_star_planet_moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.junction_galaxy_star_planet_moon (
    galaxy_id integer,
    star_id integer,
    planet_id integer,
    moon_id integer,
    junction_galaxy_star_planet_moon_id integer NOT NULL,
    name character varying(60) NOT NULL
);


ALTER TABLE public.junction_galaxy_star_planet_moon OWNER TO freecodecamp;

--
-- Name: junction_galaxy_star_planet_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.junction_galaxy_star_planet_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.junction_galaxy_star_planet_moon_id_seq OWNER TO freecodecamp;

--
-- Name: junction_galaxy_star_planet_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.junction_galaxy_star_planet_moon_id_seq OWNED BY public.junction_galaxy_star_planet_moon.junction_galaxy_star_planet_moon_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    planet_id integer NOT NULL,
    n_orbits_per_year numeric(6,6),
    mass numeric(6,6)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    has_moon boolean,
    star_id integer NOT NULL,
    mass numeric(6,6)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    mass numeric(6,6),
    constellation text,
    in_binary boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: junction_galaxy_star_planet_moon junction_galaxy_star_planet_moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction_galaxy_star_planet_moon ALTER COLUMN junction_galaxy_star_planet_moon_id SET DEFAULT nextval('public.junction_galaxy_star_planet_moon_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Blu', 10, 1, 10000, NULL);
INSERT INTO public.galaxy VALUES ('Red', 10, 2, 10000, NULL);
INSERT INTO public.galaxy VALUES ('Green', 10, 3, 10000, NULL);
INSERT INTO public.galaxy VALUES ('Magenta', 10, 4, 10000, NULL);
INSERT INTO public.galaxy VALUES ('Purple', 7, 5, 20000, NULL);
INSERT INTO public.galaxy VALUES ('Brown', 7, 6, 20000, NULL);


--
-- Data for Name: junction_galaxy_star_planet_moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.junction_galaxy_star_planet_moon VALUES (1, 1, 1, 1, 1, 'GoGoGooLoo');
INSERT INTO public.junction_galaxy_star_planet_moon VALUES (2, 3, 2, 2, 2, 'BluBli');
INSERT INTO public.junction_galaxy_star_planet_moon VALUES (3, 5, 3, 3, 3, 'BliBlo');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Blu_1-1 moon 1', 1, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Red_1-1 moon 1', 2, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Green_1-1 moon 1', 3, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Blu_1-2 moon 1', 4, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Blu_1-3 moon 1', 5, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Blu_1-4 moon 1', 6, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Blu_1-4 moon 2', 6, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Blu_1-1 moon 2', 1, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Red_1-1 moon 2', 2, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Red_1-1 moon 3', 2, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Red_1-2 moon 1', 9, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Red_1-2 moon 2', 9, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Red_1-3 moon 1', 8, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Red_1-3 moon 2', 8, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Red_1-3 moon 3', 8, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Red_1-3 moon 4', 8, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Green_1-1 moon 2', 3, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Green_1-1 moon 3', 3, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Green_1-1 moon 4', 3, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Green_1-2 moon 1', 10, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'Green_1-2 moon 2', 10, NULL, NULL);
INSERT INTO public.moon VALUES (22, 'Green_1-2 moon 3', 10, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Blu_1-1', true, 1, NULL);
INSERT INTO public.planet VALUES (2, 'Red_1-1', true, 3, NULL);
INSERT INTO public.planet VALUES (3, 'Green_1-1', true, 5, NULL);
INSERT INTO public.planet VALUES (4, 'Blu_1-2', true, 1, NULL);
INSERT INTO public.planet VALUES (5, 'Blu_1-3', true, 1, NULL);
INSERT INTO public.planet VALUES (6, 'Blu_1-4', true, 1, NULL);
INSERT INTO public.planet VALUES (7, 'Red_1-4', true, 3, NULL);
INSERT INTO public.planet VALUES (8, 'Red_1-3', true, 3, NULL);
INSERT INTO public.planet VALUES (9, 'Red_1-2', true, 3, NULL);
INSERT INTO public.planet VALUES (10, 'Green_1-2', true, 5, NULL);
INSERT INTO public.planet VALUES (11, 'Green_1-3', true, 5, NULL);
INSERT INTO public.planet VALUES (12, 'Green_1-4', true, 5, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Blu_1', 0.123400, 'BluGrande', true, 1);
INSERT INTO public.star VALUES (2, 'Blu_2', 0.135600, 'BluPiccola', true, 1);
INSERT INTO public.star VALUES (3, 'Red_1', 0.166000, 'RedMagra', true, 2);
INSERT INTO public.star VALUES (4, 'Red_2', 0.186000, 'RedVeloce', true, 2);
INSERT INTO public.star VALUES (5, 'Green_1', 0.170000, 'GreenPuffo', true, 3);
INSERT INTO public.star VALUES (6, 'Brown 1', 0.170000, 'BrownBlue', true, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: junction_galaxy_star_planet_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.junction_galaxy_star_planet_moon_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 22, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: junction_galaxy_star_planet_moon junction_galaxy_star_planet_moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction_galaxy_star_planet_moon
    ADD CONSTRAINT junction_galaxy_star_planet_moon_pkey PRIMARY KEY (junction_galaxy_star_planet_moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_id UNIQUE (galaxy_id);


--
-- Name: junction_galaxy_star_planet_moon unique_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction_galaxy_star_planet_moon
    ADD CONSTRAINT unique_id UNIQUE (junction_galaxy_star_planet_moon_id);


--
-- Name: moon unique_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_id UNIQUE (moon_id);


--
-- Name: planet unique_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_id UNIQUE (planet_id);


--
-- Name: star unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_id UNIQUE (star_id);


--
-- Name: junction_galaxy_star_planet_moon junction_galaxy_star_planet_moon_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction_galaxy_star_planet_moon
    ADD CONSTRAINT junction_galaxy_star_planet_moon_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: junction_galaxy_star_planet_moon junction_galaxy_star_planet_moon_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction_galaxy_star_planet_moon
    ADD CONSTRAINT junction_galaxy_star_planet_moon_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: junction_galaxy_star_planet_moon junction_galaxy_star_planet_moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction_galaxy_star_planet_moon
    ADD CONSTRAINT junction_galaxy_star_planet_moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: junction_galaxy_star_planet_moon junction_galaxy_star_planet_moon_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction_galaxy_star_planet_moon
    ADD CONSTRAINT junction_galaxy_star_planet_moon_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
