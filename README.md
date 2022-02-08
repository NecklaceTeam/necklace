# necklace
Necklace is a tiny, imperative, statically, strongly typed language with Elixir-like syntax.

## LLVM install
1. Install llvm9 on you linux machine
2. If llvm-hs does not detect llvm-config-9 you can symlink it as llvm-conifg and add it to the PATH.

## How to start
You need installed llvm9 and [stack](https://docs.haskellstack.org/en/stable/README/)
```shell
$ stack install alex happy
$ stack install
$ stack run necklace `<file_name>.nck`
```
## Rebuild lexer
```shell
$ stack run alex src/Compiler/Lexer.x -o src/Compiler/Lexer.hs
```
## Rebuild parser
```
$ stack run happy src/Compiler/Parser.y -o src/Compiler/Parser.hs
```
