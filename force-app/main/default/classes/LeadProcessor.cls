public class LeadProcessor implements Database.Batchable<SObject> {

    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator(
            'SELECT ID, LeadSource FROM Lead'
        );
    }

    public void execute(Database.BatchableContext bc, List<Lead> scope){

        List<Lead> leads = new List<Lead>();

        for(Lead record : scope){
            record.LeadSource = 'Dreamforce';
            leads.add(record);
        }

        update leads;
    }

    public void finish(Database.BatchableContext bc){
        
    }
}