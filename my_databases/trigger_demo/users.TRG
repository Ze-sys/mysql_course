TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER must_be_adult\n    BEFORE INSERT ON users FOR EACH ROW\n    BEGIN\n        IF NEW.age < 18\n        THEN\n            SIGNAL SQLSTATE \'45000\'\n                   SET MESSAGE_TEXT = \'Must be an adult!\';\n        END IF;\n    END'
sql_modes=1434451968
definers='root@localhost'
client_cs_names='utf8'
connection_cl_names='utf8_general_ci'
db_cl_names='latin1_swedish_ci'
created=164542629445
