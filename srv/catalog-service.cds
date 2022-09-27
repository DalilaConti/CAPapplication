using {my.App as myApp} from '../db/schema';

service CatalogService {
    entity Products as projection on myApp.Products;
}
