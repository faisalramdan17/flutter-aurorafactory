// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

// // import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
 
// //Safe Math Interface
 
// contract SafeMath {
 
//     function safeAdd(uint a, uint b) public pure returns (uint c) {
//         c = a + b;
//         require(c >= a);
//     }
 
//     function safeSub(uint a, uint b) public pure returns (uint c) {
//         require(b <= a);
//         c = a - b;
//     }
 
//     function safeMul(uint a, uint b) public pure returns (uint c) {
//         c = a * b;
//         require(a == 0 || c / a == b);
//     }
 
//     function safeDiv(uint a, uint b) public pure returns (uint c) {
//         require(b > 0);
//         c = a / b;
//     }
// }
 
 
// //ERC Token Standard #20 Interface
 
// // contract ERC20Interface {
// interface ERC20Interface {
//     function totalSupply() external view returns (uint);
//     function balanceOf(address account) external view returns (uint);
//     function transfer(address recipient, uint amount) external returns (bool);

//     function allowance(address owner, address spender) external view returns (uint);

//     function approve(address spender, uint amount) external returns (bool);

//     function transferFrom(
//         address sender,
//         address recipient,
//         uint amount
//     ) external returns (bool);

//     event Transfer(address indexed from, address indexed to, uint value);
//     event Approval(address indexed owner, address indexed spender, uint value);
// }
 
 
// //Contract function to receive approval and execute function in one call
 
// contract ApproveAndCallFallBack {
//     function receiveApproval(address from, uint256 tokens, address token, bytes data) public;
// }
 
// //Actual token contract
 
// contract QKCToken is ERC20Interface, SafeMath {
//     string public symbol;
//     string public  name;
//     uint8 public decimals;
//     uint public _totalSupply;
 
//     mapping(address => uint) balances;
//     mapping(address => mapping(address => uint)) allowed;
 
//     constructor() public {
//         symbol = "QKC";
//         name = "QuikNode Coin";
//         decimals = 2;
//         _totalSupply = 100000;
//         balances[YOUR_METAMASK_WALLET_ADDRESS] = _totalSupply;
//         emit Transfer(address(0), YOUR_METAMASK_WALLET_ADDRESS, _totalSupply);
//     }
 
//     function totalSupply() public constant returns (uint) {
//         return _totalSupply  - balances[address(0)];
//     }
 
//     function balanceOf(address tokenOwner) public constant returns (uint balance) {
//         return balances[tokenOwner];
//     }
 
//     function transfer(address to, uint tokens) public returns (bool success) {
//         balances[msg.sender] = safeSub(balances[msg.sender], tokens);
//         balances[to] = safeAdd(balances[to], tokens);
//         emit Transfer(msg.sender, to, tokens);
//         return true;
//     }
 
//     function approve(address spender, uint tokens) public returns (bool success) {
//         allowed[msg.sender][spender] = tokens;
//         emit Approval(msg.sender, spender, tokens);
//         return true;
//     }
 
//     function transferFrom(address from, address to, uint tokens) public returns (bool success) {
//         balances[from] = safeSub(balances[from], tokens);
//         allowed[from][msg.sender] = safeSub(allowed[from][msg.sender], tokens);
//         balances[to] = safeAdd(balances[to], tokens);
//         emit Transfer(from, to, tokens);
//         return true;
//     }
 
//     function allowance(address tokenOwner, address spender) public constant returns (uint remaining) {
//         return allowed[tokenOwner][spender];
//     }
 
//     function approveAndCall(address spender, uint tokens, bytes data) public returns (bool success) {
//         allowed[msg.sender][spender] = tokens;
//         emit Approval(msg.sender, spender, tokens);
//         ApproveAndCallFallBack(spender).receiveApproval(msg.sender, tokens, this, data);
//         return true;
//     }
 
//     function () public payable {
//         revert();
//     }
// }