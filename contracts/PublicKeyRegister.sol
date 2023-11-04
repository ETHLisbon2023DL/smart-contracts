// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract PublicKeyRegister {
    // The address of the OMS wallet
    address public OMS;

    struct KeyInfo {
        string nation;
        string city;
        string hospital;
    }

    KeyInfo[] public allKeys;

    // Mapping structure: nation -> city -> hospital -> public key
    mapping(string nation => mapping(string city => mapping(string hospital => address pk)))
        public keys;

    constructor() {
        // Set the deployer as the OMS
        OMS = msg.sender;
    }

    modifier onlyOMS() {
        require(
            msg.sender == OMS,
            "Only the OMS wallet can perform this operation"
        );
        _;
    }

    function insertKey(
        string memory nation,
        string memory city,
        string memory hospital,
        address publicKey
    ) public onlyOMS {
        keys[nation][city][hospital] = publicKey;
        allKeys.push(KeyInfo(nation, city, hospital));
    }

    function removeKey(
        string memory nation,
        string memory city,
        string memory hospital
    ) public onlyOMS {
        delete keys[nation][city][hospital];

        // Find and remove the key from allKeys
        for (uint i = 0; i < allKeys.length; i++) {
            if (
                keccak256(abi.encodePacked(allKeys[i].nation)) ==
                keccak256(abi.encodePacked(nation)) &&
                keccak256(abi.encodePacked(allKeys[i].city)) ==
                keccak256(abi.encodePacked(city)) &&
                keccak256(abi.encodePacked(allKeys[i].hospital)) ==
                keccak256(abi.encodePacked(hospital))
            ) {
                allKeys[i] = allKeys[allKeys.length - 1];
                allKeys.pop();
                break;
            }
        }
    }

    function checkIfAddressIsValid(
        address publicKey
    ) public view returns (bool) {
        for (uint i = 0; i < allKeys.length; i++) {
            if (
                keys[allKeys[i].nation][allKeys[i].city][allKeys[i].hospital] ==
                publicKey
            ) {
                return true;
            }
        }
        return false;
    }

    function getAllKeys() public view returns (KeyInfo[] memory) {
        return allKeys;
    }

    function getKey(
        string memory nation,
        string memory city,
        string memory hospital
    ) public view returns (address) {
        return keys[nation][city][hospital];
    }
}
