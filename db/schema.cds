using {
    Currency,
    managed,
    sap
} from '@sap/cds/common';

namespace sap.capire.bookshop;

entity Books : managed {

    key ID       : Integer                @title : '{i18n>id}';
        title    : localized String(111)  @title : '{i18n>title}';
        descr    : localized String(1111) @title : '{i18n>description}';
        author   : Association to Authors @title : '{i18n>author}';
        genre    : Association to Genres  @title : '{i18n>genre}';
        stock    : Integer                @title : '{i18n>stock}';
        price    : Decimal                @title : '{i18n>price}';
        currency : Currency               @title : '{i18n>currency}';
}

entity Authors : managed {
    key ID           : Integer;
        name         : String(111) @title : '{i18n>authors}';
        dateOfBirth  : Date        @title : '{i18n>dateOfBirth}';
        dateOfDeath  : Date        @title : '{i18n>dateOfDeath}';
        placeOfBirth : String      @title : '{i18n>placeOfBirth}';
        placeOfDeath : String      @title : '{i18n>placeOfDeath}';
        books        : Association to many Books
                           on books.author = $self;
}

/**
 * Hierarchically organized Code List for Genres
 */
entity Genres : sap.common.CodeList {
    key ID       : Integer;
        parent   : Association to Genres;
        children : Composition of many Genres
                       on children.parent = $self;
}
