# awsmeta
get aws meta-data command

## Demo

[![asciicast](https://asciinema.org/a/28360.png)](https://asciinema.org/a/28360)

## Install

```
git clone https://github.com/kawaz/awsmeta.git
cp awsmeta/bin/awsmeta /usr/local/bin/
cp awsmeta/etc/bash_completion.d/awsmeta.sh /etc/bash_completion.d/
```

## Usage

```console:
$ awsmeta instance-type
t2.micro
```

## Completion

```console:
$ awsmeta ins<TAB>
$ awsmeta instance-<TAB><TAB>
instance-action  instance-id      instance-type
$ awsmeta instance-i<TAB>
$ awsmeta instance-id
i-8c7e372e
```
