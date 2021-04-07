import QtQuick 2.1
import qb.components 1.0
Tile {
	id: domoticzTile
	property bool dimState: screenStateController.dimmedColors

    onVisibleChanged: {
        if (visible) {
            app.activeMe = true
        } else { 
            app.activeMe = false
        }
    }

  Rectangle {
      width: domoticzTile.width
      height: domoticzTile.height
      color: ( app.alarmlow && app.alarmhigh ) ? app.lowhighTileColor : ( app.alarmlow ) ? app.lowTileColor : ( app.alarmhigh ) ? app.highTileColor : (canvas.dimState) ? "#000000" : "#ffffff"
      radius: 5
  }

	onClicked: {
		stage.openFullscreen(app.limitsURL);
	}
	
// Title ---------------------------------------------------------------

	Text {
		id: tiletitle
        width: domoticzTile.width
		text: (app.showCountDown) ? "Domoticz " + app.counter : "Domoticz"
		horizontalAlignment: Text.AlignHCenter
		anchors {
			baseline: parent.top
			baselineOffset: isNxt ? 30 : 24
		}
		font {
			family: qfont.bold.name
			pixelSize: isNxt ? 25 : 20
		}
        color: ( app.alarmlow && app.alarmhigh ) ? app.lowhighTileTextColor : ( app.alarmlow ) ? app.lowTileTextColor : ( app.alarmhigh ) ? app.highTileTextColor : (typeof dimmableColors !== 'undefined') ? dimmableColors.waTileTextColor : colors.waTileTextColor
	}

// colons as seperator between fieldnames and values--------------------

	Text {
		id: colon1
        text: ( app.device1 !== '' ) ? ":" : " "
        color: ( app.alarmlow && app.alarmhigh ) ? app.lowhighTileTextColor : ( app.alarmlow ) ? app.lowTileTextColor : ( app.alarmhigh ) ? app.highTileTextColor : (typeof dimmableColors !== 'undefined') ? dimmableColors.waTileTextColor : colors.waTileTextColor
		anchors {
			top: tiletitle.bottom
			horizontalCenter: parent.horizontalCenter
			leftMargin:  isNxt ? 10 : 8  
		}
		font.pixelSize: isNxt ? 20 : 16
		font.family: qfont.italic.name
	  font.bold: true
	}

	Text {
		id: colon2
        text: ( app.device2 !== '' )	? ":" : " "
        color: ( app.alarmlow && app.alarmhigh ) ? app.lowhighTileTextColor : ( app.alarmlow ) ? app.lowTileTextColor : ( app.alarmhigh ) ? app.highTileTextColor : (typeof dimmableColors !== 'undefined') ? dimmableColors.waTileTextColor : colors.waTileTextColor
		anchors {
			top: colon1.bottom
			horizontalCenter: parent.horizontalCenter
			leftMargin:  isNxt ? 10 : 8  
		}
		font.pixelSize: isNxt ? 20 : 16
		font.family: qfont.italic.name
	  font.bold: true
	}

	Text {
		id: colon3
        text: ( app.device3 !== '' )	? ":" : " "
        color: ( app.alarmlow && app.alarmhigh ) ? app.lowhighTileTextColor : ( app.alarmlow ) ? app.lowTileTextColor : ( app.alarmhigh ) ? app.highTileTextColor : (typeof dimmableColors !== 'undefined') ? dimmableColors.waTileTextColor : colors.waTileTextColor
		anchors {
			top: colon2.bottom
			horizontalCenter: parent.horizontalCenter
			leftMargin:  isNxt ? 10 : 8  
		}
		font.pixelSize: isNxt ? 20 : 16
		font.family: qfont.italic.name
	  font.bold: true
	}
	
	Text {
		id: colon4
        text: ( app.device4 !== '' )	? ":" : " "
        color: ( app.alarmlow && app.alarmhigh ) ? app.lowhighTileTextColor : ( app.alarmlow ) ? app.lowTileTextColor : ( app.alarmhigh ) ? app.highTileTextColor : (typeof dimmableColors !== 'undefined') ? dimmableColors.waTileTextColor : colors.waTileTextColor
		anchors {
			top: colon3.bottom
			horizontalCenter: parent.horizontalCenter
			leftMargin:  isNxt ? 10 : 8  
		}
		font.pixelSize: isNxt ? 20 : 16
		font.family: qfont.italic.name
	  font.bold: true
	}
	
	Text {
		id: colon5
        text: ( app.device5 !== '' )	? ":" : " "
        color: ( app.alarmlow && app.alarmhigh ) ? app.lowhighTileTextColor : ( app.alarmlow ) ? app.lowTileTextColor : ( app.alarmhigh ) ? app.highTileTextColor : (typeof dimmableColors !== 'undefined') ? dimmableColors.waTileTextColor : colors.waTileTextColor
		anchors {
			top: colon4.bottom
			horizontalCenter: parent.horizontalCenter
			leftMargin:  isNxt ? 10 : 8  
		}
		font.pixelSize: isNxt ? 20 : 16
		font.family: qfont.italic.name
	  font.bold: true
	}
	
	Text {
		id: colon6
        text: ( app.device6 !== '' )	? ":" : " "
        color: ( app.alarmlow && app.alarmhigh ) ? app.lowhighTileTextColor : ( app.alarmlow ) ? app.lowTileTextColor : ( app.alarmhigh ) ? app.highTileTextColor : (typeof dimmableColors !== 'undefined') ? dimmableColors.waTileTextColor : colors.waTileTextColor
		anchors {
			top: colon5.bottom
			horizontalCenter: parent.horizontalCenter
			leftMargin:  isNxt ? 10 : 8  
		}
		font.pixelSize: isNxt ? 20 : 16
		font.family: qfont.italic.name
	  font.bold: true
	}

// ---------- field names

	Text {
		id: device1field
		text: app.device1
        color: ( app.alarmlow && app.alarmhigh ) ? app.lowhighTileTextColor : ( app.alarmlow ) ? app.lowTileTextColor : ( app.alarmhigh ) ? app.highTileTextColor : (typeof dimmableColors !== 'undefined') ? dimmableColors.waTileTextColor : colors.waTileTextColor
		anchors {
			top: colon1.top
			right: colon1.left
			leftMargin:  isNxt ? 10 : 8  
		}
		font.pixelSize: isNxt ? 20 : 16
		font.family: qfont.italic.name
	  font.bold: true
	}

	Text {
		id: device2field
		text: app.device2
        color: ( app.alarmlow && app.alarmhigh ) ? app.lowhighTileTextColor : ( app.alarmlow ) ? app.lowTileTextColor : ( app.alarmhigh ) ? app.highTileTextColor : (typeof dimmableColors !== 'undefined') ? dimmableColors.waTileTextColor : colors.waTileTextColor
		anchors {
			top: colon2.top
			right: colon2.left
			leftMargin:  isNxt ? 10 : 8  
		}
		font.pixelSize: isNxt ? 20 : 16
		font.family: qfont.italic.name
	  font.bold: true
	}

	Text {
		id: device3field
		text: app.device3
        color: ( app.alarmlow && app.alarmhigh ) ? app.lowhighTileTextColor : ( app.alarmlow ) ? app.lowTileTextColor : ( app.alarmhigh ) ? app.highTileTextColor : (typeof dimmableColors !== 'undefined') ? dimmableColors.waTileTextColor : colors.waTileTextColor
		anchors {
			top: colon3.top
			right: colon3.left
			leftMargin:  isNxt ? 10 : 8  
		}
		font.pixelSize: isNxt ? 20 : 16
		font.family: qfont.italic.name
	  font.bold: true
	}

	Text {
		id: device4field
		text: app.device4
        color: ( app.alarmlow && app.alarmhigh ) ? app.lowhighTileTextColor : ( app.alarmlow ) ? app.lowTileTextColor : ( app.alarmhigh ) ? app.highTileTextColor : (typeof dimmableColors !== 'undefined') ? dimmableColors.waTileTextColor : colors.waTileTextColor
		anchors {
			top: colon4.top
			right: colon4.left
			leftMargin:  isNxt ? 10 : 8  
		}
		font.pixelSize: isNxt ? 20 : 16
		font.family: qfont.italic.name
	  font.bold: true
	}

	Text {
		id: device5field
		text: app.device5
        color: ( app.alarmlow && app.alarmhigh ) ? app.lowhighTileTextColor : ( app.alarmlow ) ? app.lowTileTextColor : ( app.alarmhigh ) ? app.highTileTextColor : (typeof dimmableColors !== 'undefined') ? dimmableColors.waTileTextColor : colors.waTileTextColor
		anchors {
			top: colon5.top
			right: colon5.left
			leftMargin:  isNxt ? 10 : 8  
		}
		font.pixelSize: isNxt ? 20 : 16
		font.family: qfont.italic.name
	  font.bold: true
	}

	Text {
		id: device6field
		text: app.device6
        color: ( app.alarmlow && app.alarmhigh ) ? app.lowhighTileTextColor : ( app.alarmlow ) ? app.lowTileTextColor : ( app.alarmhigh ) ? app.highTileTextColor : (typeof dimmableColors !== 'undefined') ? dimmableColors.waTileTextColor : colors.waTileTextColor
		anchors {
			top: colon6.top
			right: colon6.left
			leftMargin:  isNxt ? 10 : 8  
		}
		font.pixelSize: isNxt ? 20 : 16
		font.family: qfont.italic.name
	  font.bold: true
	}

//---------- values

	Text {
		id: value1field
		text: ( app.device1 !== '' ) ? app.value1 : ""
        color: ( app.alarmlow && app.alarmhigh ) ? app.lowhighTileTextColor : ( app.alarmlow ) ? app.lowTileTextColor : ( app.alarmhigh ) ? app.highTileTextColor : (typeof dimmableColors !== 'undefined') ? dimmableColors.waTileTextColor : colors.waTileTextColor
		anchors {
			top: colon1.top
			left: colon1.right
			leftMargin:  isNxt ? 10 : 8  
		}
		font.pixelSize: isNxt ? 20 : 16
		font.family: qfont.italic.name
	  font.bold: true
	}


	Text {
		id: value2field
		text: ( app.device2 !== '' ) ? app.value2 : ""
        color: ( app.alarmlow && app.alarmhigh ) ? app.lowhighTileTextColor : ( app.alarmlow ) ? app.lowTileTextColor : ( app.alarmhigh ) ? app.highTileTextColor : (typeof dimmableColors !== 'undefined') ? dimmableColors.waTileTextColor : colors.waTileTextColor
		anchors {
			top: colon2.top
			left: colon2.right
			leftMargin:  isNxt ? 10 : 8  
		}
		font.pixelSize: isNxt ? 20 : 16
		font.family: qfont.italic.name
	  font.bold: true
	}

	Text {
		id: value3field
		text: ( app.device3 !== '' ) ?  app.value3 : ""
        color: ( app.alarmlow && app.alarmhigh ) ? app.lowhighTileTextColor : ( app.alarmlow ) ? app.lowTileTextColor : ( app.alarmhigh ) ? app.highTileTextColor : (typeof dimmableColors !== 'undefined') ? dimmableColors.waTileTextColor : colors.waTileTextColor
		anchors {
			top: colon3.top
			left: colon3.right
			leftMargin:  isNxt ? 10 : 8  
		}
		font.pixelSize: isNxt ? 20 : 16
		font.family: qfont.italic.name
	  font.bold: true
	}

	Text {
		id: value4field
		text: ( app.device4 !== '' ) ? app.value4 : ""
        color: ( app.alarmlow && app.alarmhigh ) ? app.lowhighTileTextColor : ( app.alarmlow ) ? app.lowTileTextColor : ( app.alarmhigh ) ? app.highTileTextColor : (typeof dimmableColors !== 'undefined') ? dimmableColors.waTileTextColor : colors.waTileTextColor
		anchors {
			top: colon4.top
			left: colon4.right
			leftMargin:  isNxt ? 10 : 8  
		}
		font.pixelSize: isNxt ? 20 : 16
		font.family: qfont.italic.name
	  font.bold: true
	}

	Text {
		id: value5field
		text: ( app.device5 !== '' ) ? app.value5 : ""
        color: ( app.alarmlow && app.alarmhigh ) ? app.lowhighTileTextColor : ( app.alarmlow ) ? app.lowTileTextColor : ( app.alarmhigh ) ? app.highTileTextColor : (typeof dimmableColors !== 'undefined') ? dimmableColors.waTileTextColor : colors.waTileTextColor
		anchors {
			top: colon5.top
			left: colon5.right
			leftMargin:  isNxt ? 10 : 8  
		}
		font.pixelSize: isNxt ? 20 : 16
		font.family: qfont.italic.name
	  font.bold: true
	}

	Text {
		id: value6field
		text: ( app.device6 !== '' ) ? app.value6 : ""
        color: ( app.alarmlow && app.alarmhigh ) ? app.lowhighTileTextColor : ( app.alarmlow ) ? app.lowTileTextColor : ( app.alarmhigh ) ? app.highTileTextColor : (typeof dimmableColors !== 'undefined') ? dimmableColors.waTileTextColor : colors.waTileTextColor
		anchors {
			top: colon6.top
			left: colon6.right
			leftMargin:  isNxt ? 10 : 8  
		}
		font.pixelSize: isNxt ? 20 : 16
		font.family: qfont.italic.name
	  font.bold: true
	}

}
