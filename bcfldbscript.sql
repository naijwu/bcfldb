
----------------------------------------------------
-- DEFINE SEQUENCE, TABLE, PRIMARY KEY CONSTRAINT --
----------------------------------------------------

-------------
-- STUDENT --
-------------
-- Create Sequence. Create a sequence if we need to control start #
-- If no need to control, simple combination of "SERIAL PRIMARY KEY" will do
CREATE SEQUENCE public.student_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

-- Create Table
CREATE TABLE public.student (
    membership_id integer NOT NULL DEFAULT nextval('student_id_seq'),
    preferred_name character varying(50) NOT NULL,
  	legal_name character varying(50) NOT NULL, -- raw data null 
  	date_of_birth DATE NOT NULL,
  	grade integer NOT NULL, -- raw data null
  	date_of_registration DATE NOT NULL,
  	school character varying(50),
    last_update timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT student_id_pk PRIMARY KEY (membership_id)
);

-- Alter Table Owner to postgres
ALTER TABLE public.student OWNER TO postgres;

-- Alter Sequence Owned by the table primary key to make it more efficient
-- This means when student table is deleted, automatically delete this sequence.
ALTER SEQUENCE public.student_id_seq OWNED BY public.student.membership_id;
-- END OF STUDENT --

---------------------
-- STUDENT CONTACT --
---------------------
-- Create Sequence
CREATE SEQUENCE public.student_contact_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- Create Table
CREATE TABLE public.student_contact (
    student_contact_id integer NOT NULL DEFAULT nextval('student_contact_id_seq'),
    membership_id integer NOT NULL,
  	cell_phone character varying(12),
  	email character varying(50),
  	home_phone character varying(12),
  	address character varying(50),
    last_update timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT student_contact_id_pk PRIMARY KEY (student_contact_id)
);

-- Alter Table Owner to postgres
ALTER TABLE public.student_contact OWNER TO postgres;

-- Alter Sequence Owned by the table primary key to make it more efficient
ALTER SEQUENCE public.student_contact_id_seq OWNED BY public.student_contact.student_contact_id;
-- END OF STUDENT_CONTACT --


-------------
-- GUARDIAN --
-------------
-- Create Sequence. Create a sequence if we need to control start #
-- If no need to control, simple combination of "SERIAL PRIMARY KEY" will do
CREATE SEQUENCE public.guardian_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

-- Create Table
CREATE TABLE public.guardian (
    guardian_id integer NOT NULL DEFAULT nextval('guardian_id_seq'),
    guardian_name character varying(50) NOT NULL, -- raw data null 
    relationship character varying(50),
    last_update timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT guardian_id_pk PRIMARY KEY (guardian_id)
);

-- Alter Table Owner to postgres
ALTER TABLE public.guardian OWNER TO postgres;

-- Alter Sequence Owned by the table primary key to make it more efficient
-- This means when guardian table is deleted, automatically delete this sequence.
ALTER SEQUENCE public.guardian_id_seq OWNED BY public.guardian.guardian_id;
-- END OF GUARDIAN --

---------------------
-- GUARDIAN CONTACT --
---------------------
-- Create Sequence
CREATE SEQUENCE public.guardian_contact_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- Create Table
CREATE TABLE public.guardian_contact (
    guardian_contact_id integer NOT NULL DEFAULT nextval('guardian_contact_id_seq'),
    cell_phone character varying(12),
    email character varying(50),
    home_phone character varying(12),
    address character varying(50),
    last_update timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT guardian_contact_id_pk PRIMARY KEY (guardian_contact_id)
);

-- Alter Table Owner to postgres
ALTER TABLE public.guardian_contact OWNER TO postgres;

-- Alter Sequence Owned by the table primary key to make it more efficient
ALTER SEQUENCE public.guardian_contact_id_seq OWNED BY public.guardian_contact.guardian_contact_id;
-- END OF GUARDIAN_CONTACT --


------------------
-- TEACHER --
------------------
-- Create Sequence
-- Create a sequence if we need to control start #
-- If no need to control, simple combination of "SERIAL PRIMARY KEY" will do
CREATE SEQUENCE public.teacher_id_seq
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

-- Create Table
CREATE TABLE public.teacher (
    teacher_id integer NOT NULL DEFAULT nextval('teacher_id_seq'),
    subjects character varying(50) NOT NULL,
    level integer NOT NULL,
    start_date date,
    last_update timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT teacher_id_pk PRIMARY KEY (teacher_id)
);

-- Alter Table Ownder to postgres
ALTER TABLE public.teacher OWNER TO postgres;

-- Alter Sequence Owned by the table primary key to make it more efficient
ALTER SEQUENCE public.teacher_id_seq OWNED BY public.teacher.teacher_id;
-- END OF TEACHER --

------------------
-- PAYROLL --
------------------
-- Create Sequence
-- Create a sequence if we need to control start #
-- If no need to control, simple combination of "SERIAL PRIMARY KEY" will do
CREATE SEQUENCE public.payroll_id_seq
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

-- Create Table
CREATE TABLE public.payroll (
    payroll_id integer NOT NULL DEFAULT nextval('payroll_id_seq'),
    hourly_rate integer NOT NULL,
    payment numeric,
    last_update timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT payroll_id_pk PRIMARY KEY (payroll_id)
);

-- Alter Table Ownder to postgres
ALTER TABLE public.payroll OWNER TO postgres;

-- Alter Sequence Owned by the table primary key to make it more efficient
ALTER SEQUENCE public.payroll_id_seq OWNED BY public.payroll.payroll_id;
-- END OF PAYROLL --


------------------
-- TIMESHEET --
------------------
-- Create Sequence
-- Create a sequence if we need to control start #
-- If no need to control, simple combination of "SERIAL PRIMARY KEY" will do
CREATE SEQUENCE public.timesheet_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

-- Create Table
CREATE TABLE public.timesheet (
    timesheet_id integer NOT NULL DEFAULT nextval('timesheet_id_seq'),
    hours_worked integer NOT NULL,
    submitted_date date,
    last_update timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT timesheet_id_pk PRIMARY KEY (timesheet_id)
);

-- Alter Table Ownder to postgres
ALTER TABLE public.timesheet OWNER TO postgres;

-- Alter Sequence Owned by the table primary key to make it more efficient
ALTER SEQUENCE public.timesheet_id_seq OWNED BY public.timesheet.timesheet_id;
-- END OF PAYROLL --


------------------
-- REPORT_CARD --
------------------
-- Create Sequence
-- Create a sequence if we need to control start #
-- If no need to control, simple combination of "SERIAL PRIMARY KEY" will do
CREATE SEQUENCE public.report_card_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

-- Create Table
CREATE TABLE public.report_card (
    report_card_id integer NOT NULL DEFAULT nextval('report_card_id_seq'),
    score integer NOT NULL,
    interim_report jsonb, 
    report bytea NOT NULL,
    submitted_date date,
    last_update timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT report_card_id_pk PRIMARY KEY (report_card_id)
);

-- Alter Table Ownder to postgres
ALTER TABLE public.report_card OWNER TO postgres;

-- Alter Sequence Owned by the table primary key to make it more efficient
ALTER SEQUENCE public.report_card_id_seq OWNED BY public.report_card.report_card_id;
-- END OF PAYROLL --


------------------
-- LESSON --
------------------
-- Create Sequence
CREATE SEQUENCE public.lesson_id_seq
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

-- Create a sequence if we need to control start #
-- If no need to control, simple combination of "SERIAL PRIMARY KEY" will do

-- Create Table
CREATE TABLE public.lesson (
    lesson_id integer NOT NULL DEFAULT nextval('lesson_id_seq'),
    name character varying(25) NOT NULL,
    season character varying(50) NOT NULL,
    lesson_date DATE NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT lesson_id_pk PRIMARY KEY (lesson_id)
);

-- Alter Table Ownder to postgres
ALTER TABLE public.lesson OWNER TO postgres;

-- Alter Sequence Owned by the table primary key to make it more efficient
ALTER SEQUENCE public.lesson_id_seq OWNED BY public.lesson.lesson_id;
-- END OF LESSON --

------------------
-- PROGAM --
------------------
-- Create Sequence
-- Create a sequence if we need to control start #
-- If no need to control, simple combination of "SERIAL PRIMARY KEY" will do
CREATE SEQUENCE public.program_id_seq
    START WITH 10
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

-- Create Table
CREATE TABLE public.program (
    program_id integer NOT NULL DEFAULT nextval('program_id_seq'),
    program_type character varying(50) NOT NULL,
    cost integer,
    last_update timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT program_id_pk PRIMARY KEY (program_id)
);

-- Alter Table Ownder to postgres
ALTER TABLE public.program OWNER TO postgres;

-- Alter Sequence Owned by the table primary key to make it more efficient
ALTER SEQUENCE public.program_id_seq OWNED BY public.program.program_id;
-- END OF PROGAM --

------------------
-- TERM --
------------------
-- Create Sequence
-- Create a sequence if we need to control start #
-- If no need to control, simple combination of "SERIAL PRIMARY KEY" will do
CREATE SEQUENCE public.term_id_seq
    START WITH 10
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

-- Create Table
CREATE TABLE public.term (
    term_id integer NOT NULL DEFAULT nextval('term_id_seq'),
    total_cost integer,
    last_update timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT term_id_pk PRIMARY KEY (term_id)
);

-- Alter Table Ownder to postgres
ALTER TABLE public.term OWNER TO postgres;

-- Alter Sequence Owned by the table primary key to make it more efficient
ALTER SEQUENCE public.term_id_seq OWNED BY public.term.term_id;
-- END OF TERM --

------------------
-- INVOICE --
------------------
-- Create Sequence
-- Create a sequence if we need to control start #
-- If no need to control, simple combination of "SERIAL PRIMARY KEY" will do
CREATE SEQUENCE public.invoice_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

-- Create Table
CREATE TABLE public.invoice (
    invoice_number integer NOT NULL DEFAULT nextval('invoice_id_seq'),
    invoice_date date,
    last_update timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT invoice_id_pk PRIMARY KEY (invoice_id)
);

-- Alter Table Ownder to postgres
ALTER TABLE public.invoice OWNER TO postgres;

-- Alter Sequence Owned by the table primary key to make it more efficient
ALTER SEQUENCE public.invoice_id_seq OWNED BY public.invoice.invoice_id;
-- END OF INVOICE --


------------------
-- PAYMENT_TRANSACTION --
------------------
-- Create Sequence
-- Create a sequence if we need to control start #
-- If no need to control, simple combination of "SERIAL PRIMARY KEY" will do
CREATE SEQUENCE public.pay_transaction_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

-- Create Table
CREATE TABLE public.pay_transaction (
    transaction_id integer NOT NULL DEFAULT nextval('pay_transaction_id_seq'),
    method character varying(50) NOT NULL,
    result boolean,
    last_update timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT pay_transaction_id_pk PRIMARY KEY (transaction_id)
);

-- Alter Table Ownder to postgres
ALTER TABLE public.pay_transaction OWNER TO postgres;

-- Alter Sequence Owned by the table primary key to make it more efficient
ALTER SEQUENCE public.pay_transaction_id_seq OWNED BY public.pay_transaction.transaction_id;
-- END OF PAYMENT_TRANSACTION --

------------------
-- new table --
------------------
-- Create Sequence
-- Create a sequence if we need to control start #
-- If no need to control, simple combination of "SERIAL PRIMARY KEY" will do

-- Create Table

-- Alter Table Ownder to postgres

-- Alter Sequence Owned by the table primary key to make it more efficient

-- END OF {New Table}--


----------------------------------------------------
----------------- DEFINE RELATIONSHIP --------------
----------------------------------------------------
-- Define relationship after completing the table creation
-- Alter Table Add Foreign Key constraint, Reference, Delete Cascade
-- E.G. Deleting PK in Student will delete student_contact record associated with

-- PK student.membershipt_id in student_contact.membershipt_id as FK
ALTER TABLE ONLY public.student_contact
    ADD CONSTRAINT student_id_pk FOREIGN KEY (membership_id) REFERENCES public.student(membership_id) ON DELETE CASCADE;

-- guardian:contact 1:1

-- payroll:timesheet 1:M

-- teacher:payroll 1:1

-- teacher:timesheet 1:M

-- teacher:report





---------------------------------------------------
---------------- DEFINE FUNCTION ------------------
---------------------------------------------------

--
-- Name: last_updated(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION last_updated() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.last_update = CURRENT_TIMESTAMP;
    RETURN NEW;
END $$;


ALTER FUNCTION public.last_updated() OWNER TO postgres;


---------------------------------------------------
--------------- DEFINE TRIGGER --------------------
---------------------------------------------------
--
-- Name: last_updated; Type: TRIGGER; Schema: public; Owner: postgres
--

-- Add last_updated column to all tables
CREATE TRIGGER last_updated BEFORE UPDATE ON student FOR EACH ROW EXECUTE PROCEDURE last_updated();
CREATE TRIGGER last_updated BEFORE UPDATE ON student_contact FOR EACH ROW EXECUTE PROCEDURE last_updated();