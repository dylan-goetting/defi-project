pragma solidity ^0.8.0;

contract Group {
    struct Member {
        bool isMember;
        bool isPending;
        uint voteCount;
    }

    mapping(address => Member) public members;
    mapping(address => mapping(address => bool)) public votes;
    address public owner;
    
    uint public memberCount = 0;

    constructor() {
        owner = msg.sender;
        members[owner] = Member(true, false, 0);
        memberCount++;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function.");
        _;
    }

    modifier onlyMembers() {
        require(members[msg.sender].isMember, "Only members can call this function.");
        _;
    }

    function addMember(address _newMember) public onlyOwner {
        require(!members[_newMember].isMember && !members[_newMember].isPending, "This address is already a member or pending member.");
        members[_newMember] = Member(false, true, 0);
    }

    function approveMember(address _newMember) public onlyMembers {
        require(members[_newMember].isPending, "This address is not a pending member.");
        require(!votes[_newMember][msg.sender], "You have already voted for this member.");

        votes[_newMember][msg.sender] = true;
        members[_newMember].voteCount++;

        if (members[_newMember].voteCount > memberCount / 2) {
            members[_newMember].isMember = true;
            members[_newMember].isPending = false;
            memberCount++;
        }
    }
}
