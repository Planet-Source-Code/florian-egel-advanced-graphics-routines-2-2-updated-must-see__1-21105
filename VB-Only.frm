VERSION 5.00
Begin VB.Form frmDemo 
   BorderStyle     =   1  'Fest Einfach
   ClientHeight    =   6495
   ClientLeft      =   150
   ClientTop       =   435
   ClientWidth     =   5535
   Icon            =   "VB-Only.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   433
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   369
   StartUpPosition =   3  'Windows-Standard
   Begin VB.OptionButton optMenu 
      Caption         =   "Bump Map"
      Enabled         =   0   'False
      Height          =   375
      Index           =   4
      Left            =   3360
      Style           =   1  'Grafisch
      TabIndex        =   27
      Top             =   120
      Width           =   975
   End
   Begin VB.OptionButton optMenu 
      Caption         =   "Blur"
      Enabled         =   0   'False
      Height          =   375
      Index           =   3
      Left            =   4440
      Style           =   1  'Grafisch
      TabIndex        =   22
      Top             =   120
      Width           =   975
   End
   Begin VB.OptionButton optMenu 
      Caption         =   "Rotate"
      Height          =   375
      Index           =   2
      Left            =   2280
      Style           =   1  'Grafisch
      TabIndex        =   15
      Top             =   120
      Width           =   975
   End
   Begin VB.OptionButton optMenu 
      Caption         =   "AlphaBlend"
      Height          =   375
      Index           =   1
      Left            =   1200
      Style           =   1  'Grafisch
      TabIndex        =   7
      Top             =   120
      Width           =   975
   End
   Begin VB.OptionButton optMenu 
      Caption         =   "Brightness"
      Height          =   375
      Index           =   0
      Left            =   120
      Style           =   1  'Grafisch
      TabIndex        =   5
      Top             =   120
      Value           =   -1  'True
      Width           =   975
   End
   Begin VB.Frame fraScreen 
      Caption         =   "Rotate"
      Height          =   5775
      Index           =   2
      Left            =   120
      TabIndex        =   14
      Top             =   600
      Width           =   5295
      Begin VB.PictureBox picRot 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   300
         Left            =   4440
         ScaleHeight     =   16
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   32
         TabIndex        =   20
         Top             =   4680
         Visible         =   0   'False
         Width           =   540
      End
      Begin VB.CheckBox chkRotMask 
         Caption         =   "Mask Color"
         Height          =   255
         Left            =   240
         TabIndex        =   19
         Top             =   4680
         Value           =   1  'Aktiviert
         Width           =   1215
      End
      Begin VB.CheckBox chkRotSmooth 
         Caption         =   "Smooth rotate"
         Enabled         =   0   'False
         Height          =   255
         Left            =   1560
         TabIndex        =   18
         Top             =   4680
         Width           =   1575
      End
      Begin VB.HScrollBar HScroll3 
         Height          =   255
         LargeChange     =   500
         Left            =   240
         Max             =   3600
         Min             =   -3600
         TabIndex        =   17
         Top             =   4320
         Width           =   4815
      End
      Begin VB.PictureBox picRotate 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   3660
         Left            =   240
         ScaleHeight     =   240
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   320
         TabIndex        =   16
         Top             =   360
         Width           =   4860
      End
      Begin VB.Label labAngle 
         Caption         =   "Angle: 0°"
         Height          =   255
         Left            =   240
         TabIndex        =   21
         Top             =   4080
         Width           =   4815
      End
   End
   Begin VB.Frame fraScreen 
      Caption         =   "Bumb Mapping"
      Height          =   5775
      Index           =   4
      Left            =   120
      TabIndex        =   28
      Top             =   600
      Width           =   5295
      Begin VB.PictureBox picBumbMap 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   3660
         Left            =   240
         ScaleHeight     =   240
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   320
         TabIndex        =   30
         Top             =   360
         Width           =   4860
      End
      Begin VB.PictureBox picRelief 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   300
         Left            =   4440
         ScaleHeight     =   16
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   37
         TabIndex        =   29
         Top             =   4680
         Visible         =   0   'False
         Width           =   615
      End
   End
   Begin VB.Frame fraScreen 
      Caption         =   "AlphaBlend"
      Height          =   5775
      Index           =   1
      Left            =   120
      TabIndex        =   1
      Top             =   600
      Width           =   5295
      Begin VB.CheckBox Check1 
         Caption         =   "Use MaskColor"
         Height          =   255
         Left            =   240
         TabIndex        =   13
         Top             =   4680
         Value           =   1  'Aktiviert
         Width           =   1575
      End
      Begin VB.PictureBox picSwan 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   300
         Left            =   4440
         ScaleHeight     =   16
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   37
         TabIndex        =   12
         Top             =   4680
         Visible         =   0   'False
         Width           =   615
      End
      Begin VB.HScrollBar HScroll2 
         Height          =   255
         LargeChange     =   16
         Left            =   240
         Max             =   255
         TabIndex        =   8
         Top             =   4320
         Value           =   128
         Width           =   4815
      End
      Begin VB.PictureBox picBlend 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   3660
         Left            =   240
         ScaleHeight     =   240
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   320
         TabIndex        =   6
         Top             =   360
         Width           =   4860
      End
      Begin VB.Label Label2 
         Caption         =   $"VB-Only.frx":1FF2
         Height          =   675
         Left            =   240
         TabIndex        =   11
         Top             =   5040
         Width           =   4695
      End
      Begin VB.Label labAlpha 
         Caption         =   "Alpha-Value: 0"
         Height          =   255
         Left            =   240
         TabIndex        =   9
         Top             =   4080
         Width           =   4815
      End
   End
   Begin VB.Frame fraScreen 
      Caption         =   "Blur"
      Height          =   5775
      Index           =   3
      Left            =   120
      TabIndex        =   23
      Top             =   600
      Width           =   5295
      Begin VB.CommandButton cmdBlurReset 
         Caption         =   "Reset"
         Height          =   375
         Left            =   360
         TabIndex        =   26
         Top             =   4200
         Width           =   855
      End
      Begin VB.CommandButton cmdBlur 
         Caption         =   "Blur"
         Height          =   375
         Left            =   1320
         TabIndex        =   25
         Top             =   4200
         Width           =   855
      End
      Begin VB.PictureBox picBlur 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   3660
         Left            =   240
         ScaleHeight     =   240
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   320
         TabIndex        =   24
         Top             =   360
         Width           =   4860
      End
   End
   Begin VB.Frame fraScreen 
      Caption         =   "Brightness"
      Height          =   5775
      Index           =   0
      Left            =   120
      TabIndex        =   0
      Top             =   600
      Width           =   5295
      Begin VB.PictureBox picBrightness 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   3660
         Left            =   240
         ScaleHeight     =   240
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   320
         TabIndex        =   3
         Top             =   360
         Width           =   4860
      End
      Begin VB.HScrollBar HScroll1 
         Height          =   255
         LargeChange     =   32
         Left            =   240
         Max             =   255
         Min             =   -255
         TabIndex        =   2
         Top             =   4320
         Width           =   4815
      End
      Begin VB.Label labBrightness 
         Caption         =   "Brightness-level: 0"
         Height          =   255
         Left            =   240
         TabIndex        =   4
         Top             =   4080
         Width           =   4815
      End
      Begin VB.Label Label1 
         Caption         =   "Adjust the slider to change the Brightness of the picture."
         Height          =   675
         Left            =   240
         TabIndex        =   10
         Top             =   5040
         Width           =   4815
      End
   End
End
Attribute VB_Name = "frmDemo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Private Declare Function FoxBrightness Lib "FoxCBmp.dll" (ByVal DstDC As Long, ByVal DstBmp As Long, ByVal SrcDC As Long, ByVal SrcBmp As Long, ByVal TransColor As Long, ByVal Brightness As Long, Optional ByVal Flags As Long) As Long
'Private Declare Function FoxBlendIn Lib "FoxCBmp.dll" (ByVal DstDC As Long, ByVal DstX As Long, ByVal DstY As Long, ByVal SrcDC As Long, ByVal SrcBmp As Long, ByVal TransColor As Long, ByVal Alpha As Byte, Optional ByVal Flags As Long) As Long
'Private Declare Function FoxRotate Lib "FoxCBmp.dll" (ByVal DstDC As Long, ByVal DstX As Long, ByVal DstY As Long, ByVal SrcDC As Long, ByVal SrcBmp As Long, ByVal TransColor As Long, ByVal Angle As Double, Optional ByVal Flags As Long) As Long
'Private Declare Function FoxBlur Lib "FoxCBmp.dll" (ByVal DstDC As Long, ByVal DstBmp As Long, ByVal SrcDC As Long, ByVal SrcBmp As Long, ByVal TransColor As Long, ByVal Blur As Long, Optional ByVal Flags As Long) As Long
'Private Declare Function GetTickCount Lib "kernel32" () As Long
'Private Declare Function FoxAlphaBlend Lib "FoxCBmp.dll" (ByVal DstDC As Long, ByVal DstX As Long, ByVal DstY As Long, ByVal DstW As Long, ByVal DstH As Long, ByVal SrcDC As Long, ByVal SrcX As Long, ByVal SrcY As Long, ByVal Alpha As Byte, ByVal TransColor As Long, ByVal Flags As Long) As Long
'Private Declare Function FoxAlphaMask Lib "FoxCBmp.dll" (ByVal DstDC As Long, ByVal DstX As Long, ByVal DstY As Long, ByVal DstW As Long, ByVal DstH As Long, ByVal SrcDC As Long, ByVal SrcX As Long, ByVal SrcY As Long, ByVal MaskDC As Long, ByVal MaskX As Long, ByVal MaskY As Long, ByVal TransColor As Long, ByVal Flags As Long) As Long
'Private Declare Function FoxBumpMap Lib "FoxCBmp.dll" (ByVal DstDC As Long, ByVal DstX As Long, ByVal DstY As Long, ByVal DstW As Long, ByVal DstH As Long, ByVal SrcDC As Long, ByVal SrcX As Long, ByVal SrcY As Long, ByVal TransColor As Long, ByVal Flags As Long) As Long

Dim CurX As Long, CurY As Long
Dim OldTime As Long

Private Sub Check1_Click()
    DrawSwane
End Sub

Private Sub chkRotMask_Click()
    HScroll3_Change
End Sub

Private Sub chkRotSmooth_Click()
    HScroll3_Change
End Sub

Private Sub cmdBlur_Click()
    OldTime = GetTickCount
    FoxBlur picBlur.hdc, picBlur.Image.Handle, picBlur.hdc, picBlur.Image.Handle, 0, 0, 0
    Caption = GetTickCount - OldTime & " ms"
    picBlur.Refresh
End Sub

Private Sub cmdBlurReset_Click()
    picBlur.Cls
    picBlur.Refresh
End Sub

Private Sub Form_Load()
    picBrightness.Picture = LoadPicture("back.jpg")
    picBlend.Picture = picBrightness.Picture
    picRotate.Picture = picBrightness.Picture
    picBlur.Picture = picBrightness.Picture
    picBumbMap.Picture = picBrightness.Picture
    picRot.Picture = LoadPicture("rotate.bmp")
    picSwan.Picture = LoadPicture("blend.bmp")
    picRelief.Picture = LoadPicture("relief.bmp")
    optMenu(0).Value = True
    optMenu_Click 0
    CurX = picBlend.ScaleWidth \ 2
    CurY = picBlend.ScaleHeight \ 2
    HScroll3_Change
    DrawSwane
    Caption = "FLOMIX Studios Graphic-DLL"
End Sub

Private Sub HScroll1_Change()
    OldTime = GetTickCount
    FoxBrightness picBrightness.hdc, picBrightness.Image.Handle, picBrightness.hdc, picBrightness.Picture.Handle, 0, HScroll1, 0
    Caption = GetTickCount - OldTime & " ms"
    picBrightness.Refresh
    labBrightness = "Brightness-level: " & HScroll1
    labBrightness.Refresh
End Sub

Private Sub HScroll1_Scroll()
    HScroll1_Change
End Sub

Private Sub HScroll2_Change()
    DrawSwane
    labAlpha = "Alpha-Value: " & HScroll2
    labAlpha.Refresh
End Sub

Private Sub HScroll2_Scroll()
    HScroll2_Change
End Sub

Private Sub HScroll3_Change()
    picRotate.Cls
    OldTime = GetTickCount
    FoxRotate picRotate.hdc, picRotate.ScaleWidth \ 2, picRotate.ScaleHeight \ 2, picRot.hdc, picRot.Image.Handle, &HFF00FF, HScroll3 / 10, chkRotMask + chkRotSmooth * 2
    'Caption = GetTickCount - OldTime & " ms"
    picRotate.Refresh
    labAngle = "Angle: " & HScroll3 / 10 & "°"
    labAngle.Refresh
End Sub

Private Sub HScroll3_Scroll()
    HScroll3_Change
End Sub

Private Sub optMenu_Click(Index As Integer)
    fraScreen(Index).ZOrder 0
End Sub

Private Sub picBlend_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    CurX = x
    CurY = y
    DrawSwane
End Sub

Private Sub DrawSwane()
    picBlend.Cls
    OldTime = GetTickCount
    FoxAlphaBlend picBlend.hdc, CurX - picSwan.ScaleWidth \ 2, CurY - picSwan.ScaleHeight \ 2, picSwan.ScaleWidth, picSwan.ScaleHeight, picSwan.hdc, 0, 0, HScroll2, &HFF00FF, Check1
    Caption = GetTickCount - OldTime & " ms"
    picBlend.Refresh
End Sub

Private Sub picBumbMap_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    CurX = x
    CurY = y
    picBumbMap.Cls
    OldTime = GetTickCount
    FoxBumpMap picBumbMap.hdc, CurX - picSwan.ScaleWidth \ 2, CurY - picRelief.ScaleHeight \ 2, picRelief.ScaleWidth, picRelief.ScaleHeight, picRelief.hdc, 0, 0, &H808080, Check1
    Caption = GetTickCount - OldTime & " ms"
    picBumbMap.Refresh
End Sub
