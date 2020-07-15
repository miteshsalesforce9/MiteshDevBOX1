public class calculatorController {

   
    public String SNumber { get; set; }
    public String FNumber { get; set; }
    public String result;
    public List<Calculator__c> calListTable;
    
    public PageReference add() {
        
        result = String.ValueOf(Integer.valueOf(FNumber) + Integer.valueOf(SNumber));
        Operation('+');
        return null;
    }


    public PageReference sub() {
    
        result = String.ValueOf(Integer.valueOf(FNumber) - Integer.valueOf(SNumber));
        Operation('-');
        return null;
    }


    public PageReference mul() {
    
        result = String.ValueOf(Integer.valueOf(FNumber) * Integer.valueOf(SNumber));
        Operation('*');
        return null;
    }


    public PageReference div() {
    
        result = String.ValueOf(Integer.valueOf(FNumber) / Integer.valueOf(SNumber));
        Operation('/');
        return null;
    }


    public PageReference reset() {
        
        FNumber = null;
        SNumber  = null;
        result = null;
        return null;
    }
    
    
    public String getResult() {
        return result;
    }
    
    
    public void Operation(String operator){
    
        Calculator__c cal = new Calculator__c();
        
        cal.First_Number__c = Integer.valueOf(FNumber);
        cal.Second_Number__c = Integer.valueOf(SNumber);
        cal.Result__c = Integer.valueOf(result);
        cal.Operation__c = operator;
        
        insert cal;
    }
    
    public List<Calculator__c> getCalcList() {

        calListTable = [SELECT Id, Name, First_Number__c, Second_Number__c, Operation__c, Result__c, CreatedDate FROM Calculator__c ORDER BY CreatedDate DESC];
        return calListTable;
    }



}