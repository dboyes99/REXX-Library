/***************************************************************************/
/* parse_argline - separate argline into parameters and options            */
/* EXECLIB Name: PRSARGL                                                   */
/* Input:                                                                  */
/*   argline - argline to be parsed                                        */
/* Output:                                                                 */
/*   pgm.execname - name of program exec                                   */
/*   pgm.parameters.x - parameter portion of command line (before '(')     */            
/*   pgm.options.x - stem containing options (after ')')                   */
/***************************************************************************/
/* Last Modified: 30 JUL 2022                                              */
/*    30-JUL-2022 DEB Initial commit                                       */
/*                                                                         */
parse_argline:

/* initialize output variables */
   pgm.execname = ''    /* null string */ 
   pgm.parameters.0 = 0 /* create stem with no contents */
   pgm.options.0 = 0    /* create stem with no contents */

/* get program name */
   parse source opsys envir pgm_name
   pgm.execname = upper(pgm_name)

/* parse argline */
   parse var argline pattern_parms '(' pattern_options ')'

/* exit*/
   return RC_OK