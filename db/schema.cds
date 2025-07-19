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
    key Index                : Integer @Core.Computed ;
        MaterialDescritption : String(40);
        MaterialLongText     : String(40);
        Type                 : Association to MaterialType;

}

entity MaterialType : managed {
    key Code     : String;
        TypeName : String;
}
