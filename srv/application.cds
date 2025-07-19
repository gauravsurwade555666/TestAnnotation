using { com.test.app as db } from '../db/schema';


service RequestService {
   
    entity RequestSet as projection on db.Requests;
    entity MaterialSet as projection on db.Material;
    entity MaterialTypeSet as projection on db.MaterialType;
}

