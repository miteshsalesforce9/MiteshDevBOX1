({
    setPopupVisibility : function(component, event) {
        var action = component.get('c.showStartupPopup'); 
        action.setCallback(this, function(a) {
            var state = a.getState(); // get the response state
            if(state == 'SUCCESS') {
                component.set('v.showModal', a.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    
    save : function(component, event) {
        var action = component.get('c.updateContact'); 
        action.setCallback(this, function(a) {
            var state = a.getState(); // get the response state
            if(state == 'SUCCESS') {
                
                component.set("v.showModal", false);
                console.log("SUCCESS");
            }
        });
        $A.enqueueAction(action); 
    }
})