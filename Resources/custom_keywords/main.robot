*** Settings ***
Documentation    Contains keywords for signin testcases
Resource    ${env}/Resources/page_objects/common_settings.robot

*** Keywords ***
Set random
| |  ${user}=             |  Generate Random String  |  4                               |  [LETTERS]	       |
| |  Set Global Variable  |  ${userNew}              |  ${user}                         |                      |

