/***************************************************************************/
/* fru_constants - set frequently used constants                           */
/* EXECLIB Name: FRUCONST                                                  */
/* Input:                                                                  */
/*   None                                                                  */
/* Output:                                                                 */
/*   None - vars set in program context                                    */
/***************************************************************************/
/* ATTN: CALL THIS FIRST OR AS EARLY IN PROGRAM AS POSSIBLE           ATTN */
/***************************************************************************/
/* Last Modified: 30 JUL 2022                                              */
/*    30-JUL-2022 DEB Initial commit                                       */
/*    04-DEC-2022 DEB Add message states array for expansion of Message:   */
/*                    functions                                            */
/*                                                                         */
fru_constants:
/* frequently used return codes */
    RC_OK = 0                  /* everything OK */
    RC_WARN = 4                /* non-fatal error */
    RX_NONFATAL=4              /* non-fatal error if it's easier explained */
    RC_MISSINGVALUE = 8        /* missing value */
    RC_DISKRO= 12              /* target disk is read/only */
    RC_NOSPACE = 16            /* disk is full */
    RC_NOTWRITABLE = 16        /* disk not writable */
    RC_NOTFOUND = 28           /* not found */
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
    VAL_NOTAPP '*NOTAPP'       /* not applicable */
    VAL_ONOFF = 'ONOFF'        /* var is a switch        CHECK/NOCHECK    */
    VAL_CMSFILE = 'CMSFILE'    /* var is a CMS file spec FILE(fn ft fm )  */
    VAL_KWDVAL = 'KWDVAL'      /* var is a kwd/val       FORMAT(1)        */

/* useful states for comparison */
    DISK_RO = 'R/O'            /* disk is R/O */
    DISK_RW = 'R/W'            /* disk is R/W */
    DISK_MDISK = 'MDISK'       /* disk is a minidisk */
    DISK_SFS = 'DIR'           /* disk is a SFS/BFS directory */

/* valid message states */
    VAL_MSGSEV = 'NORM' ,       /* normal text */
                'WARN' ,        /* warning text */
                'ERR' ,         /* error text */
                'SEVERR' ,      /* severe error text */
                'CRITERR' ,     /* critical error text */
                'FATALERR'      /* fatal error text */

 /* capability options */
    have_SUPERSAY = VAL_true    /* capability present -- set to false if not */
 
return RC_OK 