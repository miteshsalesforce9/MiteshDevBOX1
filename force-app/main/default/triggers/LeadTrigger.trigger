trigger LeadTrigger on Lead(before insert, before update){
    
    for(Lead l : Trigger.New){
        if(l.Rating != null && l.Rating != 'Hot'){
            l.addError('The rating is not Hot!!');
        }    
    }
     
}