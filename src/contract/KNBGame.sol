// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
Smart-контракт для игры в "Камень-ножницы-бумага" сокращенно KNB
Состав игроков: Пользователь выбирающий из трех и PC с получением случайного числа от 0 до 3
*/

contract KNBGame {
    uint8 option;

    //1 TBNB = 10^9 gwei
    //1 TBNB = 10^18 wei

    //0.0001 TBNB = 100000000000
    constructor() payable {}

    function game(uint8 _option) public payable returns (string memory) {
        require(
            _option < 3,
            "You can choose only 0, 1 or 2? where 0  - rock, 2 - Paper, 1 - scissors"
        );
        require(
            address(this).balance >= msg.value * 2,
            "Address do not have sufficient balance"
        );
        //require

        option = _option; //камень- 0 бумага  - 2 ножницы - 1

        //result = 0 или 1 или 2
        uint256 result = block.timestamp % 3;
        uint8 win = 0;
        if (_option == result) {
            win = 0;
        }
        if (_option == 0 && result == 1) {
            win = 1;
        }
        if (_option == 0 && result == 2) {
            win = 2;
        }
        if (_option == 1 && result == 0) {
            win = 2;
        }
        if (_option == 1 && result == 2) {
            win = 1;
        }
        if (_option == 2 && result == 0) {
            win = 1;
        }
        if (_option == 2 && result == 1) {
            win = 2;
        }

        if (win == 1) {
            payable(msg.sender).transfer(msg.value * 2);
            return "You won!";
        }

        if (win == 2) {
            payable(msg.sender).transfer(msg.value * 1);
            return "You lost!";
        }
        if (win == 0) {
            payable(msg.sender).transfer(msg.value * 1);
            return "It's a tie!";
        }ы
        return "";
    }

    receive() external payable {}
}
