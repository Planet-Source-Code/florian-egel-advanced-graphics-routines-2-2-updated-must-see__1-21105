Advanced Graphics Functions 2.1
FoxCBmp.dll
***************************************

The Visual Basic Declarations are:

Public Declare Function FoxBrightness Lib "FoxCBmp.dll" (ByVal DstDC As Long, ByVal DstBmp As Long, ByVal SrcDC As Long, ByVal SrcBmp As Long, ByVal TransColor As Long, ByVal Brightness As Long, Optional ByVal Flags As Long) As Long
Public Declare Function FoxBlendIn Lib "FoxCBmp.dll" (ByVal DstDC As Long, ByVal DstX As Long, ByVal DstY As Long, ByVal SrcDC As Long, ByVal SrcBmp As Long, ByVal TransColor As Long, ByVal Alpha As Byte, Optional ByVal Flags As Long) As Long
Public Declare Function FoxRotate Lib "FoxCBmp.dll" (ByVal DstDC As Long, ByVal DstX As Long, ByVal DstY As Long, ByVal SrcDC As Long, ByVal SrcBmp As Long, ByVal TransColor As Long, ByVal Angle As Double, Optional ByVal Flags As Long) As Long
Public Declare Function FoxBlur Lib "FoxCBmp.dll" (ByVal DstDC As Long, ByVal DstBmp As Long, ByVal SrcDC As Long, ByVal SrcBmp As Long, ByVal TransColor As Long, ByVal Blur As Long, Optional ByVal Flags As Long) As Long
Public Declare Function FoxAlphaBlend Lib "FoxCBmp.dll" (ByVal DstDC As Long, ByVal DstX As Long, ByVal DstY As Long, ByVal DstW As Long, ByVal DstH As Long, ByVal SrcDC As Long, ByVal SrcX As Long, ByVal SrcY As Long, ByVal Alpha As Byte, ByVal TransColor As Long, ByVal Flags As Long) As Long
Public Declare Function FoxAlphaMask Lib "FoxCBmp.dll" (ByVal DstDC As Long, ByVal DstX As Long, ByVal DstY As Long, ByVal DstW As Long, ByVal DstH As Long, ByVal SrcDC As Long, ByVal SrcX As Long, ByVal SrcY As Long, ByVal MaskDC As Long, ByVal MaskX As Long, ByVal MaskY As Long, ByVal TransColor As Long, ByVal Flags As Long) As Long
Public Declare Function FoxBumpMap Lib "FoxCBmp.dll" (ByVal DstDC As Long, ByVal DstX As Long, ByVal DstY As Long, ByVal DstW As Long, ByVal DstH As Long, ByVal SrcDC As Long, ByVal SrcX As Long, ByVal SrcY As Long, ByVal TransColor As Long, ByVal Flags As Long) As Long
Public Declare Function FoxMosaic Lib "FoxCBmp.dll" (ByVal DstDC As Long, ByVal DstX As Long, ByVal DstY As Long, ByVal DstW As Long, ByVal DstH As Long, ByVal SrcDC As Long, ByVal SrcX As Long, ByVal SrcY As Long, ByVal Level As Long, ByVal TransColor As Long, ByVal Flags As Long) As Long
Public Declare Function FoxTime Lib "FoxCBmp" (Optional ByVal Flags As Long) As Long
Public Declare Function FoxTimer Lib "FoxCBmp" (ByVal Time As Long) As Long
Public Declare Function FoxCounter Lib "FoxCBmp" (Optional ByVal Flags As Long) As Long

Global Const FOX_USE_MASK = &H1
Global Const FOX_ANTI_ALIAS = &H2



_________________________________________________________________________________


FoxBrightness:
Adjusts the Brightness of a picture.

PARAMETERS
DstDC          hDC of the destination picture
DstBmp         Handle of the destination picture
SrcDC          hDC of the source picture
SrcBmp         Handle of the source picture
TransColor     This color is transparent if the flag FOX_USE_MASK is set.
Brightness     Brightness adjustment, in a range from (dark) -100 to 100 (bright).
Flags          Flags allowed: FOX_USE_MASK

_________________________________________________________________________________


FoxBlendIn:
This Function is obsolete; please use FoxAlphaBlend instead.

_________________________________________________________________________________


FoxRotate:
Rotates a Picture.

PARAMETERS
DstDC          hDC of the destination picture
DstX           Center X-Position of the destination.
DstY           Center Y-Position of the destination.
SrcDC          hDC of the source picture.
SrcBmp         Handle of the source picture.
TransColor     This color is transparent if the Flag FOX_USE_MASK is set.
Angle          Angle of the rotated picture in degrees. 0 is unrotated, over 0 rotates right, under 0 rotates left.
Flags          These flags can be combined in any combination: FOX_USE_MASK, FOX_ANTI_ALIAS

REMARKS
the FOX_ANTI_ALIAS Flag really gives a perfect result, but it needs more processor time, so you should
not use it when not necessary.

_________________________________________________________________________________


FoxBlur:
Blurs a Picture.

PARAMETERS
DstDC          hDC of the destination picture
DstBmp         Handle of the destination picture
SrcDC          hDC of the source picture
SrcBmp         Handle of the source picture
TransColor     not implemented yet, this value is ignored
Blur           not implemented yet, this value is ignored
Flags          no flags available

_________________________________________________________________________________


FoxAlphaBlend:
BitBlts a picture using an alpha value

PARAMETERS
DstDC          hDC or the destination picture
DstX           Specifies the logical x-coordinate of the upper-left corner of the destination rectangle.
DstY           Specifies the logical y-coordinate of the upper-left corner of the destination rectangle.
DstW           Specifies the logical width of the source and destination rectangles.
DstH           Specifies the logical height of the source and destination rectangles.
SrcDC          hDC of the source picture 
SrcX           Specifies the logical x-coordinate of the upper-left corner of the source rectangle.
SrcY           Specifies the logical y-coordinate of the upper-left corner of the destination rectangle.
Alpha          Specifies an alpha transparency value. 0 is transparent, 255 is opaque.
TransColor     This color is transparent if the flag FOX_USE_MASK is set.
Flags          Flags allowed: FOX_USE_MASK

REMARKS
If possible, use 0, 64, 128, 192 or 255 as Alpha value, these values are much faster than the others.

_________________________________________________________________________________


FoxAlphaMask: (not implemented yet)
BitBlts a picture using an alpha channel

PARAMETERS
DstDC          hDC of the destination picture
DstX           Specifies the logical x-coordinate of the upper-left corner of the destination rectangle.
DstY           Specifies the logical y-coordinate of the upper-left corner of the destination rectangle.
DstW           Specifies the logical width of the source, destination and mask rectangles.
DstH           Specifies the logical height of the source, destination and mask rectangles.
SrcDC          hDC of the source picture
SrcX           Specifies the logical x-coordinate of the upper-left corner of the source rectangle.
SrcY           Specifies the logical y-coordinate of the upper-left corner of the source rectangle.
MaskDC         hDC of the mask picture 
MaskX          Specifies the logical x-coordinate of the upper-left corner of the mask rectangle.
MaskY          Specifies the logical y-coordinate of the upper-left corner of the mask rectangle.
TransColor     This color is transparent if the flag FOX_USE_MASK is set.
Flags          Flags allowed: FOX_USE_MASK

REMARKS
The function is not implemented yet.

_________________________________________________________________________________


FoxBumpMap
draws the source picture as a relief to the destination.

PARAMETERS
DstDC          hDC of the destination picture
DstX           Specifies the logical x-coordinate of the upper-left corner of the destination rectangle.
DstY           Specifies the logical y-coordinate of the upper-left corner of the destination rectangle.
DstW           Specifies the logical width of the source and destination rectangles.
DstH           Specifies the logical height of the source and destination rectangles.
SrcDC          hDC of the source picture
SrcX           Specifies the logical x-coordinate of the upper-left corner of the source rectangle.
SrcY           Specifies the logical y-coordinate of the upper-left corner of the source rectangle.
TransColor     This color is transparent if the flag FOX_USE_MASK is set.
Flags          Flags allowed: FOX_USE_MASK


_________________________________________________________________________________


FoxMosaic
reduces the picture to a mosaic of pixels with an adjustable size.

PARAMETERS
DstDC          hDC of the destination picture
DstX           Specifies the logical x-coordinate of the upper-left corner of the destination rectangle.
DstY           Specifies the logical y-coordinate of the upper-left corner of the destination rectangle.
DstW           Specifies the logical width of the source and destination rectangles.
DstH           Specifies the logical height of the source and destination rectangles.
SrcDC          hDC of the source picture
SrcX           Specifies the logical x-coordinate of the upper-left corner of the source rectangle.
SrcY           Specifies the logical y-coordinate of the upper-left corner of the source rectangle.
Level          Size of the Pixels
TransColor     This color is transparent if the flag FOX_USE_MASK is set.
Flags          Flags allowed: FOX_USE_MASK

_________________________________________________________________________________


FoxTime:
returns the time delay to the previous call of the function.

PARAMETERS
Flags          1: resets the time delay

RETURN VALUE
time delay to the last time the function was called with the flag 1

REMARKS
this function is ideal for realtime-programming; just call it in each main loop to get the time difference.

_________________________________________________________________________________


FoxTimer:
returns how often the specified time passed since the last call.

PARAMETERS
Time           the time delay to check. If Time is 0 the function resets the Timer.

RETURN VALUE
how often the specified time passed since the last call

REMARKS
This function combined with FoxCounter is ideal for easily getting the framerate.
sample:

FoxTimer 0 'reset the timer
FoxCounter 2 'reset the counter
Do
    DoEvents
    FoxCounter 1 'increases the counter
    If FoxTimer(1000) Then Caption = FoxCounter(2) & " fps."
    'every 1000ms read and  reset the counter

    'your code...
Loop


_________________________________________________________________________________


FoxCounter:
small Counter; it returns the current count, and optionally increases the counter by 1.

PARAMETERS
Flags          1: increases the counter
               2: resets the counter to 0

RETURN VALUE
the previous counter value








I hope this small documentation helps you to use my DLL. Have fun and success!

Florian Egel
_________________________________________________________________________________