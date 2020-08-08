pragma solidity ^0.5.16;

import "./Objects.sol";

contract Storage is Objects {

    mapping(address => string) public memberNames;
    mapping(string => address) public memberAddresses;

}
