@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {

    @HttpGet
    global static Account getAccount() {
        
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
        String accoundId = request.requestURI.substringBetween('Accounts/','/contacts');

        
        Account result =  [SELECT Id, Name, (SELECT Id, Name from Contacts) FROM Account WHERE Id = : accoundId ];
        
        return result;
    }

}