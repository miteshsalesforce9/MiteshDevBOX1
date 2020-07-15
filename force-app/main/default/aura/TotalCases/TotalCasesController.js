({
    doInit : function(component) {       
        
        var action = component.get("c.getcases");    
        action.setParams ({
            ID :component.get("v.ID")                         
        })         
        action.setCallback(this, function(actionResult) {    
            component.set("v.myPoints", actionResult.getReturnValue());
            
        var status ;
            var totalcase = "Total_Case__c";
            if (totalpoints > 5){
                status = "green";
            } else {
                status = "orange";
            }            
            component.set("v.status", status);

        });        
        
        $A.enqueueAction(action);     
    }
})