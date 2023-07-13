#Requires AutoHotkey v2.0
#SingleInstance Force

; Fix Windows Volume:
$Volume_Up::
{
   VolumeOSD("+1")
   Return
}

$Volume_Down::
{
   VolumeOSD("-1")
   Return
}


VolumeOSD(v) ; this enables volume pop up
{
   SoundSetVolume v ; Use a string "+1" or "-1"
   try if shellProvider := ComObject("{C2F03A33-21F5-47FA-B4BB-156362A2F239}", "{00000000-0000-0000-C000-000000000046}")
   try if flyoutDisp := ComObjQuery(shellProvider, "{41f9d2fb-7834-4ab6-8b1b-73e74064b465}", "{41f9d2fb-7834-4ab6-8b1b-73e74064b465}")
ComCall(3, flyoutDisp, "int", 0, "uint", 0)
}