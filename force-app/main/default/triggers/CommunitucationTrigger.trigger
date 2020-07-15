trigger CommunitucationTrigger on Communication__c(before insert, before update,after insert, after update) {

    CommunicationTriggerHandler handler = new CommunicationTriggerHandler();

    if( Trigger.isInsert){
        if(Trigger.isBefore){
            handler.OnBeforeInsert(trigger.New);
        }
        else{
            handler.OnAfterInsert(trigger.New,Trigger.newMap);
        }
    }

    else if ( Trigger.isUpdate){
        if(Trigger.isBefore){
            handler.OnBeforeUpdate(trigger.New ,trigger.Old,Trigger.NewMap,Trigger.OldMap);
        }
        else{
            handler.OnAfterUpdate(trigger.New ,trigger.Old,Trigger.NewMap,Trigger.OldMap);
        }
    }
}