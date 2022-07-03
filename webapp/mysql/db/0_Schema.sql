DROP DATABASE IF EXISTS isuumo;
CREATE DATABASE isuumo;

DROP TABLE IF EXISTS isuumo.estate;
DROP TABLE IF EXISTS isuumo.chair;

CREATE TABLE isuumo.estate
(
    id          INTEGER             NOT NULL PRIMARY KEY,
    name        VARCHAR(64)         NOT NULL,
    description VARCHAR(4096)       NOT NULL,
    thumbnail   VARCHAR(128)        NOT NULL,
    address     VARCHAR(128)        NOT NULL,
    latitude    DOUBLE PRECISION    NOT NULL,
    longitude   DOUBLE PRECISION    NOT NULL,
    rent        INTEGER             NOT NULL,
    door_height INTEGER             NOT NULL,
    door_width  INTEGER             NOT NULL,
    features    VARCHAR(64)         NOT NULL,
    popularity  INTEGER             NOT NULL,
    popularity_desc INTEGER,
    INDEX idx_popularity (popularity DESC, id ASC),
    INDEX idx_door (door_height, door_width),
    INDEX idx_rent (rent ASC, id ASC),
    INDEX idx_popularity_desc (popularity_desc, id),
    INDEX idx_lat (latitude ASC, longitude ASC)
);

CREATE TABLE isuumo.chair
(
    id          INTEGER         NOT NULL PRIMARY KEY,
    name        VARCHAR(64)     NOT NULL,
    description VARCHAR(4096)   NOT NULL,
    thumbnail   VARCHAR(128)    NOT NULL,
    price       INTEGER         NOT NULL,
    height      INTEGER         NOT NULL,
    width       INTEGER         NOT NULL,
    depth       INTEGER         NOT NULL,
    color       VARCHAR(64)     NOT NULL,
    features    VARCHAR(64)     NOT NULL,
    kind        VARCHAR(64)     NOT NULL,
    popularity  INTEGER         NOT NULL,
    popularity_desc INTEGER,
    stock       INTEGER         NOT NULL,
    price_range_id INTEGER,
    height_range_id INTEGER,
    width_range_id INTEGER,
    depth_range_id INTEGER,
    INDEX idx_price (price ASC, id ASC), -- いらないかも
    INDEX idx_price_range_id (price_range_id ASC),
    INDEX idx_height_range_id (height_range_id ASC),
    INDEX idx_width_range_id (width_range_id ASC),
    INDEX idx_depth_range_id (depth_range_id ASC),
    INDEX idx_popularity_desc (popularity_desc, id)
);
