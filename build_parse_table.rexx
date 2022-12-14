/***************************************************************************/
/* build_parse_table - build expected parse table for options              */
/* EXECLIB Name: BLDPRTA                                                   */
/* Usage: call BUILD_PARSE_TABLE parm-name type-of-parm  nargs neg var     */
/* Input:                                                                  */
/*  parse_table.0 = entries in parse_table                                 */
/*  <type of parm> =                                                       */
/*      CMSFILE - CMS filespec   FILE (fn ft fm)                           */
/*      ONOFF - <value>/NO<value>   CHECK/NOCHECK                          */
/*      KWDVAL - keyword value    keyword(value)                           */
/*  parm-name - uppercase string full name of option                       */
/*  nargs - expected num of arguments                                      */
/*  neg - negating option (if relevant) ex CHECK/NOCHECK                   */
/*  var - text name of var to be set to VAL_true if presemt                */
/*  default_val - default value to initialize var                          */
/* Output:                                                                 */
/*   parse_template.x - entry in parse template                            */
/***************************************************************************/
/* Last Modified: 08 AUG 2022                                              */
/*    08-AUG-2022 DEB Initial commit                                       */
/***************************************************************************/
BUILD_PARSE_TABLE:

BPT_Main: 
    call fru_constants                 /* establish standard constants     */
    call BPT_Define_Working_Variables
    call BPT_Parse_Argline
    call BPT_Validate_Input_Parms      /* make sure all the parms are good  */
    call Insert_Entry_In_Parse_Table   /* put it in the table               */
BPT_End_Main:
    signal bpt-exit-program

BPT_Define_Working_Variables:
/* parse_template entry structure */
    type_parm = 1     /* parameter type column */
    parm_name = 2     /* Parameter name column */
    exp_args = 3       /* expected # of args column */
                      /* ONOFF type should be 0 */
                      /* KWDVAL type should be 1 */
                      /* CMSFILE type should be 3 */
    negate_parm = 4   /* for binary true/false flag parms, identity */
                      /*  of negate value */
                      /* eg for value CHECK this would be NOCHECK */
                      /*    *NOTAPP if not applicable */
    variable = 5      /* flag variable to set */
    defaultvalue = 6  /* default value column */

    valid_tyoe_parm_enum =   VAL_ONOFF , 
                             VAL_CMSFILE , 
                             VAL_KWD  

/* number of entries in parse template is 0, then initialize to numneric 0 */
    if parse_template.x = 'PARSE_TEMPLATE.X' then ,
                parse_template.0 = VAR_NUM_NULL

/* update new entry as current one */
    curr_entry = parse_template.0 + 1    /* update new entry */

return RC_OK

BPT_Parse_Argline:
/* Example calls:                                                          */
/* call BUILD_PARSE_TABLE "NAME" "CMSFILE" "3" "filespec" ""               */ 
/* call BUILD_PARSE_TABLE "CHECK" "ONOFF" "0" "NOCHECK" "need_check" ,     */
/*            "VAL_false"                                                  */
/* call BUILD_PARSE_TABLE "COPIES" "KWDVAL" "1" "" "num_copies" ,          */
/*           "VAL_NUM_NULL"                                                */

/* get calling arguments */
    parse arg parm_name parm_type parm_expected parm_negate parm_flag_var ,
        parm_default
return rc

BPT_Validate_Input_Parms:

/* check for required arguments */
    if parm_name = 'PARM_NAME' | parm_name = '' then do /* can't be blank or omitted */
        text = 'Missing mandatory parm name - abort'
        call Message text
        rc = RC_MISSINGVALUE
        signal bpt-exit-program-with-error
    end

    if parm_type = 'PARM_TYPE' | parm_type = '' then do /* can't be blank or omitted */
        text = 'Missing mandatory parm type - abort'
        call Message text
        rc = RC_MISSINGVALUE
        signal bpt-exit-program-with-error
    end

    if parm_flag_var = 'PARM_FLAG_VAR' | parm_flag_var ='' then do
        text='Missing mandatory variable name - abort'
        call Message text
        rc = RC_MISSINGVALUE
        signal bpt-exit-program-with-error
    end

    if parm_default = '' then do  /* every var needs a default */
        text = 'Missing initial value for variable - abort'
        call Message text
        rc = RC_MISSINGVALUE
        signal bpt-exit-program-with-error
    end


/* is it one of the parm_type we know about? */

    upper parm_type   /* less to compare */

    for x = 1 to words(valid_parm_enum) do
        select
            when parm_type /= word(valid_type_parm_enum, x) do  
                iterate /* not that one, try the next */
                end
            otherwise do 
                parse_template.curr_entry.type_parm = parm_type /* much better */
                end
        end
    end

/* ONOFF type implies NO option */
    if parm_type /= VAL_ONOFF then do 
        parse_template.curr_entry.parm_negate = VAL_NOTAPP
        end

    comparestr = 'NO' || parm_name 
    if parm_negate /= comparestr then do
        parm_negate = comparestr 
        end 
return rc

Insert_Entry_In_Parse_Table:
/* add entry as current */
    parse_template.curr_entry.parm_name = parm_name
    parse_template.curr_entry.parm_type = parm_type
    parse_template.curr_entry.exp_args = parm_expected
    parse_template.curr_entry.parm_negate = parm_negate
    parse_template.curr_entry.parm_flag_var = value(parm_flag_var)
    parse_template.curr_entry.parm.parm_default = parm_default
return rc

bpt-exit-program:              /* normal exit */
    return RC_OK

bpt-exit-program-with-error:   /* something happened */
    say text
    exit

