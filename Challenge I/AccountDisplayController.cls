public class AccountDisplayController {
    //for holding account record
    public Account acc { get; private set; }
    
    public AccountDisplayController() {
        Id accId = ApexPages.currentPage().getParameters().get('id');
        
        if (accId != null) {
            //query for the account record
            acc = [SELECT Id, Name, Industry, Phone, Website, Rating FROM Account WHERE Id = :accId];
        }
        else {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Account Id was not specified.'));
        }
    }

}
