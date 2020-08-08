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
        memberAddresses[memberName] = member;
    
        emit AddMemberToOrganization(member, memberName);
    }

    modifier onlyMember(address member, string memory memberName) { 
        require (memberAddresses[memberName] == member, "Has not been added as a organization's member yet"); 
        _; 
    }
    

    /***
     * @notice - Organization's member create a condition
     *         - There are created test conditions in ./markets.config.js
     **/
    function _prepareCondition(address member, string memory memberName, address oracle, bytes32 questionId, uint outcomeSlotCount) public onlyMember(member, memberName) returns (bool) {
        conditionalTokens.prepareCondition(oracle, questionId, outcomeSlotCount);
    }

    function _reportPayouts(address member, string memory memberName, bytes32 questionId, uint[] memory payouts) public onlyMember(member, memberName) returns (bool) {
        conditionalTokens.reportPayouts(questionId, payouts);
    }
    
    
}
