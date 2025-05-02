// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {TodoList} from "../src/TodoList";

contract TodoListScript is Script {
    Todolist public todoList;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        todoList = new Todolist();

        vm.stopBroadcast();
    }
}
