# postgres-decoderbufs

A deb repository for Debezium [postgres-decoderbufs](https://github.com/debezium/postgres-decoderbufs) packages.

## available packages

Currently only packages for Ubuntu 18.04 amd64 exists. Maybe later I'll add packages for older distributions as well.

- postgresql-11-decoderbufs (v0.9.3)
- postgresql-10-decoderbufs (v0.9.3)

## usages

### import the repository signing key

```
wget --quiet -O - https://jabbors.github.io/postgres-decoderbufs/repo/A037B18F.asc | sudo apt-key add -
```

### add the repository

```
echo deb https://jabbors.github.io/postgres-decoderbufs/repo bionic main | sudo tee /etc/apt/sources.list.d/postgres_decoderbufs.list
```

### install packages

```
sudo apt-get update
sudo apt-get install postgresql-11-decoderbufs
```


## credits

Setting up this repository was inpired by this post [https://pmateusz.github.io/linux/2017/06/30/linux-secure-apt-repository.html]
