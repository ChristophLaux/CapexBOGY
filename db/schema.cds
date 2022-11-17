namespace CapitalExpenditures;

using
{
    Country,
    Currency,
    Language,
    User,
    cuid,
    extensible,
    managed,
    temporal
}
from '@sap/cds/common';

entity Capex
{
    key ID : UUID
        @Core.Computed;
    description : String;
    total_cost : Integer;
    contractors : Association to one Contractors;
}

entity Contractors
{
    key contractor : Integer;
    name : String;
    address : Composition of one Address on address.contractors = $self;
}

entity Address
{
    key ID : UUID
        @Core.Computed;
    street : String(100);
    streetno : String(100);
    postalcode : String;
    town : String(100);
    contractors : Association to one Contractors;
}
