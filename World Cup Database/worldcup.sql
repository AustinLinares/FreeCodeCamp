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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
    year integer NOT NULL,
    round character varying(100) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
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
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 2018, 'Final', 321, 322, 4, 2);
INSERT INTO public.games VALUES (2, 2018, 'Third Place', 323, 324, 2, 0);
INSERT INTO public.games VALUES (3, 2018, 'Semi-Final', 322, 324, 2, 1);
INSERT INTO public.games VALUES (4, 2018, 'Semi-Final', 321, 323, 1, 0);
INSERT INTO public.games VALUES (5, 2018, 'Quarter-Final', 322, 325, 3, 2);
INSERT INTO public.games VALUES (6, 2018, 'Quarter-Final', 324, 326, 2, 0);
INSERT INTO public.games VALUES (7, 2018, 'Quarter-Final', 323, 327, 2, 1);
INSERT INTO public.games VALUES (8, 2018, 'Quarter-Final', 321, 328, 2, 0);
INSERT INTO public.games VALUES (9, 2018, 'Eighth-Final', 324, 329, 2, 1);
INSERT INTO public.games VALUES (10, 2018, 'Eighth-Final', 326, 330, 1, 0);
INSERT INTO public.games VALUES (11, 2018, 'Eighth-Final', 323, 331, 3, 2);
INSERT INTO public.games VALUES (12, 2018, 'Eighth-Final', 327, 332, 2, 0);
INSERT INTO public.games VALUES (13, 2018, 'Eighth-Final', 322, 333, 2, 1);
INSERT INTO public.games VALUES (14, 2018, 'Eighth-Final', 325, 334, 2, 1);
INSERT INTO public.games VALUES (15, 2018, 'Eighth-Final', 328, 335, 2, 1);
INSERT INTO public.games VALUES (16, 2018, 'Eighth-Final', 321, 336, 4, 3);
INSERT INTO public.games VALUES (17, 2014, 'Final', 337, 336, 1, 0);
INSERT INTO public.games VALUES (18, 2014, 'Third Place', 338, 327, 3, 0);
INSERT INTO public.games VALUES (19, 2014, 'Semi-Final', 336, 338, 1, 0);
INSERT INTO public.games VALUES (20, 2014, 'Semi-Final', 337, 327, 7, 1);
INSERT INTO public.games VALUES (21, 2014, 'Quarter-Final', 338, 339, 1, 0);
INSERT INTO public.games VALUES (22, 2014, 'Quarter-Final', 336, 323, 1, 0);
INSERT INTO public.games VALUES (23, 2014, 'Quarter-Final', 327, 329, 2, 1);
INSERT INTO public.games VALUES (24, 2014, 'Quarter-Final', 337, 321, 1, 0);
INSERT INTO public.games VALUES (25, 2014, 'Eighth-Final', 327, 340, 2, 1);
INSERT INTO public.games VALUES (26, 2014, 'Eighth-Final', 329, 328, 2, 0);
INSERT INTO public.games VALUES (27, 2014, 'Eighth-Final', 321, 341, 2, 0);
INSERT INTO public.games VALUES (28, 2014, 'Eighth-Final', 337, 342, 2, 1);
INSERT INTO public.games VALUES (29, 2014, 'Eighth-Final', 338, 332, 2, 1);
INSERT INTO public.games VALUES (30, 2014, 'Eighth-Final', 339, 343, 2, 1);
INSERT INTO public.games VALUES (31, 2014, 'Eighth-Final', 336, 330, 1, 0);
INSERT INTO public.games VALUES (32, 2014, 'Eighth-Final', 323, 344, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (321, 'France');
INSERT INTO public.teams VALUES (322, 'Croatia');
INSERT INTO public.teams VALUES (323, 'Belgium');
INSERT INTO public.teams VALUES (324, 'England');
INSERT INTO public.teams VALUES (325, 'Russia');
INSERT INTO public.teams VALUES (326, 'Sweden');
INSERT INTO public.teams VALUES (327, 'Brazil');
INSERT INTO public.teams VALUES (328, 'Uruguay');
INSERT INTO public.teams VALUES (329, 'Colombia');
INSERT INTO public.teams VALUES (330, 'Switzerland');
INSERT INTO public.teams VALUES (331, 'Japan');
INSERT INTO public.teams VALUES (332, 'Mexico');
INSERT INTO public.teams VALUES (333, 'Denmark');
INSERT INTO public.teams VALUES (334, 'Spain');
INSERT INTO public.teams VALUES (335, 'Portugal');
INSERT INTO public.teams VALUES (336, 'Argentina');
INSERT INTO public.teams VALUES (337, 'Germany');
INSERT INTO public.teams VALUES (338, 'Netherlands');
INSERT INTO public.teams VALUES (339, 'Costa Rica');
INSERT INTO public.teams VALUES (340, 'Chile');
INSERT INTO public.teams VALUES (341, 'Nigeria');
INSERT INTO public.teams VALUES (342, 'Algeria');
INSERT INTO public.teams VALUES (343, 'Greece');
INSERT INTO public.teams VALUES (344, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 32, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 344, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

