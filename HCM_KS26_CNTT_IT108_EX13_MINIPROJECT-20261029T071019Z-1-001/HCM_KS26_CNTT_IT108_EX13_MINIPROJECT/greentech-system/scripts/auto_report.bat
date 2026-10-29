@echo off
REM ============================================================
REM  auto_report.bat - Robot loc log tu dong cho GreenTech
REM  Dinh vi file theo duong dan tuong doi (%~dp0 = thu muc script)
REM ============================================================
setlocal

set "ROOT=%~dp0.."
set "LOG=%ROOT%\data\log-he-thong.log"
set "OUT=%ROOT%\backup\bao-cao-su-co.txt"

REM ---------- AUDIT (tham dinh truoc khi chay) ----------
REM Script nay KHONG chua lenh xoa nguy hiem (del /f /s /q, rd /s /q).
REM Chi doc log (type) va GHI NOI DUOI (>>), khong ghi de, khong xoa du lieu.
echo [AUDIT] Log nguon : "%LOG%"
echo [AUDIT] Bao cao   : "%OUT%"
if not exist "%LOG%" (
    echo [LOI] Khong tim thay file log. Dung chuong trinh.
    exit /b 1
)
if not exist "%ROOT%\backup" mkdir "%ROOT%\backup"

REM ---------- TIEU DE BAO CAO ----------
echo ============================================== >> "%OUT%"
echo     BAO CAO SU CO HE THONG - GREENTECH         >> "%OUT%"
echo     Thoi diem chay: %date% %time%              >> "%OUT%"
echo     Tu khoa loc   : CRITICAL, ERROR            >> "%OUT%"
echo ============================================== >> "%OUT%"

REM ---------- LOC LOG QUA PIPE (doc tung dong, khong nap het vao RAM) ----------
type "%LOG%" | findstr /C:"CRITICAL" /C:"ERROR" >> "%OUT%"

echo. >> "%OUT%"
echo --- Het bao cao --- >> "%OUT%"
echo [XONG] Da them ket qua vao: "%OUT%"
endlocal
pause
