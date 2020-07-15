public class accountsWithContactsClass {

@auraEnabled
public static list<account> getAllAccounts(String accid)
    {
       system.debug('**************' +accid);
       list<account> accs =[Select Id, Name, Phone, (SELECT ID, CaseNumber FROM Cases) FROM Account WHERE Id =: accid];
      //  list<account> accs =[select id,name,phone,industry from account limit 10];
     //   return [select Id,Name from account limit 10];
     return accs;
    }
}