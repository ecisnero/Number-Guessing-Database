--
-- PostgreSQL database dump
--

-- Dumped from database version 12.18 (Ubuntu 12.18-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.18 (Ubuntu 12.18-0ubuntu0.20.04.1)

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
-- Name: user_stats; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.user_stats (
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.user_stats OWNER TO freecodecamp;

--
-- Data for Name: user_stats; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.user_stats VALUES ('user_1716165160580', 2, 131);
INSERT INTO public.user_stats VALUES ('user_1716165160581', 5, 195);
INSERT INTO public.user_stats VALUES ('user_1716165601214', 2, 531);
INSERT INTO public.user_stats VALUES ('user_1716165601215', 5, 71);
INSERT INTO public.user_stats VALUES ('player', 1, 10);
INSERT INTO public.user_stats VALUES ('user_1716165235719', 2, 575);
INSERT INTO public.user_stats VALUES ('user_1716165235720', 5, 288);
INSERT INTO public.user_stats VALUES ('user_1716165319074', 2, 465);
INSERT INTO public.user_stats VALUES ('user_1716165319075', 5, 80);
INSERT INTO public.user_stats VALUES ('r', 0, NULL);
INSERT INTO public.user_stats VALUES ('user_1716165436662', 2, 628);
INSERT INTO public.user_stats VALUES ('user_1716165436663', 5, 63);
INSERT INTO public.user_stats VALUES ('user_1716165465708', 2, 223);
INSERT INTO public.user_stats VALUES ('user_1716165465709', 5, 184);


--
-- Name: user_stats user_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_stats
    ADD CONSTRAINT user_stats_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--

