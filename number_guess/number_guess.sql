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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    u_id integer,
    n_guesses integer
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
    u_id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_u_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_u_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_u_id_seq OWNER TO freecodecamp;

--
-- Name: users_u_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_u_id_seq OWNED BY public.users.u_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users u_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN u_id SET DEFAULT nextval('public.users_u_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 67);
INSERT INTO public.games VALUES (2, 2, 98);
INSERT INTO public.games VALUES (3, 3, 13);
INSERT INTO public.games VALUES (4, 4, 28);
INSERT INTO public.games VALUES (6, 5, 19);
INSERT INTO public.games VALUES (12, 6, 87);
INSERT INTO public.games VALUES (14, 7, 74);
INSERT INTO public.games VALUES (19, 8, 82);
INSERT INTO public.games VALUES (20, 8, 63);
INSERT INTO public.games VALUES (21, 9, 53);
INSERT INTO public.games VALUES (22, 9, 72);
INSERT INTO public.games VALUES (23, 8, 58);
INSERT INTO public.games VALUES (24, 8, 24);
INSERT INTO public.games VALUES (25, 8, 60);
INSERT INTO public.games VALUES (26, 3, 8);
INSERT INTO public.games VALUES (27, 10, 25);
INSERT INTO public.games VALUES (28, 10, 39);
INSERT INTO public.games VALUES (29, 11, 84);
INSERT INTO public.games VALUES (30, 11, 24);
INSERT INTO public.games VALUES (31, 10, 102);
INSERT INTO public.games VALUES (32, 10, 94);
INSERT INTO public.games VALUES (33, 10, 85);
INSERT INTO public.games VALUES (34, 3, 10);
INSERT INTO public.games VALUES (35, 12, 27);
INSERT INTO public.games VALUES (36, 12, 60);
INSERT INTO public.games VALUES (37, 13, 49);
INSERT INTO public.games VALUES (38, 13, 4);
INSERT INTO public.games VALUES (39, 12, 22);
INSERT INTO public.games VALUES (40, 12, 19);
INSERT INTO public.games VALUES (41, 12, 12);
INSERT INTO public.games VALUES (42, 14, 84);
INSERT INTO public.games VALUES (43, 14, 46);
INSERT INTO public.games VALUES (44, 15, 20);
INSERT INTO public.games VALUES (45, 15, 74);
INSERT INTO public.games VALUES (46, 14, 79);
INSERT INTO public.games VALUES (47, 14, 32);
INSERT INTO public.games VALUES (48, 14, 44);
INSERT INTO public.games VALUES (49, 16, 82);
INSERT INTO public.games VALUES (50, 16, 100);
INSERT INTO public.games VALUES (51, 17, 26);
INSERT INTO public.games VALUES (52, 17, 21);
INSERT INTO public.games VALUES (53, 16, 59);
INSERT INTO public.games VALUES (54, 16, 53);
INSERT INTO public.games VALUES (55, 16, 64);
INSERT INTO public.games VALUES (56, 3, 10);
INSERT INTO public.games VALUES (57, 18, 8);
INSERT INTO public.games VALUES (58, 19, 74);
INSERT INTO public.games VALUES (59, 19, 7);
INSERT INTO public.games VALUES (60, 20, 37);
INSERT INTO public.games VALUES (61, 20, 11);
INSERT INTO public.games VALUES (62, 19, 102);
INSERT INTO public.games VALUES (63, 19, 25);
INSERT INTO public.games VALUES (64, 19, 80);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1746101152078');
INSERT INTO public.users VALUES (2, 'user_1746101152077');
INSERT INTO public.users VALUES (3, 'Ale');
INSERT INTO public.users VALUES (4, 'user_1746101293331');
INSERT INTO public.users VALUES (5, 'user_1746101293330');
INSERT INTO public.users VALUES (6, 'user_1746101350171');
INSERT INTO public.users VALUES (7, 'user_1746101350170');
INSERT INTO public.users VALUES (8, 'user_1746101498471');
INSERT INTO public.users VALUES (9, 'user_1746101498470');
INSERT INTO public.users VALUES (10, 'user_1746101554317');
INSERT INTO public.users VALUES (11, 'user_1746101554316');
INSERT INTO public.users VALUES (12, 'user_1746101747957');
INSERT INTO public.users VALUES (13, 'user_1746101747956');
INSERT INTO public.users VALUES (14, 'user_1746101770305');
INSERT INTO public.users VALUES (15, 'user_1746101770304');
INSERT INTO public.users VALUES (16, 'user_1746101808026');
INSERT INTO public.users VALUES (17, 'user_1746101808025');
INSERT INTO public.users VALUES (18, 'Luca');
INSERT INTO public.users VALUES (19, 'user_1746101882369');
INSERT INTO public.users VALUES (20, 'user_1746101882368');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 64, true);


--
-- Name: users_u_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_u_id_seq', 20, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (u_id);


--
-- Name: games u_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT u_id_fkey FOREIGN KEY (u_id) REFERENCES public.users(u_id);


--
-- PostgreSQL database dump complete
--
