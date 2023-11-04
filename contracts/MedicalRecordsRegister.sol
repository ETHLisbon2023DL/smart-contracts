// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "./ERC4671.sol";
import "./PublicKeyRegister.sol";

contract MedicalRecordsRegister is TokenERC4671 {
    PublicKeyRegister pkRegisterContract;

    constructor(
        address _pkRegisterContractAddress
    ) TokenERC4671("Medical Records", "MR", "https://eips.ethereum.org/ntt/") {
        pkRegisterContract = PublicKeyRegister(_pkRegisterContractAddress);
    }

    function _baseURI() internal pure override returns (string memory) {
        return "https://eips.ethereum.org/ntt/";
    }

    function _isAllowedToMintAndRevoke() internal view override {
        require(
            pkRegisterContract.checkIfAddressIsValid(msg.sender),
            "msg.sender must be an hospital wallet approved by OMS"
        );
    }

    function publishMedicalRecord(
        address owner,
        string memory tokenUri
    ) external {
        _isAllowedToMintAndRevoke();
        _mint(owner, tokenUri);
    }

    function updateMedicalRecord(
        address owner,
        string memory tokenUri
    ) external {
        _isAllowedToMintAndRevoke();
        _mint(owner, tokenUri);
    }

    function getHistoryOfMedicalRecordsForPatient(
        address owner
    ) public view returns (uint256[] memory) {
        uint256[] memory tokens = getOwnedTokens(owner);
        return tokens;
    }

    function revoke(uint256 tokenId) external {
        _isAllowedToMintAndRevoke();
        _revoke(tokenId);
    }
}
