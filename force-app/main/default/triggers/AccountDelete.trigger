trigger AccountDelete on Account (before delete) 
{
    if(Trigger.isDelete)
    {
        for(Account act:Trigger.old)
        {
            if(act.Test1__c>0 )
            {
                act.addError('This account cannot be deleted, because it is related to other records');
            }
        }    
    }    
}