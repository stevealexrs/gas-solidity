pragma solidity ^0.8.18;

error RevertWithError();

contract RequireVsRevert {
    uint test;

    function requireSome() public {
        require(true, "RevertWithError");
        test = 100;
        require(true, "RevertWithError");
    }

    function revertSome() public {
        if (false) revert RevertWithError();
        test = 100;
        if (false) revert RevertWithError();
    }
}