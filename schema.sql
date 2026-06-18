CREATE TABLE IF NOT EXISTS university (
    university_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS faculty (
    faculty_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    university_id INTEGER NOT NULL REFERENCES university(university_id),
    UNIQUE (name, university_id)
);

CREATE TABLE IF NOT EXISTS student (
    student_id BIGINT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    home_university INTEGER NOT NULL REFERENCES university(university_id),
    gender VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS module (
    module_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL UNIQUE,
    faculty_id INTEGER NOT NULL REFERENCES faculty(faculty_id)
);

CREATE TABLE IF NOT EXISTS registration (
    registration_id SERIAL PRIMARY KEY,
    student_id BIGINT NOT NULL REFERENCES student(student_id) ON DELETE CASCADE,
    module_id INTEGER NOT NULL REFERENCES module(module_id),
    university_id INTEGER NOT NULL REFERENCES university(university_id),
    notes TEXT,
    registered_university VARCHAR(150) NOT NULL,
    UNIQUE (student_id, module_id)
);

CREATE TABLE IF NOT EXISTS academic_results (
    result_id SERIAL PRIMARY KEY,
    student_id BIGINT NOT NULL REFERENCES student(student_id) ON DELETE CASCADE,
    module_id INTEGER NOT NULL REFERENCES module(module_id),
    university_id INTEGER NOT NULL REFERENCES university(university_id),
    mark INTEGER NOT NULL CHECK (mark BETWEEN 0 AND 100),
    semester INTEGER NOT NULL CHECK (semester IN (1, 2)),
    status VARCHAR(20) NOT NULL,
    CONSTRAINT academic_results_unique
        UNIQUE (student_id, module_id, university_id)
);

CREATE TABLE IF NOT EXISTS admin (
    admin_id SERIAL PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

INSERT INTO university (name) VALUES
    ('TUT'),
    ('University of Johannesburg'),
    ('University of Pretoria'),
    ('University of the Witwatersrand')
ON CONFLICT (name) DO NOTHING;

INSERT INTO faculty (name, university_id)
SELECT 'Information and Communication Technology', university_id
FROM university
WHERE name = 'TUT'
ON CONFLICT (name, university_id) DO NOTHING;
