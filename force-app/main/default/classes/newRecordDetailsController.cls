public class newRecordDetailsController {

    Id newRcordId;
    String FName, LName, mobile, email;
    public New_Records__c newrec;
    
    public newRecordDetailsController(){
        newRcordId = ApexPages.currentPage().getParameters().get('Id');
        
        if(newRcordId != Null){
            newrec = [SELECT Id, Name, First_Name__c, Last_Name__c, Email__c, Mobile__c FROM New_Records__c WHERE Id =: newRcordId];
           
            FName = newrec.First_Name__c;
            LName = newrec.Last_Name__c;
            mobile = newrec.Mobile__c ;
            email = newrec.Email__c;
        }
    }
    
    
    public String getLName() {
        return LName;
    }


    public String getFName() {
        return FName;
    }

    public String getMobile() {
        return mobile;
    }

    
    public String getEmail() {
        return email;
    }

    public PageReference edit() {
        
        PageReference pg = new PageReference('/apex/CreateNewRecordEdit');
        pg.getparameters().put('editId', newRcordId );
        return pg;
    }
    
    public PageReference del() {
    
        delete newrec;
        PageReference pg = new PageReference('/apex/CreateNewRecords');
        return pg;
    }

}