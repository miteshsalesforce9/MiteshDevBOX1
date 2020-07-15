global class UpdateContactAddresses implements Database.Batchable<sObject>, Database.Stateful {   
    // instance member to retain state across transactions
    global Integer recordsProcessed = 0;
    global Database.QueryLocator start(Database.BatchableContext bc) {
    
        String query = 'SELECT ID, BillingStreet, ShippingPostalCode, BillingCity, BillingCountry, BillingState, ' +
            'BillingPostalCode, (SELECT ID, MailingStreet, MailingCity, ' +
            'MailingState, MailingPostalCode FROM Contacts) FROM Account ' + 
            'Where BillingCountry = \'INDIA\'';
            
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext bc, List<Account> accList){
        // process each batch of records
        List<Contact> contacts = new List<Contact>();
        for (Account account : accList) {
            for (Contact contact : account.contacts) {
                contact.MailingStreet = account.BillingStreet;
                contact.MailingCity = account.BillingCity;
                contact.MailingState = account.BillingState;
                contact.MailingPostalCode = account.ShippingPostalCode;
                // add contact to list to be updated
                contacts.add(contact);
                // increment the instance member counter
                recordsProcessed = recordsProcessed + 1;
            }
        }
        update contacts;
    }
        
    global void finish(Database.BatchableContext bc){
        System.debug(recordsProcessed + ' records processed. Shazam!');
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors,  JobItemsProcessed, TotalJobItems, CreatedBy.Email FROM AsyncApexJob WHERE Id = :bc.getJobId()];
        
       // Send an email to the Apex job's submitter notifying of job completion.
       Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
       String[] toAddresses = new String[] {job.CreatedBy.Email};
       mail.setToAddresses(toAddresses);
       mail.setSubject('Apex Sharing Recalculation ' + job.Status);
       mail.setPlainTextBody('The batch Apex job processed ' + job.TotalJobItems + ' batches with '+ job.NumberOfErrors + ' failures.');
       Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        
    }    
}