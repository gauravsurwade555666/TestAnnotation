using { com.test.app as db } from '../db/schema';


service RequestService {
   
    entity RequestSet as projection on db.Requests;
    entity MaterialSet as projection on db.Material;
    entity MaterialTypeSet as projection on db.MaterialType;
}


service ApproverService{
    
    entity FocalPointSet as projection on db.FocalPoint;
    entity ExpertiseHolderSet as projection on db.ExpertiseHolder;
    entity StandardClassSet as projection on db.StandardClassT;
}
