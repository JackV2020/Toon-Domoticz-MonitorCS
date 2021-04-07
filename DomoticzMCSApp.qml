import QtQuick 2.1
import qb.components 1.0
import qb.base 1.0;
import FileIO 1.0

App {

// encode user:password with standard javascript btoa see : https://www.w3schools.com/jsref/tryit.asp?filename=tryjsref_win_btoa
// sadly btoa is not supported by Toon, but lucky me found: https://gist.github.com/oeon/0ada0457194ebf70ec2428900ba76255
// later I found out that Qt.btoa is what I needed
// later I found out that I could make an exception for the Toon IP address in Domoticz on the Settings page in Domoticz 

//	property url trayUrl : "DomoticzdevicesTray.qml";
//	property SystrayIcon domoticzdevicesTray

    property url titleURL : "DomoticzMCSTile.qml"
  
	property url limitsURL : "DomoticzMCSLimits.qml"
	property DomoticzMCSLimits sensorLimits

	property url domoticzURL : "DomoticzMSCConnections.qml"
	property DomoticzMSCConnections sensorDomoticz

    property bool activeMe : false
    
// ---------- update count down

    property int counter
    
// ---------- tile croll count

    property int scrollCounter : 0

// data saved in user settings file  

    property variant deviceName : []
    property variant deviceIdx : []
    property variant deviceValue : []
    property variant deviceLolim : []
    property variant deviceHilim : []
    property variant deviceLoAlarm : []
    property variant deviceHiAlarm : []

    property string ipAddress
    property string httpPort
    property string user
    property string pwd
    property string interval

// fields on tile

    property string device1
    property string value1
    property string device2
    property string value2
    property string device3
    property string value3
    property string device4
    property string value4
    property string device5
    property string value5
    property string device6
    property string value6

    property bool showCountDown;

// Tile tile control

    property bool alarmlow	: false
    property bool alarmhigh : false
// blue
    property string lowTileColor : "#00f4ff"
// red
    property string highTileColor : "#ff0000"
// purple
    property string lowhighTileColor : "#ff00f4"

// Tile text color 

// black on blue
    property string lowTileTextColor : "#000000"
// white on red
    property string highTileTextColor : "#ffffff"
// white on purple
    property string lowhighTileTextColor : "#ffffff"


// ---------- variable to receive data from Domoticz

	property variant dataJSON

// ---------- Location of settings file

	FileIO {
		id: userSettingsFile
		source: "file:///mnt/data/tsc/domoticzdevices.userSettings.json"
 	}

// ---------- user settings from settings file

	property variant userSettingsJSON : {}

// ---------- Load the requirements
      
    function init() {

        const args = {
        thumbCategory: "general",
        thumbLabel: "Monitor CS",
        thumbIcon: "qrc:/tsc/DomoticzSystrayIcon.png",
        thumbIconVAlignment: "center",
        thumbWeight: 30
        }

        registry.registerWidget("tile", titleURL, this, null, args);

        registry.registerWidget("screen", limitsURL, this, "sensorLimits");

        registry.registerWidget("screen", domoticzURL, this, "sensorDomoticz");

    }
  
// ---------- Actions right after startup

	Component.onCompleted: {
		// read user settings
		try {
			userSettingsJSON = JSON.parse(userSettingsFile.read());

            var ii = 0

            for (ii = 0; ii < 18 ; ii++) {
                deviceLoAlarm.push( false )
                deviceHiAlarm.push( false )
            }
			
			ipAddress = userSettingsJSON['ipAddress'];
			httpPort = userSettingsJSON['httpPort'];
			if (httpPort.length < 2) httpPort = "8080";
			user = userSettingsJSON['user'];
			pwd = userSettingsJSON['pwd'];
			interval = userSettingsJSON['interval'];
			if (interval.length < 2) interval = "60";

			showCountDown = (userSettingsJSON['ShowCountDown'] == "yes") ? true : false
            deviceName  = userSettingsJSON['deviceName'].slice()
            deviceIdx   = userSettingsJSON['deviceIdx'].slice()
            deviceValue = userSettingsJSON['deviceValue'].slice()
            deviceLolim = userSettingsJSON['deviceLolim'].slice()
            deviceHilim = userSettingsJSON['deviceHilim'].slice()


            readDomoticzdevicesData()

		} catch(e) {
		
            var ii = 0

            for (ii = 0; ii < 18 ; ii++) {
                deviceName.push("x")
                deviceIdx.push("x")
                deviceValue.push("x")
                deviceLolim.push("x")
                deviceHilim.push("x")
                deviceLoAlarm.push(false)
                deviceHiAlarm.push(false)

                deviceName[ii] = ""
                deviceIdx[ii] = ""
                deviceValue[ii] = ""
                deviceLolim[ii] = ""
                deviceHilim[ii] = ""
            }
            
            ipAddress = ""
			httpPort = "8080"
            user = "view"
            pwd = "view"
            interval = "10"
            showCountDown = true
        }
//        counter = interval - 1
        counter = 0
	}
  
// ---------- Save user settings

	function saveSettings(){

 		var tmpUserSettingsJSON = {
            "ipAddress": ipAddress,
            "httpPort": httpPort,
            "user": user,
            "pwd": pwd,
            "interval": interval,
            "ShowCountDown" : (showCountDown) ? "yes" : "no",
            
            "deviceName"  : deviceName,
            "deviceIdx"   : deviceIdx,
            "deviceValue" : deviceValue,
            "deviceLolim" : deviceLolim,
            "deviceHilim" : deviceHilim
            
		}

  		var doc3 = new XMLHttpRequest();
   		doc3.open("PUT", "file:///mnt/data/tsc/domoticzdevices.userSettings.json");
   		doc3.send(JSON.stringify(tmpUserSettingsJSON));
	}

// ---------- Get Domoticz data

    function readDomoticzdevicesData()  {

        var connectionPath = ipAddress + ":" + httpPort;

        if ( connectionPath.length > 4 ) {

            var xmlhttp = new XMLHttpRequest();

//        xmlhttp.open("GET", "http://"+connectionPath+"/json.htm?type=devices", true);
//        xmlhttp.setRequestHeader("Authorization", "Basic " + b2a(user + ":" + pwd));

            xmlhttp.open("GET", "http://"+connectionPath+"/json.htm?type=devices&username=" + Qt.btoa(user) + "&password=" + Qt.btoa(pwd), true);
            
            xmlhttp.timeout = 1; // time in milliseconds

            xmlhttp.ontimeout = function () {
//        XMLHttpRequest timed out. Do something here.
                value1 = value2 = value3 = value4 = value5 = value6 = "0";
            }
                  
            xmlhttp.onreadystatechange = function() {
            
                if (xmlhttp.readyState == XMLHttpRequest.DONE) {
  
                    if (xmlhttp.status === 200) {

//                saveJSON(xmlhttp.responseText,"full");
                
                        dataJSON = JSON.parse(xmlhttp.responseText);

                        var i = 0;
                        var ii = 0;
                        var newalarmlow = false
                        var newalarmhigh = false
                        for (i = 0; i < deviceValue.length; i++) {

                            deviceValue[i] = ""

                            for (ii = 0; ii < dataJSON['result'].length; ii++) {
                            
                                if ( dataJSON['result'][ii]['idx'] == deviceIdx[i] ) {
                                    deviceValue[i] = dataJSON['result'][ii]['Data']
                                    if (deviceName[i] == '') { deviceName[i] = dataJSON['result'][ii]['Name'] }
                                    if (deviceLolim[i] != '') { newalarmlow  = newalarmlow  || parseFloat(deviceValue[i]) <= parseFloat(deviceLolim[i]) }
                                    if (deviceHilim[i] != '') { newalarmhigh = newalarmhigh || parseFloat(deviceValue[i]) >= parseFloat(deviceHilim[i]) }                            
                                    if (deviceLolim[i] != '') { deviceLoAlarm[i] = ( parseFloat(deviceValue[i]) <= parseFloat(deviceLolim[i]) ) }
                                    if (deviceHilim[i] != '') { deviceHiAlarm[i] = ( parseFloat(deviceValue[i]) >= parseFloat(deviceHilim[i]) ) }                            
//                                    break
                                }

                            }
                        }

                        alarmlow = newalarmlow
                        alarmhigh = newalarmhigh

//                        saveJSON("oke: ","oke")
                    } else {
                        saveJSON("http://"+connectionPath+"/json.htm?type=devices Return status: " + xmlhttp.status ,"error")
                        value1 =  "Err " + xmlhttp.status;
                        value2 =  ipAddress;
                        value3 =  httpPort;
                        value4 =  user;
                        value5 =  pwd;
                        value6 =  "----";
                    }
                }
            }
            
            xmlhttp.send();
                
        } else {
        
            value1 =  "Err Settings";
            value2 =  ipAddress;
            value3 =  httpPort;
            value4 =  user;
            value5 =  pwd;
            value6 =  "----";
        }
    }

// ----------  Save a text file

	function saveJSON(text,id) {
		
  		var doc3 = new XMLHttpRequest();
   		doc3.open("PUT", "file:///var/volatile/tmp/domoticzdevices_retrieved_data_"+id+".json");
   		doc3.send(text);
	}      
	
// ---------- Timer and refresh routine

// Timer in ms

	Timer {
		id: datetimeTimer
		interval: 1000;
		running: activeMe
		repeat: true
		onTriggered: refreshScreen()
	}  

	function refreshScreen() {
    
        if ( counter >  0 ) {
      
            counter = counter - 1;
      
        } else {
      
            counter = interval - 1 ;

            readDomoticzdevicesData()

            value1=deviceValue[ ( scrollCounter + 0 ) % deviceName.length ]
            value2=deviceValue[ ( scrollCounter + 1 ) % deviceName.length ]
            value3=deviceValue[ ( scrollCounter + 2 ) % deviceName.length ]
            value4=deviceValue[ ( scrollCounter + 3 ) % deviceName.length ]
            value5=deviceValue[ ( scrollCounter + 4 ) % deviceName.length ]
            value6=deviceValue[ ( scrollCounter + 5 ) % deviceName.length ]

            device1=deviceName[ ( scrollCounter + 0 ) % deviceName.length ]
            device2=deviceName[ ( scrollCounter + 1 ) % deviceName.length ]
            device3=deviceName[ ( scrollCounter + 2 ) % deviceName.length ]
            device4=deviceName[ ( scrollCounter + 3 ) % deviceName.length ]
            device5=deviceName[ ( scrollCounter + 4 ) % deviceName.length ]
            device6=deviceName[ ( scrollCounter + 5 ) % deviceName.length ]
            
//          prepare for next not empty block of 6 devices

            var sumIdx = ""
            var ii = 0
            do {
                ii = ii + 1
                scrollCounter = (scrollCounter + 6) % deviceName.length
            
                sumIdx = deviceIdx[scrollCounter + 0] + deviceIdx[scrollCounter + 1] + deviceIdx[scrollCounter + 2] + deviceIdx[scrollCounter + 3] + deviceIdx[scrollCounter + 4] + deviceIdx[scrollCounter + 5]
                sumIdx = sumIdx.replace(/\s+/g, '')

            } while ( (sumIdx == '' ) && ( ii < 3 ) )

        }
    }

// ---------- encode and decode routines

// btoa and atob alternatives found on  https://gist.github.com/oeon/0ada0457194ebf70ec2428900ba76255

  function b2a(a) {
    var c, d, e, f, g, h, i, j, o, b = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=", k = 0, l = 0, m = "", n = [];
    if (!a) return a;
    do c = a.charCodeAt(k++), d = a.charCodeAt(k++), e = a.charCodeAt(k++), j = c << 16 | d << 8 | e, 
    f = 63 & j >> 18, g = 63 & j >> 12, h = 63 & j >> 6, i = 63 & j, n[l++] = b.charAt(f) + b.charAt(g) + b.charAt(h) + b.charAt(i); while (k < a.length);
    return m = n.join(""), o = a.length % 3, (o ? m.slice(0, o - 3) :m) + "===".slice(o || 3);
  }
  
  function a2b(a) {
    var b, c, d, e = {}, f = 0, g = 0, h = "", i = String.fromCharCode, j = a.length;
    for (b = 0; 64 > b; b++) e["ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".charAt(b)] = b;
    for (c = 0; j > c; c++) for (b = e[a.charAt(c)], f = (f << 6) + b, g += 6; g >= 8; ) ((d = 255 & f >>> (g -= 8)) || j - 2 > c) && (h += i(d));
    return h;
  }

// ---------- routine to get time in readable format ( not used here )

  function addZero(i) {
    if (i < 10) {
      i = "0" + i;
    }
    return i;
  }
  
  function myTime() {
    var d = new Date();
    var h = addZero(d.getHours());
    var m = addZero(d.getMinutes());
    var s = addZero(d.getSeconds());
    return h + ":" + m + ":" + s;
  }		
// ---------- end as you can see ;-)

}
