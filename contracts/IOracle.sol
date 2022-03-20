// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

interface IOracle {
     function updateReporter(address _reporter, bool _status) external;
     function updateData(bytes32 index, uint payload) external;
     function getData(bytes32 index) external view returns (bool result, uint date, uint payload);
}