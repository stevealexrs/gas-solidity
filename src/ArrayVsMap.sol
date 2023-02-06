pragma solidity ^0.8.18;

/**
 * This contract compares the gas cost of storing and retrieve data from
 * an unordered list implemented using array with another using map, event
 * and maximum length. 
 */
contract ArrayVsMap {
    address[] public mods;
    mapping(address => bool) modExists;
    uint modCount;

    event ModDemoted(address mod);
    event ModPromoted(address mod);

    constructor(address[] memory _mods) {
        mods = _mods;
        for (uint i = 0; i < _mods.length; ++i) {
            modExists[_mods[i]] == true;
        }
        modCount = _mods.length;
    }

    // test adding to array storage
    function promoteWithArray(address _mod) public {
        mods.push(_mod);
        modExists[_mod] = true;
    }

    // test adding to map storage
    function promoteWithMap(address _mod) public {
        ++modCount;
        modExists[_mod] = true;
        emit ModPromoted(_mod);
    }

    // test removal from array storage using index
    function demoteWithArrayIndex(uint _modIndex) public {
        address[] storage modList = mods;
        address mod = modList[_modIndex];
        modExists[mod] = false;
        modList[_modIndex] = modList[modList.length-1];
    }

    // test removal from array storage using loop
     function demoteWithArrayLoop(address _mod) public {
        address[] storage modList = mods;
        for (uint i = 0; i < modList.length; ++i) {
            if (modList[i] == _mod) {
                modList[i] = modList[modList.length-1];
            }
        }
        modExists[_mod] = false;
    }

    // test removal from map storage
    function demoteWithMap(address _mod) public {
        --modCount;
        modExists[_mod] = false;
        emit ModDemoted(_mod);
    }
}