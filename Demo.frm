VERSION 5.00
Begin VB.Form frmDemo 
   BorderStyle     =   1  'Fest Einfach
   ClientHeight    =   6735
   ClientLeft      =   150
   ClientTop       =   435
   ClientWidth     =   5655
   Icon            =   "Demo.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   449
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   377
   StartUpPosition =   3  'Windows-Standard
   Begin VB.Frame fraScreen 
      Caption         =   "(AlphaBlending- and Counter-Demo)"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   5775
      Index           =   9
      Left            =   120
      TabIndex        =   30
      Top             =   840
      Width           =   5415
      Begin VB.CheckBox chkRealtime 
         Caption         =   "Real-Time"
         Height          =   255
         Left            =   1560
         TabIndex        =   52
         Top             =   4680
         Value           =   1  'Aktiviert
         Width           =   1095
      End
      Begin VB.HScrollBar scrDemo 
         Height          =   255
         Left            =   240
         Max             =   16
         TabIndex        =   50
         Top             =   4320
         Value           =   3
         Width           =   4815
      End
      Begin VB.CommandButton cmdDemo 
         Caption         =   "Start Demo!"
         Height          =   375
         Left            =   240
         TabIndex        =   48
         Top             =   4680
         Width           =   1215
      End
      Begin VB.PictureBox picFlomix 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   600
         Left            =   4560
         ScaleHeight     =   36
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   40
         TabIndex        =   47
         Top             =   4680
         Visible         =   0   'False
         Width           =   660
      End
      Begin VB.PictureBox picDemo 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   3660
         Left            =   240
         MouseIcon       =   "Demo.frx":1FF2
         ScaleHeight     =   240
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   320
         TabIndex        =   46
         Top             =   360
         Width           =   4860
      End
      Begin VB.Label Label5 
         Caption         =   "This is a senseless, but quite impressive demo. check it out!"
         Height          =   495
         Left            =   240
         TabIndex        =   53
         Top             =   5160
         Width           =   4935
      End
      Begin VB.Label labDemo 
         Caption         =   "FLOMIX-Logos: 3"
         Height          =   255
         Left            =   240
         TabIndex        =   51
         Top             =   4080
         Width           =   4815
      End
   End
   Begin VB.PictureBox picBack 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      Height          =   615
      Left            =   1560
      ScaleHeight     =   37
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   53
      TabIndex        =   49
      Top             =   1560
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.CommandButton cmdMenu 
      Caption         =   "Brightness"
      Height          =   315
      Index           =   0
      Left            =   120
      TabIndex        =   36
      Top             =   120
      Width           =   1080
   End
   Begin VB.CommandButton cmdMenu 
      Caption         =   "Alpha"
      Height          =   315
      Index           =   1
      Left            =   1200
      TabIndex        =   37
      Top             =   120
      Width           =   1080
   End
   Begin VB.CommandButton cmdMenu 
      Caption         =   "Rotate"
      Height          =   315
      Index           =   2
      Left            =   2280
      TabIndex        =   38
      Top             =   120
      Width           =   1080
   End
   Begin VB.CommandButton cmdMenu 
      Caption         =   "Blur"
      Height          =   315
      Index           =   3
      Left            =   3360
      TabIndex        =   39
      Top             =   120
      Width           =   1080
   End
   Begin VB.CommandButton cmdMenu 
      Caption         =   "Bump Map"
      Height          =   315
      Index           =   4
      Left            =   4440
      TabIndex        =   40
      Top             =   120
      Width           =   1080
   End
   Begin VB.CommandButton cmdMenu 
      Caption         =   "Mosaic"
      Height          =   315
      Index           =   5
      Left            =   120
      TabIndex        =   41
      Top             =   435
      Width           =   1080
   End
   Begin VB.CommandButton cmdMenu 
      Enabled         =   0   'False
      Height          =   315
      Index           =   6
      Left            =   1200
      TabIndex        =   42
      Top             =   435
      Width           =   1080
   End
   Begin VB.CommandButton cmdMenu 
      Enabled         =   0   'False
      Height          =   315
      Index           =   7
      Left            =   2280
      TabIndex        =   43
      Top             =   435
      Width           =   1080
   End
   Begin VB.CommandButton cmdMenu 
      Enabled         =   0   'False
      Height          =   315
      Index           =   8
      Left            =   3360
      TabIndex        =   44
      Top             =   435
      Width           =   1080
   End
   Begin VB.CommandButton cmdMenu 
      Caption         =   "Demo"
      Height          =   315
      Index           =   9
      Left            =   4440
      TabIndex        =   45
      Top             =   435
      Width           =   1080
   End
   Begin VB.Frame fraScreen 
      Caption         =   "AlphaBlend"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   5775
      Index           =   1
      Left            =   120
      TabIndex        =   1
      Top             =   840
      Width           =   5415
      Begin VB.HScrollBar HScroll2 
         Height          =   255
         LargeChange     =   16
         Left            =   240
         Max             =   255
         TabIndex        =   6
         Top             =   4320
         Value           =   128
         Width           =   4815
      End
      Begin VB.CheckBox Check1 
         Caption         =   "Use MaskColor"
         Height          =   255
         Left            =   240
         TabIndex        =   11
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
         TabIndex        =   10
         Top             =   4680
         Visible         =   0   'False
         Width           =   615
      End
      Begin VB.PictureBox picBlend 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   3660
         Left            =   240
         MouseIcon       =   "Demo.frx":22FC
         MousePointer    =   99  'Benutzerdefiniert
         ScaleHeight     =   240
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   320
         TabIndex        =   5
         TabStop         =   0   'False
         Top             =   360
         Width           =   4860
      End
      Begin VB.Label Label2 
         Caption         =   $"Demo.frx":2606
         Height          =   675
         Left            =   240
         TabIndex        =   9
         Top             =   5040
         Width           =   4695
      End
      Begin VB.Label labAlpha 
         Caption         =   "Alpha-Value: 0"
         Height          =   255
         Left            =   240
         TabIndex        =   7
         Top             =   4080
         Width           =   4815
      End
   End
   Begin VB.Frame fraScreen 
      Caption         =   "Blur"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   5775
      Index           =   3
      Left            =   120
      TabIndex        =   19
      Top             =   840
      Width           =   5415
      Begin VB.CommandButton cmdBlurReset 
         Caption         =   "Reset"
         Height          =   375
         Left            =   360
         TabIndex        =   22
         Top             =   4200
         Width           =   855
      End
      Begin VB.CommandButton cmdBlur 
         Caption         =   "Blur"
         Height          =   375
         Left            =   1320
         TabIndex        =   21
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
         TabIndex        =   20
         TabStop         =   0   'False
         Top             =   360
         Width           =   4860
      End
   End
   Begin VB.Frame fraScreen 
      Caption         =   "Brightness"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   5775
      Index           =   0
      Left            =   120
      TabIndex        =   0
      Top             =   840
      Width           =   5415
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
      Begin VB.PictureBox picBrightness 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   3660
         Left            =   240
         ScaleHeight     =   240
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   320
         TabIndex        =   3
         TabStop         =   0   'False
         Top             =   360
         Width           =   4860
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
         TabIndex        =   8
         Top             =   4680
         Width           =   4815
      End
   End
   Begin VB.Frame fraScreen 
      Caption         =   "Rotate"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   5775
      Index           =   2
      Left            =   120
      TabIndex        =   12
      Top             =   840
      Width           =   5415
      Begin VB.PictureBox picRot 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   300
         Left            =   4440
         ScaleHeight     =   16
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   32
         TabIndex        =   17
         Top             =   4680
         Visible         =   0   'False
         Width           =   540
      End
      Begin VB.CheckBox chkRotMask 
         Caption         =   "Mask Color"
         Height          =   255
         Left            =   240
         TabIndex        =   16
         Top             =   4680
         Value           =   1  'Aktiviert
         Width           =   1215
      End
      Begin VB.CheckBox chkRotSmooth 
         Caption         =   "anti aliasing"
         Height          =   255
         Left            =   1560
         TabIndex        =   15
         Top             =   4680
         Value           =   1  'Aktiviert
         Width           =   1215
      End
      Begin VB.HScrollBar HScroll3 
         Height          =   255
         LargeChange     =   500
         Left            =   240
         Max             =   3600
         Min             =   -3600
         TabIndex        =   14
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
         TabIndex        =   13
         TabStop         =   0   'False
         Top             =   360
         Width           =   4860
      End
      Begin VB.Label Label4 
         Caption         =   $"Demo.frx":26BB
         Height          =   615
         Left            =   240
         TabIndex        =   35
         Top             =   5040
         Width           =   4815
      End
      Begin VB.Label labAngle 
         Caption         =   "Angle: 0°"
         Height          =   255
         Left            =   240
         TabIndex        =   18
         Top             =   4080
         Width           =   4815
      End
   End
   Begin VB.Frame fraScreen 
      Caption         =   "(void)"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   5775
      Index           =   8
      Left            =   120
      TabIndex        =   29
      Top             =   840
      Width           =   5415
   End
   Begin VB.Frame fraScreen 
      Caption         =   "(void)"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   5775
      Index           =   7
      Left            =   120
      TabIndex        =   28
      Top             =   840
      Width           =   5415
   End
   Begin VB.Frame fraScreen 
      Caption         =   "(void)"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   5775
      Index           =   6
      Left            =   120
      TabIndex        =   27
      Top             =   840
      Width           =   5415
   End
   Begin VB.Frame fraScreen 
      Caption         =   "Mosaic"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   5775
      Index           =   5
      Left            =   120
      TabIndex        =   26
      Top             =   840
      Width           =   5415
      Begin VB.HScrollBar scrMosaic 
         Height          =   255
         LargeChange     =   10
         Left            =   240
         Max             =   160
         Min             =   1
         TabIndex        =   32
         Top             =   4320
         Value           =   1
         Width           =   4815
      End
      Begin VB.PictureBox picMosaic 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   3615
         Left            =   240
         ScaleHeight     =   237
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   325
         TabIndex        =   31
         TabStop         =   0   'False
         Top             =   360
         Width           =   4935
      End
      Begin VB.Label Label3 
         Caption         =   "Adjust the Slider to change the Mosaic level. A higher level means a lower resolution."
         Height          =   975
         Left            =   240
         TabIndex        =   34
         Top             =   4680
         Width           =   4815
      End
      Begin VB.Label labMosaic 
         Caption         =   "Mosaic-Level: 1"
         Height          =   255
         Left            =   240
         TabIndex        =   33
         Top             =   4080
         Width           =   4815
      End
   End
   Begin VB.Frame fraScreen 
      Caption         =   "Bumb Mapping"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   5775
      Index           =   4
      Left            =   120
      TabIndex        =   23
      Top             =   840
      Width           =   5415
      Begin VB.PictureBox picRelief 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   300
         Left            =   4440
         ScaleHeight     =   16
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   37
         TabIndex        =   24
         Top             =   4680
         Visible         =   0   'False
         Width           =   615
      End
      Begin VB.PictureBox picBumbMap 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   3660
         Left            =   240
         MouseIcon       =   "Demo.frx":275E
         MousePointer    =   99  'Benutzerdefiniert
         ScaleHeight     =   240
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   320
         TabIndex        =   25
         TabStop         =   0   'False
         Top             =   360
         Width           =   4860
      End
   End
End
Attribute VB_Name = "frmDemo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function GetTickCount Lib "kernel32" () As Long
Private Declare Function FoxTime Lib "FoxCBmp" (Optional ByVal Flags As Long) As Long
Private Declare Function FoxTimer Lib "FoxCBmp" (ByVal Time As Long) As Long
Private Declare Function FoxCounter Lib "FoxCBmp" (Optional ByVal Flags As Long) As Long
Private Declare Function FoxBrightness Lib "FoxCBmp.dll" (ByVal DstDC As Long, ByVal DstBmp As Long, ByVal SrcDC As Long, ByVal SrcBmp As Long, ByVal TransColor As Long, ByVal Brightness As Long, Optional ByVal Flags As Long) As Long
Private Declare Function FoxBlendIn Lib "FoxCBmp.dll" (ByVal DstDC As Long, ByVal DstX As Long, ByVal DstY As Long, ByVal SrcDC As Long, ByVal SrcBmp As Long, ByVal TransColor As Long, ByVal Alpha As Byte, Optional ByVal Flags As Long) As Long
Private Declare Function FoxRotate Lib "FoxCBmp.dll" (ByVal DstDC As Long, ByVal DstX As Long, ByVal DstY As Long, ByVal SrcDC As Long, ByVal SrcBmp As Long, ByVal TransColor As Long, ByVal Angle As Double, Optional ByVal Flags As Long) As Long
Private Declare Function FoxBlur Lib "FoxCBmp.dll" (ByVal DstDC As Long, ByVal DstBmp As Long, ByVal SrcDC As Long, ByVal SrcBmp As Long, ByVal TransColor As Long, ByVal Blur As Long, Optional ByVal Flags As Long) As Long
Private Declare Function FoxAlphaBlend Lib "FoxCBmp.dll" (ByVal DstDC As Long, ByVal DstX As Long, ByVal DstY As Long, ByVal DstW As Long, ByVal DstH As Long, ByVal SrcDC As Long, ByVal SrcX As Long, ByVal SrcY As Long, ByVal Alpha As Byte, ByVal TransColor As Long, ByVal Flags As Long) As Long
Private Declare Function FoxAlphaMask Lib "FoxCBmp.dll" (ByVal DstDC As Long, ByVal DstX As Long, ByVal DstY As Long, ByVal DstW As Long, ByVal DstH As Long, ByVal SrcDC As Long, ByVal SrcX As Long, ByVal SrcY As Long, ByVal MaskDC As Long, ByVal MaskX As Long, ByVal MaskY As Long, ByVal TransColor As Long, ByVal Flags As Long) As Long
Private Declare Function FoxBumpMap Lib "FoxCBmp.dll" (ByVal DstDC As Long, ByVal DstX As Long, ByVal DstY As Long, ByVal DstW As Long, ByVal DstH As Long, ByVal SrcDC As Long, ByVal SrcX As Long, ByVal SrcY As Long, ByVal TransColor As Long, ByVal Flags As Long) As Long
Private Declare Function FoxMosaic Lib "FoxCBmp.dll" (ByVal DstDC As Long, ByVal DstX As Long, ByVal DstY As Long, ByVal DstW As Long, ByVal DstH As Long, ByVal SrcDC As Long, ByVal SrcX As Long, ByVal SrcY As Long, ByVal Level As Long, ByVal TransColor As Long, ByVal Flags As Long) As Long

Private Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long

Dim CurX As Long, CurY As Long

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
    FoxTime 1
    FoxBlur picBlur.hDC, picBlur.Image.Handle, picBlur.hDC, picBlur.Image.Handle, 0, 0, 0
    Caption = FoxTime(1) & " ms / frame"
    picBlur.Refresh
End Sub

Private Sub cmdBlurReset_Click()
    picBlur.Cls
    picBlur.Refresh
End Sub

Private Sub cmdDemo_Click()
    Dim I As Long, CurTime As Long, TmpTime As Long
    Dim Count As Long, E As Long, G As Long
    Dim Rand1(31) As Long, Rand2(31) As Long, Rand3(31) As Long
    Dim Rand4(31) As Long, Rand5(31) As Long, Rand6(31) As Long
    Dim Pos(31) As Long
    If cmdDemo.Tag = "running" Then
        cmdDemo.Tag = ""
    Else
        cmdDemo.Tag = "running"
        cmdDemo.Caption = "Stop"
        picDemo.MousePointer = 99
        FoxTimer 0 'reset the Timer
        FoxCounter 2 'reset the Counter
        For E = 0 To 31
            Pos(E) = Int(Rnd * 90)
            Rand1(E) = 300 + Int(Rnd * 200): Rand2(E) = 300 + Int(Rnd * 200)
            Rand3(E) = 300 + Int(Rnd * 200): Rand4(E) = 300 + Int(Rnd * 200)
            Rand5(E) = 200 + Int(Rnd * 200): Rand6(E) = 200 + Int(Rnd * 200)
        Next E
        Do While cmdDemo.Tag = "running"
            FoxCounter 1
            If FoxTimer(1000) Then Caption = "DLL Demo, running with " & FoxCounter(2) & " fps."
            CurTime = GetTickCount
            If chkRealtime.Value Then
                I = (CurTime / 1000 * 25) Mod 90
            Else
                I = (I + 1) Mod 90
            End If
            DoEvents
            BitBlt picDemo.hDC, 0, 0, picDemo.ScaleWidth, picDemo.ScaleHeight, picBack.hDC, 0, 0, vbSrcCopy
            
            For E = 0 To scrDemo - 1
                G = (I + Pos(E)) Mod 90
                FoxAlphaBlend picDemo.hDC, (picDemo.ScaleWidth - 80) * (0.5 + 0.25 * (Cos(CurTime / Rand1(E)) - Sin(CurTime / Rand2(E)))), (picDemo.ScaleHeight - 60) * (0.5 + 0.25 * (Sin(CurTime / Rand3(E)) + Cos(CurTime / Rand4(E)))), 80, 60, picFlomix.hDC, (G Mod 3) * 80, (G \ 3) * 60, 128 + 127 * (0.5 + 0.25 * (Cos(CurTime / Rand5(E)) - Sin(CurTime / Rand6(E)))), 0, 1
            Next E
            FoxAlphaBlend picDemo.hDC, CurX - 40, CurY - 30, 80, 60, picFlomix.hDC, (I Mod 3) * 80, (I \ 3) * 60, 255, 0, 1
            
            picDemo.Refresh
        Loop
        picDemo.MousePointer = 0
        cmdDemo.Caption = "Start"
        Caption = "FLOMIX Studios"
        BitBlt picDemo.hDC, 0, 0, picDemo.ScaleWidth, picDemo.ScaleHeight, picBack.hDC, 0, 0, vbSrcCopy
        picDemo.Refresh
    End If
End Sub

Private Sub cmdMenu_Click(Index As Integer)
    For I = 0 To cmdMenu.Count - 1
        cmdMenu(I).FontBold = I = Index
        fraScreen(I).Visible = I = Index
    Next I
End Sub

Private Sub Form_Load()
    picBack.Picture = LoadPicture("back.jpg")
    picBrightness.Picture = picBack.Picture
    picBlur.Picture = picBack.Picture
    'picBlend.Picture = picBack.Picture
    'picRotate.Picture = picBack.Picture
    'picBumbMap.Picture = picBack.Picture
    'picMosaic.Picture = picBack.Picture
    'picDemo.Picture = picBack.Picture
    picRot.Picture = LoadPicture("rotate.bmp")
    picSwan.Picture = LoadPicture("blend.bmp")
    picRelief.Picture = LoadPicture("relief.bmp")
    picFlomix.Picture = LoadPicture("Flomix.bmp")
    
    BitBlt picBlend.hDC, 0, 0, picBlend.ScaleWidth, picBlend.ScaleHeight, picBack.hDC, 0, 0, vbSrcCopy
    BitBlt picRotate.hDC, 0, 0, picRotate.ScaleWidth, picRotate.ScaleHeight, picBack.hDC, 0, 0, vbSrcCopy
    BitBlt picBumbMap.hDC, 0, 0, picBumbMap.ScaleWidth, picBumbMap.ScaleHeight, picBack.hDC, 0, 0, vbSrcCopy
    BitBlt picMosaic.hDC, 0, 0, picMosaic.ScaleWidth, picMosaic.ScaleHeight, picBack.hDC, 0, 0, vbSrcCopy
    BitBlt picDemo.hDC, 0, 0, picDemo.ScaleWidth, picDemo.ScaleHeight, picBack.hDC, 0, 0, vbSrcCopy

    cmdMenu_Click 9
    CurX = picBlend.ScaleWidth \ 2
    CurY = picBlend.ScaleHeight \ 2
    HScroll3_Change
    DrawSwane
    Caption = "FLOMIX Studios Graphic-DLL"
End Sub

Private Sub Form_Unload(Cancel As Integer)
    End
End Sub

Private Sub HScroll1_Change()
    FoxTime 1
    FoxBrightness picBrightness.hDC, picBrightness.Image.Handle, picBrightness.hDC, picBrightness.Picture.Handle, 0, HScroll1, 0
    Caption = FoxTime(1) & " ms"
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
    BitBlt picRotate.hDC, 0, 0, picRotate.ScaleWidth, picRotate.ScaleHeight, picBack.hDC, 0, 0, vbSrcCopy
    FoxTime 1
    FoxRotate picRotate.hDC, picRotate.ScaleWidth \ 2, picRotate.ScaleHeight \ 2, picRot.hDC, picRot.Image.Handle, &HFF00FF, HScroll3 / 10, chkRotMask + chkRotSmooth * 2
    Caption = "Rotating: " & FoxTime(1) & " ms / frame"
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

Private Sub picBlend_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    CurX = X
    CurY = Y
    DrawSwane
End Sub

Private Sub DrawSwane()
    BitBlt picBlend.hDC, 0, 0, picBlend.ScaleWidth, picBlend.ScaleHeight, picBack.hDC, 0, 0, vbSrcCopy
    FoxTime (1)
    FoxAlphaBlend picBlend.hDC, CurX - picSwan.ScaleWidth \ 2, CurY - picSwan.ScaleHeight \ 2, picSwan.ScaleWidth, picSwan.ScaleHeight, picSwan.hDC, 0, 0, HScroll2, &HFF00FF, Check1
    Caption = "Alpha Blending: " & FoxTime(1) & " ms / frame"
    picBlend.Refresh
End Sub

Private Sub picBumbMap_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    CurX = X
    CurY = Y
    BitBlt picBumbMap.hDC, 0, 0, picBumbMap.ScaleWidth, picBumbMap.ScaleHeight, picBack.hDC, 0, 0, vbSrcCopy
    FoxTime 1
    FoxBumpMap picBumbMap.hDC, CurX - picRelief.ScaleWidth \ 2, CurY - picRelief.ScaleHeight \ 2, picRelief.ScaleWidth, picRelief.ScaleHeight, picRelief.hDC, 0, 0, &H0, Check1
    Caption = "Bump Mapping: " & FoxTime(1) & "ms / frame"
    picBumbMap.Refresh
End Sub

Private Sub picDemo_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    CurX = X
    CurY = Y
End Sub

Private Sub scrDemo_Change()
    labDemo = "FLOMIX-Logos: " & scrDemo
    labDemo.Refresh
End Sub

Private Sub scrDemo_Scroll()
    scrDemo_Change
End Sub

Private Sub scrMosaic_Change()
    BitBlt picMosaic.hDC, 0, 0, picMosaic.ScaleWidth, picMosaic.ScaleHeight, picBack.hDC, 0, 0, vbSrcCopy
    FoxTime 1
    FoxMosaic picMosaic.hDC, 0, 0, picMosaic.ScaleWidth, picMosaic.ScaleHeight, picMosaic.hDC, 0, 0, scrMosaic, 0, 0
    Caption = "Mosaic: " & FoxTime(1) & " ms / frame"
    labMosaic = "Mosaic-Level: " & scrMosaic
    labMosaic.Refresh
    picMosaic.Refresh
End Sub

Private Sub scrMosaic_Scroll()
    scrMosaic_Change
End Sub
