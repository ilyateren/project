create table dbo.SKU (
  ID int not null identity,
  Code as ('s' + cast(ID as varchar)) not null unique,
  Name varchar(255) not null,
  constraint PK_SKU primary key clustered (ID)
);

create table dbo.Family (
  ID int not null identity,
  SurName varchar(255) not null,
  BudgetValue decimal(10, 2) not null,
  constraint PK_Family primary key clustered (ID)
);

create table dbo.Basket (
  ID int not null identity,
  ID_SKU int not null,
  ID_Family int not null,
  Quantity int not null check (Quantity >= 0),
  Value decimal(10, 2) not null check (Value >= 0),
  PurchaseDate date not null default getdate(),
  DiscountValue decimal(10, 2) not null,
  constraint PK_Basket primary key clustered (ID),
  constraint FK_Basket_ID_SKU_SKU foreign key (ID_SKU) references dbo.SKU(ID),
  constraint FK_Basket_ID_Family_Family foreign key (ID_Family) references dbo.Family(ID)
);
