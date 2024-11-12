// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// this is my first smart contract
contract HelloWord {

    string str = "Hello Word";

    struct Info {
        string phrase;
        uint256 id;
        address addr;
    }

    Info[] infos;

    mapping (uint256 id => Info info) infoMapping;

    function sayHello(uint _id) public view returns(string memory) {
        // for (uint256 i = 0; i < infos.length; i++) {
        //     if (infos[i].id == _id) {
        //         return addInfo(infos[i].phrase);
        //     }
        // }
        if (infoMapping[_id].addr != address(0x0)) {
            return infoMapping[_id].phrase;
        }
        return addInfo(str);
    }

    function setHelloWord(string memory newString, uint256 _id) public {
        Info memory info = Info(newString, _id, msg.sender);
        infos.push(info);
        infoMapping[_id] = info;
    }

    function addInfo(string memory helloWordsString) internal pure  returns(string memory) {
        return string.concat(helloWordsString, " from toppo");
    }
}