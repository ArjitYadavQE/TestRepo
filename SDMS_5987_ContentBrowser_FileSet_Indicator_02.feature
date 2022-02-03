@WS+ @FileSet @Auth_Any @Locale_EN @SDMS-5987

Feature: SDMS_5987_Fileset_Indicator
    As a user, I want a visual indication of file sets so I can quickly and easily distinguish file set folders from regular folders.

    /Given a user is logged into Content Browser
    /And one or more file sets exist

    A/C:2 Indicate file set in content list
    /Given a user is on the Content page
    /And a folder containing one or more file sets and one or more regular folders is selected
    /When the user views the content list
    /Then the user sees a folder icon next to each folder name in the list
    /And the user sees the icon next to file set folders in a different color than other folder icons (as shown in the mockup)

    Background:

        Given There are following folders in storage
            | Folder        | Path    |
            | SDMS-5987-F01 | Content |
            | SDMS-5987-F02 | Content |
            | SDMS-5987-F03 | Content |
            | SDMS-5987-F04 | Content |

        And There are following files in storage
            | File                            | Source_Folder | Destination_Path      |
            | 2022-01-28 14-16-00+05-30-01.dx | SDMS-5988     | Content\SDMS-5987-F01 |
            | 2022-01-28 14-16-00+05-30-01.rx | SDMS-5988     | Content\SDMS-5987-F01 |
            | AMX01.amx                       | SDMS-5988     | Content\SDMS-5987-F01 |
            | Sampler_1_DEABC50000_1.scml     | SDMS-5988     | Content\SDMS-5987-F01 |
            | SeqRun2.acaml                   | SDMS-5988     | Content\SDMS-5987-F01 |
            | SeqRun2.mfx                     | SDMS-5988     | Content\SDMS-5987-F01 |
            | SeqRun2.sqx                     | SDMS-5988     | Content\SDMS-5987-F01 |
            | SDMS-5987-L1F2                  | SDMS-5988     | Content               |

    Scenario: SDMS_5987_SDMS-XXXX_Indicates_File_Set_In_Content_List
        When I open the web browser
        And I navigate to Content Browser URL
        And I login to Content Browser as administrator user
        # And I select folder "SDMS-5987-F01" at path "Content" in Tree view
        And I see folder icon next to folder name in Content Table
            | Item           | Type    | IconColor |
            | SDMS-5987-F01  | FileSet | Brown     |
            | SDMS-5987-F02  | Folder  | Yellow    |
            | SDMS-5987-F03  | Folder  | Yellow    |
            | SDMS-5987-F04  | Folder  | Yellow    |
            | SDMS-5987-L1F2 | File    |           |