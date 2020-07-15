@isTest
public class OneConnectStartPopupServiceTest {
    static testMethod void validate() {
        User userObj = [Select Id, ContactId From User where Alias = 'TGC' limit 1];
        system.runAs(userObj) {
            OneConnectStartPopupService.showStartupPopup();
            OneConnectStartPopupService.updateContact();
        }
    }
    
    @testSetup static void methodName() {
        Account portalAccount = new Account(name = 'portalAccount', BillingCountry ='United States');//create a portal account first
        insert portalAccount;
        Contact portalContact = new contact(LastName = 'portalContact', AccountId = portalAccount.Id, mailingCountry ='United States', email='test@henkel.com'); //create a portal contact
        insert portalContact;
        String portalProfileId = [SELECT Id FROM profile WHERE name = 'Customer Community User'].Id;
        User userObj = new User( email='test@henkel.com',
                                profileid = portalProfileId, 
                                UserName='test@henkel.com', 
                                Alias = 'TGC',
                                TimeZoneSidKey='America/New_York',
                                EmailEncodingKey='ISO-8859-1',
                                LocaleSidKey='en_US', 
                                LanguageLocaleKey='en_US',
                                ContactId = portalContact.Id,
                                PortalRole = 'Manager',
                                FirstName = 'Genelia',
                                LastName = 'Dsouza');
        Insert userObj;
        
    }
}