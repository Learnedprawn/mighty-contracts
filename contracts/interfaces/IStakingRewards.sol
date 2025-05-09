// SPDX-License-Identifier: gpl-3.0
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface IStakingRewards {
    event RewardsSet(address rewardsToken, uint256 start, uint256 end, uint256 total);

    event Staked(address indexed user, address indexed onBehalfOf, uint256 amount);

    event Withdraw(address indexed user, address indexed to, uint256 amount);

    event RewardPaid(address indexed user, address indexed rewardsToken, uint256 claimed);

    struct Reward {
        uint256 startTime;
        uint256 endTime;
        uint256 rewardRate;
        uint256 lastUpdateTime;
        uint256 rewardPerTokenStored;
    }

    function stakedToken() external view returns (IERC20);

    function lendingPool() external view returns (address);

    function totalStaked() external view returns (uint256);

    function balanceOf(address) external view returns (uint256);

    function rewardsTokenListLength() external view returns (uint256);

    function earned(address _account, address _rewardsToken) external view returns (uint256);

    function stake(uint256 _amount, address onBehalfOf) external;

    function withdraw(uint256 _amount, address to) external;

    function withdrawByLendingPool(uint256 _amount, address user, address to) external;

    function claim() external;
}
