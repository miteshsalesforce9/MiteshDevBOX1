public class AccountCaseDetailsController {

    @auraEnabled
    public static list<account> accountCase(String accid){
    
        system.debug('Current Record ID is coming from Lightning Component '+accid);

        List<Account> accs = [Select Name, Phone, Industry, AnnualRevenue, (SELECT CaseNumber, Subject, Status, Priority FROM Cases)FROM Account WHERE Id =: accid];
        return accs;
    }
}