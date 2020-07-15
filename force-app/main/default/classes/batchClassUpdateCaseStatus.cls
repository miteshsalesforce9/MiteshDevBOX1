public class batchClassUpdateCaseStatus implements Database.Batchable<sObject>{

    public Database.QueryLocator start(Database.BatchableContext BC){
    
        String query = 'SELECT Id, CaseNumber, Priority, Origin, Status from Case';
        
        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext BC, List<Case> lstOfCase){
    
        for(Case c : lstOfCase){
            
            c.Status = 'New';
            c.Origin = 'Phone';
            c.Priority = 'High';
        }
        
        try{
            insert lstOfCase;
        }catch(Exception e){
            system.debug('Exception****::::: ' +e);
        }
    
    }
    
    public void finish(Database.BatchableContext BC){
        
        AsyncApexJob a = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email FROM AsyncApexJob WHERE Id =:BC.getJobId()];
       
           // Send an email to the Apex job's submitter notifying of job completion.
           Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
           String[] toAddresses = new String[] {a.CreatedBy.Email};
           mail.setToAddresses(toAddresses);
           mail.setSubject('Apex Sharing Recalculation ' + a.Status);
           mail.setPlainTextBody('The batch Apex job processed ' + a.TotalJobItems + ' batches with '+ a.NumberOfErrors + ' failures.');
           Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
    
}