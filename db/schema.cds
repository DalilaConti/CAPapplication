namespace my.App;

entity Products {
    key ID          : Integer;
        Name        : String not null;
        Description : String;
        Stock       : Integer;
        Price       : Decimal(16, 2);

};

entity Suppliers {
    key ID         : Integer;
        Name       : String;
        City       : String;
        State      : String(2);
        PostalCode : String(5);
        Country    : String(3);
        Email      : String;
};

entity Orders {
    key ID      : Integer;
        Product : Association to Products;
        Amount  : Integer;

};
