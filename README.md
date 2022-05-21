# Necklace
[![NecklaceTeam](https://circleci.com/gh/NecklaceTeam/necklace.svg?style=svg&circle-token=c4e076f0d1733d0d763f31e7f852bf1fa0e2546c)](https://app.circleci.com/pipelines/github/NecklaceTeam/necklace)
![issues](https://img.shields.io/bitbucket/issues/NecklaceTeam/necklace)

Necklace is a tiny, imperative, statically, strongly typed language with Elixir-like syntax.

## Features
 - ints and bool types
 - pointer support
 - while loops
 - if statements
 
## Example code
```
function main do
    a: bool;
    b: int;

    b = 5;
    while (b > 0) do
        printInt(b);
        b = b - 1;
    end
    return;
end
```
You can find more examples in `examples/` and more detailed documentation in `documentation/docs.pdf`

## Tests
Test are located in `test/` dir. To run them on your machine run
```shell
stack test
```

## Installation guide
### Requirements
1. [llvm9](https://releases.llvm.org/download.html) on you linux machine
2. If llvm-hs does not detect llvm-config-9 you can symlink it as llvm-conifg and add it to the PATH.

### How to start
You need installed llvm9 and [stack](https://docs.haskellstack.org/en/stable/README/)
```shell
$ stack install alex happy
$ stack install
$ stack run necklace-exe `<file_name>.nck`
```
stack should rebuild lexer and parser on run, but if you need to do it by hand you can do
```shell
alex src/Compiler/Lexer.x -o src/Compiler/Lexer.hs
happy src/Compiler/Parser.y -o src/Compiler/Parser.hs
```

## Run shelltests
Run all tests
```
./shelltest.sh
```
Run tests under one directory
```
./shelltest.sh <directory_name>
```

## Future plans
 - floats
 - structs
 - `bind <variable> <function>` statement, which binds given function to a variable. After that whenever that variable changes, that function runs
