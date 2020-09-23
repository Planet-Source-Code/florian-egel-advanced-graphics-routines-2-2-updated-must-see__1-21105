Attribute VB_Name = "basVBOnly"
'Here are the main functions of my DLL in VB-Code...
'I apologize that the Code is uncommented and not
'in written in the best VB-manners, but i fastly
'rewrote it from C++ to VB due to many requests.
'
'I would still use the DLL, it is much faster and
'It should be no problem to distribute such a small
'file that don't need to be registered. with just
'a few kB (where on the other hand your exe becomes
'smaller...)
'
'Have fun with the Code, Florian Egel


Option Explicit

Public Type BITMAPINFOHEADER
        biSize As Long
        biWidth As Long
        biHeight As Long
        biPlanes As Integer
        biBitCount As Integer
        biCompression As Long
        biSizeImage As Long
        biXPelsPerMeter As Long
        biYPelsPerMeter As Long
        biClrUsed As Long
        biClrImportant As Long
End Type

Public Type RGBQUAD
        rgbBlue As Byte
        rgbGreen As Byte
        rgbRed As Byte
        rgbReserved As Byte
End Type

Public Type BITMAPINFO
        bmiHeader As BITMAPINFOHEADER
        bmiColors As RGBQUAD
End Type

Public Declare Function GetTickCount Lib "kernel32" () As Long
Public Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Public Declare Function GetDIBits Lib "gdi32" (ByVal aHDC As Long, ByVal hBitmap As Long, ByVal nStartScan As Long, ByVal nNumScans As Long, lpBits As Any, lpBI As BITMAPINFO, ByVal wUsage As Long) As Long
Public Declare Function SetDIBits Lib "gdi32" (ByVal hdc As Long, ByVal hBitmap As Long, ByVal nStartScan As Long, ByVal nNumScans As Long, lpBits As Any, lpBI As BITMAPINFO, ByVal wUsage As Long) As Long
Public Declare Function SetDIBitsToDevice Lib "gdi32" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal dx As Long, ByVal dy As Long, ByVal SrcX As Long, ByVal SrcY As Long, ByVal Scan As Long, ByVal NumScans As Long, Bits As Any, BitsInfo As BITMAPINFO, ByVal wUsage As Long) As Long
Public Declare Function CreateCompatibleDC Lib "gdi32" (ByVal hdc As Long) As Long
Public Declare Function CreateCompatibleBitmap Lib "gdi32" (ByVal hdc As Long, ByVal nWidth As Long, ByVal nHeight As Long) As Long
Public Declare Function CreateBitmap Lib "gdi32" (ByVal nWidth As Long, ByVal nHeight As Long, ByVal nPlanes As Long, ByVal nBitCount As Long, lpBits As Any) As Long
Public Declare Function SelectObject Lib "gdi32" (ByVal hdc As Long, ByVal hObject As Long) As Long
Public Declare Function DeleteDC Lib "gdi32" (ByVal hdc As Long) As Long
Public Declare Function DeleteObject Lib "gdi32" (ByVal hObject As Long) As Long

Global Const PIDEG As Double = 1.74532925199433E-02

Public Function MixColors(ByVal Dst As Long, ByVal Src As Long) As Long
    MixColors = ShadeColors(Dst, Src, 128)
End Function

Public Function ShadeColors(ByVal Dst As Long, ByVal Src As Long, ByVal Shade As Byte)
    Select Case Shade
    Case 0:  ShadeColors = Dst
    Case 255: ShadeColors = Src
    Case Else:
    ShadeColors = (Src And &HFF) * Shade / 255 + (Dst And &HFF) * (255 - Shade) / 255 Or _
            ((Src And &HFF00&) * Shade / 255 + (Dst And &HFF00&) * (255 - Shade) / 255) And &HFF00& Or _
            ((Src And &HFF0000) * (Shade / 255) + (Dst And &HFF0000) * ((255 - Shade) / 255)) And &HFF0000
    End Select
End Function

Public Function FoxBrightness(ByVal DstDC As Long, ByVal DstBmp As Long, ByVal SrcDC As Long, ByVal SrcBmp As Long, ByVal TransColor As Long, ByVal Brightness As Long, Optional ByVal Flags As Long) As Long
    Dim BitCount As Long
    Dim retVal As Long
    Dim Info As BITMAPINFO
    Dim Width As Long, Height As Long
    Dim TransR As Byte, TransG As Byte, TransB As Byte
    Dim LineWidth As Long
    Dim Bits() As Byte
    Dim I As Long, B As Long, H As Long, D As Long
    
    TransR = TransColor And &HFF
    TransG = (TransColor And &HFF00&) / 255
    TransB = (TransColor And &HFF0000) / 65536
    Info.bmiHeader.biSize = Len(Info.bmiHeader)
     
    retVal = GetDIBits(SrcDC, SrcBmp, 0, 0, ByVal 0, Info, 0)
    If retVal = 0 Then Exit Function
    Width = Info.bmiHeader.biWidth
    Height = Info.bmiHeader.biHeight
    
    Info.bmiHeader.biBitCount = 24
    Info.bmiHeader.biCompression = 0
    LineWidth = Width * 3
    If (LineWidth Mod 4) Then LineWidth = LineWidth + 4 - (LineWidth Mod 4)
    BitCount = LineWidth * Height
    ReDim Bits(BitCount - 1)
    retVal = GetDIBits(SrcDC, SrcBmp, 0, Height, Bits(0), Info, 0)
    If retVal Then
        If Brightness < -255 Then Brightness = -255
        If Brightness > 255 Then Brightness = 255
        I = 0
        For H = 0 To Height - 1: For B = 0 To Width - 1
            I = H * LineWidth + 3 * B
            If (Flags And &H1) And (Bits(I + 2) = TransR) And (Bits(I + 1) = TransG) And (Bits(I) = TransB) Then
            Else
                If Brightness < 0 Then
                    For D = 0 To 2: Bits(I + D) = Bits(I + D) * (255 + Brightness) / 255: Next D
                ElseIf Brightness > 0 Then
                    For D = 0 To 2: Bits(I + D) = 255 - (255 - Bits(I + D)) * (255 - Brightness) / 255: Next D
                End If
            End If
        Next B: Next H

        SetDIBits DstDC, DstBmp, 0, Height, Bits(0), Info, 0
        Erase Bits
    End If
End Function

Public Function FoxBlendIn(ByVal DstDC As Long, ByVal DstX As Long, ByVal DstY As Long, ByVal SrcDC As Long, ByVal SrcBmp As Long, ByVal TransColor As Long, ByVal Alpha As Byte, Optional ByVal Flags As Long) As Long

End Function

Public Function FoxRotate(ByVal DstDC As Long, ByVal DstX As Long, ByVal DstY As Long, ByVal SrcDC As Long, ByVal SrcBmp As Long, ByVal TransColor As Long, ByVal Angle As Double, Optional ByVal Flags As Long) As Long
    Dim TmpDC As Long, TmpBmp As Long, OldObject As Long
    Dim BitCount As Long, BitCount2 As Long, LineWidth As Long, LineWidth2 As Long
    Dim retVal As Long
    Dim Width As Long, Height As Long, NewSize As Long
    Dim H As Long, B As Long, F As Long, D As Long, I As Long
    Dim dx1 As Double, dy1 As Double
    Dim TransR As Byte, TransG As Byte, TransB As Byte
    Dim TempAlpha As Byte
    Dim Info As BITMAPINFO, Info2 As BITMAPINFO
    Dim SrcBits() As Byte, TmpBits() As Byte
    
    TransR = TransColor And &HFF
    TransG = (TransColor And &HFF00&) / 255
    TransB = (TransColor And &HFF0000) / 65536
    Info.bmiHeader.biSize = Len(Info.bmiHeader)
    Info2.bmiHeader.biSize = Len(Info2.bmiHeader)
    retVal = GetDIBits(SrcDC, SrcBmp, 0, 0, ByVal 0, Info, 0)
    If retVal = 0 Then Exit Function
    TmpDC = CreateCompatibleDC(SrcDC)
    Width = Info.bmiHeader.biWidth
    Height = Info.bmiHeader.biHeight
    NewSize = Math.Sqr(Width ^ 2 + Height ^ 2) + 2
    
    TmpBmp = CreateCompatibleBitmap(SrcDC, NewSize, NewSize)
    If TmpBmp Then
        OldObject = SelectObject(TmpDC, TmpBmp)
        BitBlt TmpDC, 0, 0, NewSize, NewSize, DstDC, DstX - NewSize / 2, DstY - NewSize / 2, vbSrcCopy

        Info.bmiHeader.biBitCount = 24
        Info.bmiHeader.biCompression = 0
        Info2.bmiHeader.biBitCount = 24
        Info2.bmiHeader.biCompression = 0
        Info2.bmiHeader.biPlanes = 1
        Info2.bmiHeader.biHeight = NewSize
        Info2.bmiHeader.biWidth = NewSize
        
        LineWidth = Width * 3
        If (LineWidth Mod 4) Then LineWidth = LineWidth + 4 - (LineWidth Mod 4)
        BitCount = LineWidth * Height
        
        LineWidth2 = NewSize * 3
        If (LineWidth2 Mod 4) Then LineWidth2 = LineWidth2 + 4 - (LineWidth2 Mod 4)
        BitCount2 = LineWidth2 * NewSize
        
        ReDim SrcBits(BitCount - 1)
        ReDim TmpBits(BitCount2 - 1)
        GetDIBits SrcDC, SrcBmp, 0, Height, SrcBits(0), Info, 0
        GetDIBits TmpDC, TmpBmp, 0, NewSize, TmpBits(0), Info2, 0




        Dim CurOffset As Long
        Dim NewX As Double, NewY As Double
        Dim Xmm As Long, Ymm As Long
        Dim I1 As Long
        Dim v1 As Boolean
        dx1 = Cos(Angle * PIDEG)
        dy1 = Sin(Angle * PIDEG)
        
        For H = 0 To NewSize - 1
            CurOffset = LineWidth2 * H
            For B = 0 To NewSize - 1
                F = CurOffset + 3 * B
                NewX = Width / 2 + (B - NewSize / 2) * dx1 - (H - NewSize / 2) * dy1
                NewY = Height / 2 + (B - NewSize / 2) * dy1 + (H - NewSize / 2) * dx1
                
                Xmm = Int(NewX + 0.5)
                Ymm = Int(NewY + 0.5)
                If (Xmm >= 0) And (Xmm < Width) And (Ymm >= 0) And (Ymm < Height) Then
                    v1 = True
                    I1 = LineWidth * Ymm + 3 * Xmm
                    If Flags And &H1 Then
                        v1 = Not (SrcBits(I1 + 2) = TransR And SrcBits(I1 + 1) = TransG And SrcBits(I1) = TransB)
                    End If
                    If v1 Then For D = 0 To 2: TmpBits(F + D) = SrcBits(I1 + D): Next D
                End If
            Next B
        Next H
        
        SetDIBitsToDevice DstDC, DstX - NewSize / 2, DstY - NewSize / 2, NewSize, NewSize, 0, 0, 0, NewSize, TmpBits(0), Info2, 0
        Erase SrcBits
        Erase TmpBits
        DeleteObject SelectObject(TmpDC, OldObject)
    End If
    DeleteDC TmpDC
End Function

Public Function FoxBlur(ByVal DstDC As Long, ByVal DstBmp As Long, ByVal SrcDC As Long, ByVal SrcBmp As Long, ByVal TransColor As Long, ByVal Blur As Long, Optional ByVal Flags As Long) As Long

End Function

Public Function FoxAlphaBlend(ByVal DstDC As Long, ByVal DstX As Long, ByVal DstY As Long, ByVal DstW As Long, ByVal DstH As Long, ByVal SrcDC As Long, ByVal SrcX As Long, ByVal SrcY As Long, ByVal Alpha As Byte, ByVal TransColor As Long, ByVal Flags As Long) As Long
    If Alpha = 0 Or DstW = 0 Or DstH = 0 Then Exit Function
    Dim B As Long, H As Long, F As Long, I As Long
    Dim TmpDC As Long, TmpBmp As Long, TmpObj As Long
    Dim Sr2DC As Long, Sr2Bmp As Long, Sr2Obj As Long
    Dim Data1() As Long, Data2() As Long
    Dim Info As BITMAPINFO
    
    
    TmpDC = CreateCompatibleDC(SrcDC)
    Sr2DC = CreateCompatibleDC(SrcDC)
    TmpBmp = CreateCompatibleBitmap(DstDC, DstW, DstH)
    Sr2Bmp = CreateCompatibleBitmap(DstDC, DstW, DstH)
    TmpObj = SelectObject(TmpDC, TmpBmp)
    Sr2Obj = SelectObject(Sr2DC, Sr2Bmp)
    ReDim Data1(DstW * DstH * 4 - 1)
    ReDim Data2(DstW * DstH * 4 - 1)
    Info.bmiHeader.biSize = Len(Info.bmiHeader)
    Info.bmiHeader.biWidth = DstW
    Info.bmiHeader.biHeight = DstH
    Info.bmiHeader.biPlanes = 1
    Info.bmiHeader.biBitCount = 32
    Info.bmiHeader.biCompression = 0

    BitBlt TmpDC, 0, 0, DstW, DstH, DstDC, DstX, DstY, vbSrcCopy
    BitBlt Sr2DC, 0, 0, DstW, DstH, SrcDC, SrcX, SrcY, vbSrcCopy
    GetDIBits TmpDC, TmpBmp, 0, DstH, Data1(0), Info, 0
    GetDIBits Sr2DC, Sr2Bmp, 0, DstH, Data2(0), Info, 0
    
    For H = 0 To DstH - 1
        F = H * DstW
        For B = 0 To DstW - 1
            I = F + B
            If (Flags And &H1) And ((Data2(I) And &HFFFFFF) = TransColor) Then
            Else
                Data1(I) = ShadeColors(Data1(I), Data2(I), Alpha)
            End If
        Next B
    Next H

    SetDIBitsToDevice DstDC, DstX, DstY, DstW, DstH, 0, 0, 0, DstH, Data1(0), Info, 0

    Erase Data1
    Erase Data2
    DeleteObject SelectObject(TmpDC, TmpObj)
    DeleteObject SelectObject(Sr2DC, Sr2Obj)
    DeleteDC TmpDC
    DeleteDC Sr2DC
End Function

Public Function FoxBumpMap(ByVal DstDC As Long, ByVal DstX As Long, ByVal DstY As Long, ByVal DstW As Long, ByVal DstH As Long, ByVal SrcDC As Long, ByVal SrcX As Long, ByVal SrcY As Long, ByVal TransColor As Long, ByVal Flags As Long) As Long

End Function
