/***************************************************************************/
/* fru_constants - set frequently used constants                           */
/* EXECLIB Name: FRUCONST                                                  */
/* Input:                                                                  */
/*   None                                                                  */
/* Output:                                                                 */
/*   None - vars set in program contextc                                   */
/***************************************************************************/
/* ATTN: CALL THIS AS EARLY IN PROGRAM AS POSSIBLE ATTN ATTN ATTN ATTN ATTN*/
/***************************************************************************/
/* Last Modified: 30 JUL 2022                                              */
/*    30-JUL-2022 DEB Initial commit                                       */
/*                                                                         */
fru_constants:
/* frequently used return codes */
    RC_OK = 0                  /* everything OK */
    RC_MISSINGVALUE = 8        /* missing value */
    RC_DISKRO= 12              /* target disk is read/only */
    RC_NOSPACE = 16            /* disk is full */
    RC_FILEEXISTS = 28         /* file exists */
    RC_OTHERERR = 999          /* some other unexplained error happened */
/* frequently used constants */
    VAL_CHAR_NULL = ''         /* null string */
    VAL_NUM_NULL = 0           /* null number */
    VAL_true = 1               /* logical true */
    VAL_false = 0              /* logical false */
    VAL_Yes = 'Y'              /* value Y */
    VAL_No = 'N'               /* value N */
    VAL_Maybe = 'M'            /* value M */
/* useful states for comparison */
    DISK_RO = 'R/O'            /* disk is R/O */
    DISK_RW = 'R/W'            /* disk is R/W */
    DISK_MDISK = 'MDISK'       /* disk is a minidisk */
    DISK_SFS = 'DIR'           /* disk is a SFS/BFS directory */

return RC_OK 