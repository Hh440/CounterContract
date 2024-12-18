// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/Counter.sol";

contract TestCounter is Test {
    Counter c;

    function setUp() public {
        c = new Counter(5);
    }

    function testInc() public{
        c.increment();
        c.increment();
        assertEq(c.getNum(), 7,"");
    }


    function testDec() public{
        c.decrement();
        c.decrement();
        assertEq(c.getNum(),3,"");
    }


    function testFailDec() public{
         c.decrement();
         c.decrement();
         c.decrement();
         c.decrement();
         c.decrement();
         c.decrement();

    }



  
}