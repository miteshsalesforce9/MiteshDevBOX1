@RestResource(urlMapping='/Demo/*')
Global Class DemoController{
     
     //GET Request
     @HttpGet
     Global static List<Demo__c> getrecords(){
         List<Demo__c> demoRecords = [Select Id, Name from Demo__c];
         return demoRecords;
     }
        
     //POST Request create the Demo record in the system
     @HttpPost
     Global static Demo__c createNewRecord(String Name){
         Demo__c demo =  new Demo__c();
         demo.Name = Name;
         insert demo;
         string returnMessage = 'YOu have succesfully created demo record in the salesforce - '+' Record Id is - ' +demo.id;
         return [select Id, Name, Owner.Name From Demo__c where Id=: demo.id];
     
     }
}