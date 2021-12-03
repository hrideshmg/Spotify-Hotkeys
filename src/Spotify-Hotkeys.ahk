;;=============================================================================================================;;
;; ATTENTION: This script uses an external utility called nirmcd to change spotify's app volume individually,  ;;
;; this is an extremely hacky way to do it and im well aware of that.                                          ;;
;;                                                                                                             ;;
;; To use this script, download nircmd from: http://nircmd.nirsoft.net/ and paste "nircmd.exe" in either       ;;
;; the scripts running directory or in your OS's path variable.                                                ;;
;;=============================================================================================================;;

#SingleInstance, force
#NoTrayIcon

;Determines how much the volume slider is increased on the each key press, 1 corresponds to the maximum increase
offset := 0.04

run, %A_appdata%\Spotify\Spotify.exe
;Checks if spotify is running every three seconds and if it isnt, kills the script.
Loop, 
{
    sleep, 3000
    process, Exist, Spotify.Exe
    if(%ErrorLevel% == 0)
    {
        ExitApp
    }   
}

;Hotkeys can be changed by referring to this list: https://www.autohotkey.com/docs/KeyList.htm
!NumpadAdd::run, nircmd changeappvolume spotify.exe +%offset%
!NumpadSub::run, nircmd changeappvolume spotify.exe -%offset%
!Numpad1::Media_Prev
!Numpad2::Media_Play_Pause
!Numpad3::Media_Next



