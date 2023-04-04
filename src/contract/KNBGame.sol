// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
Smart-контракт для игры в "Камень-ножницы-бумага" сокращенно KNB
Состав игроков: Пользователь выбирающий из трех и PC с получением случайного числа от 0 до 2
*/

contract KNBGame {
    uint8 option;

    //1 TBNB = 10^9 gwei
    //1 TBNB = 10^18 wei

    //0.0001 TBNB = 100000000000
    constructor() payable {}
    event GameResult(address indexed player, uint256 playerOption, uint256 computerOption, uint256 result);

    function game(uint8 _option) public payable returns (string memory) {
        require(
            _option < 3,
            "You can choose only 0, 1 or 2? where 0 - rock, 1 - scissors, 2 - paper"
        );
        require(
            address(this).balance >= msg.value * 2,
            "Contract balance is not sufficient for the transaction"
        );

        option = _option; //камень - 0, ножницы - 1, бумага - 2

        //result = 0 или 1 или 2
        uint256 result = block.timestamp % 3;
        uint8 win = 0;
        if (_option == result) {
            win = 0;
        }
        if (_option == 0 && result == 1 || _option == 1 && result == 2 || _option == 2 && result == 0) {
            win = 1;
        }
        if (_option == 0 && result == 2 || _option == 1 && result == 0 || _option == 2 && result == 1) {
            win = 2;
        }

        if (win == 1) {
            emit GameResult(msg.sender, _option, result, win);
            return "You won!";
        }

        if (win == 2) {
            emit GameResult(msg.sender, _option, result, win);
            return "You lost!";
        }
        if (win == 0) {
            emit GameResult(msg.sender, _option, result, win);
            return "It's a tie!";
        }
        return "";
    }

    receive() external payable {}
}
