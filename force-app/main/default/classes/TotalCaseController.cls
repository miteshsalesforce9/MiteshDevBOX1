public with sharing class TotalCaseController{
    @AuraEnabled
    public static List<Case> getcases() {
        return [SELECT Id, Status, Total_case__c FROM Case];
    }
}