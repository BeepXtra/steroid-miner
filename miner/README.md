# miner

A proof of concept Steroid miner.

## Install

**Requirements:**

- PHP 7.2
  - GMP extension
  - OpenSSL extension

## Usage

**For pool mining:**

The miner's IP must be added in the node's allowed hosts.

```bash
miner solo [node] [public_key] [private_key]
```

**For pool mining:**

```bash
miner pool https://pool.steroid.io [address]
```