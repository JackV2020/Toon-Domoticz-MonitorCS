This app is to monitor Domoticz General Custom Sensors and : 

 - has a main purpose :
     ... warn when values in Domoticz are not within optional configurable limits by changing tile color

 - is used by me to display the next 11 values from Domoticz :
     ... pi-hole status
     ... salt level of my Aquacell water softener
     ... a device accessible by pinging it
     ... solar panels generated today
     ... solar panels generated week
     ... solar panels generated month
     ... airpressure
     ... humidity in another place in the house
     ... temperature in another place in the house
     ... active power usage
     ... the 15 minute load of Toon ( indeed, measured and logged by Domoticz )

 - has 3 screens :
    ... 1 Tile showing 1 set of 6 Custom Sensors at a time ( max 3 sets which it automatically pages between ) 
         the tile gives access to the Limits Settings screen
         ( when a value crosses a limit the tile gets a color, more details on this below )
    ... 1 Limits screen where optional lower and upper limits can be configured
         the Limits screen gives access to the Settings screen
    ... 1 Settings screen to configure the Domoticz connection and up to 3 sets of 6 Custom Sensors idx values and names.

    Since I fitted my 11 values in 2 sets, the Tile only pages between these 2 sets. Empty sets are skipped.

To install ( manually without Toon store, when it arrives in the store installing will be like for any other app ) :

 - Open an sftp tool like Mozilla on Windows or thunar on Linux to browse to your Toon.
 - On your Toon go to /qmf/qml/apps and create a folder domoticzMCS.
 - In that folder you put at least the qml files.
 - Restart the GUI. ( On your Toon go to > Settings > TSC > Restart GUI )
 - Add the Monitor CS app like any other app to the screen.
    ( Click on a big + and add a tile for Monitor CS )

To configure :

 - There will be an empty tile with a running counter.
 - Click on it to see the Limits Screen, click on the big button on the bottom to start the Settings Screen.
 - First enter your settings for user and password if you need these to access your Domoticz.
   ( When you need no user you can clear the fields or just leave the defaults in place )
 - After that enter the IP address and http port. ( default is 8080 )
 - ( When you want to change user and password after IP and port are ok you need to restart the GUI to re-login )
 - Now enter an idx of a Custom Sensor and the name of the Custom Sensor is retrieved for you.
 - You can change the name or just leave it for now. It may be too long for the tile and you may change it later.
 - To clear an idx you edit the field and put a space in it and save it. The name field will be cleared for you.
 - When you clear the name field by putting a space in it, the name will be retrieved from Domoticz again.
 - To save settings you need to click the Save button in the upper right corner.
 - To test settings just click the home button in the upper left corner. Changes are not save then.
 - You can put limits on the Limits Screen and use the home and Save buttons the same way.
 
Limits and tile colors :
 - Blue     : When at least one of the fields goes below a limit the tile will turn blue.
 - Red      : At least one value too high will result in the tile turning red.
 - Purple   : When one is too low and another too high the tile will go purple.

The limits are including the value you give.
A low of 12.34 means less or equal to 12.34
A high of 98.76 means greater or equeal to 98.76

You can put text after a limit.
Examples for trailing text : 
    - units like                         : 10.12 kg
    - date of entering the limit like    : 1234 03-28

Notes.
 - Repeat the same idx on the same place in the 3 sets to have the Custom Sensor always vissible while the Tile pages.
 - There is no check on the Limits fields to validate if the low < high and high > low or values are numeric.
     Validation could be put on but we would miss some fun......
     Just for the fun, put a high in the low and a low in the high and the tile will have color.


Thanks for reading and enjoy.
