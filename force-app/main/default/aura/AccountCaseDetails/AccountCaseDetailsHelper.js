({
	getAccountsHelper : function(component, event, helper) {
		var action =component.get("c.accountCase");
       
        action.setParams({
        	"accid" : component.get("v.recordId")  
        });
        
        action.setCallback(this, function(a){ 
             
            component.set("v.accountsToDisplay", a.getReturnValue());
            console.log('The accs are :'+JSON.stringify(a.getReturnValue()));
          
        });
        $A.enqueueAction(action);
	}
})