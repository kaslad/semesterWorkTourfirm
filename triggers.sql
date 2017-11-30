-- триггеры Изменения: delete, update, insert
-- 1. user - edit
CREATE TABLE user_edit (
  operation   CHAR(1)     NOT NULL,
  time        TIMESTAMP   NOT NULL,
  username_pg TEXT        NOT NULL,
  user_id     INT,
  login       VARCHAR(20) NOT NULL,
  password    TEXT        NOT NULL

);
CREATE OR REPLACE FUNCTION process_user_edit()
  RETURNS TRIGGER AS $user_edit$
BEGIN
  IF (TG_OP = 'DELETE')
  THEN
    INSERT INTO user_edit SELECT
                            'D',
                            now(),
                            user,
                            OLD.*;
    RETURN OLD;
  ELSIF (TG_OP = 'UPDATE')
    THEN
      INSERT INTO user_edit SELECT
                              'U',
                              now(),
                              user,
                              NEW.*;
      RETURN NEW;
  ELSIF (TG_OP = 'INSERT')
    THEN
      INSERT INTO user_edit SELECT
                              'I',
                              now(),
                              user,
                              NEW.*;
      RETURN NEW;
  END IF;
  RETURN NULL;
END;
$user_edit$ LANGUAGE plpgsql;

CREATE TRIGGER user_edit
AFTER INSERT OR UPDATE OR DELETE ON "user"
FOR EACH ROW EXECUTE PROCEDURE process_user_edit();
INSERT INTO "user" (login, password) VALUES
  ('user6', 'effdsf3e2ee32e2');
DELETE FROM "user"
WHERE id = 13;
-- 2 reservation-edit
CREATE TABLE reservation_edit (
  operation        CHAR(1)                     NOT NULL,
  time             TIMESTAMP                   NOT NULL,
  username_pg      TEXT                        NOT NULL,
  reservation_id   INT                         NOT NULL,
  user_id          INT                         NOT NULL,
  concrete_tour_id INT                         NOT NULL,
  date             TIMESTAMP WITHOUT TIME ZONE NOT NULL

);
CREATE OR REPLACE FUNCTION process_reservation_edit()
  RETURNS TRIGGER AS $reservation_edit$
BEGIN
  IF (TG_OP = 'DELETE')
  THEN
    INSERT INTO reservation_edit SELECT
                                   'D',
                                   now(),
                                   user,
                                   OLD.*;
    RETURN OLD;
  ELSIF (TG_OP = 'UPDATE')
    THEN
      INSERT INTO reservation_edit SELECT
                                     'U',
                                     now(),
                                     user,
                                     NEW.*;
      RETURN NEW;
  ELSIF (TG_OP = 'INSERT')
    THEN
      INSERT INTO reservation_edit SELECT
                                     'I',
                                     now(),
                                     user,
                                     NEW.*;
      RETURN NEW;
  END IF;
  RETURN NULL;
END;
$reservation_edit$ LANGUAGE plpgsql;

CREATE TRIGGER reservation_edit
AFTER INSERT OR UPDATE OR DELETE ON reservation
FOR EACH ROW EXECUTE PROCEDURE process_reservation_edit();

--3 trigger Tour table
CREATE TABLE tour_edit (
  operation    CHAR(1)   NOT NULL,
  time         TIMESTAMP NOT NULL,
  username_pg  TEXT      NOT NULL,
  id           SERIAL PRIMARY KEY,
  special_mark BOOLEAN   NOT NULL,
  description  TEXT,
  from_city_id INT       NOT NULL,
  to_city_id   INT       NOT NULL,
  hotel_id     INT       NOT NULL

);
CREATE OR REPLACE FUNCTION process_tour_edit()
  RETURNS TRIGGER AS $tour_edit$
BEGIN
  IF (TG_OP = 'DELETE')
  THEN
    INSERT INTO tour_edit SELECT
                            'D',
                            now(),
                            user,
                            OLD.*;
    RETURN OLD;
  ELSIF (TG_OP = 'UPDATE')
    THEN
      INSERT INTO tour_edit SELECT
                              'U',
                              now(),
                              user,
                              NEW.*;
      RETURN NEW;
  ELSIF (TG_OP = 'INSERT')
    THEN
      INSERT INTO tour_edit SELECT
                              'I',
                              now(),
                              user,
                              NEW.*;
      RETURN NEW;
  END IF;
  RETURN NULL;
END;
$tour_edit$ LANGUAGE plpgsql;

CREATE TRIGGER tour_edit
AFTER INSERT OR UPDATE OR DELETE ON tour
FOR EACH ROW EXECUTE PROCEDURE process_tour_edit();