TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER prevent_self_follow\n    BEFORE INSERT ON follows FOR EACH ROW\n    BEGIN\n        IF NEW.follower_id = NEW.followee_id\n        THEN\n            SIGNAL SQLSTATE \'45000\'\n                   SET MESSAGE_TEXT = \'You can"t follow yourself!\';\n        END IF;\n    END'
sql_modes=1434451968
definers='root@localhost'
client_cs_names='utf8'
connection_cl_names='utf8_general_ci'
db_cl_names='latin1_swedish_ci'
created=164542862911
