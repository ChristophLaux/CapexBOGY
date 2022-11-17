using CapitalExpendituresService as service from '../../srv/service';

annotate service.Capex with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Description',
            Value : description,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Total Cost',
            Value : total_cost,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Contractor',
            Value : contractors.address.ID,
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Label : 'Contractor',
            Target: '@Communication.Contact',
        },
    ]
);
annotate service.Capex with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Description',
                Value : description,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Total Cost',
                Value : total_cost,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Contractors',
            ID : 'Contractors',
            Target : '@UI.FieldGroup#Contractors',
        },
    ]
);
annotate service.Capex with {
    contractors @Common.Text : contractors.name
};
annotate service.Capex with @(
    UI.FieldGroup #Contractors : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Contractor',
                Value : contractors.address.ID,
            },
            {
                $Type : 'UI.DataFieldForAnnotation',
                Label : 'Contractor',
                Target : '@Communication.Contact',
            },
],
    }
);
annotate service.Capex with @(
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : description,
        },
        TypeName : '',
        TypeNamePlural : '',
    }
);
annotate service.Addresses with @(
   UI.FieldGroup #Address : { 
        $Type : 'UI.FieldGroupType',
        Data  : [
            {
                $Type : 'UI.DataField',
                Label : 'Contractor',
                Value : contractors.name,

            },
            {
                $Type : 'UI.DataField',
                Label : 'Street',
                Value : street,

            },
            {
                $Type : 'UI.DataField',
                Label : 'Street No',
                Value : streetno,

            },
            {
                $Type : 'UI.DataField',
                Label : 'Postal Code',
                Value : postalcode,

            },
            {
                $Type : 'UI.DataField',
                Label : 'City',
                Value : town,

            }
        ],
     }

);
annotate service.Addresses with @(
    UI.QuickViewFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#Address',
        }
    ],
);

annotate service.Addresses with {
    ID @Common.Text : {
            $value : contractors.name,
            ![@UI.TextArrangement] : #TextOnly,
        }
};


annotate service.Capex with @(
    Communication.Contact : {
        fn   : contractors.name, //full name
        kind : #org,
        adr  : [{
            street   : contractors.address.street,
            locality : contractors.address.town,
            code : contractors.address.postalcode,
        }],
    }
);