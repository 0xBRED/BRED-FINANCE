// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts@4.1.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.1.0/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts@4.1.0/token/ERC20/extensions/ERC20Snapshot.sol";
import "@openzeppelin/contracts@4.1.0/access/Ownable.sol";
import "@openzeppelin/contracts@4.1.0/security/Pausable.sol";
import "@openzeppelin/contracts@4.1.0/token/ERC20/extensions/draft-ERC20Permit.sol";

contract BREDFINANCE is ERC20, ERC20Burnable, ERC20Snapshot, Ownable, Pausable, ERC20Permit {
    constructor() ERC20("BRED FINANCE", "BRED") ERC20Permit("BRED FINANCE") {
        _mint(msg.sender, 100000000 * 10 ** decimals());
    }

    function snapshot() public onlyOwner {
        _snapshot();
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override(ERC20, ERC20Snapshot)
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}

