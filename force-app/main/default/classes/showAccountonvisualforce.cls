Public class showAccountonvisualforce{

    List<Account> acc;
    
    Public List<Account> getAcc(){
        acc = [Select Name, Type from Account];
        return Acc;
    }
}