using CatalogService as service from '../../srv/CatalogService';

annotate CatalogService.Books with @(

UI : {
    HeaderInfo : {
        Title          : {
            Value : ID,
            $Type : 'UI.DataField'
        },
        TypeName       : '{i18n>Book}',
        TypeNamePlural : '{i18n>Books}',
    },
    LineItem   : [
        {Value : ID},
        {Value : title},
        {Value : author.name},
        {Value : stock},
        {Value : price},
        {Value : currency_code},
        {Value : currency.symbol}
    ]
}

);

annotate CatalogService.Authors with @(UI : {
    HeaderInfo          : {
        TypeName       : 'Author',
        TypeNamePlural : 'Authors',
        Title          : {
            Value : ID,
            Label : '{i18n>Details}',
            $Type : 'UI.DataField'
        },

    },
    SelectionFields     : [
        ID,
        name
    ],
    LineItem            : [
        {Value : ID},
        {Value : name},
        {Value : dateOfBirth},
        {Value : dateOfDeath},
        {Value : placeOfBirth},
        {Value : placeOfDeath}
    ],
    Facets              : [
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>Details}',
            Target : '@UI.FieldGroup#Details'
        },
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>Books}',
            Target : 'books/@UI.LineItem'
        },
    ],
    FieldGroup #Details : {Data : [
        {Value : name},
        {Value : placeOfBirth},
        {Value : placeOfDeath},
        {Value : dateOfBirth},
        {Value : dateOfDeath}
    ]},
});
