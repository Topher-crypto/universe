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
-- Name: astronaut; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astronaut (
    astronaut_id integer NOT NULL,
    name character varying(255) NOT NULL,
    age integer,
    mission_count integer,
    planet_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.astronaut OWNER TO freecodecamp;

--
-- Name: astronaut_astronaut_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.astronaut_astronaut_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.astronaut_astronaut_id_seq OWNER TO freecodecamp;

--
-- Name: astronaut_astronaut_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.astronaut_astronaut_id_seq OWNED BY public.astronaut.astronaut_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    total_stars integer NOT NULL,
    age_in_millions_of_years integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    has_black_hole boolean
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    diameter numeric(10,2),
    distance_from_planet numeric(10,2),
    is_rocky boolean,
    has_atmosphere boolean,
    has_water boolean,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
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
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(100),
    mass numeric(10,2),
    orbit_distance numeric(10,2),
    is_habitable boolean NOT NULL,
    has_rings boolean NOT NULL,
    is_discovered boolean NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    description text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    age_in_million_years integer,
    luminosity numeric(10,2),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
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
-- Name: astronaut astronaut_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronaut ALTER COLUMN astronaut_id SET DEFAULT nextval('public.astronaut_astronaut_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: astronaut; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astronaut VALUES (1, 'Neil Armstrong', 39, 3, 1, '2024-12-09 17:20:47.063158');
INSERT INTO public.astronaut VALUES (2, 'Buzz Aldrin', 41, 3, 1, '2024-12-09 17:20:47.063158');
INSERT INTO public.astronaut VALUES (3, 'Sally Ride', 35, 5, 2, '2024-12-09 17:20:47.063158');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Andromeda', 50, 10000, '2024-12-09 17:13:50.767749', NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 20, 12000, '2024-12-09 17:13:50.767749', NULL);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 30, 8000, '2024-12-09 17:13:50.767749', NULL);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 40, 11000, '2024-12-09 17:13:50.767749', NULL);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100, 13500, '2024-12-09 17:13:50.767749', NULL);
INSERT INTO public.galaxy VALUES (10, 'Virgo Cluster', 150, 5000, '2024-12-09 17:13:50.767749', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Moon', 3474.80, 384400.00, true, false, true, '2024-12-09 17:18:55.470352');
INSERT INTO public.moon VALUES (2, 2, 'Phobos', 22.40, 9377.00, true, false, false, '2024-12-09 17:18:55.470352');
INSERT INTO public.moon VALUES (3, 3, 'Proxima b Moon', 4000.00, 50000.00, true, false, true, '2024-12-09 17:18:55.470352');
INSERT INTO public.moon VALUES (4, 4, 'Alpha Centauri b Moon', 3000.00, 80000.00, true, false, false, '2024-12-09 17:18:55.470352');
INSERT INTO public.moon VALUES (5, 5, 'Kepler-22b Moon', 5000.00, 150000.00, true, false, true, '2024-12-09 17:18:55.470352');
INSERT INTO public.moon VALUES (6, 6, 'Titan', 5150.00, 1200000.00, true, true, true, '2024-12-09 17:18:55.470352');
INSERT INTO public.moon VALUES (21, 1, 'Luna', 3474.80, 384400.00, true, false, true, '2024-12-09 17:18:55.470352');
INSERT INTO public.moon VALUES (22, 2, 'Deimos', 12.00, 23460.00, true, false, false, '2024-12-09 17:18:55.470352');
INSERT INTO public.moon VALUES (23, 3, 'Proxima b II', 2200.00, 45000.00, false, false, true, '2024-12-09 17:18:55.470352');
INSERT INTO public.moon VALUES (24, 4, 'Alpha Centauri b II', 2100.00, 90000.00, true, false, false, '2024-12-09 17:18:55.470352');
INSERT INTO public.moon VALUES (25, 5, 'Kepler-22b II', 5200.00, 180000.00, true, false, true, '2024-12-09 17:18:55.470352');
INSERT INTO public.moon VALUES (26, 6, 'Rhea', 1528.00, 500000.00, true, false, true, '2024-12-09 17:18:55.470352');
INSERT INTO public.moon VALUES (27, 1, 'Io', 3630.00, 422000.00, true, false, true, '2024-12-09 17:18:55.470352');
INSERT INTO public.moon VALUES (28, 2, 'Europa', 3120.00, 670900.00, true, true, true, '2024-12-09 17:18:55.470352');
INSERT INTO public.moon VALUES (29, 3, 'Ganymede', 5262.00, 1070400.00, true, true, true, '2024-12-09 17:18:55.470352');
INSERT INTO public.moon VALUES (30, 4, 'Callisto', 4821.00, 1882700.00, true, false, true, '2024-12-09 17:18:55.470352');
INSERT INTO public.moon VALUES (31, 5, 'Titan II', 5100.00, 1800000.00, true, true, true, '2024-12-09 17:18:55.470352');
INSERT INTO public.moon VALUES (32, 6, 'Enceladus', 504.00, 238000.00, true, true, true, '2024-12-09 17:18:55.470352');
INSERT INTO public.moon VALUES (33, 1, 'Mimas', 396.00, 185000.00, true, false, true, '2024-12-09 17:18:55.470352');
INSERT INTO public.moon VALUES (34, 2, 'Triton', 2706.00, 3550000.00, true, true, true, '2024-12-09 17:18:55.470352');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Earth', 'Terrestrial', 1.00, 1.00, true, false, true, '2024-12-09 17:18:45.921425', NULL);
INSERT INTO public.planet VALUES (2, 1, 'Mars', 'Terrestrial', 0.11, 1.50, false, false, true, '2024-12-09 17:18:45.921425', NULL);
INSERT INTO public.planet VALUES (3, 2, 'Proxima b', 'Earth-like', 1.17, 0.05, true, false, true, '2024-12-09 17:18:45.921425', NULL);
INSERT INTO public.planet VALUES (4, 2, 'Alpha Centauri b', 'Super-Earth', 1.13, 0.05, false, false, true, '2024-12-09 17:18:45.921425', NULL);
INSERT INTO public.planet VALUES (5, 3, 'Kepler-22b', 'Super-Earth', 2.40, 0.85, true, false, true, '2024-12-09 17:18:45.921425', NULL);
INSERT INTO public.planet VALUES (6, 4, 'Uranus', 'Ice Giant', 14.50, 19.20, false, true, true, '2024-12-09 17:18:45.921425', NULL);
INSERT INTO public.planet VALUES (7, 4, 'Venus', 'Terrestrial', 0.82, 0.72, false, false, true, '2024-12-09 17:18:45.921425', NULL);
INSERT INTO public.planet VALUES (8, 4, 'Mercury', 'Terrestrial', 0.06, 0.39, false, false, true, '2024-12-09 17:18:45.921425', NULL);
INSERT INTO public.planet VALUES (9, 4, 'Jupiter', 'Gas Giant', 318.00, 5.20, false, true, true, '2024-12-09 17:18:45.921425', NULL);
INSERT INTO public.planet VALUES (10, 5, 'Saturn', 'Gas Giant', 95.20, 9.50, false, true, true, '2024-12-09 17:18:45.921425', NULL);
INSERT INTO public.planet VALUES (11, 5, 'Neptune', 'Ice Giant', 17.10, 30.10, false, true, true, '2024-12-09 17:18:45.921425', NULL);
INSERT INTO public.planet VALUES (12, 6, 'TRAPPIST-1d', 'Earth-like', 0.41, 0.02, true, false, true, '2024-12-09 17:18:45.921425', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sol', 'Main Sequence', 4600, 1.00, '2024-12-09 17:13:59.089653');
INSERT INTO public.star VALUES (2, 1, 'Alpha Centauri', 'Main Sequence', 5000, 1.10, '2024-12-09 17:13:59.089653');
INSERT INTO public.star VALUES (3, 2, 'Sirius', 'Main Sequence', 300, 25.40, '2024-12-09 17:13:59.089653');
INSERT INTO public.star VALUES (4, 3, 'Polaris', 'Supergiant', 7000, 2.20, '2024-12-09 17:13:59.089653');
INSERT INTO public.star VALUES (5, 4, 'Betelgeuse', 'Red Giant', 10000, 100.00, '2024-12-09 17:13:59.089653');
INSERT INTO public.star VALUES (6, 5, 'Rigel', 'Blue Supergiant', 500000, 120.00, '2024-12-09 17:13:59.089653');


--
-- Name: astronaut_astronaut_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.astronaut_astronaut_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 34, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: astronaut astronaut_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronaut
    ADD CONSTRAINT astronaut_name_key UNIQUE (name);


--
-- Name: astronaut astronaut_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronaut
    ADD CONSTRAINT astronaut_pkey PRIMARY KEY (astronaut_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: astronaut fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronaut
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

