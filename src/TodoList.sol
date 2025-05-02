// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Todolist {
    enum Status {
        Pending,
        InProgress,
        Completed
    }

    struct Todo {
        uint id;
        string content;
        Status status;
    }

    event TodoAdded(uint _id, string _content);

    mapping(uint => Todo) public todos;
    uint[] public todoIds;

    function addTodos(string memory _content) public {
        uint newId = todoIds.length;
        todos[newId] = Todo(newId, _content, Status.Pending);
        todoIds.push(newId);
        emit TodoAdded(newId, _content);
    }

    function updateStatus(uint _id, Status _status) public {
        require(_id < todoIds.length, "Todo does not exist");
        todos[_id].status = _status;
    }

    function getTodo(uint _id) public view returns (Todo memory) {
        require(_id < todoIds.length, "Todo does not exist");
        return todos[_id];
    }
}
