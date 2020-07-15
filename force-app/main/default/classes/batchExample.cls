global class batchExample implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        // collect the batches of records or objects to be passed to execute
         
        String query = 'SELECT Id,Name FROM Account';
        return Database.getQueryLocator(query);
    }
     
    global void execute(Database.BatchableContext BC, List<Account> accList) {
        
        // process each batch of records
 
         
        for(Account acc : accList)
        {        
            // Update the Account Name 
            acc.Name = acc.Name + 'Webkul';
        }
        try {
            // Update the Account Record
            update accList;
         
        } catch(Exception e) {
            System.debug(e);
        }
         
    }   
     
    global void finish(Database.BatchableContext BC) {
        // execute any post-processing operations
        
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