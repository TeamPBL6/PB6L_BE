CREATE DATABASE IF NOT EXISTS PBL6;

CREATE TABLE user
(
    id            INT AUTO_INCREMENT NOT NULL,
    created_by    VARCHAR(255)       NULL,
    created_date  datetime           NULL,
    modified_date datetime           NULL,
    modified_by   VARCHAR(255)       NULL,
    username      VARCHAR(255)       NOT NULL,
    email         VARCHAR(255)       NOT NULL,
    password      VARCHAR(255)       NOT NULL,
    role       VARCHAR(255)       NOT NULL,
    full_name     VARCHAR(255)       NULL,
    phone_number  VARCHAR(255)       NULL,
    address       VARCHAR(255)       NULL,
    created_at    datetime           NOT NULL,
    CONSTRAINT pk_user PRIMARY KEY (id)
);

CREATE TABLE music
(
    id           INT AUTO_INCREMENT NOT NULL,
    title        VARCHAR(255)       NOT NULL,
    composer_id  INT                NULL,
    demo_url     VARCHAR(255)       NULL,
    full_url     VARCHAR(255)       NULL,
    price        DECIMAL            NULL,
    is_approved  BIT(1)             NOT NULL,
    is_purchased BIT(1)             NOT NULL,
    category_id  INT                NULL,
    image_url    VARCHAR(255)       NULL,
    CONSTRAINT pk_music PRIMARY KEY (id)
);
CREATE TABLE category
(
    id   INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(255)       NOT NULL,
    CONSTRAINT pk_category PRIMARY KEY (id)
);

CREATE TABLE purchase
(
    id            INT AUTO_INCREMENT NOT NULL,
    user_id       INT                NOT NULL,
    music_id      INT                NOT NULL,
    purchase_date datetime           NOT NULL,
    amount        DECIMAL            NOT NULL,
    CONSTRAINT pk_purchase PRIMARY KEY (id)
);

ALTER TABLE purchase
    ADD CONSTRAINT FK_PURCHASE_ON_MUSIC FOREIGN KEY (music_id) REFERENCES music (id);

ALTER TABLE purchase
    ADD CONSTRAINT FK_PURCHASE_ON_USER FOREIGN KEY (user_id) REFERENCES user (id);

ALTER TABLE music
    ADD CONSTRAINT FK_MUSIC_ON_CATEGORY FOREIGN KEY (category_id) REFERENCES category (id);

ALTER TABLE music
    ADD CONSTRAINT FK_MUSIC_ON_COMPOSER FOREIGN KEY (composer_id) REFERENCES user (id);


