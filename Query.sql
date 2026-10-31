 CREATE DATABASE if NOT EXISTS stat_lab;
 USE stat_lab;
 
 CREATE TABLE students(
 student_id INT PRIMARY KEY auto_increment,
 student_number VARCHAR(20) UNIQUE NOT NULL,
 NAME VARCHAR(100),
 cohort YEAR,
 faculty VARCHAR(100)
 );
 
 INSERT INTO students(student_number, NAME, cohort, faculty) values
 ('S001','Andi','2023','Matematika'),
 ('S002','Budi','2023','Statistika'),
 ('S003','Citra','2024','Matematika'),
 ('S004','Dewo','2024','Statistika');
 
 
 CREATE TABLE surveys(
 survey_id INT PRIMARY KEY AUTO_INCREMENT,
 student_id INT,
 question_code VARCHAR(10),
 score TINYINT,
 response_date DATE,
 FOREIGN KEY (student_id) REFERENCES students(student_id)
 );
 
 INSERT INTO surveys (student_id, question_code, score, response_date) VALUES
 (1,'Q1',4,'2025-08-01'),(1,'Q2',5,'2025-08-01'),
 (2,'Q1',3,'2025-08-02'),(2,'Q2',4,'2025-08-02'),
 (3,'Q1',5,'2025-08-03'),(3,'Q2',5,'2025-08-03'),
 (4,'Q1',2,'2025-08-04'),(4,'Q2',3,'2025-08-04');
 
  
 CREATE TABLE measurements (
 meas_id INT PRIMARY KEY AUTO_INCREMENT,
 student_id INT,
 variable VARCHAR(50),
 VALUE DOUBLE,
 meas_date DATE,
 FOREIGN KEY (student_id)REFERENCES students(student_id)
 );
 
 INSERT INTO measurements (student_id, variable, value, meas_date) VALUES
 (1,'time_sec',12.5,'2025-08-05'),(1,'score_lab',78.0,'2025-08-05'),
 (2,'time_sec',15.0,'2025-08-05'),(2,'score_lab',82.5,'2025-08-05'),
 (3,'time_sec',11.2,'2025-08-05'),(3,'score_lab',90.0,'2025-08-05'),
 (4,'time_sec',18.3,'2025-08-05'),(4,'score_lab',65.0,'2025-08-05');
 
 #Klausa dasar select,where, orderby,desc limit
 SELECT student_number, NAME, cohort FROM students;
 SELECT *FROM students WHERE cohort = 2023;
 SELECT * FROM measurements WHERE VALUE >80;
 SELECT *FROM measurements ORDER BY VALUE DESC LIMIT 3;
 
 #Fungsi Agregasi & group by
 SELECT COUNT(*) AS total_response FROM surveys;
 SELECT avg(VALUE) AS avg_lab_score FROM measurements WHERE variable ='score_lab';
 SELECT MAX(VALUE) AS max_time FROM measurements WHERE variable='time_sec';
 
 #Group By
 SELECT s.student_number, s.name, AVG(m.value) AS avg_score
 FROM students s
 JOIN measurements m ON s.student_id= m.student_id WHERE m.variable ='score_lab'
 group BY s.student_id, s.student_number, s.NAME;
 
 
 #rename table
 RENAME TABLE student TO students;
 #menghapus table
 DROP TABLE if EXISTS surveys;
 DROP TABLE if EXISTS student;
 DROP TABLE if EXISTS measurement;  
 #aturan mengganti nama di table atau nama tuple(kolom)pada table
 #ganti baru ---> hapus lama---> jalankan hal baru
 
 ALTER TABLE students CHANGE NAME full_name varchar(100);
 ALTER TABLE students CHANGE full_name NAME VARCHAR(100);
#Menampilkan tabel yang dibuat
SELECT* from students;  
SELECT* FROM surveys; 
SELECT* FROM measurements; 
 

 
 
 
 