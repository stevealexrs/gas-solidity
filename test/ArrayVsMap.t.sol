pragma solidity ^0.8.18;

import "forge-std/Test.sol";
import {ArrayVsMap} from "../src/ArrayVsMap.sol";

contract ArrayVsMapTest is Test {
    ArrayVsMap public avm;
    address[] mods;

    function setUp() public {
        mods.push(vm.addr(1));
        mods.push(vm.addr(2));
        mods.push(vm.addr(3));

        avm = new ArrayVsMap(mods);
    }

    function testArrayIndex() public {
        avm.promoteWithArray(vm.addr(4));
        avm.demoteWithArrayIndex(1);
    }

    function testArrayLoop() public {
        avm.promoteWithArray(vm.addr(4));
        avm.demoteWithArrayLoop(vm.addr(2));
    }

    function testMap() public {
        avm.promoteWithMap(vm.addr(4));
        avm.demoteWithMap(vm.addr(3));
    }
}