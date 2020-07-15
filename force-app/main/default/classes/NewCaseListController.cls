public class NewCaseListController {

    public String getCs() {
        return null;
    }


    
    public List <Case> getNewCases(){
    List<Case> q = [Select Id, caseNumber FROM Case Where Status = 'New'];
        return q; 
        }
 }