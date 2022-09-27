using {my.App as myApp} from '../db/schema';

service CatalogService {
    entity Products   as projection on myApp.Products;
    entity Suppliers as projection on myApp.Suppliers;
    entity Orders    as projection on myApp.Orders;
}
