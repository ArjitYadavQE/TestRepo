@WS+ @FileSet @Auth_Any @Locale_EN @SDMS_5988

Feature: SDMS_5988_DownloadMultipleFilesets

    A/C 2: Multiple file sets
    //Given a user is logged into Content Browser
    //And one or more file sets exist
    //And the user has selected more than one file set folder
    //When the user clicks to download the file sets (Download button in Action ribbon)
    //Then the file set contents are downloaded as a single zip file
    //And the name of the zip file is Download_<datetime>.zip
    //And the zip file contains a folder named for each file set
    //And the contents of the file set folders include only members of their respective file set

    Background:
        Given There are following folders in storage
            | Folder         | Path                   |
            | SDMS-5988-L1F1 | Content                |
            | SDMS-5988-L1F2 | Content\SDMS-5988-L1F1 |
        And There are following files in storage
            | File_Names                      | Source_Folder | Destination_Path       |
            | 2022-01-28 14-16-00+05-30-01.dx | SDMS-5988     | Content\SDMS-5988-L1F1 |
            | 2022-01-28 14-16-00+05-30-01.rx | SDMS-5988     | Content\SDMS-5988-L1F1 |
            | AMX01.amx                       | SDMS-5988     | Content\SDMS-5988-L1F1 |
            | Sampler_1_DEABC50000_1.scml     | SDMS-5988     | Content\SDMS-5988-L1F1 |
            | SeqRun2.acaml                   | SDMS-5988     | Content\SDMS-5988-L1F1 |
            | SeqRun2.mfx                     | SDMS-5988     | Content\SDMS-5988-L1F1 |
            | SeqRun2.sqx                     | SDMS-5988     | Content\SDMS-5988-L1F1 |


            | 2022-01-28 14-16-00+05-30-01.dx      | SDMS-5988 | Content\SDMS-5988-L1F2 |
            | 2022-01-28 14-16-00+05-30-01.rx      | SDMS-5988 | Content\SDMS-5988-L1F2 |
            | AMX01.amx                            | SDMS-5988 | Content\SDMS-5988-L1F2 |
            | GC_LC Area Percent_DefaultMethod.pmx | SDMS-5988 | Content\SDMS-5988-L1F2 |
            | Sampler_1_DEABC50000_1.scml          | SDMS-5988 | Content\SDMS-5988-L1F2 |
            | SeqRun2.acaml                        | SDMS-5988 | Content\SDMS-5988-L1F2 |
            | SeqRun2.mfx                          | SDMS-5988 | Content\SDMS-5988-L1F2 |
            | SeqRun2.sqx                          | SDMS-5988 | Content\SDMS-5988-L1F2 |


    Scenario: SDMS_5988-SDMS-XXXX_VerifyDownloading_MultipleFilesets
        When I open the web browser
        And I navigate to Content Browser URL
        And I login to Content Browser as administrator user
        And I see the Content page
        Then I see following items in Content Table
            | Item           | Type    |
            | SDMS-5988-L1F1 | FileSet |
            | SDMS-5988-L1F2 | FileSet |
        When I "select" following items in Content table
            | Name           | Type    |
            | SDMS-5988-L1F1 | FileSet |
            | SDMS-5988-L1F2 | FileSet |
        Then I see "Download" button is "active" on the action ribbon
        And I click "Download" button on the action ribbon
        And I wait until file "Download_<datetime>.zip" downloaded
        And I see file "Download_<datetime>.zip" downloaded and the size is "1,410,326 Bytes"
        And I extract the downloaded "Download_<datetime>" zip folder
        And I see below folders in extracted folder
            | FolderName       |
            | SDMS-5988-L1F1-1 |
            | SDMS-5988-L1F2-1 |
        And I see below files in "SDMS-5988-L1F1-1" extracted zip folder
            | File_Names                      |
            | 2022-01-28 14-16-00+05-30-01.dx |
            | 2022-01-28 14-16-00+05-30-01.rx |
            | AMX01.amx                       |
            | Sampler_1_DEABC50000_1.scml     |
            | SeqRun2.acaml                   |
            | SeqRun2.mfx                     |
            | SeqRun2.sqx                     |

        And I see below files in "SDMS-5988-L1F2-1" extracted zip folder
            | File_Names                           |
            | 2022-01-28 14-16-00+05-30-01.dx      |
            | 2022-01-28 14-16-00+05-30-01.rx      |
            | AMX01.amx                            |
            | GC_LC Area Percent_DefaultMethod.pmx |
            | Sampler_1_DEABC50000_1.scml          |
            | SeqRun2.acaml                        |
            | SeqRun2.mfx                          |
            | SeqRun2.sqx                          |

        And I see "SeqRun2.mfx" file contains entries of below files
            | File_Names                      |
            | 2022-01-28 14-16-00+05-30-01.dx |
            | 2022-01-28 14-16-00+05-30-01.rx |
            | AMX01.amx                       |
            | Sampler_1_DEABC50000_1.scml     |
            | SeqRun2.acaml                   |
            | SeqRun2.sqx                     |

        And I see "SeqRun2.mfx" file contains entries of below files
            | File_Names                           |
            | 2022-01-28 14-16-00+05-30-01.dx      |
            | 2022-01-28 14-16-00+05-30-01.rx      |
            | AMX01.amx                            |
            | GC_LC Area Percent_DefaultMethod.pmx |
            | Sampler_1_DEABC50000_1.scml          |
            | SeqRun2.acaml                        |
            | SeqRun2.sqx                          |
