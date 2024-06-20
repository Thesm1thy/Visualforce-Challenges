public class SingleAccountController {
    // Variable to hold the account
    public Account account { get; set; }

    public SingleAccountController() {
        fetchAccount();
    }

    // Get account
    private void fetchAccount() {
        List<Account> accountId = [SELECT Id From Account WHERE Name = 'GenePoint'];
        account = [SELECT Id, Name, Industry, Phone, Website FROM Account WHERE Id = :accountId LIMIT 1];
    }
}
