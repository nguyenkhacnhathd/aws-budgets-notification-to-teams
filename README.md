# aws-budgets-notification-to-teams
Send messages to Teams if your account costs exceed budget thresholds

# Deploy to production
./deploy.sh BudgetAmount=... BudgetThreshold=... ThresholdBudgetUrl=... AcountName=...
- BudgetAmount : default value = $100
- BudgetThreshold : default value = 80%
- ThresholdBudgetUrl : web hook url of teams
- AcountName : account name
# Example 
1. Run command : ./deploy.sh BudgetAmount=1 BudgetThreshold=80 ThresholdBudgetUrl=https://teams.microsoft.com/... AcountName=NhatNK
2. Message of Teams:
![Alt text](https://github.com/nguyenkhacnhathd/aws-budgets-notification-to-teams/blob/main/aws-budget-notification-to-teams.png?raw=true)
