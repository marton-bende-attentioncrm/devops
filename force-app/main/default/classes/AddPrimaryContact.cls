public with sharing class AddPrimaryContact implements Queueable {

    Contact contactRecord;
    String state;

    public AddPrimaryContact(Contact record, String state) {
        this.contactRecord = record;
        this.state = state;
    }

    public void execute(QueueableContext context){

        List<Contact> contacts = new List<Contact>();

        for(Account account : [SELECT Id, BillingState FROM Account WHERE BillingState = :this.state]){
            Contact contact = this.contactRecord.clone();

            contact.AccountId = account.Id;
            contacts.add(contact);
        }

        insert contacts;
    }
}