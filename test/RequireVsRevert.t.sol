pragma solidity ^0.8.18;

import "forge-std/Test.sol";
import {RequireVsRevert} from "../src/RequireVsRevert.sol";

contract RequireVsRevertTest is Test {
    RequireVsRevert public rvr;

    function setUp() public {
        rvr = new RequireVsRevert();
    }

    function testRequire() public {
        rvr.requireSome();
    }

    function testRevert() public {
        rvr.revertSome();
    }
}