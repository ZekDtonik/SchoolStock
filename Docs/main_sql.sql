CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authid` varchar(8) NOT NULL,
  `registerDate` date DEFAULT NULL,
  `lastEdited` date DEFAULT NULL,
  `login` varchar(30) DEFAULT NULL,
  `password` varchar(80) NOT NULL,
  `avatar` varchar(80) DEFAULT NULL,
  `status` int(1) DEFAULT '3' COMMENT 'Estado de acesso do usuario 1= ativo, 2=bloqueado, 3=inativo, 4=superusuarios',
  `name` varchar(50) NOT NULL,
  `lastname` varchar(150) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `emailAlt` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  KEY `Acessador` (`authid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

CREATE TABLE `usergroups` (
  `guid` varchar(35) NOT NULL,
  `registerDate` date DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text,
  `perms` varchar(4000) DEFAULT NULL COMMENT 'Os dados podem ser tanto JSON quanto serializacao, dessa forma, mantem um tipo generico para manutencao',
  `active` int(11) DEFAULT '0',
  UNIQUE KEY `guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `credentials` (
  `cid` varchar(50) NOT NULL,
  `authid` varchar(8) DEFAULT NULL,
  `guid` varchar(48) DEFAULT NULL,
  UNIQUE KEY `cid` (`cid`),
  KEY `authid` (`authid`),
  KEY `guid` (`guid`),
  CONSTRAINT `credencial_para_usuario` FOREIGN KEY (`authid`) REFERENCES `users` (`authid`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `grupodeusuario` FOREIGN KEY (`guid`) REFERENCES `usergroups` (`guid`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `category` (
  `ctgid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`ctgid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

CREATE TABLE `products` (
  `prdid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `ctgid` int(10) NOT NULL,
  PRIMARY KEY (`prdid`),
  KEY `fk_category` (`ctgid`),
  CONSTRAINT `fk_category` FOREIGN KEY (`ctgid`) REFERENCES `category` (`ctgid`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

CREATE TABLE `stock` (
  `prdid` bigint(11) NOT NULL,
  `quantity` bigint(11) NOT NULL,
  `qntMinimum` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `transactions` (
  `auhtid` bigint(20) NOT NULL AUTO_INCREMENT,
  `protocol` varchar(500) NOT NULL,
  `prdid` bigint(20) NOT NULL,
  `quantity` bigint(20) NOT NULL,
  `dateOperation` date NOT NULL,
  `typeAction` int(11) NOT NULL,
  PRIMARY KEY (`auhtid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE VIEW `see_usergroups` AS select `usergroups`.`guid` AS `guid`,`usergroups`.`registerDate` AS `registerDate`,`usergroups`.`name` AS `name`,`usergroups`.`description` AS `description`,`usergroups`.`perms` AS `perms`,`usergroups`.`active` AS `active` from `usergroups`;
CREATE VIEW `see_transactions` AS select `transactions`.`auhtid` AS `auhtid`,`transactions`.`protocol` AS `protocol`,`transactions`.`prdid` AS `prdid`,`transactions`.`quantity` AS `quantity`,`transactions`.`dateOperation` AS `dateOperation`,`transactions`.`typeAction` AS `typeAction`,`products`.`name` AS `productName` from (`transactions` join `products` on((`transactions`.`prdid` = `products`.`prdid`)));
CREATE VIEW `see_stocks` AS select `stock`.`prdid` AS `prdid`,`products`.`name` AS `productName`,`stock`.`quantity` AS `quantity`,`stock`.`qntMinimum` AS `qntMinimum` from (`stock` join `products` on((`stock`.`prdid` = `products`.`prdid`)));
CREATE VIEW `see_permissions` AS select `users`.`authid` AS `authid`,`usergroups`.`perms` AS `permissions`,`credentials`.`cid` AS `cid`,`users`.`status` AS `status`,`usergroups`.`name` AS `usergroupname`,`usergroups`.`guid` AS `guid` from ((`users` left join `credentials` on((`users`.`authid` = `credentials`.`authid`))) left join `usergroups` on((`usergroups`.`guid` = `credentials`.`guid`)));
CREATE VIEW `see_credentials` AS select concat(`users`.`name`,' ',`users`.`lastname`) AS `username`,`users`.`status` AS `userstatus`,`usergroups`.`guid` AS `guid`,`usergroups`.`name` AS `usergroupname`,`credentials`.`cid` AS `cid`,`usergroups`.`active` AS `groupactive`,`users`.`authid` AS `authid` from ((`credentials` join `users` on((`credentials`.`authid` = `users`.`authid`))) join `usergroups` on((`usergroups`.`guid` = `credentials`.`guid`)));

INSERT INTO `users`
(
`authid`,
`registerDate`,
`lastEdited`,
`login`,
`password`,
`avatar`,
`status`,
`name`,
`lastname`)
VALUES(
"0101",
curdate(),
curdate(),
"admin",
"21232f297a57a5a743894a0e4a801fc3",
"",
4,
"Super",
" Usuário"
);






