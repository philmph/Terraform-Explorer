# yaml-input-with-validation

In the two subfolders `1_loop` and `2_once` I've tested how I can implement yaml schema validation. If not done objects may or may not fit the required inputs used in a module.

`2_once` is encouraged. It's more readable, more accurate and has better error messages when schema validation fails.

Note that aditional keys can be defined in the `.yaml` file but they are removed upon validation.
