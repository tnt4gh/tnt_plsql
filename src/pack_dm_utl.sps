/*

    File: utl.sql
  Author: Tony Obermeit
    Date: 22nd July, 1994

The source code for these procedures is public domain and was written by
Tony Lee Obermeit and as such are Copyright (c) 1994-2025. You may modify 
the procedures as needed provided you include this paragraph in all files 
associated with the procedures.

  This script creates the package specification for the UTL package.

  To install and use this package, set the privileges as detailed in
  the example further below, then run utl.sql followed by utlbody.sql,

  For these utilities to work, you must issue the following command
  from sqlplus before executing:

    SET SERVEROUTPUT ON SIZE 64000

  The value of 64000 may need to be raised or lowered as applicable.
  
  The UTL package includes some handy utilities for looking at the data
  dictionary.  These include:

    dt      Describe Table.     This includes the table and 
                        column comments from the data 
                        dictionary.

    utl_wrap    Word Wrap       This is used by dt to wrap
                        the column comments

  You will need the correct privileges to use this package.  As a test, use
  the standard oracle demo tables (refer demobld.sql).  Here are the commands
  needed with Oracle7 (7.0.16) to create the user TESTDT using the USERS
  tablespace:

    sqlplus system
    create user testdt
        identified by testdt
        default tablespace users
        temporary tablespace users;

    alter user testdt
        quota unlimited on users;

    grant create session to testdt;
    grant create table to testdt;
    grant create synonym to testdt;
    grant create view to testdt;
    grant create sequence to testdt;
    grant create procedure to testdt;

    connect sys
    grant select on sys.dba_tab_comments to testdt;
    grant select on sys.dba_col_comments to testdt;
    grant select on sys.dba_tab_columns to testdt;
    grant select on sys.dba_indexes to testdt;
    grant select on sys.dba_ind_columns to testdt;
    grant select on sys.dba_constraints to testdt;
    grant select on sys.dba_cons_columns to testdt;
    grant select on sys.dba_segments to testdt;
    grant select on sys.dba_synonyms to testdt;
    grant select on sys.v_$database to testdt;
    grant select on sys.v_$version to testdt;
    grant select on sys.dba_objects to testdt;
    grant select on sys.dba_triggers to testdt;

    connect testdt/testdt
    start demobld.sql
    start utl.sql
    start utlbody.sql
    set serveroutput on size 128000
    execute utl.dt('emp');

*/

create or replace package pack_dm_utl
as
-- Revision: $Revision$

    ----------------------
    -- Public Variables --
    ----------------------

        -- Holds revision number for body and spec.  Value made 25 characters long
        -- to cater for "$Revision$" which pvcs inserts
        puv_spec_revision   varchar2(25) := 'v1.0u';

    -- This is the DT, Describe Table Procedure
    procedure dt 
        (table_name varchar2);

    -- This is the DTL, Describe Table Long Procedure which includes
    -- detail about indexes
    procedure dtl
        (table_name varchar2);

    -- This is the DTLS, Describe Table Long (with) Statistics Procedure 
    procedure dtls
        (table_name varchar2);

/*
*   Module: FUNC_SPEC_REVISION
*  Purpose: Get Revision for the package specification
*  Returns: Returns spec revision
*
* Comments:
*
* Specification Revision History
* 1.0   06-Mar-1999 Tony Obermeit   Original Spec Revision
*/

function
    FUNC_SPEC_REVISION
    return varchar2;



/*
*   Module: FUNC_BODY_REVISION
*  Purpose: Get Revision for the package body
*  Returns: Returns body revision
*
* Comments:
*
* Specification Revision History
* 1.0   06-Mar-1999 Tony Obermeit   Original Spec Revision
*/

function
    FUNC_BODY_REVISION
    return varchar2;

end pack_dm_utl;
/

