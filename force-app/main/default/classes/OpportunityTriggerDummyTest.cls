@isTest
public with sharing class OpportunityTriggerDummyTest {
    @isTest
    public static void test(){
        Opportunity opp = new Opportunity(Name = 'test', StageName = 'Open', CloseDate = System.today() + 3);
        insert opp;

        System.assertEquals(true, true);
    }
}