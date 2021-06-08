--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: jey
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE auth_group OWNER TO jey;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: jey
--

CREATE SEQUENCE auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO jey;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jey
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: jey
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO jey;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: jey
--

CREATE SEQUENCE auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO jey;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jey
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: jey
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO jey;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: jey
--

CREATE SEQUENCE auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO jey;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jey
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: jey
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO jey;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: jey
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO jey;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: jey
--

CREATE SEQUENCE auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO jey;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jey
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: jey
--

CREATE SEQUENCE auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO jey;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jey
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: jey
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO jey;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: jey
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO jey;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jey
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: jey
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO jey;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: jey
--

CREATE SEQUENCE django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO jey;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jey
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: jey
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO jey;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: jey
--

CREATE SEQUENCE django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO jey;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jey
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: jey
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO jey;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: jey
--

CREATE SEQUENCE django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO jey;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jey
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: jey
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO jey;

--
-- Name: myapp_language; Type: TABLE; Schema: public; Owner: jey
--

CREATE TABLE myapp_language (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    description text NOT NULL,
    created_at date NOT NULL
);


ALTER TABLE myapp_language OWNER TO jey;

--
-- Name: myapp_language_id_seq; Type: SEQUENCE; Schema: public; Owner: jey
--

CREATE SEQUENCE myapp_language_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE myapp_language_id_seq OWNER TO jey;

--
-- Name: myapp_language_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jey
--

ALTER SEQUENCE myapp_language_id_seq OWNED BY myapp_language.id;


--
-- Name: myapp_project; Type: TABLE; Schema: public; Owner: jey
--

CREATE TABLE myapp_project (
    title character varying(100) NOT NULL,
    description text NOT NULL,
    cover_image character varying(255) NOT NULL,
    bg_image character varying(255) NOT NULL,
    slug character varying(1000) NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    website character varying(100) NOT NULL,
    github character varying(100) NOT NULL,
    created_at date NOT NULL,
    featured boolean NOT NULL,
    project_technologies character varying(255)[],
    languages character varying(255)[]
);


ALTER TABLE myapp_project OWNER TO jey;

--
-- Name: myapp_skill; Type: TABLE; Schema: public; Owner: jey
--

CREATE TABLE myapp_skill (
    title character varying(100) NOT NULL,
    percentage character varying(100) NOT NULL,
    icon character varying(100),
    slug character varying(1000) NOT NULL,
    description text NOT NULL,
    created_at date NOT NULL,
    specialties character varying(255)[]
);


ALTER TABLE myapp_skill OWNER TO jey;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: jey
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: jey
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: jey
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: jey
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: jey
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: jey
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: jey
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: jey
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: jey
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: myapp_language id; Type: DEFAULT; Schema: public; Owner: jey
--

ALTER TABLE ONLY myapp_language ALTER COLUMN id SET DEFAULT nextval('myapp_language_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: jey
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: jey
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: jey
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add client	7	add_client
26	Can change client	7	change_client
27	Can delete client	7	delete_client
28	Can view client	7	view_client
29	Can add skill	8	add_skill
30	Can change skill	8	change_skill
31	Can delete skill	8	delete_skill
32	Can view skill	8	view_skill
33	Can add specialty	9	add_specialty
34	Can change specialty	9	change_specialty
35	Can delete specialty	9	delete_specialty
36	Can view specialty	9	view_specialty
37	Can add project	10	add_project
38	Can change project	10	change_project
39	Can delete project	10	delete_project
40	Can view project	10	view_project
41	Can add project technology	11	add_projecttechnology
42	Can change project technology	11	change_projecttechnology
43	Can delete project technology	11	delete_projecttechnology
44	Can view project technology	11	view_projecttechnology
45	Can add language	12	add_language
46	Can change language	12	change_language
47	Can delete language	12	delete_language
48	Can view language	12	view_language
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: jey
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$216000$Zja9zOIycGK9$1FwXJO1nLH/Mry/eW2tN2wj5dc8cZpjrLvDfSn3cIqA=	2021-05-26 14:19:28.614491+00	t	jey			savalijey@gmail.com	t	t	2021-02-21 15:53:56.168796+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: jey
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: jey
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: jey
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-02-21 15:58:31.056167+00	rest-apis	Rest APIs	1	[{"added": {}}]	8	1
2	2021-02-22 21:26:31.66278+00	dc	dc	1	[{"added": {}}]	10	1
3	2021-02-22 21:35:05.893147+00	dc	dc	3		10	1
4	2021-02-22 21:37:20.043333+00	dc	Mirtoch Twitter	2	[{"changed": {"fields": ["Title", "Description"]}}]	10	1
5	2021-02-22 21:39:30.691973+00	dc	Mirtoch Twitter	2	[{"changed": {"fields": ["Image", "Image", "Website", "Github"]}}]	10	1
6	2021-02-22 21:40:50.502503+00	1	Django	1	[{"added": {}}]	11	1
7	2021-02-22 21:42:49.398805+00	django	Django	1	[{"added": {}}]	8	1
8	2021-02-22 21:44:22.170714+00	rest-apis	APIs	2	[{"changed": {"fields": ["Title", "Percentage", "Icon", "Description"]}}]	8	1
9	2021-02-22 21:45:00.804614+00	rest-apis	APIs	2	[{"changed": {"fields": ["Description"]}}]	8	1
10	2021-02-22 21:53:20.826733+00	serverless-architecture	Serverless Architecture	1	[{"added": {}}]	8	1
11	2021-02-22 21:54:22.42055+00	shop-duka	Shop Duka	1	[{"added": {}}]	10	1
12	2021-02-22 21:55:32.197772+00	dc	Mirtoch Twitter	2	[{"changed": {"fields": ["Featured"]}}]	10	1
13	2021-02-22 21:57:25.354354+00	dc	Mirtoch Twitter	2	[{"changed": {"fields": ["Image", "Image"]}}]	10	1
14	2021-02-22 21:58:11.492456+00	django	Backend Development	2	[{"changed": {"fields": ["Title", "Percentage"]}}]	8	1
15	2021-02-22 22:00:41.273975+00	frontend-development	Frontend Development	1	[{"added": {}}]	8	1
16	2021-02-22 22:02:39.121929+00	testing-linting	Testing & Linting	1	[{"added": {}}]	8	1
17	2021-02-22 22:03:19.967849+00	frontend-development	Frontend Development	2	[{"changed": {"fields": ["Icon"]}}]	8	1
18	2021-02-22 22:05:22.431442+00	data-analysis	Data Analysis	1	[{"added": {}}]	8	1
19	2021-02-22 22:09:57.653892+00	my-blog	My Blog	1	[{"added": {}}]	10	1
20	2021-02-22 22:14:15.409669+00	shop-duka	Shop Duka	2	[{"changed": {"fields": ["Image", "Image"]}}]	10	1
21	2021-02-22 22:15:31.994947+00	testing-linting	Testing & Linting	2	[{"changed": {"fields": ["Icon"]}}]	8	1
22	2021-02-22 22:23:11.88366+00	corona-count	Corona Count	1	[{"added": {}}]	10	1
23	2021-02-22 22:30:10.878945+00	telegram-textbot	Telegram Textbot	1	[{"added": {}}]	10	1
24	2021-02-22 22:31:02.646833+00	data-analysis	Data Analysis & Automation	2	[{"changed": {"fields": ["Title"]}}]	8	1
25	2021-02-22 22:37:08.767333+00	jumia-kilimall-price-comparison	Jumia Kilimall Price Comparison	1	[{"added": {}}]	10	1
26	2021-02-22 22:40:07.786741+00	jumia-kilimall-price-comparison	Jumia Kilimall Price Comparison	2	[{"changed": {"fields": ["Image", "Image"]}}]	10	1
27	2021-02-22 22:41:26.658498+00	dc	Mirtoch Twitter	2	[{"changed": {"fields": ["Skill"]}}]	10	1
28	2021-02-22 22:42:03.43796+00	shop-duka	Shop Duka	2	[{"changed": {"fields": ["Skill"]}}]	10	1
29	2021-02-22 22:43:53.188485+00	my-blog	Js-Python Blog	2	[{"changed": {"fields": ["Title"]}}]	10	1
30	2021-02-22 22:45:19.301814+00	2	Django Rest Framework (DRF)	1	[{"added": {}}]	11	1
31	2021-02-22 22:45:32.251355+00	3	Celery	1	[{"added": {}}]	11	1
32	2021-02-22 22:45:41.959966+00	4	Redis	1	[{"added": {}}]	11	1
33	2021-02-22 22:46:02.498236+00	5	Selenium	1	[{"added": {}}]	11	1
34	2021-02-22 22:46:11.986478+00	6	bs4	1	[{"added": {}}]	11	1
35	2021-02-22 22:46:22.6425+00	7	Django	1	[{"added": {}}]	11	1
36	2021-02-22 22:46:34.097383+00	8	PostgreSQL	1	[{"added": {}}]	11	1
37	2021-02-22 22:46:45.736551+00	9	PostgreSQL	1	[{"added": {}}]	11	1
38	2021-02-22 22:47:06.6014+00	10	TinyMCE Richtext Editor	1	[{"added": {}}]	11	1
39	2021-02-22 22:47:22.081624+00	11	Django	1	[{"added": {}}]	11	1
40	2021-02-22 22:47:33.123054+00	12	Selenium	1	[{"added": {}}]	11	1
41	2021-02-22 22:47:45.945282+00	13	Scikit Learn	1	[{"added": {}}]	11	1
42	2021-02-22 22:48:05.196201+00	14	HTML/CSS	1	[{"added": {}}]	11	1
43	2021-02-22 22:48:14.751665+00	15	HTML/CSS	1	[{"added": {}}]	11	1
44	2021-02-22 22:48:23.635753+00	16	Django	1	[{"added": {}}]	11	1
45	2021-02-22 22:48:33.724846+00	17	Twitter API	1	[{"added": {}}]	11	1
46	2021-02-22 22:48:55.311944+00	18	Sendgrid	1	[{"added": {}}]	11	1
47	2021-02-22 22:49:07.146656+00	19	Netlify	1	[{"added": {}}]	11	1
48	2021-02-22 22:49:18.956787+00	20	Digital Ocean	1	[{"added": {}}]	11	1
49	2021-02-22 22:49:28.686117+00	21	Nginx	1	[{"added": {}}]	11	1
50	2021-02-22 22:49:59.948405+00	22	Angular	1	[{"added": {}}]	11	1
51	2021-02-22 22:50:12.010899+00	23	Flask Restful	1	[{"added": {}}]	11	1
52	2021-02-22 22:50:25.322561+00	24	PostgreSQL	1	[{"added": {}}]	11	1
53	2021-02-22 22:50:44.177842+00	25	Apiary API Documentation	1	[{"added": {}}]	11	1
54	2021-02-22 22:50:54.319494+00	26	Figma	1	[{"added": {}}]	11	1
55	2021-02-22 22:51:13.551954+00	27	Payment Gateways	1	[{"added": {}}]	11	1
56	2021-02-22 22:51:24.196392+00	28	Selenium	1	[{"added": {}}]	11	1
57	2021-02-22 22:51:34.212504+00	29	Flask	1	[{"added": {}}]	11	1
58	2021-02-22 22:51:44.348878+00	30	SQL Alchemy	1	[{"added": {}}]	11	1
59	2021-02-22 22:51:57.218861+00	31	PostgreSQL	1	[{"added": {}}]	11	1
60	2021-02-22 22:52:16.079052+00	32	Telegram	1	[{"added": {}}]	11	1
61	2021-02-22 22:52:47.782353+00	1	Django Rest Framework	1	[{"added": {}}]	9	1
62	2021-02-22 22:53:00.387621+00	2	Django Graphene	1	[{"added": {}}]	9	1
63	2021-02-22 22:53:13.256338+00	3	Flask Restful	1	[{"added": {}}]	9	1
64	2021-02-22 22:53:28.463779+00	4	HTTP	1	[{"added": {}}]	9	1
65	2021-02-22 22:53:45.784137+00	5	API Documentation	1	[{"added": {}}]	9	1
66	2021-02-22 22:54:10.029027+00	6	AWS (ec2, s3, Route 53)	1	[{"added": {}}]	9	1
67	2021-02-22 22:54:22.338469+00	7	Digital Ocean	1	[{"added": {}}]	9	1
68	2021-02-22 22:55:49.953505+00	8	Nginx (reverse proxy, load balancing)	1	[{"added": {}}]	9	1
69	2021-02-22 22:56:51.038121+00	9	GCP Compute Engine	1	[{"added": {}}]	9	1
70	2021-02-22 22:57:08.207623+00	10	Docker, docker-compose	1	[{"added": {}}]	9	1
71	2021-02-22 22:57:49.946245+00	testing-linting	CI/CD, Testing & Linting	2	[{"changed": {"fields": ["Title"]}}]	8	1
72	2021-02-22 22:58:26.836644+00	11	HTML | CSS | SCSS | Bootstrap | Tailwind	1	[{"added": {}}]	9	1
73	2021-02-22 22:58:37.382423+00	12	React	1	[{"added": {}}]	9	1
74	2021-02-22 22:58:47.886481+00	13	VueJs	1	[{"added": {}}]	9	1
75	2021-02-22 22:59:04.14072+00	14	Angular 7+	1	[{"added": {}}]	9	1
76	2021-02-22 22:59:32.143621+00	15	Figma, Adobe XD (UI/UX)	1	[{"added": {}}]	9	1
77	2021-02-22 22:59:54.423154+00	16	Webflow & Wordpress	1	[{"added": {}}]	9	1
78	2021-02-22 23:00:06.194755+00	17	Scrapy	1	[{"added": {}}]	9	1
79	2021-02-22 23:00:16.85588+00	18	Selenium	1	[{"added": {}}]	9	1
80	2021-02-22 23:00:30.632813+00	19	Data Visualization	1	[{"added": {}}]	9	1
81	2021-02-22 23:00:52.071172+00	20	Plotly & Matplotlib	1	[{"added": {}}]	9	1
82	2021-02-22 23:01:39.702877+00	21	bs4	1	[{"added": {}}]	9	1
83	2021-02-22 23:01:54.522809+00	22	SciKit Learn	1	[{"added": {}}]	9	1
84	2021-02-22 23:02:06.175933+00	23	Django	1	[{"added": {}}]	9	1
85	2021-02-22 23:02:17.623974+00	24	DRF	1	[{"added": {}}]	9	1
86	2021-02-22 23:02:26.998638+00	25	Flask	1	[{"added": {}}]	9	1
87	2021-02-22 23:02:45.465448+00	26	Cron Jobs	1	[{"added": {}}]	9	1
88	2021-02-22 23:03:11.939094+00	27	PostgreSQL, MySQL, SQLite	1	[{"added": {}}]	9	1
89	2021-02-22 23:03:51.927571+00	28	Optimization Algorithms	1	[{"added": {}}]	9	1
90	2021-02-22 23:04:03.874224+00	29	TravisCI	1	[{"added": {}}]	9	1
91	2021-02-22 23:04:13.786725+00	30	CircleCI	1	[{"added": {}}]	9	1
92	2021-02-22 23:04:44.73417+00	31	Autopep8 | Pylint | Eslint standards	1	[{"added": {}}]	9	1
93	2021-02-22 23:05:06.236861+00	32	Github Actions workflows	1	[{"added": {}}]	9	1
94	2021-02-22 23:05:54.74264+00	18	Selenium, Scrapy, bs4	2	[{"changed": {"fields": ["Title"]}}]	9	1
95	2021-02-22 23:06:11.24296+00	21	bs4	3		9	1
96	2021-02-22 23:06:11.245222+00	17	Scrapy	3		9	1
97	2021-02-22 23:06:38.071206+00	15	Figma, Adobe XD (UI/UX)	3		9	1
98	2021-02-22 23:06:38.073322+00	13	VueJs	3		9	1
99	2021-02-22 23:13:39.249757+00	telegram-textbot	Telegram Textbot	2	[{"changed": {"fields": ["Website"]}}]	10	1
100	2021-02-22 23:21:31.675725+00	my-blog	Fadhila Charity Organization	2	[{"changed": {"fields": ["Title", "Description", "Image", "Image", "Website", "Github"]}}]	10	1
101	2021-02-22 23:22:27.333698+00	33	Bootstrap	1	[{"added": {}}]	11	1
102	2021-02-22 23:22:39.826276+00	34	Django Graphene	1	[{"added": {}}]	11	1
103	2021-02-22 23:22:56.906565+00	35	React | Apollo Client	1	[{"added": {}}]	11	1
104	2021-02-22 23:23:33.788737+00	36	Payment Gateways(Mpesa C2B, Paypal, PesaPal)	1	[{"added": {}}]	11	1
105	2021-03-05 12:44:45.521266+00	1	Django	1	[{"added": {}}]	12	1
106	2021-03-05 12:44:56.24579+00	2	React	1	[{"added": {}}]	12	1
107	2021-03-05 12:45:13.777025+00	3	HTML/CSS	1	[{"added": {}}]	12	1
108	2021-03-05 12:45:26.007537+00	4	Flask	1	[{"added": {}}]	12	1
109	2021-03-05 12:45:57.036273+00	5	DRF	1	[{"added": {}}]	12	1
110	2021-03-05 12:46:56.038815+00	corona-count	Corona Count	2	[{"changed": {"fields": ["Project technologies", "Languages"]}}]	10	1
111	2021-03-05 12:48:34.853957+00	6	Angular	1	[{"added": {}}]	12	1
112	2021-03-05 13:24:09.40388+00	testing-linting	CI/CD, Testing & Linting	2	[{"changed": {"fields": ["Specialties"]}}]	8	1
113	2021-03-05 13:25:23.420769+00	serverless-architecture	Serverless Architecture	2	[{"changed": {"fields": ["Specialties"]}}]	8	1
114	2021-03-05 13:26:45.299476+00	rest-apis	APIs	2	[{"changed": {"fields": ["Specialties"]}}]	8	1
115	2021-03-05 13:28:18.929852+00	django	Backend Development	2	[{"changed": {"fields": ["Specialties"]}}]	8	1
116	2021-03-05 13:29:25.380824+00	frontend-development	Frontend Development	2	[{"changed": {"fields": ["Specialties"]}}]	8	1
117	2021-03-05 13:29:41.224895+00	frontend-development	Frontend Development	2	[{"changed": {"fields": ["Specialties"]}}]	8	1
118	2021-03-05 13:30:15.037065+00	data-analysis	Data Analysis & Automation	2	[{"changed": {"fields": ["Specialties"]}}]	8	1
119	2021-03-05 13:31:25.836566+00	data-analysis	Data Analysis & Automation	2	[{"changed": {"fields": ["Specialties"]}}]	8	1
120	2021-03-05 13:32:28.2174+00	corona-count	Corona Count	2	[{"changed": {"fields": ["Languages"]}}]	10	1
121	2021-03-05 13:33:40.865897+00	3	HTML/CSS	3		12	1
122	2021-03-05 13:33:52.507832+00	corona-count	Corona Count	2	[{"changed": {"fields": ["Languages"]}}]	10	1
123	2021-03-05 13:34:38.38641+00	my-blog	Fadhila Charity Organization	2	[{"changed": {"fields": ["Project technologies", "Languages"]}}]	10	1
124	2021-03-05 13:35:52.053254+00	jumia-kilimall-price-comparison	Jumia Kilimall Price Comparison	2	[{"changed": {"fields": ["Project technologies", "Languages"]}}]	10	1
125	2021-03-05 13:36:05.642014+00	7	DataScience	1	[{"added": {}}]	12	1
126	2021-03-05 13:37:24.851262+00	dc	Mirtoch Twitter	2	[{"changed": {"fields": ["Project technologies", "Languages"]}}]	10	1
127	2021-03-05 13:38:25.870625+00	shop-duka	Shop Duka	2	[{"changed": {"fields": ["Project technologies", "Languages"]}}]	10	1
128	2021-03-05 13:39:09.012363+00	telegram-textbot	Telegram Textbot	2	[{"changed": {"fields": ["Project technologies", "Languages"]}}]	10	1
129	2021-03-05 13:39:22.571632+00	8	Automation	1	[{"added": {}}]	12	1
130	2021-03-05 13:42:01.368525+00	corona-count	Corona Count	2	[{"changed": {"fields": ["Project technologies"]}}]	10	1
131	2021-03-05 13:42:52.227161+00	my-blog	Fadhila Charity Organization	2	[{"changed": {"fields": ["Project technologies"]}}]	10	1
132	2021-03-05 13:43:25.148918+00	jumia-kilimall-price-comparison	Jumia Kilimall Price Comparison	2	[{"changed": {"fields": ["Project technologies"]}}]	10	1
133	2021-03-05 13:43:53.929889+00	telegram-textbot	Telegram Textbot	2	[{"changed": {"fields": ["Project technologies"]}}]	10	1
134	2021-03-05 13:44:18.826965+00	telegram-textbot	Telegram Textbot	2	[{"changed": {"fields": ["Project technologies"]}}]	10	1
135	2021-03-05 13:44:38.463645+00	dc	Mirtoch Twitter	2	[{"changed": {"fields": ["Project technologies"]}}]	10	1
136	2021-03-05 13:44:58.816804+00	jumia-kilimall-price-comparison	Jumia Kilimall Price Comparison	2	[{"changed": {"fields": ["Project technologies"]}}]	10	1
137	2021-03-05 13:45:18.50446+00	my-blog	Fadhila Charity Organization	2	[{"changed": {"fields": ["Project technologies"]}}]	10	1
138	2021-03-05 13:45:54.555814+00	corona-count	Corona Count	2	[{"changed": {"fields": ["Project technologies"]}}]	10	1
139	2021-03-05 14:10:18.094204+00	corona-count	Corona Count	2	[{"changed": {"fields": ["Featured"]}}]	10	1
140	2021-03-05 14:10:26.449007+00	my-blog	Fadhila Charity Organization	2	[{"changed": {"fields": ["Featured"]}}]	10	1
141	2021-03-05 14:10:36.79049+00	jumia-kilimall-price-comparison	Jumia Kilimall Price Comparison	2	[{"changed": {"fields": ["Featured"]}}]	10	1
142	2021-03-05 14:10:46.965149+00	dc	Mirtoch Twitter	2	[{"changed": {"fields": ["Featured"]}}]	10	1
143	2021-03-05 14:11:03.27957+00	telegram-textbot	Telegram Textbot	2	[{"changed": {"fields": ["Featured"]}}]	10	1
144	2021-03-06 17:36:57.385379+00	corona-count	Corona Count	2	[{"changed": {"fields": ["Image"]}}]	10	1
145	2021-03-06 17:42:01.023341+00	my-blog	Fadhila Charity Organization	2	[{"changed": {"fields": ["Image"]}}]	10	1
146	2021-03-06 17:47:54.188336+00	jumia-kilimall-price-comparison	Jumia Kilimall Price Comparison	2	[{"changed": {"fields": ["Image"]}}]	10	1
147	2021-03-06 17:51:28.633311+00	dc	Mirtoch Twitter	2	[{"changed": {"fields": ["Image"]}}]	10	1
148	2021-03-06 17:53:59.435713+00	telegram-textbot	Telegram Textbot	2	[{"changed": {"fields": ["Image"]}}]	10	1
149	2021-03-06 17:55:47.831014+00	shop-duka	Shop Duka	2	[{"changed": {"fields": ["Image"]}}]	10	1
150	2021-03-12 12:10:42.157379+00	frontend-development	Frontend Development	2	[{"changed": {"fields": ["Specialties"]}}]	8	1
151	2021-03-13 03:58:06.636458+00	serverless-architecture	Serverless Architecture	2	[{"changed": {"fields": ["Specialties"]}}]	8	1
152	2021-03-13 03:58:17.399355+00	testing-linting	CI/CD, Testing & Linting	3		8	1
153	2021-03-13 03:58:46.01323+00	django	Backend Development	2	[{"changed": {"fields": ["Specialties"]}}]	8	1
154	2021-03-13 03:58:55.655961+00	rest-apis	APIs	3		8	1
155	2021-03-13 03:59:17.688204+00	data-analysis	Data Analysis & Automation	3		8	1
156	2021-03-13 03:59:28.442377+00	django	Backend Development	2	[{"changed": {"fields": ["Specialties"]}}]	8	1
157	2021-03-13 04:00:57.409321+00	django	Backend Development	2	[{"changed": {"fields": ["Specialties"]}}]	8	1
158	2021-03-13 04:03:38.753016+00	django	Backend Development	2	[{"changed": {"fields": ["Specialties"]}}]	8	1
159	2021-03-13 04:04:37.41263+00	django	Backend Development	2	[{"changed": {"fields": ["Specialties"]}}]	8	1
160	2021-03-13 04:05:56.365306+00	frontend-development	Frontend Development	2	[{"changed": {"fields": ["Specialties"]}}]	8	1
161	2021-03-13 04:07:29.241702+00	frontend-development	Frontend Development	2	[{"changed": {"fields": ["Percentage"]}}]	8	1
162	2021-03-13 04:07:52.654008+00	frontend-development	Frontend Development	2	[{"changed": {"fields": ["Percentage"]}}]	8	1
163	2021-03-13 04:08:04.696155+00	serverless-architecture	Serverless Architecture	2	[{"changed": {"fields": ["Percentage"]}}]	8	1
164	2021-03-13 04:08:37.890465+00	serverless-architecture	Serverless Architecture	2	[{"changed": {"fields": ["Specialties"]}}]	8	1
165	2021-03-13 04:20:19.115811+00	frontend-development	Frontend Development	2	[{"changed": {"fields": ["Specialties"]}}]	8	1
166	2021-03-13 04:29:58.758794+00	6	Angular	3		12	1
167	2021-03-13 04:31:21.277917+00	8	Automation	3		12	1
168	2021-03-13 04:32:13.911849+00	corona-count	Corona Count	2	[{"changed": {"fields": ["Languages"]}}]	10	1
169	2021-03-13 04:32:31.083479+00	shop-duka	Shop Duka	2	[{"changed": {"fields": ["Languages"]}}]	10	1
170	2021-03-13 04:32:49.958907+00	telegram-textbot	Telegram Textbot	2	[{"changed": {"fields": ["Languages"]}}]	10	1
171	2021-03-20 14:20:15.232546+00	django	Backend Development	2	[{"changed": {"fields": ["Specialties"]}}]	8	1
172	2021-03-20 14:20:46.690954+00	frontend-development	Frontend Development	2	[{"changed": {"fields": ["Specialties"]}}]	8	1
173	2021-05-26 14:20:08.139299+00	serverless-architecture	Serverless Architecture	2	[{"changed": {"fields": ["Specialties"]}}]	8	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: jey
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	myapp	client
8	myapp	skill
9	myapp	specialty
10	myapp	project
11	myapp	projecttechnology
12	myapp	language
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: jey
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-02-21 13:45:53.841118+00
2	auth	0001_initial	2021-02-21 13:45:53.886458+00
3	admin	0001_initial	2021-02-21 13:45:53.946929+00
4	admin	0002_logentry_remove_auto_add	2021-02-21 13:45:53.964039+00
5	admin	0003_logentry_add_action_flag_choices	2021-02-21 13:45:53.97289+00
6	contenttypes	0002_remove_content_type_name	2021-02-21 13:45:53.992392+00
7	auth	0002_alter_permission_name_max_length	2021-02-21 13:45:54.001509+00
8	auth	0003_alter_user_email_max_length	2021-02-21 13:45:54.010783+00
9	auth	0004_alter_user_username_opts	2021-02-21 13:45:54.019511+00
10	auth	0005_alter_user_last_login_null	2021-02-21 13:45:54.028448+00
11	auth	0006_require_contenttypes_0002	2021-02-21 13:45:54.030683+00
12	auth	0007_alter_validators_add_error_messages	2021-02-21 13:45:54.039404+00
13	auth	0008_alter_user_username_max_length	2021-02-21 13:45:54.051921+00
14	auth	0009_alter_user_last_name_max_length	2021-02-21 13:45:54.061272+00
15	auth	0010_alter_group_name_max_length	2021-02-21 13:45:54.073554+00
16	auth	0011_update_proxy_permissions	2021-02-21 13:45:54.082212+00
17	auth	0012_alter_user_first_name_max_length	2021-02-21 13:45:54.090905+00
18	myapp	0001_initial	2021-02-21 13:45:54.123306+00
19	myapp	0002_auto_20210123_0956	2021-02-21 13:45:54.153888+00
20	myapp	0003_project_featured	2021-02-21 13:45:54.173104+00
21	myapp	0004_projecttechnology	2021-02-21 13:45:54.186547+00
22	myapp	0005_remove_skill_image	2021-02-21 13:45:54.198798+00
23	sessions	0001_initial	2021-02-21 13:45:54.208343+00
24	myapp	0006_auto_20210305_1137	2021-03-05 12:43:40.108356+00
25	myapp	0007_auto_20210305_1203	2021-03-05 12:43:40.15049+00
26	myapp	0008_auto_20210305_1220	2021-03-05 12:43:40.172036+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: jey
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
fkbx8yarihyzonl8nub1ecil8bbzzauf	.eJxVjLEOwjAMRP8lM4piNSUWIzvfEDm2QwookZp2Qvw7rdQBttO9d_c2kdalxLXrHCcxFwPm9Nsl4qfWHciD6r1ZbnWZp2R3xR6021sTfV0P9--gUC_b2jPlMCR2QUdyOdDADpFRA4h4SAHVizgAx7hFxKAiwhmJcYSzms8XAik4yw:1lDr3i:B9UDdL-bBE79ZMklSRWYCqF6kImD56nTF9dgLDOcoq4	2021-03-07 15:54:10.436496+00
9emdbzzk46pguv3ks8pg2lbu9ptdgfcw	.eJxVjLEOwjAMRP8lM4piNSUWIzvfEDm2QwookZp2Qvw7rdQBttO9d_c2kdalxLXrHCcxFwPm9Nsl4qfWHciD6r1ZbnWZp2R3xR6021sTfV0P9--gUC_b2jPlMCR2QUdyOdDADpFRA4h4SAHVizgAx7hFxKAiwhmJcYSzms8XAik4yw:1lIaHC:vOqTrZiPI1s_Ru27IjDoWv9YOcEcBP5XWiFQ7-4b7Ms	2021-03-20 16:59:38.188159+00
vwj276blu3wbfphz9u9y0zohqjpbo17t	.eJxVjLEOwjAMRP8lM4piNSUWIzvfEDm2QwookZp2Qvw7rdQBttO9d_c2kdalxLXrHCcxFwPm9Nsl4qfWHciD6r1ZbnWZp2R3xR6021sTfV0P9--gUC_b2jPlMCR2QUdyOdDADpFRA4h4SAHVizgAx7hFxKAiwhmJcYSzms8XAik4yw:1lJuh4:oLm0u1WQtWNcAdrvXUqt9cdHAMAIgFpft1WA6gv0Fdo	2021-03-24 08:59:50.045448+00
9sqnn01u7hytckg31ppjgkd3xxgh1957	.eJxVjLEOwjAMRP8lM4piNSUWIzvfEDm2QwookZp2Qvw7rdQBttO9d_c2kdalxLXrHCcxFwPm9Nsl4qfWHciD6r1ZbnWZp2R3xR6021sTfV0P9--gUC_b2jPlMCR2QUdyOdDADpFRA4h4SAHVizgAx7hFxKAiwhmJcYSzms8XAik4yw:1lRtHB:5djhgsyMTXTxBZdPBF6awxilEUGIkF3wihxH3A2Ut2E	2021-04-15 09:06:05.040406+00
y0fc7qnyhsyy7jve5ncsz9q7i16a4815	.eJxVjLEOwjAMRP8lM4piNSUWIzvfEDm2QwookZp2Qvw7rdQBttO9d_c2kdalxLXrHCcxFwPm9Nsl4qfWHciD6r1ZbnWZp2R3xR6021sTfV0P9--gUC_b2jPlMCR2QUdyOdDADpFRA4h4SAHVizgAx7hFxKAiwhmJcYSzms8XAik4yw:1leD3E:DwJpp7tHrNvg_vZRuB9_AsmDggRVDfDrRXHyn9dBEsM	2021-05-19 08:38:36.718696+00
gckm626gbyei5crae350h55gu16actoj	.eJxVjLEOwjAMRP8lM4piNSUWIzvfEDm2QwookZp2Qvw7rdQBttO9d_c2kdalxLXrHCcxFwPm9Nsl4qfWHciD6r1ZbnWZp2R3xR6021sTfV0P9--gUC_b2jPlMCR2QUdyOdDADpFRA4h4SAHVizgAx7hFxKAiwhmJcYSzms8XAik4yw:1lluNc:jchddIPKblrcoAUjXXq78MPZk-IVajrG7dOL6X2IfCc	2021-06-09 14:19:28.619776+00
\.


--
-- Data for Name: myapp_language; Type: TABLE DATA; Schema: public; Owner: jey
--

COPY myapp_language (id, title, description, created_at) FROM stdin;
1	Django	<p>Django</p>	2021-03-05
2	React	<p>React</p>	2021-03-05
4	Flask	<p>Flask</p>	2021-03-05
5	DRF	<p>DRF</p>	2021-03-05
7	DataScience	<p>DataScience</p>	2021-03-05
\.


--
-- Data for Name: myapp_project; Type: TABLE DATA; Schema: public; Owner: jey
--

COPY myapp_project (title, description, cover_image, bg_image, slug, start_date, end_date, website, github, created_at, featured, project_technologies, languages) FROM stdin;
Fadhila Charity Organization	<p>This is a web application developed for a charity organization to enable members to help others in a fun and intuitive manner.</p>	image/upload/v1614036090/portfolio/project/cover/nhpigcfdivvtgln64qdm.png	image/upload/v1615052520/portfolio/project/background/nzudxt4rbl54da8bf4qi.png	my-blog	2021-02-22	2021-02-22	https://fadhila.herokuapp.com	https://github.com/fadhila-backend	2021-02-22	t	{Django,Bootstrap,React,"Payment Gateways (MPESA, Paypal, PesaPal)",E-commerce,PostgreSQL}	{Django,React}
Jumia Kilimall Price Comparison	<p>This is a web application created to help Kenyan online shoppers to compare the prices of common products on the two most common e-commerce platforms; Jumia and Kilimall.</p>	image/upload/v1614033607/portfolio/project/cover/n2ljykizt7x6lzfdjqcg.jpg	image/upload/v1615052873/portfolio/project/background/px3ceewp9jxarlnp4sgy.png	jumia-kilimall-price-comparison	2021-02-22	2021-02-22	https://jkm-bot.herokuapp.com	https://github.com/dev-jey/jkm-bot	2021-02-22	t	{Django,Bs4,Selenium,Pandas,"Scikit Learn",PostgreSQL}	{Django,DataScience}
Mirtoch Twitter	<p>This is a revolutionary project meant to relay insightful tweets from East Africa, mainly IGAD countries. Covering politics, business, development and media tweets</p>	image/upload/v1614031044/portfolio/project/cover/vsc9nbovsbfdbldsx0kq.jpg	image/upload/v1615053088/portfolio/project/background/tmxti0ekt6koqxwzen0m.png	dc	2021-02-22	2021-02-22	https://mirtoch.com	https://github.com/dev-jey/twitter-highlights	2021-02-22	t	{"TinyMCE Rich Text Editor",Django,"Twitter API",PostgreSQL}	{Django}
Corona Count	<p>With the rising corona cases, I took the initiative to develop a simple platform that indicates the latest number of cases, in different countries, with up to date information.</p>	image/upload/v1614032591/portfolio/project/cover/rnyxmem2ugvmunua4itk.jpg	image/upload/v1615052216/portfolio/project/background/f2k6ri2ndeqj19hdltsv.png	corona-count	2021-02-22	2021-02-22	https://coronacount.netlify.app	https://github.com/dev-jey/coronacount-backend/	2021-02-22	t	{Angular,"Django Rest Framework",Mapbox,"Data Scrapper",PostgreSQL}	{DRF}
Shop Duka	<p>This is a web app developed to help shop owners manage different shop attendants, manage inventory, and harmonize the accounts of a business to ensure accountability.</p>	image/upload/v1614032054/portfolio/project/cover/kdsyxjjblojzuvhh5egt.png	image/upload/v1615053347/portfolio/project/background/wu4j2filoces1yx27j7e.png	shop-duka	2021-02-22	2021-02-22	https://shopduka.herokuapp.com	https://github.com/dev-jey/store-mananger-v1	2021-02-22	t	{Angular,Flask,"Flask Restful",Blueprints,PostgreSQL}	{Flask}
Telegram Textbot	<p>This is an application that automates bulk messaging or repetitive message sending on telegram, mainly beneficial to digital marketers</p>	image/upload/v1614033009/portfolio/project/cover/lgebg9bka9qnxdgmbzsn.jpg	image/upload/v1615053238/portfolio/project/background/tjjsaad6lvsijbbwmwiq.png	telegram-textbot	2021-02-22	2021-02-22	https://telegramtextbot.herokuapp.com	https://github.com/dev-jey/telegram-textbot	2021-02-22	t	{HTML/CSS,Flask,Selenium,Telegram,PostgreSQL,"SQL Alchemy"}	{Flask}
\.


--
-- Data for Name: myapp_skill; Type: TABLE DATA; Schema: public; Owner: jey
--

COPY myapp_skill (title, percentage, icon, slug, description, created_at, specialties) FROM stdin;
Backend Development	95	activity	django	<p>I have an immense understanding of different backend frameworks, working with databases and devleoping optimal algorithms.</p>	2021-02-22	{"PostgreSQL | MySQL | SQLite | Redis",Django,Flask,"Cron jobs","Restful APIs, GraphQL, HTTP methods","Graphene, DRF, Flask Restful","Bs4, Selenium, Scrapy, Scikit Learn, Matplotlib, ETL",Firebase}
Frontend Development	96	airplay	frontend-development	<p>Using modern frontend frameworks, I can build intuitive, responsive, and user-friendly interfaces that adaptively meet the needs of your end-users.</p>	2021-02-22	{"HTML | SCSS | Bootstrap | Tailwind","Javascript | JQuery | Ajax","React, React-Redux, React hooks, NextJs","React Native","Context API, React Apollo","UI/UX development",Webflow}
Serverless Architecture	90	cloud	serverless-architecture	<p>I have experience automating deployments for applications in virtual machines in the cloud, managing and updating containerized applications using contemporary DevOps tools.</p>	2021-02-22	{"AWS(ec2, s3, Route 53, Elastic IP, lightsail,  AWS beanstalk)","Digital Ocean","Web Servers(Nginx)","App servers(Gunicorn)",GCP,"Travis CI, Circle CI, Pylint, Pep8 Standards, Github Actions","Docker, Docker-compose"}
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jey
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jey
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jey
--

SELECT pg_catalog.setval('auth_permission_id_seq', 48, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jey
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jey
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jey
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jey
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 173, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jey
--

SELECT pg_catalog.setval('django_content_type_id_seq', 12, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jey
--

SELECT pg_catalog.setval('django_migrations_id_seq', 26, true);


--
-- Name: myapp_language_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jey
--

SELECT pg_catalog.setval('myapp_language_id_seq', 8, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: jey
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: jey
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: jey
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: jey
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: jey
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: jey
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: jey
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: jey
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: jey
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: jey
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: jey
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: jey
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: jey
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: jey
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: jey
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: jey
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: jey
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: myapp_language myapp_language_pkey; Type: CONSTRAINT; Schema: public; Owner: jey
--

ALTER TABLE ONLY myapp_language
    ADD CONSTRAINT myapp_language_pkey PRIMARY KEY (id);


--
-- Name: myapp_project myapp_project_pkey; Type: CONSTRAINT; Schema: public; Owner: jey
--

ALTER TABLE ONLY myapp_project
    ADD CONSTRAINT myapp_project_pkey PRIMARY KEY (slug);


--
-- Name: myapp_skill myapp_skill_pkey; Type: CONSTRAINT; Schema: public; Owner: jey
--

ALTER TABLE ONLY myapp_skill
    ADD CONSTRAINT myapp_skill_pkey PRIMARY KEY (slug);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: jey
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: jey
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: jey
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: jey
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: jey
--

CREATE INDEX auth_user_groups_group_id_97559544 ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: jey
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: jey
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: jey
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: jey
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: jey
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: jey
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: jey
--

CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: jey
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: myapp_project_slug_5c8e1551_like; Type: INDEX; Schema: public; Owner: jey
--

CREATE INDEX myapp_project_slug_5c8e1551_like ON myapp_project USING btree (slug varchar_pattern_ops);


--
-- Name: myapp_skill_slug_c577a7b4_like; Type: INDEX; Schema: public; Owner: jey
--

CREATE INDEX myapp_skill_slug_c577a7b4_like ON myapp_skill USING btree (slug varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: jey
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: jey
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: jey
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: jey
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: jey
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: jey
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: jey
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: jey
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: jey
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

