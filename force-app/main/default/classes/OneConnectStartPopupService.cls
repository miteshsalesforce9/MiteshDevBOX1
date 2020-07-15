public class OneConnectStartPopupService {
    @AuraEnabled
    public static boolean showStartupPopup() {
        boolean isCheck = false;
        isCheck= [SELECT Id, ContactId,OneconnectRegisteredUser__c FROM User WHERE Id =: UserInfo.getUserId()].OneconnectRegisteredUser__c;        
        return !isCheck;
    }
    
    @AuraEnabled
    public static void updateContact() {
        User userObj = [SELECT Id, ContactId,OneconnectRegisteredUser__c FROM User WHERE Id =: UserInfo.getUserId()];
        userObj.OneconnectRegisteredUser__c = true;
        UPDATE userObj;
    }
}