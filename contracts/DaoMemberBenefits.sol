pragma solidity ^0.5.16;

/// Specific storage for the DaoMakeDecision contract
import "./Storage/DaoMakeDecision/Storage.sol";
import "./Storage/DaoMakeDecision/Events.sol";

/// Read contract from node_module 
//import './GnosisPmSystem.sol';
import "../node_modules/@gnosis.pm/conditional-tokens-contracts/contracts/ConditionalTokens.sol";


/***
 * @notice - This contract provide the member benefits
 *         - i.e). Provide the insurance for members by using conditional token (ERC1155)
 **/
contract DaoMemberBenefits is Storage, Events {
    ConditionalTokens public conditionalTokens;

    constructor (address _conditionalTokens) public {
        conditionalTokens = ConditionalTokens(_conditionalTokens);
    }


    /***
     * @notice - Provide the insurance for members by using conditional token (ERC1155)
     **/
    function insuranceForMembers() returns(bool res) internal {
        
    }
    




    /***
     * @notice - Add organization members for joining oppotunities of making decision in DAO
     **/
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

    function _splitPosition(
        IERC20 collateralToken,
        bytes32 parentCollectionId,
        bytes32 conditionId,
        uint[] memory partition,
        uint amount
    ) public returns (bool) {
        conditionalTokens.splitPosition(collateralToken, parentCollectionId, conditionId, partition, amount);
    }
    
    function _mergePositions(
        IERC20 collateralToken,
        bytes32 parentCollectionId,
        bytes32 conditionId,
        uint[] memory partition,
        uint amount
    ) public returns (bool) {
        conditionalTokens.mergePositions(collateralToken, parentCollectionId, conditionId, partition, amount);
    }

    function _redeemPositions(
        IERC20 collateralToken, 
        bytes32 parentCollectionId, 
        bytes32 conditionId, 
        uint[] memory indexSets
    ) public returns (bool) {
        conditionalTokens.redeemPositions(collateralToken, parentCollectionId, conditionId, indexSets);
    }

    function _reportPayouts(address member, string memory memberName, bytes32 questionId, uint[] memory payouts) public returns (bool) {
        conditionalTokens.reportPayouts(questionId, payouts);
    }
    
    
}
