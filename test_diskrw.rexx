/* REXX */
/*************************************************************/
/* test_diskrw -  is a disk r/w?                             */
/* EXECLIB Name: TDRW                                                          */
/* Input:                                                    */
/*    disk.filemode - accessed disk filemode                 */
/*                                                           */
/* Output:                                                   */
/*      disk.writable  - true/false                         */                             
/*                                                           */
/* Return Codes:                                             */
/*      RC_OK - all well                                     */
/*      RC_OTHERERR - something went wrong                   */
/*                                                           */
/* Uses:                                                     */
/*      fru_constants (must be called before use)            */
/*************************************************************/
test_diskrw:

    disk.writable = VAL_false
    'PIPE CMS QUERY DISK' disk.filemode 
        '| DROP 1', 
        '| VAR dataline'
    if rc <> RC_OK then do
        rc = RC_OTHERERR
        signal exit_test_diskrw_subroutine
    end
    parse var dataline . . . disk.status .
    if disk.status = DISK_RW then disk.writable = VAL_true
    
exit_test_diskrw_subroutine:
return rc