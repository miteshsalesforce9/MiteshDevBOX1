@isTest
Public class TestCase{

    public static testmethod void TestCase(){
    
    Test.startTest();
    
    /**User u = new User(LastName = 'last',
                 Email = '000@amamama.com',
                 Title = '1title',
                 Alias = 'alias',
                 TimeZoneSidKey = 'America/Los_Angeles',
                 EmailEncodingKey = 'UTF-8',
                 LanguageLocaleKey = 'en_US',
                 LocaleSidKey = 'en_US'
                 ); **/

               
           //users.add(u); 
           
    Id profileId= userinfo.getProfileId();
    String profileName=[Select Id,Name from Profile where Id=:profileId].Name;
    
    User thisUser = [SELECT Id FROM User WHERE Id = :UserInfo.getUserId()];
    
    
    System.runAs (thisUser) {
    
    Case c = new Case(Subject = 'Test Sales Plan', 
                      Description = 'test Description',
                      Status = 'New',
                      Type = 'Refund',
                      Origin = 'Phone'
                     
                      );
     insert c; 
     
     /**CaseShare cs = new CaseShare(CaseId = c.Id,
                                UserOrGroupId = c.Handler__c,
                                CaseAccessLevel = 'Edit',
                                RowCause = Schema.CaseShare.RowCause.Manual
                      );
     insert cs; ***/
     
    }
    
  } 
          
}