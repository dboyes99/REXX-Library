/* REXX */
/***********************************************************/
/* test_fileexists - does file exist?                      */
/* EXECLIB Name: TFEX                                      */
/*                                                         */
/* Input:                                                  */
/*      file.name - obvious                                */
/*      file.type - obvious                                */
/*      file.mode - obvious                                */
/*                                                         */
/* Output:                                                 */
/*      file.exists - true/false                           */
/*                                                         */
/* Return Codes:                                           */
/*      RC_OK = all well                                   */
/*      RC_WARN = making an assumption on parm             */
/*      RC_OTHERERR - something went wrong                 */
/*                                                         */
/* Uses:                                                   */
/*      fru_constants (must be called before use)          */
/*      message                                            */
/***********************************************************/
test_fileexists:
    
    /* validate input parms */
    
    if file.name = VAL_CHAR_NULL then do
        message = "File name missing - can't continue"
        call message "RED"
        rc = RC_OTHERERR
        signal exit_test_fileexists_routine
    end
    if file.type = VAL_CHAR_NULL then do
        message = "File type missing - can't continue"
        call message "RED"
        rc = RC_OTHERERR
        signal exit_test_fileexists_routine
    end
    if file.mode = VAL_CHAR_NULL then do
        message = "File mode missing - assuming A"
        call message "YELLOW"
        rc = RC_WARN
        signal exit_test_fileexists_routine
    end
    
    /* test for file */
    file.exists = VAL_No
    'ESTATE' file.spec
    if rc = RC_OK then file.exists = VAL_true

    exit_test_fileexists_routine:
    return rc
    


