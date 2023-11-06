pragma solidity ^0.8.0;

contract FriendLend {

    struct Member {
        string username;
        uint256 friendScore;
        uint256 balance;
    }

    struct LoanRequest {
        address borrower;
        uint256 amount;
        uint256 filled;
        uint256 dueDate;
        bool isFulfilled;
    }
    address public owner;
    mapping(address => Member) public members;
    address[] public memberAddresses;
    LoanRequest[] public loanRequests;
    mapping(address => address[]) public pendingInvites;
    mapping(address => mapping(address => bool)) public votes;

    // Events
    event NewMember(address indexed member, string username);
    event LoanRequested(address indexed borrower, uint256 amount, uint256 dueDate);
    event LoanFulfilled(uint256 indexed loanId, address indexed lender, uint256 amount);
    event InviteProposed(address indexed proposer, address indexed invitee);
    event Voted(address indexed voter, address indexed candidate, bool vote);

    // Modifier to check if the caller is a member
    modifier onlyMember() {
        require(bytes(members[msg.sender].username).length > 0, "Not a member");
        _;
    }

