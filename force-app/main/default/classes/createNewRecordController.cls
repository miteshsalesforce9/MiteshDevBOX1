public class createNewRecordController {

    List<New_Records__c> newRecords;
    public List<New_Records__c> getNewRecordList() {
        
        newRecords = [SELECT Id, Name, First_Name__c, Last_Name__c, Email__c, Mobile__c, CreatedDate FROM New_Records__c ORDER BY CreatedDate DESC];
        return newRecords;
    }


    public PageReference createNewRecord() {
        
        PageReference pg = new PageReference('/apex/CreateNewRecordEdit');
        return pg;
    }

}