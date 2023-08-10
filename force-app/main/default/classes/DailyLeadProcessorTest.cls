@isTest
public with sharing class DailyLeadProcessorTest {

    public static final String CRON_EXP = '0 0 0 15 3 ? 2042';

    @TestSetup
    static void setup(){
        Integer i;

        List<Lead> leads = new List<Lead>();

        for(i = 0; i < 200; i++){
            Lead lead = new Lead(LastName = 'test ' + i, Company = 'test');
            leads.add(lead);
        }

        insert leads;
    }

    @isTest
    public static void test(){
        Test.startTest();
        String jobId = System.schedule('Schedule test', CRON_EXP, new DailyLeadProcessor());
        System.assertEquals(200, [SELECT COUNT() FROM Lead WHERE LeadSource = ''], 'Tasks exist before job has run');
        Test.stopTest();
        System.assertEquals(200, [SELECT COUNT() FROM Lead WHERE LeadSource = 'Dreamforce'], 'Tasks exist before job has run');
    }
}