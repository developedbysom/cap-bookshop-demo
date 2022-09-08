using {sap.capire.bookshop as my} from '../db/schema';

service CatalogService {
    @requires : 'USA_USER'
    @restrict : [{
        grant : 'READ',
        where : 'currency_code = ''USD'''
    }]
    entity Books   as projection on my.Books;

    @requires : 'authenticated-user'
    entity Authors as projection on my.Authors;
}
