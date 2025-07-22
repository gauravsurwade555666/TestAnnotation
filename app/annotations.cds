using {ApproverService} from '../srv/application.cds';
using {RequestService} from '../srv/application.cds';

annotate RequestService.RequestSet with @UI.HeaderInfo: {
    TypeName      : 'Request',
    TypeNamePlural: 'Requests'
};

annotate RequestService.RequestSet with @UI.SelectionFields: [RequestNumber];

annotate RequestService.MaterialSet with @UI.HeaderInfo: {
    TypeName      : 'Material',
    TypeNamePlural: 'Materials'
};

annotate RequestService.MaterialTypeSet with @UI.HeaderInfo: {
    TypeName      : 'Material Type',
    TypeNamePlural: 'Material Types'
};


annotate RequestService.RequestSet with @UI.LineItem: [
    {
        $Type: 'UI.DataField',
        Value: RequestNumber
    },
    {
        $Type: 'UI.DataField',
        Value: RequestDescription
    },
    {
        $Type: 'UI.DataField',
        Value: Priority
    }
];
annotate RequestService.MaterialSet with @UI.LineItem: [
    {
        $Type: 'UI.DataField',
        Value: RequestNumber
    },
    {
        $Type: 'UI.DataField',
        Value: Index
    },
    {
        $Type: 'UI.DataField',
        Value: MaterialDescritption
    },
    {
        $Type: 'UI.DataField',
        Value: MaterialLongText
    }
];

annotate RequestService.RequestSet with @UI.FieldGroup #Main: {
    $Type: 'UI.FieldGroupType',
    Data : [
        {
            $Type: 'UI.DataField',
            Value: RequestNumber,
            Label: 'RequestNumber'
        },
        {
            $Type: 'UI.DataField',
            Value: RequestDescription,
            Label: 'Request Description'
        },
        {
            $Type: 'UI.DataField',
            Value: Priority,
            Label: 'Priority'
        }
    ]
};

annotate RequestService.RequestSet with @UI.Facets: [
    {
        $Type : 'UI.ReferenceFacet',
        ID    : 'Main',
        Label : 'General Information',
        Target: '@UI.FieldGroup#Main'
    },
    {
        $Type : 'UI.CollectionFacet',
        ID    : 'FacetIdentifier1',
        Label : 'Mass Material Data',
        Facets: [{
            $Type : 'UI.ReferenceFacet',
            ID    : 'FacetIdentifier2',
            Target: '_Materials/@UI.LineItem'
        }]
    },
  
];
