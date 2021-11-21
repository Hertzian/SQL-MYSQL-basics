-- Basic Trigger structure
-- Syntax
CREATE TRIGGER trigger_name
trigger_time trigger_event ON table_name FOR EACH ROW
BEGIN
    ...
END;

trigger_time:
-- only two choices
BEFORE
AFTER

trigger_event:
-- three choices
INSERT
UPDATE
DELETE

ON

table_name:
-- well, any table you want
<your table_name>

-- First trigger
DELIMITER $$

CREATE TRIGGER must_be_adult
    BEFORE INSERT ON people FOR EACH ROW
    BEGIN
        IF NEW.age < 18
        THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'Must be an adult!';
        END IF;
    END;
$$

DELIMITER ;

-- To show all triggers in ALL our databases
SHOW TRIGGERS;
-- To remove triggers
DROP TRIGGER trigger_name;
-- Triggers make debugging hard!
