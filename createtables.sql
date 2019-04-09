CREATE SEQUENCE public.student_id_seq;
CREATE SEQUENCE public.student_contact_id_seq;

ALTER SEQUENCE public.student_id_seq
  OWNER TO postgres;

ALTER SEQUENCE public.student_contact_id_seq
  OWNER TO postgres;

CREATE TABLE public.student (
  membership_id integer NOT NULL DEFAULT nextval('student_id_seq'::regclass),
  preferred_name character varying(50) NOT NULL,
  legal_name character varying(50) NOT NULL,
  date_of_birth DATE NOT NULL,
  grade integer NOT NULL,
  date_of_registration DATE NOT NULL,
  CONSTRAINT student_pkey PRIMARY KEY (membership_id)
);

CREATE TABLE student_contact (
  student_contact_id integer NOT NULL DEFAULT nextval('student_contact_id_seq'::regclass),
  membership_id integer NOT NULL,
  cell_phone character varying(50),
  email character varying(50),
  home_phone character varying(50),
  address character varying(50),
  CONSTRAINT student_contact_pkey PRIMARY KEY (student_contact_id),
  CONSTRAINT membership_id_fk FOREIGN KEY (membership_id)
);

CREATE TABLE guardian (
  /*
  guardian_id: INT primary_key
  first_name: VARCHAR(50)
  last_name: VARCHAR(50)
  relationship: VARCHAR(15)
  */
);

CREATE TABLE guardian_contact (
  /*
  cell_phone: VARCHAR(50)
  email: VARCHAR(50)
  home_phone: VARCHAR(50)
  address: VARCHAR(50)
  */
);

CREATE TABLE report_card (
  /*
  report_id: INT primary_key
  marked_by: VARCHAR(50)
  score: INT
  report: BLOB
  interim_report: JSON
  */
);

CREATE TABLE teacher (
  /*
  teacher_id: INT primary_key
  subjects: VARCHAR(50)
  level: INT
  */
);

CREATE TABLE payroll (
  /*
  teacher_id_fk: INT
  hourly_rate: NUMERIC
  payment: NUMERIC
  */
);

CREATE TABLE timesheet (
  /*
  date: DATE primary_key
  teacher_id_fk: INT
  hours_worked: INT
  */
);

CREATE TABLE term (
  /*
  term_id: INT primary_key
  membership_id_fk: INT
  programs_registered: VARCHAR(50)
  price: INT
  */
);

CREATE TABLE program (
  /*
  program_id: INT primary_key
  term_id_fk: INT
  type: VARCHAR(50)
  cost: INT
  */
);

CREATE TABLE lesson (
  /*
  program_id_fk: INT
  name: VARCHAR(50)
  season: VARCHAR(50)
  date: DATE
  */
);

CREATE TABLE invoice (
  /*
  invoice_id: INT primary_key
  term_id_fk: INT
  date: DATE
  */
);

CREATE TABLE payment_transaction (
  /*
  invoice_id_fk: INT
  date: VARCHAR(50)
  method: VARCHAR(50)
  result: BOOLEAN
  */
);

/*
ALTER TABLE public.student
  ADD CONSTRAINT student_pkey PRIMARY KEY (membership_id)
;
*/
