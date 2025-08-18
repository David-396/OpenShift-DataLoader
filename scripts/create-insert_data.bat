oc rsh mysql-6896bf5cb8-plbrp &&

mysql -u david -p DataLoaderDB
pwd

CREATE TABLE project_table ( id INT NOT NULL AUTO_INCREMENT, name VARCHAR(10), PRIMARY KEY (id));
INSERT INTO project_table (name) VALUES ('David');

exit
