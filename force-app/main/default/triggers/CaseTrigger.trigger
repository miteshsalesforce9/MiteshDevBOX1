trigger CaseTrigger on Case(before insert, before update, after insert, after update, after delete, after undelete) {

    CaseTriggerHandler CaseTH = new CaseTriggerHandler();
    
    if(Trigger.isInsert){
        
        if(Trigger.isBefore){
            caseTH.onBeforeInsert(Trigger.new);
        }
        
        else if(Trigger.isAfter){
            caseTH.onBeforeInsert(Trigger.new);
        }
    }
    
    if(Trigger.isUpdate){
        
        if(Trigger.isBefore){
            Set<Id> caseIds = Trigger.newMap != null ? Trigger.newMap.keySet() : new Set<Id>();
            system.debug('[CaseTrigger] ' + caseIds);
        }
        
        else if(Trigger.isAfter){
            caseTH.OnAfterUpdate(Trigger.new, Trigger.oldMap);
        }
    }
    
    /**

    if(Trigger.isBefore && Trigger.isInsert) {
        caseTH.onBeforeInsert(Trigger.new);
    }
    
    if(Trigger.isBefore && Trigger.isUpdate) {
        //caseTH.SetCoordinators(Trigger.new);
        Set<Id> caseIds = Trigger.newMap != null ? Trigger.newMap.keySet() : new Set<Id>();
        system.debug('[CaseTrigger] ' + caseIds);
       // caseTH.SetNumberOfWorkOrders(Trigger.new, caseIds);
        
        //caseTH.onBeforeUpdate(Trigger.newMap);
    }
    
    
    if((Trigger.isInsert || Trigger.isUndelete) && Trigger.isAfter){        
        caseTH.OnAfterInsert(Trigger.new);
    }

    if(Trigger.isUpdate && Trigger.isAfter){
        caseTH.OnAfterUpdate(Trigger.new, Trigger.oldMap);
    }
    
    if(trigger.IsDelete && Trigger.isAfter) {
        //caseTH.OnAfterDelete(trigger.old);
    } **/

}