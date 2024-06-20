public class PaginatedAccountsController {
    public Integer pageSize { get; set; }
    public Integer pageNumber { get; set; }
    public Integer totalPages { get; set; }
    // List to hold the accounts
    public List<Account> accounts { get; set; }
    
    public PaginatedAccountsController() {
        pageSize = 10;
        pageNumber = 1;
        accounts = new List<Account>();
        fetchAccounts();
    }

    // Get accounts for current page
    public void fetchAccounts() {
        Integer offset = (pageNumber - 1) * pageSize;
        accounts = [SELECT Id, Name, Industry, Phone FROM Account LIMIT :pageSize OFFSET :offset];
        Integer totalRecords = [SELECT count() FROM Account];
        totalPages = (totalRecords + pageSize - 1) / pageSize;
    }

    // Next page
    public void nextPage() {
        if (pageNumber < totalPages) {
            pageNumber++;
            fetchAccounts();
        }
    }

    // Previous page
    public void previousPage() {
        if (pageNumber > 1) {
            pageNumber--;
            fetchAccounts();
        }
    }
}
