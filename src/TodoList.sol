// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Todolist {
    enum Status {
        Pending,
        InProgress,
        Completed
    }

    struct Todo {
        uint256 id;
        string content;
        Status status;
    }

    event TodoAdded(uint256 _id, string _content);

    mapping(uint256 => Todo) public todos;
    uint256[] public todoIds;

    function addTodos(string memory _content) public {
        uint256 newId = todoIds.length;
        todos[newId] = Todo(newId, _content, Status.Pending);
        todoIds.push(newId);
        emit TodoAdded(newId, _content);
    }

    function updateStatus(uint256 _id, Status _status) public {
        require(_id < todoIds.length, "Todo does not exist");
        todos[_id].status = _status;
    }

    function getTodo(uint256 _id) public view returns (Todo memory) {
        require(_id < todoIds.length, "Todo does not exist");
        return todos[_id];
    }
}
