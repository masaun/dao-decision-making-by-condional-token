pragma solidity ^0.5.1;

import "./Storage/DaoMakeDecision/Objects.sol";
import './GnosisPmSystem.sol';


contract DaoMakeDecision {
	address[] public organizationMembers;
    mapping(address => string) public memberNames;

    /***
     * @notice - Add make decision as DAO
     **/
    function AddMemberToOrganization(address member, string memberName) public returns (bool) {
        organizationMembers.push(member);
        memberNames[member] = memberName;
    }
    
}
