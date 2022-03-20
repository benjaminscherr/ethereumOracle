// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Oracle {

    struct Data {
        uint date;
        uint payload;
    }

    address public admin;
    mapping (address => bool) reporters;
    mapping (bytes32 => Data) public data;

    constructor (address _admin) {
        admin = _admin;
    }

    function updateReporter(address _reporter, bool _status) external {
        require(msg.sender == admin, 'You must be the admin');
        reporters[_reporter] = _status;
    }

    function updateData(bytes32 index, uint payload) external {
        require(reporters[msg.sender] == true, 'Only registered reporters can submit data');
        data[index] = Data(block.timestamp, payload);
    }

    function getData(bytes32 index) external view returns (bool result, uint date, uint payload) {
        if (data[index].payload == 0) {
            return (false, 0, 0);
        } else {
            return (true, data[index].date, data[index].payload);
        }
    }
}