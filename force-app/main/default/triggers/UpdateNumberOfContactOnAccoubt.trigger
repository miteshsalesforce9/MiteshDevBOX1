trigger UpdateNumberOfContactOnAccoubt on Contact (after insert, after update, after delete, after undelete) {

    
    try{
    
        Set<Id> accIds = new Set<Id>();
        if(Trigger.isInsert ||Trigger.isUpdate){
               
            for(Contact c : Trigger.New){
                accIds.add(c.AccountId);
            }
        }
        
        if(Trigger.isDelete){
            for(Contact c : Trigger.old){
                accIds.add(c.AccountId);
            }
        }
            
        Map<Id, Account> getAccounts = new Map<Id, Account>([SELECT Id, Name, Number_of_Contacts__c from Account WHERE Id IN : accIds]);
        Map<Id, Contact> getContacts = new Map<Id, Contact>([SELECT Id, Name, AccountId from Contact WHERE AccountId IN : accIds]);
    
            
            if(getAccounts.size()>0){
                for(Account a : getAccounts.values()){ // getAccounts.values(): Used this method to convert Map to List
                    integer updateContactCountOnAccount = 0;
                    for(Contact c : getContacts.Values()){
                        if(c.AccountId == a.Id){
                            updateContactCountOnAccount++;
                        }
                    }
                    a.Number_of_Contacts__c = updateContactCountOnAccount;
                }
                update getAccounts.values();
            }
    }
    
    catch(Exception e){
        System.debug('Get the DML Exception here******* ::: ' +e);
    }
}