## 1 - model method_name should start with self

```
def self.get_names
	xyz ...
end 

```

## 2 - use exception handling at end of each function 

```
begin

rescue StandardError=>e
      ErrorLog.insert_error_and_notify(e, :error_place => 'user_create_user_model')
end 

``` 