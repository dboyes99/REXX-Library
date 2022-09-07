/***************************************************************************/
/* Message - type message to user                                          */
/* EXECLIB Name: USERMSG                                                   */
/* Input:                                                                  */
/*   text - Message to be displayed                                        */
/* Output:                                                                 */
/*   message is typed on console                                           */
/***************************************************************************/
/***************************************************************************/
/* Last Modified: 30 JUL 2022                                              */
/*    30-JUL-2022 DEB Initial commit                                       */
/***************************************************************************/
Message: 
    parse arg message
    /* if null text, silently return */
    if message = '' then do 
        rc = RX_NONFATAL
        signal msg-exit-program-with-error
    end
    if have_SUPERSAY then do 
        noop /* for now */
        end
    else do
        say message
        rc = RC_OK
        signal msg-exit-program
    end

msg-exit-program-with-error:
    exit rc

msg-exit-program:
    return rc

