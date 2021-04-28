import QtQuick 2.1
import qb.components 1.0
import BasicUIControls 1.0

Screen {
	id: root
	screenTitle: qsTr("Domoticz Settings")
    
    property int fieldHeightHeader : isNxt ? 35 : 28
    property int fieldWidhtHeader : isNxt ? 250 : 200

    property int setWidth  : isNxt ? 290 : 232
    property int setHeight : isNxt ? 325 : 260

    property string setColor  : "lightblue"

    property int fieldHeight : isNxt ? 30 : 24
    property int fieldNameWidth : isNxt ? 160 : 128
    property int fieldIdxWidth : isNxt ? 70 : 52
    property int insetTopMargin : isNxt ? 15 : 12
    property int insetSideMargin : isNxt ? 20 : 16

	property string	activeColor: "lightgrey"
	property string	hoverColor: "lightblue"
	property string	selectedColor : "yellow"

    property string     trueColor: "lightgreen"
    property string     falseColor: "#EF3C40"

    property bool   activeMe

    onVisibleChanged: {
        if (visible) {
            addCustomTopRightButton("Save");
            refreshScreen()
            activeMe = true
        } else { 
            activeMe = false
        }
    }

// Save button

	onCustomButtonClicked: {
		app.saveSettings();
		hide();
	}

// ---------- Timer and refresh routine

// Timer in ms

	Timer {
		id: datetimeTimer
		interval: 5000;
		running: activeMe
		repeat: true
		onTriggered: refreshScreen()
	}  

    function refreshScreen() {

        app.readDomoticzdevicesData()

        domoticzIP.buttonText = app.ipAddress
        domoticzPort.buttonText = app.httpPort

        domoticzInterval.buttonText = app.interval;
        
        domoticzUser.buttonText = app.user;
        domoticzPassword.buttonText = "********";

        if (app.showCountDown) {
            domoticzCountDown.buttonText = "Count Down"
            domoticzCountDown.buttonActiveColor = trueColor
        } else {
            domoticzCountDown.buttonText = "No Count Down"
            domoticzCountDown.buttonActiveColor = falseColor
        }

		idx1Label.buttonText = app.deviceIdx[0];
		idx2Label.buttonText = app.deviceIdx[1];
		idx3Label.buttonText = app.deviceIdx[2];
		idx4Label.buttonText = app.deviceIdx[3];
		idx5Label.buttonText = app.deviceIdx[4];
		idx6Label.buttonText = app.deviceIdx[5];

		idx7Label.buttonText = app.deviceIdx[6];
		idx8Label.buttonText = app.deviceIdx[7];
		idx9Label.buttonText = app.deviceIdx[8];
		idx10Label.buttonText = app.deviceIdx[9];
		idx11Label.buttonText = app.deviceIdx[10];
		idx12Label.buttonText = app.deviceIdx[11];

		idx13Label.buttonText = app.deviceIdx[12];
		idx14Label.buttonText = app.deviceIdx[13];
		idx15Label.buttonText = app.deviceIdx[14];
		idx16Label.buttonText = app.deviceIdx[15];
		idx17Label.buttonText = app.deviceIdx[16];
		idx18Label.buttonText = app.deviceIdx[17];

		device1Label.buttonText = app.deviceName[0];
		device2Label.buttonText = app.deviceName[1];
		device3Label.buttonText = app.deviceName[2];
		device4Label.buttonText = app.deviceName[3];
		device5Label.buttonText = app.deviceName[4];
		device6Label.buttonText = app.deviceName[5];

		device7Label.buttonText = app.deviceName[6];
		device8Label.buttonText = app.deviceName[7];
		device9Label.buttonText = app.deviceName[8];
		device10Label.buttonText = app.deviceName[9];
		device11Label.buttonText = app.deviceName[10];
		device12Label.buttonText = app.deviceName[11];

		device13Label.buttonText = app.deviceName[12];
		device14Label.buttonText = app.deviceName[13];
		device15Label.buttonText = app.deviceName[14];
		device16Label.buttonText = app.deviceName[15];
		device17Label.buttonText = app.deviceName[16];
		device18Label.buttonText = app.deviceName[17];

    }

// ----------------------------------------------------- Save IP Address

	function saveipAddress(text) {
        if (text) {
            if ( ( text.trim() == "" ) || (/^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/.test(text.trim()) ) ) {  
//                domoticzIP.buttonText = text.trim();
                app.ipAddress = text.trim();
            }
        }
	}

	function saveipPort(text) {
		if (text) {
            if ( parseInt(text) > 0 ) {
//                domoticzPort.buttonText = parseInt(text);
                app.httpPort = parseInt(text);
            }
		}
	}

	function saveUser(text) {
		if (text) {
//			domoticzUser.buttonText = text;
			app.user = text;
		}
	}

	function savePwd(text) {
		if (text) {
			app.pwd = text;
		}
	}

	function saveInterval(text) {
		if (text) {
            if ( parseInt(text) > 4 ) {
                domoticzInterval.buttonText = parseInt(text);
                app.interval = parseInt(text);
            } else {
                domoticzInterval.buttonText = "5"
                app.interval = 5
            }
		}
	}

// ----------------------------------------------------- Save idx values


	function saveIdx1(text) {
		if (text) {
            if (text.trim() != idx1Label.buttonText ) {
                idx1Label.buttonText = text.trim();
                app.deviceIdx[0] = text.trim();
                if (text.trim() == "" ) { saveDevice1(" ") }
                else { saveDevice1("..wait......") }
            }
		}
	}

	function saveIdx2(text) {
		if (text) {
            if (text.trim() != idx2Label.buttonText ) {
                idx2Label.buttonText = text.trim();
                app.deviceIdx[1] = text.trim();
                if (text.trim() == "" ) { saveDevice2(" ") }
                else { saveDevice2("..wait......") }
            }
		}
	}
	function saveIdx3(text) {
		if (text) {
            if (text.trim() != idx3Label.buttonText ) {
                idx3Label.buttonText = text.trim();
                app.deviceIdx[2] = text.trim();
                if (text.trim() == "" ) { saveDevice3(" ") }
                else { saveDevice3("..wait......") }
            }
		}
	}
	function saveIdx4(text) {
		if (text) {
            if (text.trim() != idx4Label.buttonText ) {
                idx4Label.buttonText = text.trim();
                app.deviceIdx[3] = text.trim();
                if (text.trim() == "" ) { saveDevice4(" ") }
                else { saveDevice4("..wait......") }
            }
		}
	}
	function saveIdx5(text) {
		if (text) {
            if (text.trim() != idx5Label.buttonText ) {
                idx5Label.buttonText = text.trim();
                app.deviceIdx[4] = text.trim();
                if (text.trim() == "" ) { saveDevice5(" ") }
                else { saveDevice5("..wait......") }
            }
		}
	}
	function saveIdx6(text) {
		if (text) {
            if (text.trim() != idx6Label.buttonText ) {
                idx6Label.buttonText = text.trim();
                app.deviceIdx[5] = text.trim();
                if (text.trim() == "" ) { saveDevice6(" ") }
                else { saveDevice6("..wait......") }
            }
		}
	}
	function saveIdx7(text) {
		if (text) {
            if (text.trim() != idx7Label.buttonText ) {
                idx7Label.buttonText = text.trim();
                app.deviceIdx[6] = text.trim();
                if (text.trim() == "" ) { saveDevice7(" ") }
                else { saveDevice7("..wait......") }
            }
		}
	}
	function saveIdx8(text) {
		if (text) {
            if (text.trim() != idx8Label.buttonText ) {
                idx8Label.buttonText = text.trim();
                app.deviceIdx[7] = text.trim();
                if (text.trim() == "" ) { saveDevice8(" ") }
                else { saveDevice8("..wait......") }
            }
		}
	}
	function saveIdx9(text) {
		if (text) {
            if (text.trim() != idx9Label.buttonText ) {
                idx9Label.buttonText = text.trim();
                app.deviceIdx[8] = text.trim();
                if (text.trim() == "" ) { saveDevice9(" ") }
                else { saveDevice9("..wait......") }
            }
		}
	}
	function saveIdx10(text) {
		if (text) {
            if (text.trim() != idx10Label.buttonText ) {
                idx10Label.buttonText = text.trim();
                app.deviceIdx[9] = text.trim();
                if (text.trim() == "" ) { saveDevice10(" ") }
                else { saveDevice10("..wait......") }
            }
		}
	}
	function saveIdx11(text) {
		if (text) {
            if (text.trim() != idx11Label.buttonText ) {
                idx11Label.buttonText = text.trim();
                app.deviceIdx[10] = text.trim();
                if (text.trim() == "" ) { saveDevice11(" ") }
                else { saveDevice11("..wait......") }
            }
		}
	}
	function saveIdx12(text) {
		if (text) {
            if (text.trim() != idx12Label.buttonText ) {
                idx12Label.buttonText = text.trim();
                app.deviceIdx[11] = text.trim();
                if (text.trim() == "" ) { saveDevice12(" ") }
                else { saveDevice12("..wait......") }
            }
		}
	}
	function saveIdx13(text) {
		if (text) {
            if (text.trim() != idx13Label.buttonText ) {
                idx13Label.buttonText = text.trim();
                app.deviceIdx[12] = text.trim();
                if (text.trim() == "" ) { saveDevice13(" ") }
                else { saveDevice13("..wait......") }
            }
		}
	}
	function saveIdx14(text) {
		if (text) {
            if (text.trim() != idx14Label.buttonText ) {
                idx14Label.buttonText = text.trim();
                app.deviceIdx[13] = text.trim();
                if (text.trim() == "" ) { saveDevice14(" ") }
                else { saveDevice14("..wait......") }
            }
		}
	}
	function saveIdx15(text) {
		if (text) {
            if (text.trim() != idx15Label.buttonText ) {
                idx15Label.buttonText = text.trim();
                app.deviceIdx[14] = text.trim();
                if (text.trim() == "" ) { saveDevice15(" ") }
                else { saveDevice15("..wait......") }
            }
		}
	}
	function saveIdx16(text) {
		if (text) {
            if (text.trim() != idx16Label.buttonText ) {
                idx16Label.buttonText = text.trim();
                app.deviceIdx[15] = text.trim();
                if (text.trim() == "" ) { saveDevice16(" ") }
                else { saveDevice16("..wait......") }
            }
		}
	}
	function saveIdx17(text) {
		if (text) {
            if (text.trim() != idx17Label.buttonText ) {
                idx17Label.buttonText = text.trim();
                app.deviceIdx[16] = text.trim();
                if (text.trim() == "" ) { saveDevice17(" ") }
                else { saveDevice17("..wait......") }
            }
		}
	}
	function saveIdx18(text) {
		if (text) {
            if (text.trim() != idx18Label.buttonText ) {
                idx18Label.buttonText = text.trim();
                app.deviceIdx[17] = text.trim();
                if (text.trim() == "" ) { saveDevice18(" ") }
                else { saveDevice18("..wait......") }
            }
		}
	}

// --------------------------------------------------- Save device names

	function saveDevice1(text) {
		if (text) {
			device1Label.buttonText = text.trim();
			app.deviceName[0] = text.trim();
		}
	}

	function saveDevice2(text) {
		if (text) {
			device2Label.buttonText = text.trim();
			app.deviceName[1] = text.trim();
		}
	}

	function saveDevice3(text) {
		if (text) {
			device3Label.buttonText = text.trim();
			app.deviceName[2] = text.trim();
		}
	}

	function saveDevice4(text) {
		if (text) {
			device4Label.buttonText = text.trim();
			app.deviceName[3] = text.trim();
		}
	}

	function saveDevice5(text) {
		if (text) {
			device5Label.buttonText = text.trim();
			app.deviceName[4] = text.trim();
		}
	}

	function saveDevice6(text) {
		if (text) {
			device6Label.buttonText = text.trim();
			app.deviceName[5] = text.trim();
		}
	}

	function saveDevice7(text) {
		if (text) {
			device7Label.buttonText = text.trim();
			app.deviceName[6] = text.trim();
		}
	}

	function saveDevice8(text) {
		if (text) {
			device8Label.buttonText = text.trim();
			app.deviceName[7] = text.trim();
		}
	}

	function saveDevice9(text) {
		if (text) {
			device9Label.buttonText = text.trim();
			app.deviceName[8] = text.trim();
		}
	}

	function saveDevice10(text) {
		if (text) {
			device10Label.buttonText = text.trim();
			app.deviceName[9] = text.trim();
		}
	}

	function saveDevice11(text) {
		if (text) {
			device11Label.buttonText = text.trim();
			app.deviceName[10] = text.trim();
		}
	}

	function saveDevice12(text) {
		if (text) {
			device12Label.buttonText = text.trim();
			app.deviceName[11] = text.trim();
		}
	}

	function saveDevice13(text) {
		if (text) {
			device13Label.buttonText = text.trim();
			app.deviceName[12] = text.trim();
		}
	}

	function saveDevice14(text) {
		if (text) {
			device14Label.buttonText = text.trim();
			app.deviceName[13] = text.trim();
		}
	}

	function saveDevice15(text) {
		if (text) {
			device15Label.buttonText = text.trim();
			app.deviceName[14] = text.trim();
		}
	}

	function saveDevice16(text) {
		if (text) {
			device16Label.buttonText = text.trim();
			app.deviceName[15] = text.trim();
		}
	}

	function saveDevice17(text) {
		if (text) {
			device17Label.buttonText = text.trim();
			app.deviceName[16] = text.trim();
		}
	}

	function saveDevice18(text) {
		if (text) {
			device18Label.buttonText = text.trim();
			app.deviceName[17] = text.trim();
		}
	}

// ------------------------------------------------------- IP address

    Text {
        id: ipAddressLabel
        text: "IP Address"
        anchors {
            top: parent.top
//            topMargin: isNxt ? 20 : 16
            horizontalCenter: set1.horizontalCenter
        }
        font {
            pixelSize: isNxt ? 20 : 16
            family: qfont.bold.name
        }
    }

    YaLabel {
        id: domoticzIP
        buttonText:  ""
        height: fieldHeightHeader
        width: fieldWidhtHeader
        buttonActiveColor: activeColor
        buttonHoverColor: hoverColor
        buttonSelectedColor : selectedColor
        enabled : true
        selected : false
        textColor : "black"
        buttonBorderWidth: 2
        anchors {
            top: ipAddressLabel.bottom
            horizontalCenter: set1.horizontalCenter
        }
        onClicked: {
			qkeyboard.open("The IP address of the Domoticz server", domoticzIP.buttonText, saveipAddress)
        }
    }

// ------------------------------------------------------- IP Port

    Text {
        id: portLabel
        text: "Port"
        anchors {
            top: domoticzIP.bottom
            topMargin: isNxt ? 10 : 8
            horizontalCenter: set1.horizontalCenter
        }
        font {
            pixelSize: isNxt ? 20 : 16
            family: qfont.bold.name
        }
    }

    YaLabel {
        id: domoticzPort
        buttonText:  ""
        height: fieldHeightHeader
        width: fieldWidhtHeader
        buttonActiveColor: activeColor
        buttonHoverColor: hoverColor
        buttonSelectedColor : selectedColor
        enabled : true
        selected : false
        textColor : "black"
        buttonBorderWidth: 2
        anchors {
            top: portLabel.bottom
            horizontalCenter: set1.horizontalCenter
        }
        onClicked: {
			qkeyboard.open("The IP port of the Domoticz server", domoticzPort.buttonText, saveipPort)
        }
    }

// ------------------------------------------------------- Interval

    Text {
        id: intervalLabel
        text: "Interval"
        anchors {
            top: parent.top
//            topMargin: isNxt ? 20 : 16
            horizontalCenter: set2.horizontalCenter
        }
        font {
            pixelSize: isNxt ? 20 : 16
            family: qfont.bold.name
        }
    }

    YaLabel {
        id: domoticzInterval
        buttonText:  ""
        height: fieldHeightHeader
        width: fieldWidhtHeader
        buttonActiveColor: activeColor
        buttonHoverColor: hoverColor
        buttonSelectedColor : selectedColor
        enabled : true
        selected : false
        textColor : "black"
        buttonBorderWidth: 2
        anchors {
            top: intervalLabel.bottom
            horizontalCenter: set2.horizontalCenter
        }
        onClicked: {
			qkeyboard.open("The data refresh interval", domoticzInterval.buttonText, saveInterval)
        }
    }


// ------------------------------------------------------- Show countdown

    Text {
        id: countdownText
        text: "Countdown on Tile?"
        anchors {
            top: domoticzInterval.bottom
            topMargin: isNxt ? 10 : 8
            horizontalCenter: set2.horizontalCenter
        }
        font {
            pixelSize: isNxt ? 20 : 16
            family: qfont.bold.name
        }
    }

    YaLabel {
        id: domoticzCountDown
        buttonText:  ""
        height: fieldHeightHeader
        width: fieldWidhtHeader
        buttonActiveColor: activeColor
        buttonHoverColor: hoverColor
        buttonSelectedColor : selectedColor
        enabled : true
        selected : false
        textColor : "black"
        buttonBorderWidth: 2
        anchors {
            top: countdownText.bottom
            horizontalCenter: set2.horizontalCenter
        }
        onClicked: {
            app.showCountDown = ! app.showCountDown
            refreshScreen()
        }
    }

// ------------------------------------------------------- User

    Text {
        id: userLabel
        text: "User"
        anchors {
            top: parent.top
//            topMargin: isNxt ? 20 : 16
            horizontalCenter: set3.horizontalCenter
        }
        font {
            pixelSize: isNxt ? 20 : 16
            family: qfont.bold.name
        }
    }

    YaLabel {
        id: domoticzUser
        buttonText:  ""
        height: fieldHeightHeader
        width: fieldWidhtHeader
        buttonActiveColor: activeColor
        buttonHoverColor: hoverColor
        buttonSelectedColor : selectedColor
        enabled : true
        selected : false
        textColor : "black"
        buttonBorderWidth: 2
        anchors {
            top: userLabel.bottom
            horizontalCenter: set3.horizontalCenter
        }
        onClicked: {
			qkeyboard.open("The Username for the Domoticz server", domoticzUser.buttonText, saveUser)
        }
    }

// ------------------------------------------------------- Password

    Text {
        id: passwordLabel
        text: "Password"
        anchors {
            top: domoticzUser.bottom
            topMargin: isNxt ? 10 : 8
            horizontalCenter: set3.horizontalCenter
        }
        font {
            pixelSize: isNxt ? 20 : 16
            family: qfont.bold.name
        }
    }

    YaLabel {
        id: domoticzPassword
        buttonText:  ""
        height: fieldHeightHeader
        width: fieldWidhtHeader
        buttonActiveColor: activeColor
        buttonHoverColor: hoverColor
        buttonSelectedColor : selectedColor
        enabled : true
        selected : false
        textColor : "black"
        buttonBorderWidth: 2
        anchors {
            top: passwordLabel.bottom
            horizontalCenter: set3.horizontalCenter
        }
        onClicked: {
//			qkeyboard.open("The password for the Domoticz server", domoticzPassword.buttonText, savePwd)
			qkeyboard.open("The password for the Domoticz server", app.pwd, savePwd)
        }
    }

// ------------------------------------------------------- Rectangles

  Rectangle {
      id:     set1
      width:  setWidth
      height: setHeight
      color:  setColor
      radius: 5
  		anchors {
            left:       parent.left
            top:        domoticzPort.bottom
            topMargin:  isNxt ? 20 : 16
            leftMargin: isNxt ? 30 : 24
  		}
        border {
            width : 1
            color : textColor
        }
  }

  Rectangle {
      id:     set2
      width:  setWidth
      height: setHeight
      color:  setColor
      radius: 5
  		anchors {
  		  horizontalCenter: parent.horizontalCenter
          top:        set1.top
  		}
        border {
            width : 1
            color : textColor
        }
  }

  Rectangle {
      id:     set3
      width:  setWidth
      height: setHeight
      color:  setColor
      radius: 5
  		anchors {
  		  right:       parent.right
          top:        set1.top
        rightMargin: isNxt ? 30 : 24

  		}
        border {
            width : 1
            color : textColor
        }
  }





// ------------------------------------------------------- Message
	
	Text {
		id: userpwdWarningText
		text: "Note : User and/or Password change require a GUI restart"
		anchors {
            top: set1.bottom
            topMargin: isNxt ? 10 : 8
            horizontalCenter : set2.horizontalCenter
		}
		font {
            pixelSize: isNxt ? 25 : 20
			family: qfont.bold.name
		}
		color: "#ff0000"
	}

// ------------------------------------------------------- Idx block 1

    Text {
        id: idxText1
        text: "idx"
        anchors {
            top: set1.top
            topMargin: insetTopMargin
            horizontalCenter: idx1Label.horizontalCenter
        }
        font {
            pixelSize: isNxt ? 20 : 16
            family: qfont.bold.name
        }
    }

	YaLabel {
		id: idx1Label
		buttonText:  ""
		height: fieldHeight
		width: fieldIdxWidth
		buttonActiveColor: activeColor
		buttonHoverColor: hoverColor
		buttonSelectedColor : selectedColor
		enabled : true
		selected : false
		textColor : "black"
		anchors {
            left: set1.left
			top: idxText1.bottom
			topMargin: insetTopMargin
			leftMargin: insetSideMargin
			}
		onClicked: {
			qkeyboard.open("The idx for device 1", idx1Label.buttonText, saveIdx1);
		}
	}

	YaLabel {
		id: idx2Label
		buttonText:  ""
		height: fieldHeight
		width: fieldIdxWidth
		buttonActiveColor: activeColor
		buttonHoverColor: hoverColor
		buttonSelectedColor : selectedColor
		enabled : true
		selected : false
		textColor : "black"
		anchors {
            left: set1.left
			top: idx1Label.bottom
			topMargin: insetTopMargin
			leftMargin: insetSideMargin
			}
		onClicked: {
			qkeyboard.open("The idx for device 2", idx2Label.buttonText, saveIdx2);
		}
	}

	YaLabel {
		id: idx3Label
		buttonText:  ""
		height: fieldHeight
		width: fieldIdxWidth
		buttonActiveColor: activeColor
		buttonHoverColor: hoverColor
		buttonSelectedColor : selectedColor
		enabled : true
		selected : false
		textColor : "black"
		anchors {
            left: set1.left
			top: idx2Label.bottom
			topMargin: insetTopMargin
			leftMargin: insetSideMargin
			}
		onClicked: {
			qkeyboard.open("The idx for device 3", idx3Label.buttonText, saveIdx3);
		}
	}

	YaLabel {
		id: idx4Label
		buttonText:  ""
		height: fieldHeight
		width: fieldIdxWidth
		buttonActiveColor: activeColor
		buttonHoverColor: hoverColor
		buttonSelectedColor : selectedColor
		enabled : true
		selected : false
		textColor : "black"
		anchors {
            left: set1.left
			top: idx3Label.bottom
			topMargin: insetTopMargin
			leftMargin: insetSideMargin
			}
		onClicked: {
			qkeyboard.open("The idx for device 4", idx4Label.buttonText, saveIdx4);
		}
	}

	YaLabel {
		id: idx5Label
		buttonText:  ""
		height: fieldHeight
		width: fieldIdxWidth
		buttonActiveColor: activeColor
		buttonHoverColor: hoverColor
		buttonSelectedColor : selectedColor
		enabled : true
		selected : false
		textColor : "black"
		anchors {
            left: set1.left
			top: idx4Label.bottom
			topMargin: insetTopMargin
			leftMargin: insetSideMargin
			}
		onClicked: {
			qkeyboard.open("The idx for device 5", idx5Label.buttonText, saveIdx5);
		}
	}

	YaLabel {
		id: idx6Label
		buttonText:  ""
		height: fieldHeight
		width: fieldIdxWidth
		buttonActiveColor: activeColor
		buttonHoverColor: hoverColor
		buttonSelectedColor : selectedColor
		enabled : true
		selected : false
		textColor : "black"
		anchors {
            left: set1.left
			top: idx5Label.bottom
			topMargin: insetTopMargin
			leftMargin: insetSideMargin
			}
		onClicked: {
			qkeyboard.open("The idx for device 6", idx6Label.buttonText, saveIdx6);
		}
	}


// ------------------------------------------------------- Idx block 2


    Text {
        id: idxText2
        text: "idx"
        anchors {
            top: set2.top
            topMargin: insetTopMargin
            horizontalCenter: idx7Label.horizontalCenter
        }
        font {
            pixelSize: isNxt ? 20 : 16
            family: qfont.bold.name
        }
    }

	YaLabel {
		id: idx7Label
		buttonText:  ""
		height: fieldHeight
		width: fieldIdxWidth
		buttonActiveColor: activeColor
		buttonHoverColor: hoverColor
		buttonSelectedColor : selectedColor
		enabled : true
		selected : false
		textColor : "black"
		anchors {
            left: set2.left
			top: idxText2.bottom
			topMargin: insetTopMargin
			leftMargin: insetSideMargin
			}
		onClicked: {
			qkeyboard.open("The idx for device 7", idx7Label.buttonText, saveIdx7);
		}
	}

	YaLabel {
		id: idx8Label
		buttonText:  ""
		height: fieldHeight
		width: fieldIdxWidth
		buttonActiveColor: activeColor
		buttonHoverColor: hoverColor
		buttonSelectedColor : selectedColor
		enabled : true
		selected : false
		textColor : "black"
		anchors {
            left: set2.left
			top: idx7Label.bottom
			topMargin: insetTopMargin
			leftMargin: insetSideMargin
			}
		onClicked: {
			qkeyboard.open("The idx for device 8", idx8Label.buttonText, saveIdx8);
		}
	}

	YaLabel {
		id: idx9Label
		buttonText:  ""
		height: fieldHeight
		width: fieldIdxWidth
		buttonActiveColor: activeColor
		buttonHoverColor: hoverColor
		buttonSelectedColor : selectedColor
		enabled : true
		selected : false
		textColor : "black"
		anchors {
            left: set2.left
			top: idx2Label.bottom
			topMargin: insetTopMargin
			leftMargin: insetSideMargin
			}
		onClicked: {
			qkeyboard.open("The idx for device 9", idx9Label.buttonText, saveIdx9);
		}
	}

	YaLabel {
		id: idx10Label
		buttonText:  ""
		height: fieldHeight
		width: fieldIdxWidth
		buttonActiveColor: activeColor
		buttonHoverColor: hoverColor
		buttonSelectedColor : selectedColor
		enabled : true
		selected : false
		textColor : "black"
		anchors {
            left: set2.left
			top: idx3Label.bottom
			topMargin: insetTopMargin
			leftMargin: insetSideMargin
			}
		onClicked: {
			qkeyboard.open("The idx for device 10", idx10Label.buttonText, saveIdx10);
		}
	}

	YaLabel {
		id: idx11Label
		buttonText:  ""
		height: fieldHeight
		width: fieldIdxWidth
		buttonActiveColor: activeColor
		buttonHoverColor: hoverColor
		buttonSelectedColor : selectedColor
		enabled : true
		selected : false
		textColor : "black"
		anchors {
            left: set2.left
			top: idx4Label.bottom
			topMargin: insetTopMargin
			leftMargin: insetSideMargin
			}
		onClicked: {
			qkeyboard.open("The idx for device 11", idx11Label.buttonText, saveIdx11);
		}
	}

	YaLabel {
		id: idx12Label
		buttonText:  ""
		height: fieldHeight
		width: fieldIdxWidth
		buttonActiveColor: activeColor
		buttonHoverColor: hoverColor
		buttonSelectedColor : selectedColor
		enabled : true
		selected : false
		textColor : "black"
		anchors {
            left: set2.left
			top: idx5Label.bottom
			topMargin: insetTopMargin
			leftMargin: insetSideMargin
			}
		onClicked: {
			qkeyboard.open("The idx for device 12", idx12Label.buttonText, saveIdx12);
		}
	}


// ------------------------------------------------------- Idx block 3


    Text {
        id: idxText3
        text: "idx"
        anchors {
            top: set3.top
            topMargin: insetTopMargin
            horizontalCenter: idx13Label.horizontalCenter
        }
        font {
            pixelSize: isNxt ? 20 : 16
            family: qfont.bold.name
        }
    }

	YaLabel {
		id: idx13Label
		buttonText:  ""
		height: fieldHeight
		width: fieldIdxWidth
		buttonActiveColor: activeColor
		buttonHoverColor: hoverColor
		buttonSelectedColor : selectedColor
		enabled : true
		selected : false
		textColor : "black"
		anchors {
            left: set3.left
			top: idxText3.bottom
			topMargin: insetTopMargin
			leftMargin: insetSideMargin
			}
		onClicked: {
			qkeyboard.open("The idx for device 13", idx13Label.buttonText, saveIdx13);
		}
	}

	YaLabel {
		id: idx14Label
		buttonText:  ""
		height: fieldHeight
		width: fieldIdxWidth
		buttonActiveColor: activeColor
		buttonHoverColor: hoverColor
		buttonSelectedColor : selectedColor
		enabled : true
		selected : false
		textColor : "black"
		anchors {
            left: set3.left
			top: idx13Label.bottom
			topMargin: insetTopMargin
			leftMargin: insetSideMargin
			}
		onClicked: {
			qkeyboard.open("The idx for device 14", idx14Label.buttonText, saveIdx14);
		}
	}

	YaLabel {
		id: idx15Label
		buttonText:  ""
		height: fieldHeight
		width: fieldIdxWidth
		buttonActiveColor: activeColor
		buttonHoverColor: hoverColor
		buttonSelectedColor : selectedColor
		enabled : true
		selected : false
		textColor : "black"
		anchors {
            left: set3.left
			top: idx2Label.bottom
			topMargin: insetTopMargin
			leftMargin: insetSideMargin
			}
		onClicked: {
			qkeyboard.open("The idx for device 15", idx15Label.buttonText, saveIdx15);
		}
	}

	YaLabel {
		id: idx16Label
		buttonText:  ""
		height: fieldHeight
		width: fieldIdxWidth
		buttonActiveColor: activeColor
		buttonHoverColor: hoverColor
		buttonSelectedColor : selectedColor
		enabled : true
		selected : false
		textColor : "black"
		anchors {
            left: set3.left
			top: idx3Label.bottom
			topMargin: insetTopMargin
			leftMargin: insetSideMargin
			}
		onClicked: {
			qkeyboard.open("The idx for device 16", idx16Label.buttonText, saveIdx16);
		}
	}

	YaLabel {
		id: idx17Label
		buttonText:  ""
		height: fieldHeight
		width: fieldIdxWidth
		buttonActiveColor: activeColor
		buttonHoverColor: hoverColor
		buttonSelectedColor : selectedColor
		enabled : true
		selected : false
		textColor : "black"
		anchors {
            left: set3.left
			top: idx4Label.bottom
			topMargin: insetTopMargin
			leftMargin: insetSideMargin
			}
		onClicked: {
			qkeyboard.open("The idx for device 17", idx17Label.buttonText, saveIdx17);
		}
	}

	YaLabel {
		id: idx18Label
		buttonText:  ""
		height: fieldHeight
		width: fieldIdxWidth
		buttonActiveColor: activeColor
		buttonHoverColor: hoverColor
		buttonSelectedColor : selectedColor
		enabled : true
		selected : false
		textColor : "black"
		anchors {
            left: set3.left
			top: idx5Label.bottom
			topMargin: insetTopMargin
			leftMargin: insetSideMargin
			}
		onClicked: {
			qkeyboard.open("The idx for device 18", idx18Label.buttonText, saveIdx18);
            refreshScreen()
		}
	}

// ------------------------------------------------------- Device block 1

    Text {
        id: nameText1
        text: "Name"
        anchors {
            top: set1.top
            topMargin: insetTopMargin
            horizontalCenter: device1Label.horizontalCenter
        }
        font {
            pixelSize: isNxt ? 20 : 16
            family: qfont.bold.name
        }
    }
	
	YaLabel {
		id: device1Label
		buttonText:  ""
		height: fieldHeight
		width: fieldNameWidth
		buttonActiveColor: activeColor
		buttonHoverColor: hoverColor
		buttonSelectedColor : selectedColor
		enabled : true
		selected : false
		textColor : "black"
		anchors {
            right: set1.right
			top: nameText1.bottom
			topMargin: insetTopMargin
			rightMargin: insetSideMargin
			}
		onClicked: {
			qkeyboard.open("A short name for device 1", device1Label.buttonText, saveDevice1);
		}
	}

	YaLabel {
		id: device2Label
		buttonText:  ""
		height: fieldHeight
		width: fieldNameWidth
		buttonActiveColor: activeColor
		buttonHoverColor: hoverColor
		buttonSelectedColor : selectedColor
		enabled : true
		selected : false
		textColor : "black"
		anchors {
            right: set1.right
			top: device1Label.bottom
			topMargin: insetTopMargin
			rightMargin: insetSideMargin
			}
		onClicked: {
			qkeyboard.open("A short name for device 2", device2Label.buttonText, saveDevice2);
		}
	}

	YaLabel {
		id: device3Label
		buttonText:  ""
		height: fieldHeight
		width: fieldNameWidth
		buttonActiveColor: activeColor
		buttonHoverColor: hoverColor
		buttonSelectedColor : selectedColor
		enabled : true
		selected : false
		textColor : "black"
		anchors {
            right: set1.right
			top: device2Label.bottom
			topMargin: insetTopMargin
			rightMargin: insetSideMargin
			}
		onClicked: {
			qkeyboard.open("A short name for device 3", device3Label.buttonText, saveDevice3);
		}
	}

	YaLabel {
		id: device4Label
		buttonText:  ""
		height: fieldHeight
		width: fieldNameWidth
		buttonActiveColor: activeColor
		buttonHoverColor: hoverColor
		buttonSelectedColor : selectedColor
		enabled : true
		selected : false
		textColor : "black"
		anchors {
            right: set1.right
			top: device3Label.bottom
			topMargin: insetTopMargin
			rightMargin: insetSideMargin
			}
		onClicked: {
			qkeyboard.open("A short name for device 4", device4Label.buttonText, saveDevice4);
		}
	}

	YaLabel {
		id: device5Label
		buttonText:  ""
		height: fieldHeight
		width: fieldNameWidth
		buttonActiveColor: activeColor
		buttonHoverColor: hoverColor
		buttonSelectedColor : selectedColor
		enabled : true
		selected : false
		textColor : "black"
		anchors {
            right: set1.right
			top: device4Label.bottom
			topMargin: insetTopMargin
			rightMargin: insetSideMargin
			}
		onClicked: {
			qkeyboard.open("A short name for device 5", device5Label.buttonText, saveDevice5);
		}
	}

	YaLabel {
		id: device6Label
		buttonText:  ""
		height: fieldHeight
		width: fieldNameWidth
		buttonActiveColor: activeColor
		buttonHoverColor: hoverColor
		buttonSelectedColor : selectedColor
		enabled : true
		selected : false
		textColor : "black"
		anchors {
            right: set1.right
			top: device5Label.bottom
			topMargin: insetTopMargin
			rightMargin: insetSideMargin
			}
		onClicked: {
			qkeyboard.open("A short name for device 6", device6Label.buttonText, saveDevice6);
		}
	}

// ------------------------------------------------------- Device block 2

    Text {
        id: nameText2
        text: "Name"
        anchors {
            top: set2.top
            topMargin: insetTopMargin
            horizontalCenter: device7Label.horizontalCenter
        }
        font {
            pixelSize: isNxt ? 20 : 16
            family: qfont.bold.name
        }
    }
	
	YaLabel {
		id: device7Label
		buttonText:  ""
		height: fieldHeight
		width: fieldNameWidth
		buttonActiveColor: activeColor
		buttonHoverColor: hoverColor
		buttonSelectedColor : selectedColor
		enabled : true
		selected : false
		textColor : "black"
		anchors {
            right: set2.right
			top: nameText2.bottom
			topMargin: insetTopMargin
			rightMargin: insetSideMargin
			}
		onClicked: {
			qkeyboard.open("A short name for device 7", device7Label.buttonText, saveDevice7);
		}
	}

	YaLabel {
		id: device8Label
		buttonText:  ""
		height: fieldHeight
		width: fieldNameWidth
		buttonActiveColor: activeColor
		buttonHoverColor: hoverColor
		buttonSelectedColor : selectedColor
		enabled : true
		selected : false
		textColor : "black"
		anchors {
            right: set2.right
			top: device7Label.bottom
			topMargin: insetTopMargin
			rightMargin: insetSideMargin
			}
		onClicked: {
			qkeyboard.open("A short name for device 8", device8Label.buttonText, saveDevice8);
		}
	}

	YaLabel {
		id: device9Label
		buttonText:  ""
		height: fieldHeight
		width: fieldNameWidth
		buttonActiveColor: activeColor
		buttonHoverColor: hoverColor
		buttonSelectedColor : selectedColor
		enabled : true
		selected : false
		textColor : "black"
		anchors {
            right: set2.right
			top: device2Label.bottom
			topMargin: insetTopMargin
			rightMargin: insetSideMargin
			}
		onClicked: {
			qkeyboard.open("A short name for device 9", device9Label.buttonText, saveDevice9);
		}
	}

	YaLabel {
		id: device10Label
		buttonText:  ""
		height: fieldHeight
		width: fieldNameWidth
		buttonActiveColor: activeColor
		buttonHoverColor: hoverColor
		buttonSelectedColor : selectedColor
		enabled : true
		selected : false
		textColor : "black"
		anchors {
            right: set2.right
			top: device3Label.bottom
			topMargin: insetTopMargin
			rightMargin: insetSideMargin
			}
		onClicked: {
			qkeyboard.open("A short name for device 10", device10Label.buttonText, saveDevice10);
		}
	}

	YaLabel {
		id: device11Label
		buttonText:  ""
		height: fieldHeight
		width: fieldNameWidth
		buttonActiveColor: activeColor
		buttonHoverColor: hoverColor
		buttonSelectedColor : selectedColor
		enabled : true
		selected : false
		textColor : "black"
		anchors {
            right: set2.right
			top: device4Label.bottom
			topMargin: insetTopMargin
			rightMargin: insetSideMargin
			}
		onClicked: {
			qkeyboard.open("A short name for device 11", device11Label.buttonText, saveDevice11);
		}
	}

	YaLabel {
		id: device12Label
		buttonText:  ""
		height: fieldHeight
		width: fieldNameWidth
		buttonActiveColor: activeColor
		buttonHoverColor: hoverColor
		buttonSelectedColor : selectedColor
		enabled : true
		selected : false
		textColor : "black"
		anchors {
            right: set2.right
			top: device5Label.bottom
			topMargin: insetTopMargin
			rightMargin: insetSideMargin
			}
		onClicked: {
			qkeyboard.open("A short name for device 12", device12Label.buttonText, saveDevice12);
		}
	}

// ------------------------------------------------------- Device block 3


    Text {
        id: nameText3
        text: "Name"
        anchors {
            top: set3.top
            topMargin: insetTopMargin
            horizontalCenter: device13Label.horizontalCenter
        }
        font {
            pixelSize: isNxt ? 20 : 16
            family: qfont.bold.name
        }
    }
	
	YaLabel {
		id: device13Label
		buttonText:  ""
		height: fieldHeight
		width: fieldNameWidth
		buttonActiveColor: activeColor
		buttonHoverColor: hoverColor
		buttonSelectedColor : selectedColor
		enabled : true
		selected : false
		textColor : "black"
		anchors {
            right: set3.right
			top: nameText3.bottom
			topMargin: insetTopMargin
			rightMargin: insetSideMargin
			}
		onClicked: {
			qkeyboard.open("A short name for device 13", device13Label.buttonText, saveDevice13);
		}
	}

	YaLabel {
		id: device14Label
		buttonText:  ""
		height: fieldHeight
		width: fieldNameWidth
		buttonActiveColor: activeColor
		buttonHoverColor: hoverColor
		buttonSelectedColor : selectedColor
		enabled : true
		selected : false
		textColor : "black"
		anchors {
            right: set3.right
			top: device13Label.bottom
			topMargin: insetTopMargin
			rightMargin: insetSideMargin
			}
		onClicked: {
			qkeyboard.open("A short name for device 14", device14Label.buttonText, saveDevice14);
		}
	}

	YaLabel {
		id: device15Label
		buttonText:  ""
		height: fieldHeight
		width: fieldNameWidth
		buttonActiveColor: activeColor
		buttonHoverColor: hoverColor
		buttonSelectedColor : selectedColor
		enabled : true
		selected : false
		textColor : "black"
		anchors {
            right: set3.right
			top: device2Label.bottom
			topMargin: insetTopMargin
			rightMargin: insetSideMargin
			}
		onClicked: {
			qkeyboard.open("A short name for device 15", device15Label.buttonText, saveDevice15);
		}
	}

	YaLabel {
		id: device16Label
		buttonText:  ""
		height: fieldHeight
		width: fieldNameWidth
		buttonActiveColor: activeColor
		buttonHoverColor: hoverColor
		buttonSelectedColor : selectedColor
		enabled : true
		selected : false
		textColor : "black"
		anchors {
            right: set3.right
			top: device3Label.bottom
			topMargin: insetTopMargin
			rightMargin: insetSideMargin
			}
		onClicked: {
			qkeyboard.open("A short name for device 16", device16Label.buttonText, saveDevice16);
		}
	}

	YaLabel {
		id: device17Label
		buttonText:  ""
		height: fieldHeight
		width: fieldNameWidth
		buttonActiveColor: activeColor
		buttonHoverColor: hoverColor
		buttonSelectedColor : selectedColor
		enabled : true
		selected : false
		textColor : "black"
		anchors {
            right: set3.right
			top: device4Label.bottom
			topMargin: insetTopMargin
			rightMargin: insetSideMargin
			}
		onClicked: {
			qkeyboard.open("A short name for device 17", device17Label.buttonText, saveDevice17);
		}
	}

	YaLabel {
		id: device18Label
		buttonText:  ""
		height: fieldHeight
		width: fieldNameWidth
		buttonActiveColor: activeColor
		buttonHoverColor: hoverColor
		buttonSelectedColor : selectedColor
		enabled : true
		selected : false
		textColor : "black"
		anchors {
            right: set3.right
			top: device5Label.bottom
			topMargin: insetTopMargin
			rightMargin: insetSideMargin
			}
		onClicked: {
			qkeyboard.open("A short name for device 18", device18Label.buttonText, saveDevice18);
		}
	}


// end	
}
