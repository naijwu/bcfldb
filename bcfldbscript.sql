
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


------------------
-- { New Table} --
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

-- PK {table.pk} in {table.fk} as FK






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