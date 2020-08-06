pragma solidity ^0.5.16;

/// Specific storage for the DaoMakeDecision contract
import "./Storage/DaoMakeDecision/Storage.sol";
import "./Storage/DaoMakeDecision/Events.sol";

/// Read contract from node_module 
//import './GnosisPmSystem.sol';
import "../node_modules/@gnosis.pm/conditional-tokens-contracts/contracts/ConditionalTokens.sol";


contract DaoMakeDecision is Storage, Events {
	address[] public organizationMembers;

    ConditionalTokens public conditionalTokens;

    constructor (address _conditionalTokens) public {
        conditionalTokens = ConditionalTokens(_conditionalTokens);
    }

    /***
     * @notice - Add organization members for joining oppotunities of making decision in DAO
     **/
    function addMemberToOrganization(address member, string memory memberName) public returns (bool) {
        organizationMembers.push(member);
        memberNames[member] = memberName;
    
        emit AddMemberToOrganization(member, memberName);
    }

    function _prepareCondition(address oracle, bytes32 questionId, uint outcomeSlotCount) public returns (bool) {
        conditionalTokens.prepareCondition(oracle, questionId, outcomeSlotCount);
    }

    function _reportPayouts(bytes32 questionId, uint[] memory payouts) public returns (bool) {
        conditionalTokens.reportPayouts(questionId, payouts);
    }
    
    
}
