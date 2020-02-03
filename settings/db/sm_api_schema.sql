CREATE SCHEMA sm_api;

CREATE TABLE IF NOT EXISTS sm_api.referrer_amended (
    referrer_id NUMERIC(20)  NOT NULL,
    client_id INT NOT NULL,
    si_doctor_id NUMERIC(20)  DEFAULT NULL,
    password text NOT NULL,
    deleted boolean DEFAULT false,
    WelcomeSent boolean DEFAULT false,
    ssm_status TEXT CHECK (ssm_status   IN('imported','seen','archived')) DEFAULT NULL,
    PRIMARY KEY (referrer_id));
CREATE INDEX referrer_amended_client_id_ssm_status ON sm_api.referrer_amended  (client_id,ssm_status);

CREATE TABLE IF NOT EXISTS sm_api.referrer_local (
    id BIGSERIAL,
    client_id INT NOT NULL,
    first_name text DEFAULT NULL,
    last_name text DEFAULT NULL,
    practice_name text DEFAULT NULL,
    phone text DEFAULT NULL,
    email text NOT NULL,
    speciality text DEFAULT NULL,
    deleted boolean DEFAULT false,
    ssm_status TEXT CHECK (ssm_status   IN('imported','seen','archived')) DEFAULT NULL,
    prefix text DEFAULT NULL,
    salutation text DEFAULT NULL,
    global_id text NOT NULL,
    WelcomeSent boolean DEFAULT false,
    PRIMARY KEY (id));
CREATE INDEX referrer_local_id_global_id ON sm_api.referrer_local  (global_id);
CREATE INDEX referrer_local_client_id ON sm_api.referrer_local  (client_id);
CREATE INDEX referrer_local_client_id_first_last_name ON sm_api.referrer_local  (client_id,first_name,last_name);
CREATE INDEX referrer_local_client_id_email ON sm_api.referrer_local  (client_id,email);
CREATE INDEX referrer_local_client_id_global_id ON sm_api.referrer_local  (client_id,global_id);
CREATE INDEX referrer_local_client_id_ssm_status  ON sm_api.referrer_local (client_id,ssm_status);

ALTER sequence sm_api.referrer_local_id_seq owned by NONE;
ALTER table sm_api.referrer_local ALTER column id drop default;
DROP sequence sm_api.referrer_local_id_seq;
ALTER Table sm_api.referrer_local ALTER id SET DATA TYPE TEXT;
ALTER Table sm_api.referrer_amended ALTER referrer_id SET DATA TYPE TEXT;


