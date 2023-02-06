pragma solidity ^0.8.18;

import "forge-std/Test.sol";
import {ModifierStorage} from "../src/ModifierStorage.sol";

contract ModifierStorageTest is Test {
    ModifierStorage public ms;

    function setUp() public {
        ms = new ModifierStorage();
        ms.createExample(10);
        ms.createExample(20);
        ms.createExample(30);
    }

    function testModifier() public {
        ms.updateWithModifier(1, 50);
    }

    function testRequire() public {
        ms.updateWithRequire(1, 50);
    }
}