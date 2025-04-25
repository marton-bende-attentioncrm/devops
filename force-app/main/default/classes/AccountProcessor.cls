public with sharing class AccountProcessor {
    
    @future
    public static void countContacts(List<Id> accountIdList){


        System.debug('warning generated here');
        //Get every contact record
        List<Contact> contactList = [SELECT Id, AccountId FROM Contact WHERE AccountId IN :accountIdList];

        List<Account> updateList = new List<Account>();

        for(Account acc : [SELECT Id FROM Account WHERE Id IN :accountIdList]){
            Integer temp = 0;
            for(Contact c : contactList){
                if(c.AccountId == acc.Id){
                    temp += 1;
                }
            }
            acc.Number_Of_Contacts__c = temp;
            updateList.add(acc);
        }
        
        update updateList;

    }
}