CREATE DATABASE ecommerce
    DEFAULT CHARACTER SET = 'utf8mb4';

CREATE USER 'ecommerce '@'%' IDENTIFIED BY 'ecommerce';
GRANT SELECT, INSERT, UPDATE, DELETE ON ecommerce.* TO 'ecommerce'@'%';

use ecommerce;
  CREATE TABLE `products` (
    `productId` int(11) NOT NULL AUTO_INCREMENT,
    `productName` varchar(255) NOT NULL,
    `productDescription` text NOT NULL,
    `productPrice` decimal(10,2) NOT NULL,
    `productImgUrl` varchar(255) NOT NULL,
    `productStatus` char(3) NOT NULL,
    PRIMARY KEY (`productId`)
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

  CREATE TABLE `sales` (
    `saleId` int(11) NOT NULL AUTO_INCREMENT,
    `productId` int(11) NOT NULL,
    `salePrice` decimal(10,2) NOT NULL,
    `saleStart` datetime NOT NULL,
    `saleEnd` datetime NOT NULL,
    PRIMARY KEY (`saleId`),
    KEY `fk_sales_products_idx` (`productId`),
    CONSTRAINT `fk_sales_products` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

  CREATE TABLE `highlights` (
    `highlightId` int(11) NOT NULL AUTO_INCREMENT,
    `productId` int(11) NOT NULL,
    `highlightStart` datetime NOT NULL,
    `highlightEnd` datetime NOT NULL,
    PRIMARY KEY (`highlightId`),
    KEY `fk_highlights_products_idx` (`productId`),
    CONSTRAINT `fk_highlights_products` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;


   INSERT INTO `products` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`, `productStatus`) VALUES
  (1, 'Negocios Web Intro', 'Libro de Introducción a los Negocios Web 70 pg', 200, 'https://placehold.co/290x250?text=Negocios-Web-Intro&font=roboto','ACT');

  INSERT INTO `products` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`, `productStatus`) VALUES
  (2, 'Negocios Web 2', 'Libro de Negocios Web 2 POO 120 pg', 300, 'https://placehold.co/290x250?text=Negocios-Web-2&font=roboto','ACT');

  INSERT INTO `products` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`, `productStatus`) VALUES
  (3, 'Negocios Web Advance', 'Libro de Negocios Web Ingreso Pasivo 170 pg', 700, 'https://placehold.co/290x250?text=Negocios-Web-Advance&font=roboto','ACT');

  INSERT INTO `products` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`, `productStatus`) VALUES
  (4, 'Negocios Web Full', 'Libro de Negocios Web Full Stack 220 pg', 1000, 'https://placehold.co/290x250?text=Negocios-Web-Full&font=roboto','ACT');

  INSERT INTO `products` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`, `productStatus`) VALUES
  (5, 'Negocios Web Master', 'Libro de Negocios Web Master 300 pg', 1500, 'https://placehold.co/290x250?text=Negocios-Web-Master&font=roboto','ACT');

  INSERT INTO `products` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`, `productStatus`) VALUES
  (6, 'Negocios Web Expert', 'Libro de Negocios Web Expert 400 pg', 2000, 'https://placehold.co/290x250?text=Negocios-Web-Expert&font=roboto','ACT');

  INSERT INTO `products` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`, `productStatus`) VALUES
  (7, 'Negocios Web Guru', 'Libro de Negocios Web Guru 500 pg', 2500, 'https://placehold.co/290x250?text=Negocios-Web-Guru&font=roboto','ACT');

  INSERT INTO `products` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`, `productStatus`) VALUES
  (8, 'Negocios Web Master Ninha', 'Libro de Negocios Web Master Ninja 300 pg', 1500, 'https://placehold.co/290x250?text=Negocios-Web-Master-Ninja&font=roboto','ACT');

  INSERT INTO `products` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`, `productStatus`) VALUES
  (9, 'Negocios Web Expert Ninja', 'Libro de Negocios Web Expert Ninja 400 pg', 2000, 'https://placehold.co/290x250?text=Negocios-Web-Expert-Ninja&font=roboto','ACT');

  INSERT INTO `products` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`, `productStatus`) VALUES
  (10, 'Negocios Web Guru Ninja', 'Libro de Negocios Web Guru Ninja 500 pg', 2500, 'https://placehold.co/290x250?text=Negocios-Web-Guru-Ninja&font=roboto','ACT');

  INSERT INTO `sales` (`saleId`, `productId`, `salePrice`, `saleStart`, `saleEnd`) VALUES
  (1, 3, 500, '2023-08-01 00:00:00', '2023-10-31 23:59:59');

  INSERT INTO `sales` (`saleId`, `productId`, `salePrice`, `saleStart`, `saleEnd`) VALUES
  (2, 5, 750, '2023-08-01 00:00:00', '2023-10-31 23:59:59');

  INSERT INTO `sales` (`saleId`, `productId`, `salePrice`, `saleStart`, `saleEnd`) VALUES
  (3, 7, 1500, '2023-08-01 00:00:00', '2023-10-31 23:59:59');

  INSERT INTO `highlights` ( `highlightId`, `productId`, `highlightStart`, `highlightEnd`) VALUES
  (1, 1, '2023-08-01 00:00:00', '2023-10-31 23:59:59');

  INSERT INTO `highlights` ( `highlightId`, `productId`, `highlightStart`, `highlightEnd`) VALUES
  (2, 4, '2023-08-01 00:00:00', '2023-10-31 23:59:59');


  use ecommerce;
CREATE TABLE
    `usuario` (
        `usercod` bigint(10) NOT NULL AUTO_INCREMENT,
        `useremail` varchar(80) DEFAULT NULL,
        `username` varchar(80) DEFAULT NULL,
        `userpswd` varchar(128) DEFAULT NULL,
        `userfching` datetime DEFAULT NULL,
        `userpswdest` char(3) DEFAULT NULL,
        `userpswdexp` datetime DEFAULT NULL,
        `userest` char(3) DEFAULT NULL,
        `useractcod` varchar(128) DEFAULT NULL,
        `userpswdchg` varchar(128) DEFAULT NULL,
        `usertipo` char(3) DEFAULT NULL COMMENT 'Tipo de Usuario, Normal, Consultor o Cliente',
        PRIMARY KEY (`usercod`),
        UNIQUE KEY `useremail_UNIQUE` (`useremail`),
        KEY `usertipo` (
            `usertipo`,
            `useremail`,
            `usercod`,
            `userest`
        )
    ) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;

CREATE TABLE
    `roles` (
        `rolescod` varchar(128) NOT NULL,
        `rolesdsc` varchar(45) DEFAULT NULL,
        `rolesest` char(3) DEFAULT NULL,
        PRIMARY KEY (`rolescod`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE
    `roles_usuarios` (
        `usercod` bigint(10) NOT NULL,
        `rolescod` varchar(128) NOT NULL,
        `roleuserest` char(3) DEFAULT NULL,
        `roleuserfch` datetime DEFAULT NULL,
        `roleuserexp` datetime DEFAULT NULL,
        PRIMARY KEY (`usercod`, `rolescod`),
        KEY `rol_usuario_key_idx` (`rolescod`),
        CONSTRAINT `rol_usuario_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
        CONSTRAINT `usuario_rol_key` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`) ON DELETE NO ACTION ON UPDATE NO ACTION
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE
    `funciones` (
        `fncod` varchar(255) NOT NULL,
        `fndsc` varchar(255) DEFAULT NULL,
        `fnest` char(3) DEFAULT NULL,
        `fntyp` char(3) DEFAULT NULL,
        PRIMARY KEY (`fncod`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE
    `funciones_roles` (
        `rolescod` varchar(128) NOT NULL,
        `fncod` varchar(255) NOT NULL,
        `fnrolest` char(3) DEFAULT NULL,
        `fnexp` datetime DEFAULT NULL,
        PRIMARY KEY (`rolescod`, `fncod`),
        KEY `rol_funcion_key_idx` (`fncod`),
        CONSTRAINT `funcion_rol_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
        CONSTRAINT `rol_funcion_key` FOREIGN KEY (`fncod`) REFERENCES `funciones` (`fncod`) ON DELETE NO ACTION ON UPDATE NO ACTION
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE
    `bitacora` (
        `bitacoracod` int(11) NOT NULL AUTO_INCREMENT,
        `bitacorafch` datetime DEFAULT NULL,
        `bitprograma` varchar(255) DEFAULT NULL,
        `bitdescripcion` varchar(255) DEFAULT NULL,
        `bitobservacion` mediumtext,
        `bitTipo` char(3) DEFAULT NULL,
        `bitusuario` bigint(18) DEFAULT NULL,
        PRIMARY KEY (`bitacoracod`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 10 DEFAULT CHARSET = utf8;


    insert into `roles`()