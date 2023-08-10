@isTest
public with sharing class AddPrimaryContactTest {
    
    @TestSetup
    static void makeData(){

        List<Account> accounts = new List<Account>();

        Integer i;
        for(i = 0; i < 50; i++){
            Account acc = new Account(Name = 'test ' + i, BillingState = 'NY');
            accounts.add(acc);
        }

        for(i = 0; i < 50; i++){
            Account acc = new Account(Name = 'test ' + i, BillingState = 'CA');
            accounts.add(acc);
        }

        insert accounts;
        
    }

    @isTest
    public static void test(){
        Contact contact = new Contact(LastName = 'test contact record');
        insert contact;
        AddPrimaryContact apc = new AddPrimaryContact(contact, 'CA');

        Test.startTest();
        System.enqueueJob(apc);
        Test.stopTest();

        System.assertEquals(50, [SELECT COUNT() FROM Contact WHERE Account.BillingState = 'CA'], 'Count the contacts inserted by quable class');
        
    }
}