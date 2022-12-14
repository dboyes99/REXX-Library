/***************************************************************************/
/* refine_parse - validate parse against template                          */
/* EXECLIB Name: REFPRSE                                                   */
/* Input:                                                                  */
/*  pattern_parms - parsed string from parse_argline                       */
/*  pattern_options - parsed string from parse_argline                     */
/*  parse_template.x = valid options                                       */
/*     <type of parm> <par_name> <xpected # of args> <negate_parm>         */
/*  <type of parm> =                                                       */
/*      CMS_FILE - CMS filespec   FILE (fn ft fm)                          */
/*      PNP - <value>/NO<value>   CHECK/NOCHECK                            */
/*      KWDVAL - keyword value    keyword(value)                           */
/* Output:                                                                 */
/*   pgm.options.n - parsed options                                        */
/*   pgm.options.0 - number of options found   
/*      options.n.1 = option name   (normalized)                           */            
/*      options.n.2 = option value                                         */
/***************************************************************************/
/* Last Modified: 08 AUG 2022                                              */
/*    08-AUG-2022 DEB Initial commit                                       */
/***************************************************************************/
refine_parse:
/* variable init */
    pgm.options.0 = VAL_NUM_NULL
    type_parm = 1   /* parameter type column */
    parm_name = 2   /* Parameter name column */
    expected_args = 3 /* expected # of args column */
    negate_parm = 4 /* for binary true/false flag parms, identity of negate value */
    variable = 5 /* flag variable to set */
    parm.openvalue = '(' /* value of parm delimiters */
    parm.closevalue = ')'