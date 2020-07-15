public class CreateNewRecordEditController {

    
    public String email { get; set; }
    public String mobile { get; set; }
    public String LName { get; set; }
    public String FName { get; set; }

    
    public PageReference save() {
    
        New_Records__c newrec = new New_Records__c();
        newrec.First_Name__c = FName;
        newrec.Last_Name__c = LName;
        newrec.Mobile__c = mobile;
        newrec.Email__c = email;
        
        insert newrec;
        
        PageReference pg = new PageReference('/apex/newrecorddetails');
        pg.getparameters().put('Id', newrec.Id);
        
        return pg;
    }

    public PageReference saveNew() {
        New_Records__c newrec = new New_Records__c();
        newrec.First_Name__c = FName;
        newrec.Last_Name__c = LName;
        newrec.Mobile__c = mobile;
        newrec.Email__c = email;
        
        insert newrec;
        
        email = '';
        mobile = '';
        LName = '';
        FName = '';
        
        PageReference pg = new PageReference('/apex/CreateNewRecordEdit');
        return pg;
    }
    
    public PageReference cancel() {
        PageReference pg = new PageReference('/apex/CreateNewRecords');
        return pg;
    }
}