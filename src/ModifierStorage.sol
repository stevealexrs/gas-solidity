pragma solidity ^0.8.18;

/**
 * This contract compares the gas cost of modifier accessing storage
 * with using requires in same function.
 */
contract ModifierStorage {
    struct Example {
        uint some;
        bool isExpired;
    }
    Example[] public examples;

    modifier onlyActive(uint _id) {
        require(!examples[_id].isExpired);
        _;
    }

    function updateWithModifier(uint _id, uint _value) public onlyActive(_id) {
        Example storage example = examples[_id];
        example.some = _value;
    }

    function updateWithRequire(uint _id, uint _value) public {
        Example storage example = examples[_id];
        require(!examples[_id].isExpired);
        example.some = _value;
    }

    function createExample(uint _value) public {
        Example storage example = examples.push();
        example.some = _value;
    }
}