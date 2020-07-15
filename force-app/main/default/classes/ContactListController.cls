public with sharing class ContactListController {

    @AuraEnabled
    public static List<Contact> findAll(){
        return [SELECT Id, Name, Phone FROM Contact LIMIT 50];
    }
    
    @AuraEnabled
    public static List<Contact> findByName(String searchKey){
        String contactName = '%' + searchKey + '%';
        return [SELECT Id, Name, Phone FROM Contact WHERE Name LIKE : contactName LIMIT 50];
    }
    
    @AuraEnabled
    public static Contact findById(String ContactId){
        return [SELECT ID, Name, Title, Phone, MobilePhone, Account.Name FROM Contact WHERE Id =: ContactId];
    }
}