@isTest
public with sharing class LeadProcessorTest {
    @TestSetup
    static void setup(){
        List<Lead> leads = new List<Lead>();

        for(Integer i = 0; i < 200; i++){
            Lead l = new Lead(LastName = 'test ' + i, Company = 'test company');
            leads.add(l);
        }

        insert leads;
    }

    @isTest
    static void testClass(){
        
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();

        Id batchId = Database.executeBatch(lp);

        Test.stopTest();

        System.assertEquals(200, [SELECT COUNT() FROM Lead WHERE LeadSource = 'Dreamforce']);
    }
}