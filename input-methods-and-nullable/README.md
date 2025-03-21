# input-methods-and-nullable

In the three subfolders `1_tfvars`, `2_locals` and `3_yaml` I've tested different methods of feeding configuration data to a module. The main challenge and idea was to check how to standardize the input to be properly used when providing the data to a module call using `for_each`. `nullable` was the main thing I've tested in combination.

Note that I've split the yaml method towards [`yaml-input-with-validation`](../yaml-input-with-validation). If I am feeding configuration data this is likely my go to way in the future to enable people without `Terraform` knowledge to collaborate and self-service.
