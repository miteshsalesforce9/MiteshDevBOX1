public class CommunicationActions{

    public static void calculateCommunicationRevenue(List<Communication__c> newCommunicationList, Map<Id,Communication__c> oldCommunicationMap, String insertorUpdate){
    
        for(Communication__c comm : newCommunicationList){
            if(insertorUpdate == 'insert'){
                if(comm.Communication_Type__c != ''){
                    calculateRevenueAmount(comm);
                }
            }
            
            if(insertorUpdate == 'update'){
                String oldCommunicationType = oldCommunicationMap.get(comm.id).Communication_Type__c;
                if(comm.Communication_Type__c  != '' && comm.Communication_Type__c != oldCommunicationType ){
                    calculateRevenueAmount(comm);
                }
            }
        }
    }
    
    public static void calculateRevenueAmount(Communication__c comm){
    
        if(comm.Communication_Type__c  == 'Daily'){
            comm.Communication_Revenue__c = 10*20;
        }
        
        else if(comm.Communication_Type__c  == 'Weekly'){
            comm.Communication_Revenue__c = 10*20*30;
        }
        
        else if(comm.Communication_Type__c  == 'Monthly'){
            comm.Communication_Revenue__c = 10*20/2;
        }
        
        else if(comm.Communication_Type__c  == 'Yearly'){
            comm.Communication_Revenue__c = 15*206464624/12;
        }
    }
    
    public static void createEnergyAudit(List<Communication__c> newCommunicationList,Map<Id,Communication__c> oldCommunicationMap, String insertorUpdate){
    
        if(insertorUpdate == 'insert'){
            try{
                List<Energy_Audit__c> createEnergy = new List<Energy_Audit__c>();
            
                for(Communication__c comm : newCommunicationList){
        
                    Energy_Audit__c energy = new Energy_Audit__c();
                    
                    if(comm.Communication_Type__c  == 'Weekly'){
                        energy.Name = 'Test Weekly';
                        energy.Communication__c = comm.id;
                        energy.Annual_Energy_Usage_kWh__c = 100;
                        energy.Audit_Notes__c = 'This is for weekly records';
                        energy.Type_of_Installation__c= 'Carport';
                        energy.Account__c = '0010b00002BJQjU';
                        energy.Average_Annual_Electric_Cost__c = 50;
                        createEnergy.add(energy);            
                    }
                    else{
                        energy.Name = 'Test Not Weekly';
                        energy.Communication__c = comm.id;
                        energy.Annual_Energy_Usage_kWh__c = 20;
                        energy.Audit_Notes__c = 'This is for not weekly records';
                        energy.Type_of_Installation__c= 'Rooftop';
                        energy.Account__c = '0010b00002BJQjU';
                        energy.Average_Annual_Electric_Cost__c = 500;
                        createEnergy.add(energy);
                    }
                }
        
                if(!createEnergy.isEmpty()){
                    insert createEnergy;
                }
            }catch(Exception e){
                System.debug('************* An exception occurred: ' + e.getMessage());
            }
        }
        
        if(insertorUpdate == 'update'){
            try{
                List<Energy_Audit__c> createEnergy = new List<Energy_Audit__c>();
            
                for(Communication__c comm : newCommunicationList){
                    
                    String oldCommunitcationType = oldCommunicationMap.get(comm.id).Communication_Type__c;
                    Energy_Audit__c energy = new Energy_Audit__c();
                    
                    if(comm.Communication_Type__c  == 'Weekly' && comm.Communication_Type__c  != oldCommunitcationType){
                        energy.Name = 'Test Weekly Update';
                        energy.Communication__c = comm.id;
                        energy.Annual_Energy_Usage_kWh__c = 100;
                        energy.Audit_Notes__c = 'This is for weekly records';
                        energy.Type_of_Installation__c= 'Carport';
                        energy.Account__c = '0010b00002BJQjU';
                        energy.Average_Annual_Electric_Cost__c = 50;
                        createEnergy.add(energy);            
                    }
                }
        
                if(!createEnergy.isEmpty()){
                    insert createEnergy;
                }
            }catch(Exception e){
                System.debug('************* An exception occurred: ' + e.getMessage());
            }
        }
    }
}