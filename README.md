# Aurora ERC20 Token Factory

A new Flutter project by using GetX, Solidity & Aurora Network runing in Ethereum Chain.
http://aurorafactory.testnet.codingyourlife.id

## 📺 Presentation
> https://www.youtube.com/watch?v=PHbwC92ylHU


# Deploying a Contract Using Truffle

## Introduction

[Truffle](https://www.trufflesuite.com/) is a widely used development
environment and testing framework for Ethereum smart contracts. In this
tutorial, we will show by example how to use Truffle with the Aurora Testnet.

This tutorial assumes that you are familiar with Truffle and the non-fungible
tokens (NFT) concept. For more details about the non-fungible token standard,
please refer to the [ERC-721 Non-Fungible Token
Standard](https://ethereum.org/en/developers/docs/standards/tokens/erc-721/)
specification.

## Installing Prerequisites

This tutorial assumes that you have Node.js 12+ and Yarn. Please refer to the
[Yarn installation how-to](https://classic.yarnpkg.com/en/docs/install) if you
don't yet have the `yarn` command installed locally.

To install the prerequisite packages, clone the examples repository and then run
`yarn`:

### Install Truffle

```bash
npm install -g truffle 
```

### Install dependencies

```bash

git clone https://github.com/faisalramdan17/flutter-aurorafactory.git

cd flutter-aurorafactory

yarn 

```

## Connecting Truffle to Aurora

Export your `MNEMONIC` as follows:

```bash
export MNEMONIC='YOUR MNEMONIC HERE'
```

Now in `truffle-config.js`, you will need to change the `from` address as shown
below in the `aurora` network section:

```json
...
aurora: {
    provider: () => setupWallet('https://testnet.aurora.dev'),
    network_id: 0x4e454153,
    gas: 10000000,
    from: process.env.OWNER_ADDRESS // ADD YOURS AT .ENV BY RENAMING .ENV-EXAMPLE FILE
},
```

The `truffle-config.js` configuration will pick up your `MNEMONIC` environment
variable and recover the address that will be used for sending and signing
transactions on the Aurora network.

## Deploying the Contract

To deploy the `ERC20Factory` contract, you can run the `yarn` command as
follows:

```bash

yarn deploy:aurora

....

2_deploy_contracts.js
=====================

   Deploying 'ERC20Factory'
   ------------------------
   > transaction hash:    0xc68d318832bdd1ce62522be0c9b1d525f1cd819290cdf346938cde87e792a76c
   > Blocks: 7            Seconds: 4
   > contract address:    0xaE074f630CCe25260463cc69cC6E765fA5Cf28Ad
   > block number:        81424014
   > block timestamp:     1644071016
   > account:             0x797F65FEf7f325fe3a508Cb85EBe0BD311DA4654
   > balance:             2.1498476027615
   > gas used:            1925330 (0x1d60d2)
   > gas price:           0 gwei
   > value sent:          0 ETH
   > total cost:          0 ETH

....
```

# Getting Started of Flutter Development

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

