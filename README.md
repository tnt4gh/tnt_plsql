# tnt\_plsql

PL/SQL utility for describing Oracle database objects.  The command line DESC <table> is very limited given the wealth of information available in the data dictionary for objects in the database. This utility package provides a describe table and describe table long procedure that details the table structure and all related objects such as indexes.



In src, look at pack\_dm\_utl.sps for instructions on setting the privileges needed to run this package

in src, look at pack\_dm\_utl.spb for details on how to contact the author



Last time I used this package was with Oracle 11.  Here's how the output looks like:



.------------------------------------------------------------------------------.

|Object Description: SCOTT.TNT\_APPLICATIONS                                    |

|        which is a: TABLE                                                     |

|------------------------------------------------------------------------------|

|Column Name                   Datatype        Nul Comment                     |

|------------------------------------------------------------------------------|

|SYSTEM\_CODE                   VARCHAR2(12)    NO  1st part primary key,       |

|                                                  References tnt\_systems      |

|                                                  table.                      |

|APPLICATION\_CODE              VARCHAR2(20)    NO  2nd part primary key, forced|

|                                                  to upper case in db         |

|                                                  constraint.                 |

|APPLICATION\_ID                VARCHAR2(32)    NO  Mixed case, maps directly to|

|                                                  id in menu.xml              |

|APPLICATION\_TYPE              VARCHAR2(12)    NO  Lower case, maps directly to|

|                                                  type in menu.xml,           |

|                                                  pageflow,menu only values   |

|                                                  allowed, only expect        |

|                                                  pageflow initially and      |

|                                                  possibly forever            |

|MENU\_PROMPT                   VARCHAR2(64)    NO  Mixed case, maps directly to|

|                                                  prompt in menu.xml,         |

|                                                  displayed on tnt web menu   |

|MENU\_ORDER                    NUMBER(4)       NO  Positive integer, determines|

|                                                  order of prompts generated  |

|                                                  into menu.xml               |

|ENABLED                       VARCHAR2(1)     NO  Upper case (forced in apex) |

|                                                  Y/N.  If not Y, application |

|                                                  will not be generated into  |

|                                                  menu.xml                    |

|STAND\_ALONE                   VARCHAR2(1)     NO  Upper case (forced in apex) |

|                                                  Y/N.  If Y, application will|

|                                                  not be generated into       |

|                                                  menu.xml                    |

|NOTE                          VARCHAR2(400)       Comment / special notes     |

|                                                  about the application       |

|------------------------------------------------------------------------------|

|Index Name                                                    Uniqueness      |

|------------------------------------------------------------------------------|

|SCOTT.CONS\_TNT\_APPL\_PK                                        UNIQUE          |

|            Column: SYSTEM\_CODE                     Position: 1               |

|                    APPLICATION\_CODE                          2               |

|------------------------------------------------------------------------------|

|Constraints                                                                   |

|------------------------------------------------------------------------------|

|       Primary Key: SCOTT.CONS\_TNT\_APPL\_PK                                    |

|            Status: ENABLED                                                   |

|            Column: SYSTEM\_CODE                     Position: 1               |

|                    APPLICATION\_CODE                          2               |

|     Referenced by: SCOTT.TNT\_APPLICATION\_ROLES       Status: ON  (NO ACTION) |

|                    SCOTT.TNT\_APPLICATION\_MODULES     Status: ON  (NO ACTION) |

|                                                                              |

|       Foreign Key: SCOTT.CONS\_APPL\_TO\_SYS\_FK                                 |

|            Status: ENABLED                          Deletes: NO ACTION       |

|            Column: SYSTEM\_CODE                     Position: 1               |

|        References: SCOTT.CONS\_TNT\_SYSTEMS\_PK                                 |

|             Table: SCOTT.TNT\_SYSTEMS                                         |

|           Ref Col: SYSTEM\_CODE                     Position: 1               |

|                                                                              |

|            Unique: NONE FOUND                                                |

|             Check: SCOTT.CONS\_TNT\_APPL\_CODE\_CHK                              |

|            Status: ENABLED                                                   |

|         Condition: application\_code = upper(application\_code)                |

|                                                                              |

|------------------------------------------------------------------------------|

|Start: 05-MAR-13 07:27:45 Finish: 07:27:45       Describe Table v1.1          |

|Database: ORCL - Oracle Database 11g Enterprise Edition Release 11.2.0.2.0 - P|

`------------------------------------------------------------------------------'

