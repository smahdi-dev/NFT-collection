// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";

contract DeployMoodNftTest is Test {
    DeployMoodNft public deployer;

    function setUp() public {
        deployer = new DeployMoodNft();
    }

    function testConvertSvgToUri() public view {
        string
            memory expectedUri = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCIgd2lkdGg9IjEwMCIgaGVpZ2h0PSIxMDAiPjxjaXJjbGUgY3g9IjEyIiBjeT0iMTIiIHI9IjEwIiBmaWxsPSIjRkZERDY3Ii8+PGNpcmNsZSBjeD0iOCIgY3k9IjEwIiByPSIxLjUiIGZpbGw9IiM2NjQ1MDAiLz48Y2lyY2xlIGN4PSIxNiIgY3k9IjEwIiByPSIxLjUiIGZpbGw9IiM2NjQ1MDAiLz48cGF0aCBkPSJNOCAxNSBRIDEyIDE4LCAxNiAxNSIgZmlsbD0ibm9uZSIgc3Ryb2tlPSIjNjY0NTAwIiBzdHJva2Utd2lkdGg9IjEuNSIvPjwvc3ZnPg==";
        string
            memory svg = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="100" height="100"><circle cx="12" cy="12" r="10" fill="#FFDD67"/><circle cx="8" cy="10" r="1.5" fill="#664500"/><circle cx="16" cy="10" r="1.5" fill="#664500"/><path d="M8 15 Q 12 18, 16 15" fill="none" stroke="#664500" stroke-width="1.5"/></svg>';
        string memory actualUri = deployer.svgToImageURI(svg);
        assert(
            keccak256(abi.encodePacked(actualUri)) ==
                keccak256(abi.encodePacked(expectedUri))
        );
    }
}
