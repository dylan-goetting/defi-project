# defi-project

## Flow of Normal Logic Example

In this scenario, Josh, Dylan, and Joey are part of a lending group. The following steps demonstrate how a new member, Cyril, is invited, a loan is requested and funded, and the repayment and withdrawal processes occur.

### Step 1: Josh Proposes a New Invite for an ETH Address
- **Josh**: `proposeInvite(0x123456789ABCDEF...);`

### Step 2: Dylan and Josh Vote "Yes," Joey Votes "No"
- **Josh**: `voteOnPendingPerson(0x123456789ABCDEF..., true);`
- **Dylan**: `voteOnPendingPerson(0x123456789ABCDEF..., true);`
- **Joey**: `voteOnPendingPerson(0x123456789ABCDEF..., false);`

### Step 3: Cyril is Admitted to the Network By Majority
- **Cyril**: `join("Cyril");`

### Step 4: Josh & Dylan Each Transfer $800 into the Pool
- **Josh**: `depositFunds({value: 800 ether});`
- **Dylan**: `depositFunds({value: 800 ether});`

### Step 5: Cyril Requests a Loan for $1000 for Investing in BananaCoin
- **Cyril**: `requestLoan(1000, now + 1 week, "Invest in BananaCoin");`

### Step 6: Dylan Contributes $800 and Josh Contributes $200 to Fill the Loan Request
- **Dylan**: `fillLoanRequest(loanId, 800);`
- **Josh**: `fillLoanRequest(loanId, 200);`

### Step 7: Cyril Repays the Loan 1 Week Later
- **Cyril**: `repayLoan(loanId, 1100);`

### Step 8: Josh Withdraws All His Money from the Pool
- **Josh**: `withdrawFunds({value: hisTotalBalance});`




##Flow of Logic Example

##Back End Archetecture

###Core Structs

    struct Member {
        string username; 
        uint256 friendScore;
        uint256 balance;
    }

    Member stuct stores all relevant information to users in the member pool