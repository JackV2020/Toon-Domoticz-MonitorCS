import QtQuick 2.1
import qb.components 1.0
import BasicUIControls 1.0

Screen {
    id: root
    screenTitle: qsTr("low and high limits ( <= low  ...  >= high )")

    property bool activeMe
    
    property bool loAlarm0
    property bool loAlarm1
    property bool loAlarm2
    property bool loAlarm3
    property bool loAlarm4
    property bool loAlarm5   
    property bool loAlarm6
    property bool loAlarm7
    property bool loAlarm8
    property bool loAlarm9
    property bool loAlarm10
    property bool loAlarm11
    property bool loAlarm12
    property bool loAlarm13
    property bool loAlarm14
    property bool loAlarm15
    property bool loAlarm16
    property bool loAlarm17

    property bool hiAlarm0
    property bool hiAlarm1
    property bool hiAlarm2
    property bool hiAlarm3
    property bool hiAlarm4
    property bool hiAlarm5
    property bool hiAlarm6
    property bool hiAlarm7
    property bool hiAlarm8
    property bool hiAlarm9
    property bool hiAlarm10
    property bool hiAlarm11
    property bool hiAlarm12
    property bool hiAlarm13
    property bool hiAlarm14
    property bool hiAlarm15
    property bool hiAlarm16
    property bool hiAlarm17

    property int setWidth  : isNxt ? 290 : 232
    property int setHeight : isNxt ? 440 : 352

    property string setColor  : "lightgreen"
    property string textColor  : "black"
    property int insetTopMargin : isNxt ? 35 : 28

    property int fieldHeight : isNxt ? 35 : 28
//    property int fieldLimWidth : isNxt ? 100 : 80
    property int fieldLimWidth : isNxt ? 125 : 100
    
    property string    activeColor: "lightgrey"
    property string    hoverColor: "lightblue"
    property string    selectedColor : "yellow"
    property string    loAlarmColor : "#6666ff"
    property string    hiAlarmColor : "#ff6666"
  
    property int fieldheightV1 : 28
    property int fieldheightV2 : 35
    
    property int fieldwidthV1 : 140
    property int fieldwidthV2 : 175
    
    onVisibleChanged: {
        if (visible) {
            addCustomTopRightButton("Save");
            activeMe = true
            refreshScreen()
        } else {
            activeMe = false
        }
    }

    onCustomButtonClicked: {
        app.saveSettings();
        hide();
    }

// Timer in ms

	Timer {
		id: datetimeTimer
		interval: 1000;
		running: activeMe
		repeat: true
		onTriggered: refreshScreen()
	}  

    function refreshScreen() {
    
        app.readDomoticzdevicesData()

        device0Label.text = app.deviceName[0];
        device1Label.text = app.deviceName[1];
        device2Label.text = app.deviceName[2];
        device3Label.text = app.deviceName[3];
        device4Label.text = app.deviceName[4];
        device5Label.text = app.deviceName[5];

        device6Label.text = app.deviceName[6];
        device7Label.text = app.deviceName[7];
        device8Label.text = app.deviceName[8];
        device9Label.text = app.deviceName[9];
        device10Label.text = app.deviceName[10];
        device11Label.text = app.deviceName[11];


        device12Label.text = app.deviceName[12];
        device13Label.text = app.deviceName[13];
        device14Label.text = app.deviceName[14];
        device15Label.text = app.deviceName[15];
        device16Label.text = app.deviceName[16];
        device17Label.text = app.deviceName[17];

        device0Lolim.selected = app.deviceLolim[0] != ""
        device1Lolim.selected = app.deviceLolim[1] != ""
        device2Lolim.selected = app.deviceLolim[2] != ""
        device3Lolim.selected = app.deviceLolim[3] != ""
        device4Lolim.selected = app.deviceLolim[4] != ""
        device5Lolim.selected = app.deviceLolim[5] != ""
        device6Lolim.selected = app.deviceLolim[6] != ""
        device7Lolim.selected = app.deviceLolim[7] != ""
        device8Lolim.selected = app.deviceLolim[8] != ""
        device9Lolim.selected = app.deviceLolim[9] != ""
        device10Lolim.selected = app.deviceLolim[10] != ""
        device11Lolim.selected = app.deviceLolim[11] != ""
        device12Lolim.selected = app.deviceLolim[12] != ""
        device13Lolim.selected = app.deviceLolim[13] != ""
        device14Lolim.selected = app.deviceLolim[14] != ""
        device15Lolim.selected = app.deviceLolim[15] != ""
        device16Lolim.selected = app.deviceLolim[16] != ""
        device17Lolim.selected = app.deviceLolim[17] != ""

        device0Hilim.selected = app.deviceHilim[0] != ""
        device1Hilim.selected = app.deviceHilim[1] != ""
        device2Hilim.selected = app.deviceHilim[2] != ""
        device3Hilim.selected = app.deviceHilim[3] != ""
        device4Hilim.selected = app.deviceHilim[4] != ""
        device5Hilim.selected = app.deviceHilim[5] != ""
        device6Hilim.selected = app.deviceHilim[6] != ""
        device7Hilim.selected = app.deviceHilim[7] != ""
        device8Hilim.selected = app.deviceHilim[8] != ""
        device9Hilim.selected = app.deviceHilim[9] != ""
        device10Hilim.selected = app.deviceHilim[10] != ""
        device11Hilim.selected = app.deviceHilim[11] != ""
        device12Hilim.selected = app.deviceHilim[12] != ""
        device13Hilim.selected = app.deviceHilim[13] != ""
        device14Hilim.selected = app.deviceHilim[14] != ""
        device15Hilim.selected = app.deviceHilim[15] != ""
        device16Hilim.selected = app.deviceHilim[16] != ""
        device17Hilim.selected = app.deviceHilim[17] != ""

        device0Lolim.buttonText = app.deviceLolim[0];
        device1Lolim.buttonText = app.deviceLolim[1];
        device2Lolim.buttonText = app.deviceLolim[2];
        device3Lolim.buttonText = app.deviceLolim[3];
        device4Lolim.buttonText = app.deviceLolim[4];
        device5Lolim.buttonText = app.deviceLolim[5];

        device6Lolim.buttonText = app.deviceLolim[6];
        device7Lolim.buttonText = app.deviceLolim[7];
        device8Lolim.buttonText = app.deviceLolim[8];
        device9Lolim.buttonText = app.deviceLolim[9];
        device10Lolim.buttonText = app.deviceLolim[10];
        device11Lolim.buttonText = app.deviceLolim[11];

        device12Lolim.buttonText = app.deviceLolim[12];
        device13Lolim.buttonText = app.deviceLolim[13];
        device14Lolim.buttonText = app.deviceLolim[14];
        device15Lolim.buttonText = app.deviceLolim[15];
        device16Lolim.buttonText = app.deviceLolim[16];
        device17Lolim.buttonText = app.deviceLolim[17];

        device0Hilim.buttonText = app.deviceHilim[0];
        device1Hilim.buttonText = app.deviceHilim[1];
        device2Hilim.buttonText = app.deviceHilim[2];
        device3Hilim.buttonText = app.deviceHilim[3];
        device4Hilim.buttonText = app.deviceHilim[4];
        device5Hilim.buttonText = app.deviceHilim[5];

        device6Hilim.buttonText = app.deviceHilim[6];
        device7Hilim.buttonText = app.deviceHilim[7];
        device8Hilim.buttonText = app.deviceHilim[8];
        device9Hilim.buttonText = app.deviceHilim[9];
        device10Hilim.buttonText = app.deviceHilim[10];
        device11Hilim.buttonText = app.deviceHilim[11];


        device12Hilim.buttonText = app.deviceHilim[12];
        device13Hilim.buttonText = app.deviceHilim[13];
        device14Hilim.buttonText = app.deviceHilim[14];
        device15Hilim.buttonText = app.deviceHilim[15];
        device16Hilim.buttonText = app.deviceHilim[16];
        device17Hilim.buttonText = app.deviceHilim[17];

        loAlarm0 = app.deviceLoAlarm[0]
        loAlarm1 = app.deviceLoAlarm[1]
        loAlarm2 = app.deviceLoAlarm[2]
        loAlarm3 = app.deviceLoAlarm[3]
        loAlarm4 = app.deviceLoAlarm[4]
        loAlarm5 = app.deviceLoAlarm[5]
        loAlarm6 = app.deviceLoAlarm[6]
        loAlarm7 = app.deviceLoAlarm[7]
        loAlarm8 = app.deviceLoAlarm[8]
        loAlarm9 = app.deviceLoAlarm[9]
        loAlarm10 = app.deviceLoAlarm[10]
        loAlarm11 = app.deviceLoAlarm[11]
        loAlarm12 = app.deviceLoAlarm[12]
        loAlarm13 = app.deviceLoAlarm[13]
        loAlarm14 = app.deviceLoAlarm[14]
        loAlarm15 = app.deviceLoAlarm[15]
        loAlarm16 = app.deviceLoAlarm[16]
        loAlarm17 = app.deviceLoAlarm[17]

        hiAlarm0 = app.deviceHiAlarm[0]
        hiAlarm1 = app.deviceHiAlarm[1]
        hiAlarm2 = app.deviceHiAlarm[2]
        hiAlarm3 = app.deviceHiAlarm[3]
        hiAlarm4 = app.deviceHiAlarm[4]
        hiAlarm5 = app.deviceHiAlarm[5]
        hiAlarm6 = app.deviceHiAlarm[6]
        hiAlarm7 = app.deviceHiAlarm[7]
        hiAlarm8 = app.deviceHiAlarm[8]
        hiAlarm9 = app.deviceHiAlarm[9]
        hiAlarm10 = app.deviceHiAlarm[10]
        hiAlarm11 = app.deviceHiAlarm[11]
        hiAlarm12 = app.deviceHiAlarm[12]
        hiAlarm13 = app.deviceHiAlarm[13]
        hiAlarm14 = app.deviceHiAlarm[14]
        hiAlarm15 = app.deviceHiAlarm[15]
        hiAlarm16 = app.deviceHiAlarm[16]
        hiAlarm17 = app.deviceHiAlarm[17]
        
    }
    
    
    function saveLolim0(text) {
        if (text) {
            app.deviceLolim[0] = text.trim();
            refreshScreen()
        }
    }

    function saveLolim1(text) {
        if (text) {
            app.deviceLolim[1] = text.trim();
            refreshScreen()
        }
    }

    function saveLolim2(text) {
        if (text) {
            app.deviceLolim[2] = text.trim();
            refreshScreen()
        }
    }

    function saveLolim3(text) {
        if (text) {
            app.deviceLolim[3] = text.trim();
            refreshScreen()
        }
    }

    function saveLolim4(text) {
        if (text) {
            app.deviceLolim[4] = text.trim();
            refreshScreen()
        }
    }

    function saveLolim5(text) {
        if (text) {
            app.deviceLolim[5] = text.trim();
            refreshScreen()
        }
    }

    function saveLolim6(text) {
        if (text) {
            app.deviceLolim[6] = text.trim();
            refreshScreen()
        }
    }

    function saveLolim7(text) {
        if (text) {
            app.deviceLolim[7] = text.trim();
            refreshScreen()
        }
    }

    function saveLolim8(text) {
        if (text) {
            app.deviceLolim[8] = text.trim();
            refreshScreen()
        }
    }

    function saveLolim9(text) {
        if (text) {
            app.deviceLolim[9] = text.trim();
            refreshScreen()
        }
    }

    function saveLolim10(text) {
        if (text) {
            app.deviceLolim[10] = text.trim();
            refreshScreen()
        }
    }

    function saveLolim11(text) {
        if (text) {
            app.deviceLolim[11] = text.trim();
            refreshScreen()
        }
    }

    function saveLolim12(text) {
        if (text) {
            app.deviceLolim[12] = text.trim();
            refreshScreen()
        }
    }

    function saveLolim13(text) {
        if (text) {
            app.deviceLolim[13] = text.trim();
            refreshScreen()
        }
    }

    function saveLolim14(text) {
        if (text) {
            app.deviceLolim[14] = text.trim();
            refreshScreen()
        }
    }

    function saveLolim15(text) {
        if (text) {
            app.deviceLolim[15] = text.trim();
            refreshScreen()
        }
    }

    function saveLolim16(text) {
        if (text) {
            app.deviceLolim[16] = text.trim();
            refreshScreen()
        }
    }

    function saveLolim17(text) {
        if (text) {
            app.deviceLolim[17] = text.trim();
            refreshScreen()
        }
    }


    function saveHilim0(text) {
        if (text) {
            app.deviceHilim[0] = text.trim();
            refreshScreen()
        }
    }

    function saveHilim1(text) {
        if (text) {
            app.deviceHilim[1] = text.trim();
            refreshScreen()
        }
    }

    function saveHilim2(text) {
        if (text) {
            app.deviceHilim[2] = text.trim();
            refreshScreen()
        }
    }

    function saveHilim3(text) {
        if (text) {
            app.deviceHilim[3] = text.trim();
            refreshScreen()
        }
    }

    function saveHilim4(text) {
        if (text) {
            app.deviceHilim[4] = text.trim();
            refreshScreen()
        }
    }

    function saveHilim5(text) {
        if (text) {
            app.deviceHilim[5] = text.trim();
            refreshScreen()
        }
    }

    function saveHilim6(text) {
        if (text) {
            app.deviceHilim[6] = text.trim();
            refreshScreen()
        }
    }

    function saveHilim7(text) {
        if (text) {
            app.deviceHilim[7] = text.trim();
            refreshScreen()
        }
    }

    function saveHilim8(text) {
        if (text) {
            app.deviceHilim[8] = text.trim();
            refreshScreen()
        }
    }

    function saveHilim9(text) {
        if (text) {
            app.deviceHilim[9] = text.trim();
            refreshScreen()
        }
    }

    function saveHilim10(text) {
        if (text) {
            app.deviceHilim[10] = text.trim();
            refreshScreen()
        }
    }

    function saveHilim11(text) {
        if (text) {
            app.deviceHilim[11] = text.trim();
            refreshScreen()
        }
    }

    function saveHilim12(text) {
        if (text) {
            app.deviceHilim[12] = text.trim();
            refreshScreen()
        }
    }

    function saveHilim13(text) {
        if (text) {
            app.deviceHilim[13] = text.trim();
            refreshScreen()
        }
    }

    function saveHilim14(text) {
        if (text) {
            app.deviceHilim[14] = text.trim();
            refreshScreen()
        }
    }

    function saveHilim15(text) {
        if (text) {
            app.deviceHilim[15] = text.trim();
            refreshScreen()
        }
    }

    function saveHilim16(text) {
        if (text) {
            app.deviceHilim[16] = text.trim();
            refreshScreen()
        }
    }

    function saveHilim17(text) {
        if (text) {
            app.deviceHilim[17] = text.trim();
            refreshScreen()
        }
    }
// --------------------------------------------------- Settings Button

    YaLabel {
        id: settingsButton
        buttonText:  "Domoticz communication and idx settings"
        height: isNxt ? fieldheightV2 : fieldheightV1
//        width: isNxt ? fieldwidthV2 : fieldwidthV1
        width: setWidth * 2
// select highlight color for settings button
        buttonActiveColor: hoverColor
        buttonHoverColor: hoverColor
        buttonSelectedColor : selectedColor
        enabled : true
        selected : false
        textColor : "black"
        buttonBorderWidth: 2
//        buttonBorderColor: "red"
        anchors {
            bottom : parent.bottom
            horizontalCenter: parent.horizontalCenter
            bottomMargin: isNxt ? 15 : 12
        }
        onClicked: {
            stage.openFullscreen(app.domoticzURL);
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
            top:        parent.top
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
            top:              set1.top
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
            top:         set1.top
            rightMargin: isNxt ? 30 : 24
        }
        border {
            width : 1
            color : textColor
        }
    }

// ------------------------------------------------------- Devices block 1

    Text {
        id: device0Label
        text: ""
        anchors {
            top: set1.top
            horizontalCenter: set1.horizontalCenter
            topMargin: 10
        }
        color: textColor
        font {
            pixelSize: isNxt ? 25 : 20
            family: qfont.bold.name
        }
    }

    Text {
        id: device1Label
        text: ""
        anchors {
            top: device0Label.bottom
            horizontalCenter: set1.horizontalCenter
            topMargin: insetTopMargin
        }
        color: textColor
        font {
            pixelSize: isNxt ? 25 : 20
            family: qfont.bold.name
        }
    }

    Text {
        id: device2Label
        text: ""
        anchors {
            top: device1Label.bottom
            horizontalCenter: set1.horizontalCenter
            topMargin: insetTopMargin
        }
        color: textColor
        font {
            pixelSize: isNxt ? 25 : 20
            family: qfont.bold.name
        }
    }

    Text {
        id: device3Label
        text: ""
        anchors {
            top: device2Label.bottom
            horizontalCenter: set1.horizontalCenter
            topMargin: insetTopMargin
        }
        color: textColor
        font {
            pixelSize: isNxt ? 25 : 20
            family: qfont.bold.name
        }
    }

    Text {
        id: device4Label
        text: ""
        anchors {
            top: device3Label.bottom
            horizontalCenter: set1.horizontalCenter
            topMargin: insetTopMargin
        }
        color: textColor
        font {
            pixelSize: isNxt ? 25 : 20
            family: qfont.bold.name
        }
    }

    Text {
        id: device5Label
        text: ""
        anchors {
            top: device4Label.bottom
            horizontalCenter: set1.horizontalCenter
            topMargin: insetTopMargin
        }
        color: textColor
        font {
            pixelSize: isNxt ? 25 : 20
            family: qfont.bold.name
        }
    }

// ------------------------------------------------------- Devices block 2

    Text {
        id: device6Label
        text: ""
        anchors {
            top: set2.top
            horizontalCenter: set2.horizontalCenter
            topMargin: 10
        }
        color: textColor
        font {
            pixelSize: isNxt ? 25 : 20
            family: qfont.bold.name
        }
    }

    Text {
        id: device7Label
        text: ""
        anchors {
            top: device6Label.bottom
            horizontalCenter: set2.horizontalCenter
            topMargin: insetTopMargin
        }
        color: textColor
        font {
            pixelSize: isNxt ? 25 : 20
            family: qfont.bold.name
        }
    }

    Text {
        id: device8Label
        text: ""
        anchors {
            top: device7Label.bottom
            horizontalCenter: set2.horizontalCenter
            topMargin: insetTopMargin
        }
        color: textColor
        font {
            pixelSize: isNxt ? 25 : 20
            family: qfont.bold.name
        }
    }

    Text {
        id: device9Label
        text: ""
        anchors {
            top: device8Label.bottom
            horizontalCenter: set2.horizontalCenter
            topMargin: insetTopMargin
        }
        color: textColor
        font {
            pixelSize: isNxt ? 25 : 20
            family: qfont.bold.name
        }
    }

    Text {
        id: device10Label
        text: ""
        anchors {
            top: device9Label.bottom
            horizontalCenter: set2.horizontalCenter
            topMargin: insetTopMargin
        }
        color: textColor
        font {
            pixelSize: isNxt ? 25 : 20
            family: qfont.bold.name
        }
    }

    Text {
        id: device11Label
        text: ""
        anchors {
            top: device10Label.bottom
            horizontalCenter: set2.horizontalCenter
            topMargin: insetTopMargin
        }
        color: textColor
        font {
            pixelSize: isNxt ? 25 : 20
            family: qfont.bold.name
        }
    }


// ------------------------------------------------------- Devices block 3

    Text {
        id: device12Label
        text: ""
        anchors {
            top: set3.top
            horizontalCenter: set3.horizontalCenter
            topMargin: 10
        }
        color: textColor
        font {
            pixelSize: isNxt ? 25 : 20
            family: qfont.bold.name
        }
    }

    Text {
        id: device13Label
        text: ""
        anchors {
            top: device12Label.bottom
            horizontalCenter: set3.horizontalCenter
            topMargin: insetTopMargin
        }
        color: textColor
        font {
            pixelSize: isNxt ? 25 : 20
            family: qfont.bold.name
        }
    }

    Text {
        id: device14Label
        text: ""
        anchors {
            top: device13Label.bottom
            horizontalCenter: set3.horizontalCenter
            topMargin: insetTopMargin
        }
        color: textColor
        font {
            pixelSize: isNxt ? 25 : 20
            family: qfont.bold.name
        }
    }

    Text {
        id: device15Label
        text: ""
        anchors {
            top: device14Label.bottom
            horizontalCenter: set3.horizontalCenter
            topMargin: insetTopMargin
        }
        color: textColor
        font {
            pixelSize: isNxt ? 25 : 20
            family: qfont.bold.name
        }
    }

    Text {
        id: device16Label
        text: ""
        anchors {
            top: device15Label.bottom
            horizontalCenter: set3.horizontalCenter
            topMargin: insetTopMargin
        }
        color: textColor
        font {
            pixelSize: isNxt ? 25 : 20
            family: qfont.bold.name
        }
    }

    Text {
        id: device17Label
        text: ""
        anchors {
            top: device16Label.bottom
            horizontalCenter: set3.horizontalCenter
            topMargin: insetTopMargin
        }
        color: textColor
        font {
            pixelSize: isNxt ? 25 : 20
            family: qfont.bold.name
        }
    }

// ------------------------------------------------------- deviceLolim block 1

    YaLabel {
        id: device0Lolim
        buttonText:  ""
        height: fieldHeight
        width: fieldLimWidth
        buttonActiveColor: activeColor
        buttonHoverColor: hoverColor
        buttonSelectedColor : ( loAlarm0 ) ? loAlarmColor : selectedColor
        enabled : true
        textColor : "black"
        anchors {
            left: set1.left
            top: device0Label.bottom
            leftMargin: isNxt ? 5 : 4
        }
        onClicked: {
            qkeyboard.open("The lower limit for '" + app.deviceName[0]+"'", device0Lolim.buttonText, saveLolim0);
        }
    }

    YaLabel {
        id: device1Lolim
        buttonText:  ""
        height: fieldHeight
        width: fieldLimWidth
        buttonActiveColor: activeColor
        buttonHoverColor: hoverColor
        buttonSelectedColor : ( loAlarm1 ) ? loAlarmColor : selectedColor
        enabled : true
        textColor : "black"
        anchors {
            left: set1.left
            top: device1Label.bottom
            leftMargin: isNxt ? 5 : 4
        }
        onClicked: {
            qkeyboard.open("The lower limit for '" + app.deviceName[1]+"'", device1Lolim.buttonText, saveLolim1);
        }
    }

    YaLabel {
        id: device2Lolim
        buttonText:  ""
        height: fieldHeight
        width: fieldLimWidth
        buttonActiveColor: activeColor
        buttonHoverColor: hoverColor
        buttonSelectedColor : ( loAlarm2 ) ? loAlarmColor : selectedColor
        enabled : true
        textColor : "black"
        anchors {
            left: set1.left
            top: device2Label.bottom
            leftMargin: isNxt ? 5 : 4
        }
        onClicked: {
            qkeyboard.open("The lower limit for '" + app.deviceName[2]+"'", device2Lolim.buttonText, saveLolim2);
        }
    }

    YaLabel {
        id: device3Lolim
        buttonText:  ""
        height: fieldHeight
        width: fieldLimWidth
        buttonActiveColor: activeColor
        buttonHoverColor: hoverColor
        buttonSelectedColor : ( loAlarm3 ) ? loAlarmColor : selectedColor
        enabled : true
        textColor : "black"
        anchors {
            left: set1.left
            top: device3Label.bottom
            leftMargin: isNxt ? 5 : 4
        }
        onClicked: {
            qkeyboard.open("The lower limit for '" + app.deviceName[3]+"'", device3Lolim.buttonText, saveLolim3);
        }
    }

    YaLabel {
        id: device4Lolim
        buttonText:  ""
        height: fieldHeight
        width: fieldLimWidth
        buttonActiveColor: activeColor
        buttonHoverColor: hoverColor
        buttonSelectedColor : ( loAlarm4 ) ? loAlarmColor : selectedColor
        enabled : true
        textColor : "black"
        anchors {
            left: set1.left
            top: device4Label.bottom
            leftMargin: isNxt ? 5 : 4
        }
        onClicked: {
            qkeyboard.open("The lower limit for '" + app.deviceName[4]+"'", device4Lolim.buttonText, saveLolim4);
        }
    }

    YaLabel {
        id: device5Lolim
        buttonText:  ""
        height: fieldHeight
        width: fieldLimWidth
        buttonActiveColor: activeColor
        buttonHoverColor: hoverColor
        buttonSelectedColor : ( loAlarm5 ) ? loAlarmColor : selectedColor
        enabled : true
        textColor : "black"
        anchors {
            left: set1.left
            top: device5Label.bottom
            leftMargin: isNxt ? 5 : 4
        }
        onClicked: {
            qkeyboard.open("The lower limit for '" + app.deviceName[5]+"'", device5Lolim.buttonText, saveLolim5);
        }
    }


// ------------------------------------------------------- deviceLolim block 2

    YaLabel {
        id: device6Lolim
        buttonText:  ""
        height: fieldHeight
        width: fieldLimWidth
        buttonActiveColor: activeColor
        buttonHoverColor: hoverColor
        buttonSelectedColor : ( loAlarm6 ) ? loAlarmColor : selectedColor
        enabled : true
        textColor : "black"
        anchors {
            left: set2.left
            top: device6Label.bottom
            leftMargin: isNxt ? 5 : 4
        }
        onClicked: {
            qkeyboard.open("The lower limit for '" + app.deviceName[6]+"'", device6Lolim.buttonText, saveLolim6);
        }
    }

    YaLabel {
        id: device7Lolim
        buttonText:  ""
        height: fieldHeight
        width: fieldLimWidth
        buttonActiveColor: activeColor
        buttonHoverColor: hoverColor
        buttonSelectedColor : ( loAlarm7 ) ? loAlarmColor : selectedColor
        enabled : true
        textColor : "black"
        anchors {
            left: set2.left
            top: device7Label.bottom
            leftMargin: isNxt ? 5 : 4
        }
        onClicked: {
            qkeyboard.open("The lower limit for '" + app.deviceName[7]+"'", device7Lolim.buttonText, saveLolim7);
        }
    }

    YaLabel {
        id: device8Lolim
        buttonText:  ""
        height: fieldHeight
        width: fieldLimWidth
        buttonActiveColor: activeColor
        buttonHoverColor: hoverColor
        buttonSelectedColor : ( loAlarm8 ) ? loAlarmColor : selectedColor
        enabled : true
        textColor : "black"
        anchors {
            left: set2.left
            top: device8Label.bottom
            leftMargin: isNxt ? 5 : 4
        }
        onClicked: {
            qkeyboard.open("The lower limit for '" + app.deviceName[8]+"'", device8Lolim.buttonText, saveLolim8);
        }
    }

    YaLabel {
        id: device9Lolim
        buttonText:  ""
        height: fieldHeight
        width: fieldLimWidth
        buttonActiveColor: activeColor
        buttonHoverColor: hoverColor
        buttonSelectedColor : ( loAlarm9 ) ? loAlarmColor : selectedColor
        enabled : true
        textColor : "black"
        anchors {
            left: set2.left
            top: device9Label.bottom
            leftMargin: isNxt ? 5 : 4
        }
        onClicked: {
            qkeyboard.open("The lower limit for '" + app.deviceName[9]+"'", device9Lolim.buttonText, saveLolim9);
        }
    }

    YaLabel {
        id: device10Lolim
        buttonText:  ""
        height: fieldHeight
        width: fieldLimWidth
        buttonActiveColor: activeColor
        buttonHoverColor: hoverColor
        buttonSelectedColor : ( loAlarm10 ) ? loAlarmColor : selectedColor
        enabled : true
        textColor : "black"
        anchors {
            left: set2.left
            top: device10Label.bottom
            leftMargin: isNxt ? 5 : 4
        }
        onClicked: {
            qkeyboard.open("The lower limit for '" + app.deviceName[10]+"'", device10Lolim.buttonText, saveLolim10);
        }
    }

    YaLabel {
        id: device11Lolim
        buttonText:  ""
        height: fieldHeight
        width: fieldLimWidth
        buttonActiveColor: activeColor
        buttonHoverColor: hoverColor
        buttonSelectedColor : ( loAlarm11 ) ? loAlarmColor : selectedColor
        enabled : true
        textColor : "black"
        anchors {
            left: set2.left
            top: device11Label.bottom
            leftMargin: isNxt ? 5 : 4
        }
        onClicked: {
            qkeyboard.open("The lower limit for '" + app.deviceName[11]+"'", device11Lolim.buttonText, saveLolim11);
        }
    }


// ------------------------------------------------------- deviceLolim block 3

    YaLabel {
        id: device12Lolim
        buttonText:  ""
        height: fieldHeight
        width: fieldLimWidth
        buttonActiveColor: activeColor
        buttonHoverColor: hoverColor
        buttonSelectedColor : ( loAlarm12 ) ? loAlarmColor : selectedColor
        enabled : true
        textColor : "black"
        anchors {
            left: set3.left
            top: device12Label.bottom
            leftMargin: isNxt ? 5 : 4
        }
        onClicked: {
            qkeyboard.open("The lower limit for '" + app.deviceName[12]+"'", device12Lolim.buttonText, saveLolim12);
        }
    }

    YaLabel {
        id: device13Lolim
        buttonText:  ""
        height: fieldHeight
        width: fieldLimWidth
        buttonActiveColor: activeColor
        buttonHoverColor: hoverColor
        buttonSelectedColor : ( loAlarm13 ) ? loAlarmColor : selectedColor
        enabled : true
        textColor : "black"
        anchors {
            left: set3.left
            top: device13Label.bottom
            leftMargin: isNxt ? 5 : 4
        }
        onClicked: {
            qkeyboard.open("The lower limit for '" + app.deviceName[13]+"'", device13Lolim.buttonText, saveLolim13);
        }
    }

    YaLabel {
        id: device14Lolim
        buttonText:  ""
        height: fieldHeight
        width: fieldLimWidth
        buttonActiveColor: activeColor
        buttonHoverColor: hoverColor
        buttonSelectedColor : ( loAlarm14 ) ? loAlarmColor : selectedColor
        enabled : true
        textColor : "black"
        anchors {
            left: set3.left
            top: device14Label.bottom
            leftMargin: isNxt ? 5 : 4
        }
        onClicked: {
            qkeyboard.open("The lower limit for '" + app.deviceName[14]+"'", device14Lolim.buttonText, saveLolim14);
        }
    }

    YaLabel {
        id: device15Lolim
        buttonText:  ""
        height: fieldHeight
        width: fieldLimWidth
        buttonActiveColor: activeColor
        buttonHoverColor: hoverColor
        buttonSelectedColor : ( loAlarm15 ) ? loAlarmColor : selectedColor
        enabled : true
        textColor : "black"
        anchors {
            left: set3.left
            top: device15Label.bottom
            leftMargin: isNxt ? 5 : 4
        }
        onClicked: {
            qkeyboard.open("The lower limit for '" + app.deviceName[15]+"'", device15Lolim.buttonText, saveLolim15);
        }
    }

    YaLabel {
        id: device16Lolim
        buttonText:  ""
        height: fieldHeight
        width: fieldLimWidth
        buttonActiveColor: activeColor
        buttonHoverColor: hoverColor
        buttonSelectedColor : ( loAlarm16 ) ? loAlarmColor : selectedColor
        enabled : true
        textColor : "black"
        anchors {
            left: set3.left
            top: device16Label.bottom
            leftMargin: isNxt ? 5 : 4
        }
        onClicked: {
            qkeyboard.open("The lower limit for '" + app.deviceName[16]+"'", device16Lolim.buttonText, saveLolim16);
        }
    }

    YaLabel {
        id: device17Lolim
        buttonText:  ""
        height: fieldHeight
        width: fieldLimWidth
        buttonActiveColor: activeColor
        buttonHoverColor: hoverColor
        buttonSelectedColor : ( loAlarm17 ) ? loAlarmColor : selectedColor
        enabled : true
        textColor : "black"
        anchors {
            left: set3.left
            top: device17Label.bottom
            leftMargin: isNxt ? 5 : 4
        }
        onClicked: {
            qkeyboard.open("The lower limit for '" + app.deviceName[17]+"'", device17Lolim.buttonText, saveLolim17);
        }
    }

// ------------------------------------------------------- deviceHilim block 1

    YaLabel {
        id: device0Hilim
        buttonText:  ""
        height: fieldHeight
        width: fieldLimWidth
        buttonActiveColor: activeColor
        buttonHoverColor: hoverColor
//        buttonSelectedColor : ( hiAlarm0 ) ? hiAlarmColor : selectedColor
        buttonSelectedColor : ( hiAlarm0 ) ? hiAlarmColor : selectedColor
//        buttonSelectedColor : ( true ) ? hiAlarmColor : selectedColor
        enabled : true
        textColor : "black"
        anchors {
            right: set1.right
            top: device0Label.bottom
            rightMargin: isNxt ? 5 : 4
        }
        onClicked: {
            qkeyboard.open("The higher limit for '" + app.deviceName[0]+"'", device0Hilim.buttonText, saveHilim0);
        }
    }

    YaLabel {
        id: device1Hilim
        buttonText:  ""
        height: fieldHeight
        width: fieldLimWidth
        buttonActiveColor: activeColor
        buttonHoverColor: hoverColor
        buttonSelectedColor : ( hiAlarm1 ) ? hiAlarmColor : selectedColor
        enabled : true
        textColor : "black"
        anchors {
            right: set1.right
            top: device1Label.bottom
            rightMargin: isNxt ? 5 : 4
        }
        onClicked: {
            qkeyboard.open("The higher limit for '" + app.deviceName[1]+"'", device1Hilim.buttonText, saveHilim1);
        }
    }

    YaLabel {
        id: device2Hilim
        buttonText:  ""
        height: fieldHeight
        width: fieldLimWidth
        buttonActiveColor: activeColor
        buttonHoverColor: hoverColor
        buttonSelectedColor : ( hiAlarm2 ) ? hiAlarmColor : selectedColor
        enabled : true
        textColor : "black"
        anchors {
            right: set1.right
            top: device2Label.bottom
            rightMargin: isNxt ? 5 : 4
        }
        onClicked: {
            qkeyboard.open("The higher limit for '" + app.deviceName[2]+"'", device2Hilim.buttonText, saveHilim2);
        }
    }

    YaLabel {
        id: device3Hilim
        buttonText:  ""
        height: fieldHeight
        width: fieldLimWidth
        buttonActiveColor: activeColor
        buttonHoverColor: hoverColor
        buttonSelectedColor : ( hiAlarm3 ) ? hiAlarmColor : selectedColor
        enabled : true
        textColor : "black"
        anchors {
            right: set1.right
            top: device3Label.bottom
            rightMargin: isNxt ? 5 : 4
        }
        onClicked: {
            qkeyboard.open("The higher limit for '" + app.deviceName[3]+"'", device3Hilim.buttonText, saveHilim3);
        }
    }

    YaLabel {
        id: device4Hilim
        buttonText:  ""
        height: fieldHeight
        width: fieldLimWidth
        buttonActiveColor: activeColor
        buttonHoverColor: hoverColor
        buttonSelectedColor : ( hiAlarm4 ) ? hiAlarmColor : selectedColor
        enabled : true
        textColor : "black"
        anchors {
            right: set1.right
            top: device4Label.bottom
            rightMargin: isNxt ? 5 : 4
        }
        onClicked: {
            qkeyboard.open("The higher limit for '" + app.deviceName[4]+"'", device4Hilim.buttonText, saveHilim4);
        }
    }

    YaLabel {
        id: device5Hilim
        buttonText:  ""
        height: fieldHeight
        width: fieldLimWidth
        buttonActiveColor: activeColor
        buttonHoverColor: hoverColor
        buttonSelectedColor : ( hiAlarm5 ) ? hiAlarmColor : selectedColor
        enabled : true
        textColor : "black"
        anchors {
            right: set1.right
            top: device5Label.bottom
            rightMargin: isNxt ? 5 : 4
        }
        onClicked: {
            qkeyboard.open("The higher limit for '" + app.deviceName[5]+"'", device5Hilim.buttonText, saveHilim5);
        }
    }


// ------------------------------------------------------- deviceHilim block 2

    YaLabel {
        id: device6Hilim
        buttonText:  ""
        height: fieldHeight
        width: fieldLimWidth
        buttonActiveColor: activeColor
        buttonHoverColor: hoverColor
        buttonSelectedColor : ( hiAlarm6 ) ? hiAlarmColor : selectedColor
        enabled : true
        textColor : "black"
        anchors {
            right: set2.right
            top: device6Label.bottom
            rightMargin: isNxt ? 5 : 4
        }
        onClicked: {
            qkeyboard.open("The higher limit for '" + app.deviceName[6]+"'", device6Hilim.buttonText, saveHilim6);
        }
    }

    YaLabel {
        id: device7Hilim
        buttonText:  ""
        height: fieldHeight
        width: fieldLimWidth
        buttonActiveColor: activeColor
        buttonHoverColor: hoverColor
        buttonSelectedColor : ( hiAlarm7 ) ? hiAlarmColor : selectedColor
        enabled : true
        textColor : "black"
        anchors {
            right: set2.right
            top: device7Label.bottom
            rightMargin: isNxt ? 5 : 4
        }
        onClicked: {
            qkeyboard.open("The higher limit for '" + app.deviceName[7]+"'", device7Hilim.buttonText, saveHilim7);
        }
    }

    YaLabel {
        id: device8Hilim
        buttonText:  ""
        height: fieldHeight
        width: fieldLimWidth
        buttonActiveColor: activeColor
        buttonHoverColor: hoverColor
        buttonSelectedColor : ( hiAlarm8 ) ? hiAlarmColor : selectedColor
        enabled : true
        textColor : "black"
        anchors {
            right: set2.right
            top: device8Label.bottom
            rightMargin: isNxt ? 5 : 4
        }
        onClicked: {
            qkeyboard.open("The higher limit for '" + app.deviceName[8]+"'", device8Hilim.buttonText, saveHilim8);
        }
    }

    YaLabel {
        id: device9Hilim
        buttonText:  ""
        height: fieldHeight
        width: fieldLimWidth
        buttonActiveColor: activeColor
        buttonHoverColor: hoverColor
        buttonSelectedColor : ( hiAlarm9 ) ? hiAlarmColor : selectedColor
        enabled : true
        textColor : "black"
        anchors {
            right: set2.right
            top: device9Label.bottom
            rightMargin: isNxt ? 5 : 4
        }
        onClicked: {
            qkeyboard.open("The higher limit for '" + app.deviceName[9]+"'", device9Hilim.buttonText, saveHilim9);
        }
    }

    YaLabel {
        id: device10Hilim
        buttonText:  ""
        height: fieldHeight
        width: fieldLimWidth
        buttonActiveColor: activeColor
        buttonHoverColor: hoverColor
        buttonSelectedColor : ( hiAlarm10 ) ? hiAlarmColor : selectedColor
        enabled : true
        textColor : "black"
        anchors {
            right: set2.right
            top: device10Label.bottom
            rightMargin: isNxt ? 5 : 4
        }
        onClicked: {
            qkeyboard.open("The higher limit for '" + app.deviceName[10]+"'", device10Hilim.buttonText, saveHilim10);
        }
    }

    YaLabel {
        id: device11Hilim
        buttonText:  ""
        height: fieldHeight
        width: fieldLimWidth
        buttonActiveColor: activeColor
        buttonHoverColor: hoverColor
        buttonSelectedColor : ( hiAlarm11 ) ? hiAlarmColor : selectedColor
        enabled : true
        textColor : "black"
        anchors {
            right: set2.right
            top: device11Label.bottom
            rightMargin: isNxt ? 5 : 4
        }
        onClicked: {
            qkeyboard.open("The higher limit for '" + app.deviceName[11]+"'", device11Hilim.buttonText, saveHilim11);
        }
    }


// ------------------------------------------------------- deviceHilim block 3

    YaLabel {
        id: device12Hilim
        buttonText:  ""
        height: fieldHeight
        width: fieldLimWidth
        buttonActiveColor: activeColor
        buttonHoverColor: hoverColor
        buttonSelectedColor : ( hiAlarm12 ) ? hiAlarmColor : selectedColor
        enabled : true
        textColor : "black"
        anchors {
            right: set3.right
            top: device12Label.bottom
            rightMargin: isNxt ? 5 : 4
        }
        onClicked: {
            qkeyboard.open("The higher limit for '" + app.deviceName[12]+"'", device12Hilim.buttonText, saveHilim12);
        }
    }

    YaLabel {
        id: device13Hilim
        buttonText:  ""
        height: fieldHeight
        width: fieldLimWidth
        buttonActiveColor: activeColor
        buttonHoverColor: hoverColor
        buttonSelectedColor : ( hiAlarm13 ) ? hiAlarmColor : selectedColor
        enabled : true
        textColor : "black"
        anchors {
            right: set3.right
            top: device13Label.bottom
            rightMargin: isNxt ? 5 : 4
        }
        onClicked: {
            qkeyboard.open("The higher limit for '" + app.deviceName[13]+"'", device13Hilim.buttonText, saveHilim13);
        }
    }

    YaLabel {
        id: device14Hilim
        buttonText:  ""
        height: fieldHeight
        width: fieldLimWidth
        buttonActiveColor: activeColor
        buttonHoverColor: hoverColor
        buttonSelectedColor : ( hiAlarm14 ) ? hiAlarmColor : selectedColor
        enabled : true
        textColor : "black"
        anchors {
            right: set3.right
            top: device14Label.bottom
            rightMargin: isNxt ? 5 : 4
        }
        onClicked: {
            qkeyboard.open("The higher limit for '" + app.deviceName[14]+"'", device14Hilim.buttonText, saveHilim14);
        }
    }

    YaLabel {
        id: device15Hilim
        buttonText:  ""
        height: fieldHeight
        width: fieldLimWidth
        buttonActiveColor: activeColor
        buttonHoverColor: hoverColor
        buttonSelectedColor : ( hiAlarm15 ) ? hiAlarmColor : selectedColor
        enabled : true
        textColor : "black"
        anchors {
            right: set3.right
            top: device15Label.bottom
            rightMargin: isNxt ? 5 : 4
        }
        onClicked: {
            qkeyboard.open("The higher limit for '" + app.deviceName[15]+"'", device15Hilim.buttonText, saveHilim15);
        }
    }

    YaLabel {
        id: device16Hilim
        buttonText:  ""
        height: fieldHeight
        width: fieldLimWidth
        buttonActiveColor: activeColor
        buttonHoverColor: hoverColor
        buttonSelectedColor : ( hiAlarm16 ) ? hiAlarmColor : selectedColor
        enabled : true
        textColor : "black"
        anchors {
            right: set3.right
            top: device16Label.bottom
            rightMargin: isNxt ? 5 : 4
        }
        onClicked: {
            qkeyboard.open("The higher limit for '" + app.deviceName[16]+"'", device16Hilim.buttonText, saveHilim16);
        }
    }

    YaLabel {
        id: device17Hilim
        buttonText:  ""
        height: fieldHeight
        width: fieldLimWidth
        buttonActiveColor: activeColor
        buttonHoverColor: hoverColor
        buttonSelectedColor : ( hiAlarm17 ) ? hiAlarmColor : selectedColor
        enabled : true
        textColor : "black"
        anchors {
            right: set3.right
            top: device17Label.bottom
            rightMargin: isNxt ? 5 : 4
        }
        onClicked: {
            qkeyboard.open("The higher limit for '" + app.deviceName[17]+"'", device17Hilim.buttonText, saveHilim17);
        }
    }

// end    
}
