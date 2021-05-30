#p::
WinActivate, MATLAB R2020a
send ^v ; paste
send {enter}
sleep 200 ; wait for the paste to be over
WinActivate, ahk_exe WindowsTerminal.exe
;WinGet, ID, ID, A
;WinGet, prc, ProcessName, ahk_id %id%
;WinGetClass, Cls, ahk_id %id%
;WinGetTitle, tit, ahk_id %id%

;MsgBox,% format("Process`t{}`nClass`t{}`nTitle`t{}", prc,cls,tit)
return