@IsTest
Public class TestLead{
Public static testmethod void testLeadTrigger() {
 
    // Insert a valid answer
    Lead l = new Lead();
    l.Rating = 'Hot';
    l.LastName = 'lastname';
    l.Company = 'company';
    insert l;
        
    // Is the answer still the same, surely nobody could have changed it right?
    System.assertEquals('Hot',[select Rating From Lead where Id = :l.Id][0].Rating);
   }
}