using {myApp} from '../db/schema';

service CustomerService {
    entity CustomerSrv as projection on myApp.Customer;


}
