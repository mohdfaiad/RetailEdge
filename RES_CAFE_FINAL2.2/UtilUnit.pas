unit UtilUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, ExtCtrls, Printers, DataUnit, MessageBox, DateUtils;

function  CheckNum(Text: string; TextLen: integer; Max, Min: double; NumFlag: Char): boolean;
function  TransferDate(DateStr: string): TDateTime;
function  ConvertDateTime(DateTimeVar: TDateTime): string;
function  CheckDate(DateStr: string): boolean;
procedure SaveDevicePortInfo;
procedure ReadDevicePortInfo;
procedure ReadMachineID;
procedure SaveMachineID;
function  GeneratePriceFieldName(PriceSelect: integer; HappyHourPrice: boolean): string;
function  GenerateSubDescriptionFieldName(PriceSelect: integer): string;
function  CopyDescription(Description: string): string;
function  DeleteSpace(Value: string): string;
function  SearchString(StringList: TStrings; S: string): Integer;
procedure GetLocalMachineName(var MachineName: string);
function  FormatCurrency(X: double): string;
function  CheckHappyHourTime: boolean;
function  CheckScreenResolution: boolean;
function  CheckQuotes(StringTemp: Widestring): Widestring;
function  RoundToCurrency(Amount: double): double;
//procedure WritePort(Port: word; Value: byte);
//procedure Out32(wAddr:word; bOut:byte); stdcall; external 'VPOS_OUTPUT.dll'
//function  Inp32(wAddr:word): integer; stdcall; external 'VPOS_OUTPUT.dll'
function MyCheckErrorMsg(__ErrorInfo : string) : boolean;

procedure SaveDVRIP;
procedure SaveDVRUser;
Procedure SaveDVRPWD;
procedure SaveDVRNo;

procedure ReadDVRIP;
Procedure ReadDVRNo;
procedure ReadDVRPWD;
procedure ReadDVRUser;

implementation

function CheckNum(Text: string; TextLen: integer; Max, Min: double; NumFlag: Char): boolean;
var
 Temp: double;
begin
 Result := False;
 if (Length(Text) > TextLen) then
    begin
     MessageBoxForm.MessagePro('Data out of range!', sErrorMsg);
     Exit;
    end;
 try
  if NumFlag = 'F' then
     Temp := StrToFloat(Text)
    else
     Temp := StrToInt(Text)
 except
  MessageBoxForm.MessagePro('Data is invalid!', sErrorMsg);
  EXit;
 end;
 if (Temp < Min) or (Temp > Max)  then
    begin
     MessageBoxForm.MessagePro('Data out of range!', sErrorMsg);
     EXit;
    end;
 Result := True;
end;

function TransferDate(DateStr: string): TDateTime;
var
 Year, Month, Day: word;
 sYear, sMonth, sDay: string;
 I, Count: integer;
begin
 sYear := ''; sMonth := ''; sDay := '';
 I := 1; Count := Length(DateStr);
 while (I < Count) and (DateStr[I] In ['0'..'9']) do
  begin
   sDay := sDay + DateStr[I];
   I := I + 1;
  end;
 I := I + 1;
 while (I < Count) and (DateStr[I] In ['0'..'9']) do
  begin
   sMonth := sMonth + DateStr[I];
   I := I + 1;
  end;
 I := I + 1;
 while I <= Count do
  begin
   sYear := sYear + DateStr[I];
   I := I + 1;
  end;
 Day := StrToInt(sDay); Month := StrToInt(sMonth); Year := StrToInt(sYear);
 Result := EncodeDate(Year, Month, Day);
end;

function ConvertDateTime(DateTimeVar: TDateTime): string;
begin
 Result := Chr(39) + FormatDateTime('mm/dd/yyyy hh:mm:ss', DateTimeVar) + Chr(39);
end;

function CheckDate(DateStr: string): boolean;
var
 Year, Month, Day: word;
 sYear, sMonth, sDay: string;
 I, Count: integer;
begin
 sYear := ''; sMonth := ''; sDay := '';
 Result := True;
 try
  I := 1; Count := Length(DateStr);
  while (I < Count) and (DateStr[I] In ['0'..'9']) do
   begin
    sDay := sDay + DateStr[I];
    I := I + 1;
   end;
  I := I + 1;
  while (I < Count) and (DateStr[I] In ['0'..'9']) do
   begin
    sMonth := sMonth + DateStr[I];
    I := I + 1;
   end;
  I := I + 1;
  while I <= Count do
   begin
    sYear := sYear + DateStr[I];
    I := I + 1;
   end;
  Day := StrToInt(sDay);
  Month := StrToInt(sMonth);
  Year := StrToInt(sYear);
  EncodeDate(Year, Month, Day);
 except
  MessageBoxForm.MessagePro('Date error!', sErrorMsg);
  Result := False;
 end;
end;

procedure SaveDevicePortInfo;
var
 F: File Of DevicePortType;
 FileName: string;
begin
 FileName := 'C:\PosVision.psp';
 AssignFile(F, FileName);
 Rewrite(F);
 Write(F, FVar);
 CloseFile(F);
end;

procedure ReadDevicePortInfo;
var
 TestF: File of Byte;
 NewF: File Of DevicePortType;
 OldF1: File of OldDevicePortType1;
 OldFvar1: OldDevicePortType1;
 OldF2: File of OldDevicePortType2;
 OldFvar2: OldDevicePortType2;
 OldF3: File of OldDevicePortType3;
 OldFvar3: OldDevicePortType3;
 OldF4: File of OldDevicePortType4;
 OldFvar4: OldDevicePortType4;
 FileName: string;
 Size: LongInt;
 I: integer;
begin
 with FVar do
  begin
   for I := 1 to 12 do
    begin
     StrPCopy(POSPrinter[I].Name, 'N/A');
     PrinterSpeed[I] := 5;
     PrinterFlowCtrl[I] := 0;
     AutoCutter[I] := 0;
     Thermal[I] := 0;
     JobListDuplicate[I] := 0;
     GoWithMessage[I] := 1;
    end;
   DefaultPrinter := 0;
   CashDrawerPort := 0;
   CashDrawerSpeed := 5;
   DrawerFlowCtrl := 0;
   CashDrawerMode := 0;
   CheckTillStatus := 0;
   SecondCashDrawerPort := 0;
   SecondCashDrawerSpeed := 5;
   SecondDrawerFlowCtrl := 0;
   SecondCashDrawerMode := 0;
   SecondCheckTillStatus := 0;
   PDAPrinterServer := 0;
   DefaultTablePage := 0;
   PoleDisplayPort := 0;
   PoleDisplaySpeed := 5;
   PoleFlowCtrl := 0;
   KitchenScreen := 0;
   SendDescription := 0;
   SecondDisplay := 0;
   LinkToEFTPOS := 0;
   ScalePort := 0;
   ScaleSpeed := 0;
   ScaleFlowCtrl := 0;
   ScaleModel := 0;
   PrintLogoOnPOSPrinter := 0;
   DefaultMainMenuGroupCode := 0;
   DefaultPOSMenuGroupCode := 0;
   PoleDisplayMode := 0;
   FeedLines := 5;
   FirstFeedLines := 0;
   CheckListPrinterPort := 0;
   SupportChineseCharacterPrinter := 1;
   DefaultPhoneOrderMenuGroupCode := 0;
   SecurityCameraPort := 0;
   SecurityCameraPortSpeed := 5;
   SecurityCameraPortControl := 0;
   for I := 1 to 12 do StrPCopy(TableOrderJobListTitle[I].TitleName, 'JOB LIST');
   for I := 1 to 12 do StrPCopy(QuickServiceJobListTitle[I].TitleName, 'JOB LIST');
   for I := 1 to 12 do StrPCopy(PhoneOrderJobListTitle[I].TitleName, 'JOB LIST');
   Reserver1 := 0;
   Reserver2 := 0;
   Reserver3 := 0;
   Reserver4 := 0;
   Reserver5 := 0;
   Reserver6 := 0;
   Reserver7 := 0;
   Reserver8 := 0;
  end;
 FileName := 'C:\PosVision.psp';
 if Not FileExists(FileName) then Exit;
 AssignFile(TestF, FileName);
 Reset(TestF);
 Size := FileSize(TestF);
 CloseFile(TestF);
 if (Size <> sizeof(DevicePortType)) and (Size <> Sizeof(OldDevicePortType1)) and
    (Size <> Sizeof(OldDevicePortType2)) and (Size <> Sizeof(OldDevicePortType3)) and
    (Size <> Sizeof(OldDevicePortType4)) then
    DeleteFile(FileName)
   else
    if (Size = Sizeof(DevicePortType)) then
        begin
         AssignFile(NewF, FileName);
         Reset(NewF);
         Read(NewF, FVar);
         CloseFile(NewF);
         if FVar.FeedLines < 0 then FVar.FeedLines := 5;
        end
       else
        if Size = SizeOf(OldDevicePortType1) then
           begin
            AssignFile(OldF1, FileName);
            Reset(OldF1);
            Read(OldF1, OldFVar1);
            CloseFile(OldF1);
            for I := 1 to 12 do
             begin
              FVar.POSPrinter[I].Name := OldFVar1.POSPrinter[I].Name;
              FVar.PrinterSpeed[I] := OldFVar1.PrinterSpeed[I];
              FVar.PrinterFlowCtrl[I] := OldFVar1.PrinterFlowCtrl[I];
              FVar.AutoCutter[I] := OldFVar1.AutoCutter[I];
              FVar.Thermal[I] := OldFVar1.Thermal[I];
             end;
             FVar.DefaultPrinter := OldFVar1.DefaultPrinter;
             FVar.CashDrawerPort := OldFVar1.CashDrawerPort;
             FVar.CashDrawerSpeed := OldFVar1.CashDrawerSpeed;
             FVar.DrawerFlowCtrl := OldFVar1.DrawerFlowCtrl;
             FVar.CashDrawerMode := OldFVar1.CashDrawerMode;
             FVar.CheckTillStatus := OldFVar1.CheckTillStatus;
             FVar.PoleDisplayPort := OldFVar1.PoleDisplayPort;
             FVar.PoleDisplaySpeed := OldFVar1.PoleDisplaySpeed;
             FVar.PoleFlowCtrl := OldFVar1.PoleFlowCtrl;
             FVar.KitchenScreen := OldFVar1.KitchenScreen;
             FVar.SendDescription := OldFVar1.SendDescription;
             FVar.SecondDisplay := OldFVar1.SecondDisplay;
             FVar.PDAPrinterServer := OldFVar1.PDAPrinterServer;
             FVar.DefaultTablePage := OldFVar1.DefaultTablePage;
             FVar.ScalePort := OldFVar1.ScalePort;
             FVar.ScaleSpeed := OldFVar1.ScaleSpeed;
             FVar.ScaleFlowCtrl := OldFVar1.ScaleFlowCtrl;
             SaveDevicePortInfo;
            end
           else
            if Size = SizeOf(OldDevicePortType2) then
               begin
                AssignFile(OldF2, FileName);
                Reset(OldF2);
                Read(OldF2, OldFVar2);
                CloseFile(OldF2);
                for I := 1 to 12 do
                 begin
                  FVar.POSPrinter[I].Name := OldFVar2.POSPrinter[I].Name;
                  FVar.PrinterSpeed[I] := OldFVar2.PrinterSpeed[I];
                  FVar.PrinterFlowCtrl[I] := OldFVar2.PrinterFlowCtrl[I];
                  FVar.AutoCutter[I] := OldFVar2.AutoCutter[I];
                  FVar.Thermal[I] := OldFVar2.Thermal[I];
                 end;
                FVar.DefaultPrinter := OldFVar2.DefaultPrinter;
                FVar.CashDrawerPort := OldFVar2.CashDrawerPort;
                FVar.CashDrawerSpeed := OldFVar2.CashDrawerSpeed;
                FVar.DrawerFlowCtrl := OldFVar2.DrawerFlowCtrl;
                FVar.CashDrawerMode := OldFVar2.CashDrawerMode;
                FVar.CheckTillStatus := OldFVar2.CheckTillStatus;
                FVar.PoleDisplayPort := OldFVar2.PoleDisplayPort;
                FVar.PoleDisplaySpeed := OldFVar2.PoleDisplaySpeed;
                FVar.PoleFlowCtrl := OldFVar2.PoleFlowCtrl;
                FVar.ScalePort := OldFVar2.ScalePort;
                FVar.ScaleSpeed := OldFVar2.ScaleSpeed;
                FVar.ScaleFlowCtrl := OldFVar2.ScaleFlowCtrl;
                FVar.ScaleModel := OldFVar2.ScaleModel;
                FVar.KitchenScreen := OldFVar2.KitchenScreen;
                FVar.SendDescription := OldFVar2.SendDescription;
                FVar.SecondDisplay := OldFVar2.SecondDisplay;
                FVar.PDAPrinterServer := OldFVar2.PDAPrinterServer;
                FVar.DefaultTablePage := OldFVar2.DefaultTablePage;
                FVar.LinkToEFTPOS := OldFVar2.LinkToEFTPOS;
                SaveDevicePortInfo;
               end
              else
               if Size = SizeOf(OldDevicePortType3) then
                  begin
                   AssignFile(OldF3, FileName);
                   Reset(OldF3);
                   Read(OldF3, OldFVar3);
                   CloseFile(OldF3);
                   for I := 1 to 12 do
                    begin
                     FVar.POSPrinter[I].Name := OldFVar3.POSPrinter[I].Name;
                     FVar.PrinterSpeed[I] := OldFVar3.PrinterSpeed[I];
                     FVar.PrinterFlowCtrl[I] := OldFVar3.PrinterFlowCtrl[I];
                     FVar.AutoCutter[I] := OldFVar3.AutoCutter[I];
                     FVar.Thermal[I] := OldFVar3.Thermal[I];
                    end;
                   FVar.DefaultPrinter := OldFVar3.DefaultPrinter;
                   FVar.CashDrawerPort := OldFVar3.CashDrawerPort;
                   FVar.CashDrawerSpeed := OldFVar3.CashDrawerSpeed;
                   FVar.DrawerFlowCtrl := OldFVar3.DrawerFlowCtrl;
                   FVar.CashDrawerMode := OldFVar3.CashDrawerMode;
                   FVar.CheckTillStatus := OldFVar3.CheckTillStatus;
                   FVar.SecondCashDrawerPort := OldFVar3.SecondCashDrawerPort;
                   FVar.SecondCashDrawerSpeed := OldFVar3.SecondCashDrawerSpeed;
                   FVar.SecondDrawerFlowCtrl := OldFVar3.SecondDrawerFlowCtrl;
                   FVar.SecondCashDrawerMode := OldFVar3.SecondCashDrawerMode;
                   FVar.SecondCheckTillStatus := OldFVar3.SecondCheckTillStatus;
                   FVar.ScalePort := OldFVar3.ScalePort;
                   FVar.ScaleSpeed := OldFVar3.ScaleSpeed;
                   FVar.ScaleFlowCtrl := OldFVar3.ScaleFlowCtrl;
                   FVar.ScaleModel := OldFVar3.ScaleModel;
                   FVar.PoleDisplayPort := OldFVar3.PoleDisplayPort;
                   FVar.PoleDisplaySpeed := OldFVar3.PoleDisplaySpeed;
                   FVar.PoleFlowCtrl := OldFVar3.PoleFlowCtrl;
                   FVar.KitchenScreen := OldFVar3.KitchenScreen;
                   FVar.SendDescription := OldFVar3.SendDescription;
                   FVar.SecondDisplay := OldFVar3.SecondDisplay;
                   FVar.PDAPrinterServer := OldFVar3.PDAPrinterServer;
                   FVar.DefaultTablePage := OldFVar3.DefaultTablePage;
                   FVar.LinkToEFTPOS := OldFVar3.LinkToEFTPOS;
                   FVar.PrintLogoOnPOSPrinter := OldFVar3.PrintLogoOnPOSPrinter;
                   FVar.DefaultMainMenuGroupCode := OldFVar3.DefaultMainMenuGroupCode;
                   FVar.DefaultPOSMenuGroupCode := OldFVar3.DefaultPOSMenuGroupCode;
                   FVar.PoleDisplayMode := OldFVar3.PoleDisplayMode;
                   FVar.FeedLines := OldFVar3.FeedLines;
                   FVar.FirstFeedLines := OldFVar3.FirstFeedLines;
                   FVar.CheckListPrinterPort := OldFVar3.CheckListPrinterPort;
                   FVar.SupportChineseCharacterPrinter := OldFVar3.SupportChineseCharacterPrinter;
                   FVar.DefaultPhoneOrderMenuGroupCode := OldFVar3.DefaultPhoneOrderMenuGroupCode;
                   SaveDevicePortInfo;
                  end
                 else
                  if Size = SizeOf(OldDevicePortType4) then
                     begin
                      AssignFile(OldF4, FileName);
                      Reset(OldF4);
                      Read(OldF4, OldFVar4);
                      CloseFile(OldF4);
                      for I := 1 to 12 do
                        begin
                         FVar.POSPrinter[I].Name := OldFVar4.POSPrinter[I].Name;
                         FVar.PrinterSpeed[I] := OldFVar4.PrinterSpeed[I];
                         FVar.PrinterFlowCtrl[I] := OldFVar4.PrinterFlowCtrl[I];
                         FVar.AutoCutter[I] := OldFVar4.AutoCutter[I];
                         FVar.Thermal[I] := OldFVar4.Thermal[I];
                        end;
                      FVar.DefaultPrinter := OldFVar4.DefaultPrinter;
                      FVar.CashDrawerPort := OldFVar4.CashDrawerPort;
                      FVar.CashDrawerSpeed := OldFVar4.CashDrawerSpeed;
                      FVar.DrawerFlowCtrl := OldFVar4.DrawerFlowCtrl;
                      FVar.CashDrawerMode := OldFVar4.CashDrawerMode;
                      FVar.CheckTillStatus := OldFVar4.CheckTillStatus;
                      FVar.SecondCashDrawerPort := OldFVar4.SecondCashDrawerPort;
                      FVar.SecondCashDrawerSpeed := OldFVar4.SecondCashDrawerSpeed;
                      FVar.SecondDrawerFlowCtrl := OldFVar4.SecondDrawerFlowCtrl;
                      FVar.SecondCashDrawerMode := OldFVar4.SecondCashDrawerMode;
                      FVar.SecondCheckTillStatus := OldFVar4.SecondCheckTillStatus;
                      FVar.ScalePort := OldFVar4.ScalePort;
                      FVar.ScaleSpeed := OldFVar4.ScaleSpeed;
                      FVar.ScaleFlowCtrl := OldFVar4.ScaleFlowCtrl;
                      FVar.ScaleModel := OldFVar4.ScaleModel;
                      FVar.PoleDisplayPort := OldFVar4.PoleDisplayPort;
                      FVar.PoleDisplaySpeed := OldFVar4.PoleDisplaySpeed;
                      FVar.PoleFlowCtrl := OldFVar4.PoleFlowCtrl;
                      FVar.KitchenScreen := OldFVar4.KitchenScreen;
                      FVar.SendDescription := OldFVar4.SendDescription;
                      FVar.SecondDisplay := OldFVar4.SecondDisplay;
                      FVar.PDAPrinterServer := OldFVar4.PDAPrinterServer;
                      FVar.DefaultTablePage := OldFVar4.DefaultTablePage;
                      FVar.LinkToEFTPOS := OldFVar4.LinkToEFTPOS;
                      FVar.PrintLogoOnPOSPrinter := OldFVar4.PrintLogoOnPOSPrinter;
                      FVar.DefaultMainMenuGroupCode := OldFVar4.DefaultMainMenuGroupCode;
                      FVar.DefaultPOSMenuGroupCode := OldFVar4.DefaultPOSMenuGroupCode;
                      FVar.PoleDisplayMode := OldFVar4.PoleDisplayMode;
                      FVar.FeedLines := OldFVar4.FeedLines;
                      FVar.FirstFeedLines := OldFVar4.FirstFeedLines;
                      FVar.CheckListPrinterPort := OldFVar4.CheckListPrinterPort;
                      FVar.SupportChineseCharacterPrinter := OldFVar4.SupportChineseCharacterPrinter;
                      FVar.DefaultPhoneOrderMenuGroupCode := OldFVar4.DefaultPhoneOrderMenuGroupCode;
                      FVar.PoleDisplayMode := OldFVar4.PoleDisplayMode;
                      FVar.FeedLines := OldFVar4.FeedLines;
                      FVar.FirstFeedLines := OldFVar4.FirstFeedLines;
                      FVar.CheckListPrinterPort := OldFVar4.CheckListPrinterPort;
                      FVar.SupportChineseCharacterPrinter := OldFVar4.SupportChineseCharacterPrinter;
                      FVar.DefaultPhoneOrderMenuGroupCode := OldFVar4.DefaultPhoneOrderMenuGroupCode;
                      FVar.SecurityCameraPort := OldFVar4.SecurityCameraPort;
                      FVar.SecurityCameraPortSpeed := OldFVar4.SecurityCameraPortSpeed;
                      FVar.SecurityCameraPortControl := OldFVar4.SecurityCameraPortControl;
                      SaveDevicePortInfo;
                     end;
 if FVar.PoleDisplayMode < 0 then FVar.PoleDisplayMode := 0;
 if FVar.FeedLines < 0 then FVar.FeedLines := 0;
 if FVar.FirstFeedLines < 0 then FVar.FirstFeedLines := 0;
 if FVar.SupportChineseCharacterPrinter < 0 then FVar.SupportChineseCharacterPrinter := 1;
 if FVar.CheckListPrinterPort < 0 then FVar.CheckListPrinterPort := FVar.DefaultPrinter;
end;

function GeneratePriceFieldName(PriceSelect: integer; HappyHourPrice: boolean): string;
begin
 if HappyHourPrice then
    case PriceSelect of
     0: Result := 'HappyHourPrice1';
     1: Result := 'HappyHourPrice2';
     2: Result := 'HappyHourPrice3';
     3: Result := 'HappyHourPrice4';
    end
   else
    case PriceSelect of
     0: Result := 'Price';
     1: Result := 'Price1';
     2: Result := 'Price2';
     3: Result := 'Price3';
    end;
end;

function GenerateSubDescriptionFieldName(PriceSelect: integer): string;
begin
 case PriceSelect of
  0: Result := 'SubDescription';
  1: Result := 'SubDescription1';
  2: Result := 'SubDescription2';
  3: Result := 'SubDescription3';
 end;
end;

function CopyDescription(Description: string): string;
var
 StrTemp, LineStr, Temp, FirstLine: string;
 I, L, LineCount: integer;
begin
 StrTemp := ''; Temp :=''; LineStr := ''; FirstLine := '';
 I := 1; LineCount := 0;
 L := Length(Description);
 if ButtonLayOut = 1 then
    begin
     while (I <= L) and (Description[I] <> ' ') do
      begin
       FirstLine := FirstLine + Description[I];
       I := I + 1;
      end;
     LineCount := 1;
     I := I + 1;
    end;
 if I <= L then
    begin
     while (I <= L) and (LineCount < 4) do
      begin
       case Description[I] of
        '&': Temp := Temp + '&&';
        ' ': if (Length(LineStr) + Length(Temp)) <= 12 then
                begin
                 if LineStr <> '' then
                    LineStr := LineStr + ' ' + Temp
                   else
                    LineStr := Temp;
                 Temp := '';
                end
               else
                begin
                 if lineStr <> '' then
                    begin
                     LineCount := LineCount + 1;
                     if StrTemp <> '' then
                        StrTemp := StrTemp + Chr(13) + Chr(10) + LineStr
                       else
                        StrTemp := LineStr;
                    end;
                 LineStr := Temp;
                 Temp := '';
                end;
        else
         Temp := Temp + Description[I];
       end;
       I := I + 1;
      end;
     if (Length(LineStr) + Length(Temp)) <= 12 then
        LineStr := LineStr + ' ' + Temp
       else
        begin
         LineCount := LineCount + 1;
         if StrTemp <> '' then
            StrTemp := StrTemp + Chr(13) + Chr(10) + LineStr
           else
            StrTemp := LineStr;
         LineStr := Temp;
         Temp := '';
        end;
     if (LineStr <> '') and (LineCount < 4) then
        begin
         if StrTemp <> '' then
            StrTemp := StrTemp + Chr(13) + Chr(10) + LineStr
           else
            StrTemp := LineStr;
        end;
    end;
 if ButtonLayOut = 1 then
    begin
     if (StrTemp <> '') then
        Result := FirstLine + Chr(13) + Chr(10) + StrTemp
       else
        Result := FirstLine;
    end
   else
    Result := StrTemp;
end;

function DeleteSpace(Value: string): string;
var
 I: integer;
 Temp: string;
begin
 Temp := '';
 for I := 1 to Length(Value) do
  if Value[I] <> ' ' then Temp := Temp + Value[I];
 Result := Temp;
end;

function SearchString(StringList: TStrings; S: string): Integer;
var
 I: Integer;
begin
  I := 0;
  while (I < StringList.Count) and (StringList[I] <> S) do
   Inc(I);
  if (StringList[I] <> S) then
     Result := -1
    else
     Result := I;
end;

procedure GetLocalMachineName(var MachineName: string);
var
 S: array [1..MAX_COMPUTERNAME_LENGTH + 1] of char;
 NameLength: DWORD;
begin
 NameLength := MAX_COMPUTERNAME_LENGTH + 1;
 GetComputerName(@S, NameLength);
 MachineName := Copy(String(S), 1, NameLength);
end;

function FormatCurrency(X: double): string;
begin
 Result := sCurrency + Format('%4.2f', [ABS(X)]);
 if X < 0 then Result := '-' + Result;
end;

function CheckHappyHourTime: boolean;
begin
 case DayOfTheWeek(Date + Time) of
  1: Result := (Time >= HappyHourStartTime) and (Time <= HappyHourEndTime);
  2: Result := (Time >= HappyHourStartTime1) and (Time <= HappyHourEndTime1);
  3: Result := (Time >= HappyHourStartTime2) and (Time <= HappyHourEndTime2);
  4: Result := (Time >= HappyHourStartTime3) and (Time <= HappyHourEndTime3);
  5: Result := (Time >= HappyHourStartTime4) and (Time <= HappyHourEndTime4);
  6: Result := (Time >= HappyHourStartTime5) and (Time <= HappyHourEndTime5);
  7: Result := (Time >= HappyHourStartTime6) and (Time <= HappyHourEndTime6);
 else
  Result := False;
 end;
end;

function CheckScreenResolution: boolean;
var
 lpDevMode: TDeviceMode;
begin
 Result := (Screen.Width >= 1024) and (Screen.Height >= 768);
 if Not Result and
    (MessageBoxForm.MessagePro('This program only support 1024 X 768 resolution.' +
    Chr(13) + Chr(10) + Chr(13) + Chr(10) +
    'Do you want to adjustment your screen resolution?', sConfirmMsg) = mrYes) then
    begin
     Result := EnumDisplaySettings(Nil, 0, lpDevMode);
     if Result then
        begin
         lpDevMode.dmFields := DM_PELSWIDTH or DM_PELSHEIGHT;
         lpDevMode.dmPelsWidth := 1024;
         lpDevMode.dmPelsHeight := 768;
         Result := ChangeDisplaySettings(lpDevMode, 0) = DISP_CHANGE_SUCCESSFUL;
        end
       else
        Result := False;
    end;
end;

function CheckQuotes(StringTemp: Widestring): Widestring;
var
 I: integer;
begin
 I := 1; Result := '';
 while I <= Length(StringTemp) do
  begin
   if (StringTemp[I] = Chr(39)) or (StringTemp[I] = '`') then
      Result := Result + Chr(39) + Chr(39)
     else
      Result := Result + StringTemp[I];
   I := I + 1;
  end;
end;

function RoundToCurrency(Amount: double): double;
begin
 if Amount >= 0 then
    Result := Trunc(Amount * 100 + 0.500005) / 100
   else
    Result := Trunc(Amount * 100 - 0.500005) / 100;
end;

procedure ReadMachineID;
var
 FileName: string;
 F: TextFile;
begin
 FileName := 'C:\Terminal.psp';
 if Not FileExists(FileName) then
    MachineID := ''
   else
    begin
     AssignFile(F, FileName);
     Reset(F);
     Readln(F, MachineID);
     CloseFile(F);
    end;
end;

procedure SaveMachineID;
var
 FileName: string;
 F: TextFile;
begin
 FileName := 'C:\Terminal.psp';
 AssignFile(F, FileName);
 Rewrite(F);
 Writeln(F, MachineID);
 CloseFile(F);
end;

{procedure WritePort(Port: WORD; Value: BYTE);
begin
 Out32(Port, Value);
end;      }


function MyCheckErrorMsg(__ErrorInfo : string) : boolean; //??????
begin
    result := false;
    if (pos('????', __ErrorInfo) > 0) or (pos('connection failed', __ErrorInfo) > 0) or
       (pos('connectionopen (connect()).', __ErrorInfo) > 0) or (pos('cannot perform this operation on a closed dataset', __ErrorInfo) > 0) then
    begin
        result := true;
    end;
end;


procedure SaveDVRIP;
var
 FileName: string;
 F: TextFile;
  SysDir: array[0..$FF] of Char;
begin
 GetSystemDirectory(SysDir, SizeOf(SysDir));
 FileName := SysDir + '\DVRIP.SYS';
 AssignFile(F, FileName);
 Rewrite(F);
 Writeln(F, DVRIP);
 CloseFile(F);
end;

procedure SaveDVRUser;
var
 FileName: string;
 F: TextFile;
  SysDir: array[0..$FF] of Char;
begin
 GetSystemDirectory(SysDir, SizeOf(SysDir));
 FileName := SysDir + '\DVRUser.SYS';
 AssignFile(F, FileName);
 Rewrite(F);
 Writeln(F, DVRUser);
 CloseFile(F);
end;

procedure SaveDVRPWD;
var
 FileName: string;
 F: TextFile;
  SysDir: array[0..$FF] of Char;
begin
 GetSystemDirectory(SysDir, SizeOf(SysDir));
 FileName := SysDir + '\DVRPWD.SYS';
 AssignFile(F, FileName);
 Rewrite(F);
 Writeln(F, DVRPWD);
 CloseFile(F);
end;

procedure SaveDVRNo;
var
 FileName: string;
 F: TextFile;
  SysDir: array[0..$FF] of Char;
begin
 GetSystemDirectory(SysDir, SizeOf(SysDir));
 FileName := SysDir + '\DVRNo.SYS';
 AssignFile(F, FileName);
 Rewrite(F);
 Writeln(F, DVRNo);
 CloseFile(F);
end;


procedure ReadDVRNo;
var
 FileName: string;
 F: TextFile;
 SysDir: array[0..$FF] of Char;
begin
 GetSystemDirectory(SysDir, SizeOf(SysDir));
 FileName := SysDir + '\DVRNo.SYS';
 if Not FileExists(FileName) then
    DVRNo := ''
   else
    begin
     AssignFile(F, FileName);
     Reset(F);
     Readln(F, DVRNo);
     CloseFile(F);
    end;
end;

procedure ReadDVRIP;
var
 FileName: string;
 F: TextFile;
 SysDir: array[0..$FF] of Char;
begin
 GetSystemDirectory(SysDir, SizeOf(SysDir));
 FileName := SysDir + '\DVRIP.SYS';
 if Not FileExists(FileName) then
    DVRIP := ''
   else
    begin
     AssignFile(F, FileName);
     Reset(F);
     Readln(F, DVRIP);
     CloseFile(F);
    end;
end;

procedure ReadDVRUser;
var
 FileName: string;
 F: TextFile;
 SysDir: array[0..$FF] of Char;
begin
 GetSystemDirectory(SysDir, SizeOf(SysDir));
 FileName := SysDir + '\DVRUser.SYS';
 if Not FileExists(FileName) then
    DVRUser := ''
   else
    begin
     AssignFile(F, FileName);
     Reset(F);
     Readln(F, DVRUser);
     CloseFile(F);
    end;
end;

procedure ReadDVRPWD;
var
 FileName: string;
 F: TextFile;
 SysDir: array[0..$FF] of Char;
begin
 GetSystemDirectory(SysDir, SizeOf(SysDir));
 FileName := SysDir + '\DVRPWD.SYS';
 if Not FileExists(FileName) then
    DVRPWD := ''
   else
    begin
     AssignFile(F, FileName);
     Reset(F);
     Readln(F, DVRPWD);
     CloseFile(F);
    end;
end;
end.

