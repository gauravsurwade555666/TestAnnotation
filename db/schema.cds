namespace com.test.app;

using {managed} from '@sap/cds/common';

entity Requests : managed {
    key RequestNumber      : UUID @(Core.Computed: true);
        RequestDescription : String(40);
        Priority           : String enum {
            High;
            Medium;
            Low;
        };
        _Materials         : Composition of many Material
                                 on _Materials.RequestNumber = $self.RequestNumber;

}

entity Material : managed {
    key RequestNumber        : UUID;
    key Index                : Integer ;
        MaterialDescritption : String(40);
        MaterialLongText     : String(40);
        Type                 : String;

}

entity MaterialType : managed {
    key Code     : String;
        TypeName : String;
}


entity FocalPoint : managed {
    key userEmail     : String;
    key StandardClass : Association to StandardClassT;

}

entity ExpertiseHolder : managed {
    key userEmail     : String;
    key StandardClass : Association to StandardClassT;

}

entity StandardClassT : managed {
    key StdClass         : String;
        Description      : String;
        _ExpertiseHolder : Association to many ExpertiseHolder
                               on _ExpertiseHolder.StandardClass = $self;
        _FocalPoint      : Association to many FocalPoint
                               on _FocalPoint.StandardClass = $self;
}



