// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/Coin.sol";

contract TestCoin is Test {
    Coin c;

    function setUp() public {
        c = new Coin();
    }


    function testMint() public{
        c.mint(address(this), 100);
        assertEq(c.balanceOf(address(this)), 100,"ok");
       assertEq(c.balanceOf(0x82Eb1ae21D52821EEb195F2c2c0D40e66b33c97D), 0,"ok");

    }


    function testTransfer() public{
          c.mint(address(this), 100);
          c.transfer(0x82Eb1ae21D52821EEb195F2c2c0D40e66b33c97D,50);

          assertEq(c.balanceOf(address(this)), 50);
          assertEq(c.balanceOf(0x82Eb1ae21D52821EEb195F2c2c0D40e66b33c97D),50);

          vm.prank(0x82Eb1ae21D52821EEb195F2c2c0D40e66b33c97D);
          c.transfer(address(this),50);

          assertEq(c.balanceOf(address(this)), 100);
          assertEq(c.balanceOf(0x82Eb1ae21D52821EEb195F2c2c0D40e66b33c97D),0);

        
    }


    function testApproval() public{
        c.mint(address(this), 100);
        c.approve(0x82Eb1ae21D52821EEb195F2c2c0D40e66b33c97D,10);

        assertEq(c.allowance(address(this),0x82Eb1ae21D52821EEb195F2c2c0D40e66b33c97D), 10,"ok");

        vm.prank(0x82Eb1ae21D52821EEb195F2c2c0D40e66b33c97D);

        c.transferFrom(address(this),0x82Eb1ae21D52821EEb195F2c2c0D40e66b33c97D,5);

        assertEq(c.balanceOf(address(this)),95,"ok");

        assertEq(c.balanceOf(0x82Eb1ae21D52821EEb195F2c2c0D40e66b33c97D), 5,"ok");

        assertEq(c.allowance(address(this),0x82Eb1ae21D52821EEb195F2c2c0D40e66b33c97D), 5,"ok");


    }





  
}
