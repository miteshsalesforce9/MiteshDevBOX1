Public With Sharing class CaseTriggerHandler{

set<Id> caseIds = new set<Id>();

    public void OnBeforeInsert(List<Case> cases){
    
        for(Case c : cases){
    
            if(c.origin == 'Phone'){
                c.subject = c.Origin + '  ' + ':' + '  ' + UserInfo.getName();
            }
    
        }
    
    }
    
    Public void OnAfterInsert(List<Case> newCases){
        List<Demo__c> listDemo = new List<Demo__c>();
        List<CaseShare> listCaseShare = new List<CaseShare>();
        
        for(case c : newCases){
            Demo__c demo = new Demo__c();
            
            
            if(c.Handler__c != null){
            caseshare cs = new caseshare(
                CaseId = c.Id,
                UserOrGroupId = c.Handler__c,
                CaseAccessLevel = 'Edit',
                RowCause = Schema.CaseShare.RowCause.Manual
            );
            listCaseShare.add(cs);
            system.debug('*******cSHARE' + cs);
            }
            
            if (c.Type == 'Refund') {
                demo.Name = c.subject;
                demo.Case__c = c.Id;
                demo.Email__c = 'mitesh@mitesh.com';
                listDemo.add(demo);
                System.debug('Get demo......'+listDemo.size());
            }
            if(listDemo.size()>0) insert listDemo;
            if(listCaseShare.size()>0) insert listCaseShare;
       }

       
    }
    
    Public void OnAfterUpdate(List<Case> newCase, Map<Id, Case> oldMap){
    
    List < Case > cListTask = new List < Case > ();
    Id CaseRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Product Support').getRecordTypeId();
    
        for(Case c : newCase){
        Case oldCase = oldMap.get(c.Id);
        
            if(c.Priority== 'High' && c.Status != oldCase.Status){
               cListTask.add(c);
               System.debug('Get the Task List of case' +cListTask.size());
            }
        }
        if (cListTask.size() > 0) createTask(cListTask);
    }
    
    
    public void createTask(List < Case > caseTaskList) {
        List < Task > tList = new List < Task > ();
        system.debug('****Number of Task****' + caseTaskList.size());
        for (Case cTask: caseTaskList) {
            Task t = new Task();
            if (cTask.Type == 'Refund') {
                t.Subject = 'Communicate Case Solution';
                //t.Type_Task__c = 'Customer Service Tasks';
                t.Status = 'In Progress';
                t.ActivityDate = Date.today() + 3;
                t.WhatId = cTask.ID;
                //t.OwnerId = cTask.Communicator__c;
                tList.add(t);
                system.debug('*********Task' + t);

            }
            
        }
        if (tList.size() > 0) insert tList;
    }
    
}