public with sharing class DailyLeadProcessor implements Schedulable {
    
    public void execute(SchedulableContext ctx){
        List<Lead> leads = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = '' LIMIT 200];
        List<Lead> updateLeads = new List<Lead>();


        for(Lead lead : leads){
            lead.LeadSource = 'Dreamforce';
            updateLeads.add(lead);
        }

        update updateleads;
    }
}