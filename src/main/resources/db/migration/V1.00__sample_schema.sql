CREATE SCHEMA サンプル;

CREATE TABLE サンプル.アクション
(
    管理番号 CHARACTER(6) PRIMARY KEY,
    名称 VARCHAR(20) NOT NULL,
    created_at  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE SCHEMA 商品;

-- 区分

CREATE TABLE 商品.種類
(
    種類 VARCHAR (6) PRIMARY KEY
);

CREATE TABLE 商品.特徴
(
    特徴 VARCHAR (10) PRIMARY KEY
);

-- リソース

CREATE TABLE 商品.品種
(
    品種番号 CHARACTER (7) PRIMARY KEY ,
    名前 VARCHAR (20) NOT NULL
);

-- イベント
CREATE TABLE 商品.栽培キット
(
    キット番号 CHARACTER (10) PRIMARY KEY,
    種まき日 DATE NOT NULL,
    カバー CHAR (1) NOT NULL,
    種類 VARCHAR (6) NOT NULL REFERENCES 商品.種類
);

CREATE TABLE 商品.キットの特徴
(
    キット番号 CHARACTER (10) NOT NULL REFERENCES 商品.栽培キット,
    順序番号 NUMERIC (1) NOT NULL,
    PRIMARY KEY(キット番号,順序番号),
    特徴 VARCHAR (10) NOT NULL REFERENCES 商品.特徴,
    UNIQUE (キット番号,特徴)
);

CREATE TABLE 商品.列
(
    キット番号 CHARACTER (10) NOT NULL REFERENCES 商品.栽培キット,
    列番号 NUMERIC (1) NOT NULL,
    PRIMARY KEY(キット番号,列番号),
    品種番号 CHARACTER (7) NOT NULL REFERENCES 商品.品種,
    種の数 NUMERIC(2) NOT NULL
);