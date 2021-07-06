
# UNIT TESTING NOTES DEVELOPMENT

The shell script 'unit-tests' runs a series of tests on the notes(1), 
notebook(1) and journal(1) scripts.

Each function is tested for the appropriate output (directories created, 
files encrypted etc) and any errors output to tests/error_log_for_unit_tests.

The shell script places an appropriate framework around each script and 
runs through a series of test use cases checking what is output compared 
to what is expected.


## RUNNING UNIT TESTS 

To run the unit tests you need to set the environment variable $TESTKEY 
to the GPG Key you wish to use and then run the 'unit-tests' shell script.


```shell
$ export TESTKEY="E33A79B685AA......325F41243EDA850A"
$ ./unit-tests
```

The script edits the notes(1) config file after creation to point to the 
GPG key $TESTKEY. this allows the user to guarantee which GPG key is 
used in the unit-tests script if the developer has more than one private key.

### Testing "notes newkey newGPGkey"

If the user also sets $ALTGPGKEY before running the test then the 
notes(1) command 'newkey' will decrypt from $TESTKEY and then encrypt to 
$ALTGPGKEY.

If no $ALTGPGKEY is found in the environment the unit-tests script will 
set $ALTGPGKEY = $TESTKEY to test notes newkey command.

