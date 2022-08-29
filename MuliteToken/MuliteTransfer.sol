// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts v4.4.1 (token/ERC20/extensions/IERC20Metadata.sol)

pragma solidity ^0.8.0;

import "./IERC20.sol";

contract MuliteTransfer {

    // 批量转账eth

    function muliteTransferEth(uint256 amount, address[] memory transfer_address) public payable {

        uint address_length = transfer_address.length;
        uint totalAmount = amount * address_length;
        require(msg.value >= totalAmount, "Insufficient batch transfer balance");

        for(uint i = 0; i < address_length; i++) {
            payable(transfer_address[i]).transfer(amount);
        }
    }

    // 批量转账erc 20 token

    function muliteTransferERC20Token(uint256 amount, address[] memory transfer_address, address contract_address) public {

        uint address_length = transfer_address.length;
        uint totalAmount = amount * address_length;

        uint256 balance = IERC20(contract_address).balanceOf(msg.sender);
        require(balance >= totalAmount, "Insufficient batch transfer balance");

        for(uint i = 0; i < address_length; i++) {
            IERC20(contract_address).transferFrom(msg.sender,transfer_address[i],amount);
        }
    }


}