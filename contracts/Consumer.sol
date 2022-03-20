// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import './IOracle.sol';

contract Consumer {

    IOracle public oracle;

    constructor(address _oracle) {
        oracle = IOracle(_oracle);
    }

}