pragma solidity ^0.5.16;

/// Specific storage for the DaoMakeDecision contract
import "./Storage/DaoMakeDecision/Storage.sol";
import "./Storage/DaoMakeDecision/Events.sol";

import './GnosisPmSystem.sol';


contract DaoMakeDecision is Storage, Events {
	address[] public organizationMembers;

    /***
     * @notice - Add organization members for joining oppotunities of making decision in DAO
     **/
    function addMemberToOrganization(address member, string memory memberName) public returns (bool) {
        organizationMembers.push(member);
        memberNames[member] = memberName;
    
        emit AddMemberToOrganization(member, memberName);
    }
    
}
