# necklace
Necklace is a tiny, imperative, statically, strongly typed language with Elixir-like syntax.

## How to run
```
cabal run necklace_compiler `./<file_name>.nck`
```

## Rebuild lexer
```
alex src/Compiler/Lexer.x -o src/Compiler/Lexer.hs
```
## Rebuild parser
```
happy src/Compiler/Parser.y -o src/Compiler/Parser.hs
```
## Tests
You must first install required packages with ```cabal install --enable-tests```
Then to run tests enter ```cabal test```
