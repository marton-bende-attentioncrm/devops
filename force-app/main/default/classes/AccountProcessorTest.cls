@isTest
public with sharing class AccountProcessorTest {
    
    @isTest
    public static void testClass(){
        System.debug('random debug');
        Test.startTest();
        Account acc = new Account(Name = 'Test acc');
        insert acc;
        Contact c = new Contact(LastName = 'Test contact', AccountId = acc.Id);
        insert c;

        AccountProcessor.countContacts(new List<Id>{acc.Id});
        Test.stopTest();

        System.assertEquals(1, [SELECT Id, Number_Of_Contacts__c FROM Account WHERE Id = :acc.Id LIMIT 1].Number_Of_Contacts__c, 'number check');
    }
}