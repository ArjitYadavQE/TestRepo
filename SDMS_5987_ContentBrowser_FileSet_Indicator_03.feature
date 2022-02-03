@WS+ @FileSet @Auth_Any @Locale_EN @SDMS-5987

Feature: SDMS_5987_Fileset_Indicator
    As a user, I want a visual indication of file sets so I can quickly and easily distinguish file set folders from regular folders.

    /Given a user is logged into Content Browser
    /And one or more file sets exist

    A/C:3 No file set indicator in breadcrumbs
    /Given a user is on the Content page
    /When the user selects/clicks a file set folder
    /Then the user sees the entire contents of the file set folder
    /And the user does not see the file set indicator in the breadcrumbs

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

    Scenario:SDMS_5987_SDMS-XXXX_No_Fileset_Indicator_In_Breadcrumbs
        When I open the web browser
        And I navigate to Content Browser URL
        And I login to Content Browser as administrator user
        And I click "Tree View Expand" icon on Content page
        And I select folder "SDMS-5987-F01" at path "Content" in Tree view
        And I do not see folder icon color as Brown in breadcrumbs
        And I see following items in Content Table
            | Item                            | Type |
            | 2022-01-28 14-16-00+05-30-01.dx | File |
            | 2022-01-28 14-16-00+05-30-01.rx | File |
            | AMX01.amx                       | File |
            | Sampler_1_DEABC50000_1.scml     | File |
            | SeqRun2.acaml                   | File |
            | SeqRun2.mfx                     | File |
            | SeqRun2.sqx                     | File |