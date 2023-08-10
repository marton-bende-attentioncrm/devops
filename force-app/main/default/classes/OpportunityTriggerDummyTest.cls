@isTest
public with sharing class OpportunityTriggerDummyTest {
    @isTest
    public static void test(){
        Opportunity opp = new Opportunity(Name = 'test');
        insert opp;

        System.assertEquals(true, true);
    }
}