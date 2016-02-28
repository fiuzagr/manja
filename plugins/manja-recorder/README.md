## About

The `manja recorder` enable the record of executed commands and create an executable aliased script.


## Usage

```shell
$ manja recorder [start]

$ cd ~

$ mkdir -p .test

$ cd .test

$ echo 'My first recorder' >> record.txt

$ [...]

$ manja recorder stop [Alias]
manja recorder ID: 9999

$ 
```

Then, to repeat recorded script:

```shell
$ manja 9999

or

$ manja Alias
```

