CREATE SCHEMA `SIP`;

CREATE TABLE `MNLdStockFisico` (
  `IdStock` integer,
  `Descrip` string,
  `Apto` string,
  `Usuario` string,
  `Terminal` string,
  `TS` timestamp
);

CREATE TABLE `MNadArticulos` (
  `Id` integer,
  `IdArticulo` integer,
  `IdNumero` integer,
  `Mna` string,
  `SectSecc` integer,
  `Usuario` string,
  `Terminal` string,
  `Ts` timestamp,
  `CodigoSap` integer
);

CREATE TABLE `MNadTipoArticulos` (
  `Mna` string,
  `Descrip` string,
  `TipoCotizacion` string,
  `Terminal` string,
  `Usuario` string,
  `Ts` timestamp
);

CREATE TABLE `SIP`.`SIPidStocks` (
  `Idb` integer,
  `Id` integer,
  `Scannig` integer,
  `UxB` integer,
  `IdStock` integer,
  `Unidades` integer,
  `Usuario` string,
  `Terminal` string,
  `Ts` timestamp
);

ALTER TABLE `SIP`.`SIPidStocks` ADD FOREIGN KEY (`Idb`) REFERENCES `MNLdStockFisico` (`IdStock`);

ALTER TABLE `MNadArticulos` ADD FOREIGN KEY (`Id`) REFERENCES `SIP`.`SIPidStocks` (`Id`);

ALTER TABLE `MNadArticulos` ADD FOREIGN KEY (`Usuario`) REFERENCES `SIP`.`SIPidStocks` (`Usuario`);

ALTER TABLE `MNadArticulos` ADD FOREIGN KEY (`Usuario`) REFERENCES `MNadTipoArticulos` (`Usuario`);

ALTER TABLE `MNadArticulos` ADD FOREIGN KEY (`Terminal`) REFERENCES `MNadTipoArticulos` (`Terminal`);

ALTER TABLE `SIP`.`SIPidStocks` ADD FOREIGN KEY (`Terminal`) REFERENCES `MNadArticulos` (`Terminal`);

ALTER TABLE `MNadArticulos` ADD FOREIGN KEY (`Ts`) REFERENCES `SIP`.`SIPidStocks` (`Ts`);

ALTER TABLE `MNadTipoArticulos` ADD FOREIGN KEY (`Ts`) REFERENCES `MNadArticulos` (`Ts`);

ALTER TABLE `SIP`.`SIPidStocks` ADD FOREIGN KEY (`Ts`) REFERENCES `MNLdStockFisico` (`TS`);

ALTER TABLE `MNLdStockFisico` ADD FOREIGN KEY (`Terminal`) REFERENCES `SIP`.`SIPidStocks` (`Terminal`);

ALTER TABLE `SIP`.`SIPidStocks` ADD FOREIGN KEY (`Usuario`) REFERENCES `MNLdStockFisico` (`Usuario`);
