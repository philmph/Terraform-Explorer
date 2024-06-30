# for-loop-object-handling

I wanted to test if using `_` actually has any use in Terraform as compared to go.

To test this locally, run `terraform init` and run `terraform console` after.

## Notes

Using `_` does not make a lot of sense imho as it is still usable. The only valid reason i see is opinionated in maps and objects:

If you want to use only the key instead of the value you could write f.e.

```hcl
locals {
obj = {
  key1 = "value1"
}

obj_loop = [ for key, _ in local.obj : ... ]
}
```

This would not actually dump the value but indicate to a human that it is not relevant / used in the loop.

Using only `key` would result in `key` being the `value`:

```hcl
locals {
obj = {
  key1 = "value1"
}

obj_loop = [ for key in local.obj : "I am actually the value=${key}" ]
}
```

Not of any use in lists imho because it will result in a iterators `0, 1, ...`.
