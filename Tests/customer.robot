*** Settings ***
Documentation     Testcases for SupraERP new
Resource    ${env}/Resources/page_objects/common_settings.robot


*** Test Cases ***
TC1: Verify admin can sign in ERP account using correct password
| |   Open Browser                      |  https://deverp.supraenergy.in/                  |  chrome     |
| |   Maximize Browser Window           |                                                  |             |
| |   Input Text                        |   //input[@placeholder='Email']                  | erp         |
| |   Input password                    |   //input[@placeholder='Password']               | ${pass}     |
| |   Click Element                     |   //button[@id='kt_login_signin_submit']         |             |
| |   Wait Until Page contains element  |   //h3[@class='kt-header__title kt-grid__item']  |             |
| |   Wait Until Page contains          |   Dashboard                                      |             |

TC2: Verify admin can create a new customer
| |  Mouse Over                        |  //i[@class='kt-menu__link-icon flaticon2-group']                                                        |                 |
| |  Wait Until Page Does not contain  |  Loading ...                                                                                             |                 |
| |  Wait Until Page contains element  |  //span[contains(text(),'Customers')]                                                                    |                 |
| |  Click Element                     |  //span[contains(text(),'Customers')]                                                                    |                 |
| |  Wait Until Page contains          |  All Customers                                                                                           |                 |
| |  Wait Until Page contains          |  Add New                                                                                                 |                 |
| |  Click link                        |  //div[@id='CustomerTableSection']//div[contains(@class,'kt-portlet__head kt-portlet__head--lg')]//a[1]  |                 |
| |  Wait Until Page contains          |  Add Customer                                                                                            |                 |
| |  Set random                        |                                                                                                          |                 |
| |  Input Text                        |  id=customer_name                                                                                        | Test${userNew}  |
| |  Input Text                        |  id=line_1                                                                                               | Palanpur        |
| |  Select From List By Label         |  id=country_id                                                                                           | India           |
| |  Click Element                     |  id=state_id                                                                                             |                 |
| |  Select From List By Label         |  id=state_id                                                                                             | Karnataka       |
| |  Select From List By Label         |  id=add_city                                                                                             | Hubli           |
| |  Input Text                        |  id=zipcode                                                                                              | 400100          |
| |  Click Element                     |  id=addBtn                                                                                               |                 |
| |  Wait Until Page contains          |  Data saved successfully.                                                                                |                 |


TC3: Verify admin can search the newly created customer
| |  Wait Until Page contains element  |  id=generalSearch                         |                  |
| |  Press Key                         |  id=generalSearch                         |  Test${userNew}  |
| |  Press Key                         |  id=generalSearch                         |  \\13            |
| |  Wait Until Page contains element  |  //td[contains(text(),'Test${userNew}')]  |                  |
| |  Element Text Should Be            |  //td[contains(text(),'Test${userNew}')]  |  Test${userNew}  |
| |  Wait Until Page contains          |  View                                     |                  |
| |  Wait Until Page Does not contain  |  Data saved successfully.                 |                  |
| |  Wait Until Page contains          |  View                                     |                  |
| |  Click link                        |  View                                     |                  |
| |  Wait Until Page contains          |  Test${userNew}                           |                  |



TC4: Verify admin can edit the details of newly created customer
| |  Wait Until Page Does not contain  |  Loading ...                        |                         |
| |  Click link                        |  Edit                               |                         |
| |  Wait Until Page contains element  |  id=customer_name                   |                         |
| |  Input Text                        |  id=customer_name                   |  Test${userNew}-Edited  |
| |  Click button                      |  id=editBtnCust                     |                         |
| |  Wait Until Page contains          |  Data saved successfully.           |                         |
| |  Wait Until Page Does not contain  |  Data saved successfully.           |                         |
| |  Wait Until Page Does not contain  |  Loading ...                        |                         |
| |  Click button                      |  //button[contains(text(),'Back')]  |                         |
| |  Wait Until Page contains          |  Test${userNew}-Edited              |                         |


TC5: Verify admin can add the contact details for newly created customer
| |  Wait Until Page contains element  |  //button[contains(text(),'Manage Contacts')]  |                                     |
| |  Click button                      |  //button[contains(text(),'Manage Contacts')]  |                                     |
| |  Wait Until Page contains          |  Contact Details                               |                                     |
| |  Wait Until Page contains          |  Add                                           |                                     |
| |  Wait Until Page contains element  |  //button[text()='Add']                        |                                     |
| |  Click button                      |  //button[text()='Add']                        |                                     |
| |  Wait Until Page contains          |  Add New                                       |                                     |
| |  Wait Until Page contains element  |  id=contact_type                               |                                     |
| |  Wait Until Page contains          |  Contact Type                                  |                                     |
| |  Wait Until Page contains          |  Contact                                       |                                     |
| |  Wait Until Page contains          |  Visibility                                    |                                     |
| |  Set Selenium Speed                |  0.2 seconds                                   |                                     |
| |  Select From List By Label         |  id=contact_type                               |  Phone                              |
| |  Input Text                        |  id=add_contact                                |  9921345466                         |
| |  Select From List By Label         |  id=visibility                                 |  Display where the address is used  |
| |  Click button                      |  id=addBtnContactAddress                       |                                     |
| |  Wait Until Page contains          |  Contact Added Successfully                    |                                     |
| |  Click button                      |  //button[text()='List All']                   |                                     |
| |  Wait Until Page contains          |  Showing 1 to 1 of 1 entries                   |                                     |


TC6: Verify admin can edit the contact details for newly created customer
| |  Page should contain link  |  Edit                                     |               |
| |  Click link                |  xpath=(//a[contains(text(),'Edit')])[2]  |               |
| |  Wait Until Page contains  |  Edit Contact                             |               |
| |  Input Text                |  id=contact_edit                          |  9988776655   |
| |  Click button              |  id=editBtnContactAddress                 |               |
| |  Wait Until Page contains  |  Contact Saved Successfully               |               |
| |  Click button              |  xpath=(//button[text()='List All'])[2]   |               |

TC7: Verify admin can delete the contact details for newly created customer
| |  Wait Until Page contains  |  Showing 1 to 1 of 1 entries                                                             |
| |  Page should contain link  |  Delete                                                                                  |
| |  Click link                |  Delete                                                                                  |
| |  Handle Alert              |  action=ACCEPT                                                                           |
| |  Wait Until Page contains  |  Contact Deleted Successfully                                                            |
| |  Click Element             |  //div[@id='add-contact-success-ad']//span[contains(text(),'×')]                         |
| |  Click Element             |  //div[@id='manageContactsAddress']//div[@class='modal-header']//button[@class='close']  |
| |  Close Browser             |                                                                                    |


