--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    age_million_years integer NOT NULL,
    distance_from_earth numeric(12,2) NOT NULL,
    is_active boolean NOT NULL,
    description text
);


ALTER TABLE public.galaxy OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    radius_km integer NOT NULL,
    orbital_period_days numeric(12,2) NOT NULL,
    has_atmosphere boolean NOT NULL,
    description text
);


ALTER TABLE public.moon OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(50) NOT NULL,
    orbital_period_days numeric(12,2) NOT NULL,
    has_life boolean NOT NULL,
    description text
);


ALTER TABLE public.planet OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: space_station; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.space_station (
    space_station_id integer NOT NULL,
    name character varying(100) NOT NULL,
    location character varying(100) NOT NULL,
    crew_capacity integer NOT NULL,
    is_operational boolean NOT NULL
);


ALTER TABLE public.space_station OWNER TO postgres;

--
-- Name: space_station_space_station_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.space_station_space_station_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_station_space_station_id_seq OWNER TO postgres;

--
-- Name: space_station_space_station_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.space_station_space_station_id_seq OWNED BY public.space_station.space_station_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    spectral_type character varying(10) NOT NULL,
    temperature_k integer NOT NULL,
    mass_solar numeric(8,3) NOT NULL,
    is_visible boolean NOT NULL
);


ALTER TABLE public.star OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: space_station space_station_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.space_station ALTER COLUMN space_station_id SET DEFAULT nextval('public.space_station_space_station_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13610, 0.00, true, 'Home galaxy of Earth');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10010, 2537000.00, true, 'Nearest major galaxy');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 11200, 2723000.00, true, 'A member of the Local Group');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 9000, 23000000.00, true, 'Interacting grand-design spiral');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral', 13000, 29350000.00, true, 'Bright central bulge and dust lane');
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Irregular', 13000, 163000.00, true, 'Satellite galaxy of the Milky Way');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.moon VALUES (1, 'Luna', 3, 1737, 27.32, false, 'Earths natural satellite');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11, 0.32, false, 'Inner moon of Mars');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6, 1.26, false, 'Outer moon of Mars');
INSERT INTO public.moon VALUES (4, 'Io', 5, 1821, 1.77, true, 'Volcanically active moon');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1561, 3.55, false, 'Icy moon with a subsurface ocean');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 2634, 7.15, false, 'Largest moon in the Solar System');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410, 16.69, false, 'Heavily cratered moon');
INSERT INTO public.moon VALUES (8, 'Titan', 6, 2575, 15.95, true, 'Moon with a dense atmosphere');
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 764, 4.52, false, 'Icy moon of Saturn');
INSERT INTO public.moon VALUES (10, 'Iapetus', 6, 735, 79.33, false, 'Two-toned moon of Saturn');
INSERT INTO public.moon VALUES (11, 'Andromeda Prime I-a', 9, 1200, 18.40, false, 'Moon of a distant super-Earth');
INSERT INTO public.moon VALUES (12, 'Andromeda Prime I-b', 9, 650, 42.10, false, 'Outer moon of a distant super-Earth');
INSERT INTO public.moon VALUES (13, 'Andromeda Prime II-a', 10, 2100, 33.50, false, 'Moon of a distant gas giant');
INSERT INTO public.moon VALUES (14, 'Andromeda Prime II-b', 10, 900, 88.20, false, 'Outer moon of a distant gas giant');
INSERT INTO public.moon VALUES (15, 'Triangulum Beacon I-a', 11, 500, 9.80, false, 'Moon of a compact rocky planet');
INSERT INTO public.moon VALUES (16, 'Triangulum Beacon I-b', 11, 320, 21.70, false, 'Small outer moon');
INSERT INTO public.moon VALUES (17, 'Whirlpool Core I-a', 12, 1800, 25.00, false, 'Large moon of an ice giant');
INSERT INTO public.moon VALUES (18, 'Whirlpool Core I-b', 12, 700, 61.00, false, 'Small moon of an ice giant');
INSERT INTO public.moon VALUES (19, 'Whirlpool Core I-c', 12, 300, 103.00, false, 'Distant irregular moon');
INSERT INTO public.moon VALUES (20, 'Proxima b-I', 8, 420, 6.50, false, 'Moon of Proxima b');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 87.97, false, 'Smallest planet in the Solar System');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 224.70, false, 'Cloud-covered rocky planet');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', 365.25, true, 'Home world');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 687.00, false, 'The red planet');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas giant', 4332.59, false, 'Largest planet in the Solar System');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas giant', 10759.22, false, 'Planet known for its rings');
INSERT INTO public.planet VALUES (7, 'Sirius b', 2, 'White dwarf', 0.38, false, 'Dense companion star remnant');
INSERT INTO public.planet VALUES (8, 'Proxima b', 3, 'Terrestrial', 11.19, false, 'Exoplanet orbiting Proxima Centauri');
INSERT INTO public.planet VALUES (9, 'Andromeda Prime I', 4, 'Super-Earth', 410.50, false, 'A distant rocky world');
INSERT INTO public.planet VALUES (10, 'Andromeda Prime II', 4, 'Gas giant', 1290.00, false, 'A distant gas giant');
INSERT INTO public.planet VALUES (11, 'Triangulum Beacon I', 5, 'Terrestrial', 96.40, false, 'A compact rocky planet');
INSERT INTO public.planet VALUES (12, 'Whirlpool Core I', 6, 'Ice giant', 802.00, false, 'A remote ice giant');


--
-- Data for Name: space_station; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.space_station VALUES (1, 'Lagrange One', 'Earth-Moon L1', 120, true);
INSERT INTO public.space_station VALUES (2, 'Mars Gateway', 'Mars orbit', 60, true);
INSERT INTO public.space_station VALUES (3, 'Deep Space Relay', 'Outer Solar System', 30, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 5778, 1.000, true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A1V', 9940, 2.020, true);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, 'M5.5V', 3042, 0.122, true);
INSERT INTO public.star VALUES (4, 'Andromeda Prime', 2, 'B2V', 22000, 10.500, true);
INSERT INTO public.star VALUES (5, 'Triangulum Beacon', 3, 'O9V', 34000, 18.200, true);
INSERT INTO public.star VALUES (6, 'Whirlpool Core Star', 4, 'F5V', 6500, 1.300, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: space_station_space_station_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.space_station_space_station_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: space_station space_station_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.space_station
    ADD CONSTRAINT space_station_name_key UNIQUE (name);


--
-- Name: space_station space_station_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.space_station
    ADD CONSTRAINT space_station_pkey PRIMARY KEY (space_station_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA public TO freecodecamp;


--
-- Name: TABLE galaxy; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.galaxy TO freecodecamp;


--
-- Name: SEQUENCE galaxy_galaxy_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON SEQUENCE public.galaxy_galaxy_id_seq TO freecodecamp;


--
-- Name: TABLE moon; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.moon TO freecodecamp;


--
-- Name: SEQUENCE moon_moon_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON SEQUENCE public.moon_moon_id_seq TO freecodecamp;


--
-- Name: TABLE planet; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.planet TO freecodecamp;


--
-- Name: SEQUENCE planet_planet_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON SEQUENCE public.planet_planet_id_seq TO freecodecamp;


--
-- Name: TABLE space_station; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.space_station TO freecodecamp;


--
-- Name: SEQUENCE space_station_space_station_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON SEQUENCE public.space_station_space_station_id_seq TO freecodecamp;


--
-- Name: TABLE star; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.star TO freecodecamp;


--
-- Name: SEQUENCE star_star_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON SEQUENCE public.star_star_id_seq TO freecodecamp;


--
-- PostgreSQL database dump complete
--

