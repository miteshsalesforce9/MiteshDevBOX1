global class UpdateLeadOwnerSchedler implements Database.Batchable<sObject>, Database.Stateful {
    

    global Database.QueryLocator start(Database.BatchableContext bc) {
        
        String query = 'SELECT ID, Name, OwnerId, Is_Partner_Lead__c from Lead where Is_Partner_Lead__c == True';
        
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext bc, List<Lead> scope){
        // process each batch of records
        // logic to execute batch wise
        
        List<Lead> lead = new List<Lead>();
        for (Lead l : scope) {
            l.OwnerId = '0050b000004n8Yg';
        }
        //update l;
    } 
       
    global void finish(Database.BatchableContext bc){
        
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, 
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];
        // call some utility to send email
       
    }    
}