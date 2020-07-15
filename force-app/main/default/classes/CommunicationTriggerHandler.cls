Public with sharing class CommunicationTriggerHandler {

   
    public void OnBeforeInsert(List<Communication__c> newCommunication){
        CommunicationActions.calculateCommunicationRevenue(newCommunication,null,'insert');
    }
    
    public void OnAfterInsert(List<Communication__c> newCommunication, Map<Id,Communication__c> newMapCommunication){
        CommunicationActions.createEnergyAudit(newCommunication,null,'insert');
    }
    
    public void OnBeforeUpdate( List<Communication__c> newCommunication, List<Communication__c> oldCommunication,
                                Map<ID, Communication__c> newnewCommunicationMap, Map<ID, Communication__c> oldCommunicationMap){
        CommunicationActions.calculateCommunicationRevenue(newCommunication,oldCommunicationMap,'update');                            
    }
    
    public void OnAfterUpdate( List<Communication__c> newCommunication, List<Communication__c> oldCommunication,
                                Map<ID, Communication__c> newnewCommunicationMap, Map<ID, Communication__c> oldCommunicationMap){
        CommunicationActions.createEnergyAudit(newCommunication,oldCommunicationMap,'update');                           
    }
}