@WS+ @FileSet @Auth_Any @Locale_EN @SDMS_5988

Feature: SDMS_5988_DownloadSingleFileSingleVersion_01a

    A/C 1a: Single file set, single version
    //Given a user is logged into Content Browser
    //And one or more file sets exist
    //And the user has selected a single file set folder that contains a file set with only one version
    //When the user clicks to download the file set (Download button in Action ribbon)
    //Then the file set contents are downloaded as a zip file
    //And the name of the zip file is <file set name>-<version>.zip
    //And the zip contains a folder with the same name as the file set
    //And the folder contains the contents of the file set (based on the newest manifest file)

    Background:
        Given There are following folders in storage
            | Folder         | Path    |
            | SDMS-5988-L1F1 | Content |

        And There are following files in storage
            | File                            | Source_Folder | Destination_Path       |
            | 2022-01-28 14-16-00+05-30-01.dx | SDMS-5988     | Content\SDMS-5988-L1F1 |
            | 2022-01-28 14-16-00+05-30-01.rx | SDMS-5988     | Content\SDMS-5988-L1F1 |
            | AMX01.amx                       | SDMS-5988     | Content\SDMS-5988-L1F1 |
            | Sampler_1_DEABC50000_1.scml     | SDMS-5988     | Content\SDMS-5988-L1F1 |
            | SeqRun2.acaml                   | SDMS-5988     | Content\SDMS-5988-L1F1 |
            | SeqRun2.mfx                     | SDMS-5988     | Content\SDMS-5988-L1F1 |
            | SeqRun2.sqx                     | SDMS-5988     | Content\SDMS-5988-L1F1 |

    # | ACQ-1.amx                   | SDMS-5988     | Content\SDMS-5988-L1F1 |
    # | Calibration.rdl             | SDMS-5988     | Content\SDMS-5988-L1F1 |
    # | LC-RES-2.acaml              | SDMS-5988     | Content\SDMS-5988-L1F1 |
    # | LC-RES-2.mfx                | SDMS-5988     | Content\SDMS-5988-L1F1 |
    # | LC-SEQ.sqx                  | SDMS-5988     | Content\SDMS-5988-L1F1 |
    # | Line-001.dx                 | SDMS-5988     | Content\SDMS-5988-L1F1 |
    # | Line-001.rx                 | SDMS-5988     | Content\SDMS-5988-L1F1 |
    # | Line-001_1.pdf              | SDMS-5988     | Content\SDMS-5988-L1F1 |
    # | New method 1.pmx            | SDMS-5988     | Content\SDMS-5988-L1F1 |
    # | Sampler_1_DEABC50000_1.scml | SDMS-5988     | Content\SDMS-5988-L1F1 |

    Scenario: SDMS_5988-SDMS-_VerifyDownloading_SingleFileSetSingleVersion
        When I open the web browser
        And I navigate to Content Browser URL
        And I login to Content Browser as administrator user
        And I see the Content page
        Then I see following items in Content Table
            | Item           | Type    |
            | SDMS-5988-L1F1 | FileSet |
        When I navigate to folder "SDMS-5988-L1F1" at path "Content" on Content page
        And I see following items sorted in Content Table
            | Item                            | Type |
            | 2022-01-28 14-16-00+05-30-01.dx | File |
            | 2022-01-28 14-16-00+05-30-01.rx | File |
            | AMX01.amx                       | File |
            | Sampler_1_DEABC50000_1.scml     | File |
            | SeqRun2.acaml                   | File |
            | SeqRun2.mfx                     | File |
            | SeqRun2.sqx                     | File |

        # | ACQ-1.amx                   | File |
        # | Calibration.rdl             | File |
        # | LC-RES-2.acaml              | File |
        # | LC-RES-2.mfx                | File |
        # | LC-SEQ.sqx                  | File |
        # | Line-001.dx                 | File |
        # | Line-001.rx                 | File |
        # | Line-001_1.pdf              | File |
        # | New method 1.pmx            | File |
        # | Sampler_1_DEABC50000_1.scml | File |
        And I navigate to root folder on Content page
        And I "select" checkbox for "SDMS-5988-L1F1" in Content Table
        Then I see "Download" button is "active" on the action ribbon
        And I click "Download" button on the action ribbon
        And I wait until file "SDMS-5988-L1F1-1.zip" downloaded
        And I see file "SDMS-5988-L1F1-1.zip" downloaded and the size is "491,497 Bytes"
        And I extract the downloaded "SDMS-5988-L1F1-1.zip" zip folder
        And I see below folders in extracted folder
            | FolderName       |
            | SDMS-5988-L1F1-1 |
        And I see below files in "SDMS-5988-L1F1-1"  extracted zip folder
            | File_Names                      |
            | 2022-01-28 14-16-00+05-30-01.dx |
            | 2022-01-28 14-16-00+05-30-01.rx |
            | AMX01.amx                       |
            | Sampler_1_DEABC50000_1.scml     |
            | SeqRun2.acaml                   |
            | SeqRun2.mfx                     |
            | SeqRun2.sqx                     |
        # | ACQ-1.amx                   |
        # | Calibration.rdl             |
        # | LC-RES-2.acaml              |
        # | LC-RES-2.mfx                |
        # | LC-SEQ.sqx                  |
        # | Line-001.dx                 |
        # | Line-001.rx                 |
        # | Line-001_1.pdf              |
        # | New method 1.pmx            |
        # | Sampler_1_DEABC50000_1.scml |
        # And I see "LC-RES-2.mfx" mfx file contains entries of below files
        And I see "SeqRun2.mfx" mfx file contains entries of below files
            | File_Names                      |
            | 2022-01-28 14-16-00+05-30-01.dx |
            | 2022-01-28 14-16-00+05-30-01.rx |
            | AMX01.amx                       |
            | Sampler_1_DEABC50000_1.scml     |
            | SeqRun2.acaml                   |
            | SeqRun2.sqx                     |

# | ACQ-1.amx                   |
# | Calibration.rdl             |
# | LC-RES-2.acaml              |
# | LC-SEQ.sqx                  |
# | Line-001.dx                 |
# | Line-001.rx                 |
# | Line-001_1.pdf              |
# | New method 1.pmx            |
# | Sampler_1_DEABC50000_1.scml |