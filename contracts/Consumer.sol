// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import './IOracle.sol';

contract Consumer {

    IOracle public oracle;

    constructor(address _oracle) {
        oracle = IOracle(_oracle);
    }

    //Function that requires Oracle

    function priceReturn() external view {
        bytes32 index = keccak256(abi.encodePacked('BTC/USD'));
        (bool result, uint timestamp, uint data) = oracle.getData(index);
        require(result == true, "No result found for specified key");
        require(timestamp >= block.timestamp - 3, "Data is no longer current");
    }
   
}