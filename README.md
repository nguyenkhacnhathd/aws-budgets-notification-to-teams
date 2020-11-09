# aws-budgets-notification-to-teams
Send messages to Teams if your account costs exceed budget thresholds

# Deploy to production
./deploy.sh BudgetAmount=... BudgetThreshold=... ThresholdBudgetUrl=... AcountName=...
- BudgetAmount : default value = $100
- BudgetThreshold : default value = 80%
- ThresholdBudgetUrl : web hook url of teams
- AcountName : account name