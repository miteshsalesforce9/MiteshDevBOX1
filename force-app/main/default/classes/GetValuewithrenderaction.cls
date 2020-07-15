Public class GetValuewithrenderaction{



        List<Account> acc;
        //String input_value;
        
        public List<Account> getacts(){
            return acc;
        }
        
        public PageReference channel(){
            acc = [SELECT Name, Type FROM Account where Type = 'Customer - Channel'];
            return null;
        }
        
        public PageReference direct(){
            acc = [SELECT Name, Type FROM Account where Type = 'Customer - Direct'];
            return null;
        }
       
}