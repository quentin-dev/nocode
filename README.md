# Nocode

A simple way to write clean single-file code without taking up disk space

## Inspiration

- Kelsey Hightower's [nocode](https://github.com/kelseyhightower/nocode)

## Requirements

| Requirement  |                          Reason                          |
|:------------:|:--------------------------------------------------------:|
| clang-format |   Clean up code and apply your preferred coding style    |
|     gcc      |                   Compiling your code                    |
|     tee      | Temporarily save the file all while writing it to stdout |
|     git      |            Uploading your code to the Cloud™️             |

## Limitations

Nocode is currently limited to C code, with hopefully more to come

## Usage

1) `./nocode.sh filename`
2) Write your code on stdin
3) Use `CTRL+D` to tell nocode you're done writing 
4) Follow the on screen instructions
5) Once nocode has exited, you can `git push` your files

## Possible improvements

- If a user calls `Nocode` on an already-committed file, check it out
  to edit it, instead of writing from scratch
