public class SingleAccountController {
    // Variable to hold the account
    public Account account { get; set; }
    public String aboutMe { get; set; }
    
    // Constructor
    public SingleAccountController() {
        fetchAccount();
        setAboutMe();
    }

    // Method to fetch the account
    private void fetchAccount() {
        List<Account> accountId = [SELECT Id From Account WHERE Name = 'GenePoint'];
        account = [SELECT Id, Name, Industry, Phone, Website FROM Account WHERE Id = :accountId LIMIT 1];
    }
    
    // Method to set about me
    private void setAboutMe() {
        String userLanguage = UserInfo.getLocale();
        if (userLanguage == 'es') {
            aboutMe = 'Acerca de mí: Soy Jason Smith, un desarrollador de Salesforce con experiencia en el uso de Apex, Visualforce y Lightning Web Components.';
        } else {
            aboutMe = 'About Me: I am Jason Smith a Salesforce developer with experience using Apex, Visualforce, and Lightning Web Components.';
        }
    }
    
}
