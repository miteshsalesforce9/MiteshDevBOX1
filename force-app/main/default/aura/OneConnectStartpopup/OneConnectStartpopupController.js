({
    doInit : function(component, event, helper) {
        helper.setPopupVisibility(component, event);
    },
    
	closeModal : function(component, event, helper) {
        helper.save(component, event);
	}
})