This Toon app is to monitor Domoticz Devices of the type General Custom Sensor. 

A Toon app is an app which can be installed on a rooted Eneco Toon 1 or Toon 2.
Rooting a Toon is perfectly legal by the way.

 - purpose :
    ... page between 3 sets of 6 devices with their values on the tile
    ... warn when values in Domoticz are not within optional configurable limits by changing tile color
    ... on dimmed screen only show first page (so put most intesting counters there)

 - is used by me to display Domoticz devices like :
    ... solar panels generated today
    ... solar panels generated week
    ... solar panels generated month
    ... airpressure
    ... humidity in the house
    ... temperature in another place in the house
    ... active power usage
 - the same for the next devices but with optional limits defined :
    ... pi-hole status ( low when status is 0 )
    ... salt level of my Aquacell water softener ( low alarm when 1 )
    ... the 15 minute load of Toon ( high alarm above 1.25 )
    ... a device accessible by pinging it ( low alarm when below 4 pings )

Since my values fit in 2 sets of 6, the Tile only pages between these 2 sets. Empty sets are skipped.

 - To show and configure everything this app has 3 screens :
    ... 1 Tile showing 1 set of 6 Custom Sensors at a time ( max 3 sets which it automatically pages between ) 
         the tile gives access to the Limits Settings screen
         ( when a value crosses a limit the tile gets a color, more details on this below )
    ... 1 Limits screen where optional lower and upper limits can be configured
         the Limits screen gives access to the Settings screen
    ... 1 Settings screen to configure the Domoticz connection and up to 3 sets of 6 Custom Sensors idx values and names.

When the app arrives in the store installing will be like for any other app.

For now to install manually without Toon store : 

 - Download the zip. ( Click green Code above and select Download Zip )
 - Unpack the zipfile.
 - Use FileZilla / WinSCP to create /qmf/qml/apps/domoticzMCS on Toon.
 - Put the contents of the zipfile in the new directory.
 - Restart the GUI or reboot your Toon.
 - Add the 'Monitor CS' app like any other app to the screen.
    ( Click on a big + and add a tile for 'Monitor CS' )

To configure :

 - After first startup there will be an empty tile with a running counter.
 - Click on it to see the Limits Screen, click on the big button on the bottom to start the Settings Screen.
 - First enter your settings for user and password if you need these to access your Domoticz.
   ( When you need no user you can clear the fields or just leave the defaults in place )
 - After that enter the IP address and http port. ( default is 8080 )
 - ( When you want to change user and password after IP and port are ok you need to restart the GUI to re-login )
 - Now enter an idx of a Custom Sensor and the name of the Custom Sensor will be retrieved for you. Just wait...
 - You can change the name or just leave it for now. It may be too long for the tile and you may change it later.
 - To clear an idx you edit the field and put a space in it and save it. The name field will be cleared for you.
 - When you change an idx the new name will be retrieved for you. Just wait....
 - When you clear the name field by putting a space in it, the name will be retrieved from Domoticz again.
 - To save settings you need to click the Save button in the upper right corner.
 - To test settings just click the home button in the upper left corner. Changes are not save then.
 - You can put limits on the Limits Screen and use the home and Save buttons the same way.

The limits are including the value you give.
A low of 12.34 means less or equal to 12.34
A high of 98.76 means greater or equeal to 98.76

You can put text after a limit.
Examples for trailing text : 
    - units like                         : 10.12 kg
    - date of entering the limit like    : 1234 03-28
 
Tile colors :
 - Neutral  : No alarms
 - Blue     : When at least one of the fields goes below a limit the tile will turn blue.
 - Red      : At least one value too high will result in the tile turning red.
 - Purple   : When one is too low and another too high the tile will go purple.

Limits Screen field colors :
 - Neutral  : field empty
 - Yellow   : limit value present
 - Blue     : low limit value in alarm
 - Red      : high limit in alarm
 
In the screenshots folder you can see that I, for demo purpose, entered wrong values for some limits resulting in some colored limits on the Limits Screen and a purple Tile.

Notes.
 - Repeat the same idx on the same place in the 3 sets to have the Custom Sensor always vissible while the Tile pages.
 - There is no check on the Limits fields to validate if the low < high and high > low or values are numeric.
     Validation could be put on but we would miss some fun......
     Just to test, put a high in the low and a low in the high and the tile will have color.

Thanks for reading and enjoy.
