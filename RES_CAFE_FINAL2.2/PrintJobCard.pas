unit PrintJobCard;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, UtilUnit, ADODB, Variants;

type
  BuffType = Record
   Qty: double;
   Category, Category1, Description1, Description2, VoidReason, SpecialOrder, Ingredients: string;
   Seat, IDNo, JobListColor: integer;
   Instruction: boolean;
   Price, DiscountRate: double;
  end;
  TPrintJobListForm = class(TDataModule)
    InstructionQuery: TADOQuery;
    Query: TADOQuery;
    procedure InitBuff;
    function  FindIDNo(IDNo: integer): integer;
    procedure InsertLine(RecordNo: integer);
    function  PostDataToBuff: integer;
    procedure OpenQuery(SQLStr: String);
    function  GetVoidReasonPro(VoidReasonCode: string): string;
    procedure OpenInstructionQuery(SQLStr: String);
    procedure PrintConfirmedOrder;
    procedure PrintUnConfirmedOrder;
    procedure PrintJobListPro;
    procedure PrintOutPro(PrinterPort: integer);
    procedure PrintJobList(OrderNo, IDStr: string; PrintAll, ConfirmedOrder: boolean; PrinterPort: integer);
  private { Private declarations }
    OrderNo, IDStr, TableNo, Telephone, ServicePerson, OrderDate, OpName: string;
    VIPName, VIPAddress, VIPState, VIPTelephone, CustomerName: string;
    VIPNo, Persons, OrderKindFlag, PrinterPort: Integer;
    PrintAll, JobListDuplicated, DeliveryFlag, ConfirmedOrder, AddNewItem: boolean;
    DueTime: TDateTime;
    Buff: array [1..500] of BuffType;

  public
    { Public declarations }
  end;

var
  PrintJobListForm: TPrintJobListForm;

implementation

uses DataUnit, PrintJobListControl;

{$R *.DFM}

procedure TPrintJobListForm.InitBuff;
var
 I: integer;
begin
 for I := 1 to 500 do
  with Buff[I] do
   begin
    Qty := 0;
    Category := '';
    Category1 := '';
    Description1 := '';
    Description2 := '';
    Seat := 0;
    IDNo := 0;
    JobListColor := 0;
    Instruction := False;
    Price := 0;
    DiscountRate := 0;
    VoidReason := '';
    SpecialOrder := '';
    Ingredients := '';
   end;
end;

procedure TPrintJobListForm.InsertLine(RecordNo: integer);
var
 I: integer;
begin
 for I := 500 Downto RecordNo + 1 do
  Buff[I] := Buff[I - 1];
 with Buff[RecordNo] do
  begin
   Qty := 0;
   Category := '';
   Category1 := '';
   Description1 := '';
   Description2 := '';
   Seat := 0;
   IDNo := 0;
   JobListColor := 0;
   Instruction := False;
   Price := 0;
   DiscountRate := 0;
   VoidReason := '';
   SpecialOrder := '';
  end;
end;

function TPrintJobListForm.FindIDNo(IDNo: integer): integer;
var
 I: integer;
begin
 I := 1;
 while (I <= 500) and (IDNo <> Buff[I].IDNo) do
  I := I + 1;
 if I < 500 then Result := I else Result := -1;
end;

function TPrintJobListForm.PostDataToBuff: integer;
var
 I, K, IDNo: integer;
 Description1, Description2, FieldName: string;
begin
 InitBuff; I := 0;
 with Query do
  begin
   First;
   while Not EOF do
    begin
     Description1 := FieldByName('Description1').AsString;
     Description2 := FieldByName('Description2').AsString;
     if FieldByName('Multiple').AsBoolean then
        begin
         FieldName := GenerateSubDescriptionFieldName(FieldByName('PriceSelect').AsInteger);
         if FieldByName(FieldName).AsString <> '' then
            begin
             if Not FieldByName('SubDescriptionSwap').AsBoolean then
                Description1 := Description1 + '/' + FieldByName(FieldName).AsString
               else
                Description1 := FieldByName(FieldName).AsString + '/' + Description1;
             if Description2 <> '' then
                begin
                 if Not FieldByName('SubDescriptionSwap').AsBoolean then
                    Description2 := Description2 + '/' + FieldByName(FieldName).AsString
                   else
                    Description2 := FieldByName(FieldName).AsString + '/' + Description2;
                end;
            end;
        end;
     I := I + 1;
     Buff[I].Qty := FieldByName('Qty').AsFloat;
     Buff[I].Description1 := Description1;
     Buff[I].Description2 := Description2;
     Buff[I].Category := FieldByName('Category').AsString;
     Buff[I].Category1 := FieldByName('Category1').AsString;
     Buff[I].Seat := FieldByName('Seat').AsInteger;
     Buff[I].IDNo := FieldByName('IDNo').AsInteger;
     Buff[I].JobListColor := FieldByName('JobListColor').AsInteger;
     Buff[I].Instruction := False;
     Buff[I].Price := FieldByName('Price').AsFloat;
     Buff[I].DiscountRate := FieldByName('Discount').AsFloat;
     Buff[I].VoidReason := FieldByName('VoidReason').AsString;
     Buff[I].SpecialOrder := FieldByName('SpecialOrder').AsString;
     Buff[I].Ingredients := FieldByName('Ingredients').AsString;
     Next;
    end;
   Close;
  end;
 with InstructionQuery do
  begin
   First;
   while Not EOF do
    begin
     Description1 := FieldByName('Description1').AsString;
     Description2 := FieldByName('Description2').AsString;
     if FieldByName('Multiple').AsBoolean then
        begin
         FieldName := GenerateSubDescriptionFieldName(FieldByName('PriceSelect').AsInteger);
         if FieldByName(FieldName).AsString <> '' then
            begin
             Description1 := Description1 + '/' + FieldByName(FieldName).AsString;
             Description2 := Description2 + '/' + FieldByName(FieldName).AsString;
            end;
        end;
     case FieldByName('Condition').AsInteger of
      1: Description1 := '* ' + Description1;
      2: Description1 := '[+] ' + Description1;
      3: Description1 := '[-] ' + Description1;
      4: Description1 := '[++] ' + Description1;
      5: Description1 := '[L] ' + Description1;
     end;
     if Description2 <> '' then
        case FieldByName('Condition').AsInteger of
         1: Description2 := '* ' + Description2;
         2: Description2 := '[+] ' + Description2;
         3: Description2 := '[-] ' + Description2;
         4: Description2 := '[++] ' + Description2;
         5: Description2 := '[L] ' + Description2;
        end;
     IDNo := FieldByName('IDNo').AsInteger - 1;
     K := FindIDNo(IDNo);
     if K > 0 then
        begin
         InsertLine(K + 1);
         Buff[K + 1].Qty := FieldByName('Qty').AsFloat;
         Buff[K + 1].Description1 := Description1;
         Buff[K + 1].Description2 := Description2;
         Buff[K + 1].Category := FieldByName('Category').AsString;
         Buff[K + 1].Category1 := FieldByName('Category1').AsString;
         Buff[K + 1].Seat := FieldByName('Seat').AsInteger;
         Buff[K + 1].IDNo := FieldByName('IDNo').AsInteger;
         Buff[K + 1].JobListColor := FieldByName('JobListColor').AsInteger;
         Buff[K + 1].Price := FieldByName('Price').AsFloat;
         Buff[K + 1].DiscountRate := FieldByName('Discount').AsFloat;
         Buff[K + 1].SpecialOrder := FieldByName('SpecialOrder').AsString;
         Buff[K + 1].Instruction := True;
         Buff[K + 1].VoidReason := '';
         Buff[K + 1].Ingredients := '';
         I := I + 1;
        end;
     Next;
    end;
  end;
 Result := I;
end;

procedure TPrintJobListForm.OpenQuery(SQLStr: String);
begin
 Screen.Cursor := crHourGlass;
 with Query do
  begin
   Active := False;
   Connection := DataForm.ADOConnection;
   SQL.Clear;
   SQL.Add(SQLStr);
   try
    Active := True;
   finally
    Screen.Cursor := crDefault;
   end;
  end;
end;

procedure TPrintJobListForm.OpenInstructionQuery(SQLStr: String);
begin
 Screen.Cursor := crHourGlass;
 with InstructionQuery do
  begin
   Active := False;
   Connection := DataForm.ADOConnection;
   SQL.Clear;
   SQL.Add(SQLStr);
   try
    Active := True;
   finally
    Screen.Cursor := crDefault;
   end;
  end;
end;

function TPrintJobListForm.GetVoidReasonPro(VoidReasonCode: string): string;
var
 SQLStr: string;
begin
 SQLStr := 'Select * From VoidReasonTable Where Code=' + Chr(39) + CheckQuotes(VoidReasonCode) + Chr(39);
 OpenQuery(SQLStr);
 with Query do
  if Active and (RecordCount > 0) then
     Result := FieldByName('Description').AsString
    else
     Result := '';
 Query.Close;
end;

procedure TPrintJobListForm.PrintOutPro(PrinterPort: integer);
var
 PrintStr, Description, StrTemp, Category, LineStr: string;
 I, CharCount, PaperWidth, PageCounter, JobListFormat: integer;
 Total: double;

begin
 JobListFormat := jobListFormatForPrinter[PrinterPort];
 PageCounter := 0;
 PaperWidth := 20;
 LineStr := '';
 for I := 1 to PaperWidth do LineStr := LineStr + '-';
 while (PageCounter = 0) or (JobListDuplicated and (PageCounter <= 1)) do
  begin
   Total := 0;
   DataForm.OpenPrinterPort(PrinterPort);
   DataForm.FeedsPaperLines;
   if JobListFontSize = 0 then
      DataForm.SetBlackFontB
     else
      DataForm.SetBlackFontC;
   if (PageCounter > 0) or PrintAll then
      begin
       //PrintStr := '******* COPY *******';
       PrintStr := '        Copy        ';
       DataForm.OutPutToPrinter(PrintStr);
       DataForm.OutPutToPrinter(' ');
      end
     else
      if AddNewItem then
         begin
          //PrintStr := '*** ADD NEW ITEM ***';
          PrintStr := '    Add New Item    ';
          DataForm.OutPutToPrinter(PrintStr);
          DataForm.OutPutToPrinter(' ');
         end
        else
         begin

          DataForm.OutPutToPrinter('');
          DataForm.OutPutToPrinter('');
         end;

   {case OrderKindFlag of
     sTableOrder: PrintStr := String(FVar.TableOrderJobListTitle[PrinterPort].TitleName);
     sPhoneOrder: PrintStr := String(FVar.PhoneOrderJobListTitle[PrinterPort].TitleName);
    else
     PrintStr := String(FVar.QuickServiceJobListTitle[PrinterPort].TitleName);
   end;
   if PrintStr <> '' then
      begin
       PrintStr := Format('%' + IntToStr((PaperWidth - Length(PrintStr)) div 2) + 's%s', ['', PrintStr]);
       DataForm.OutPutToPrinter(PrintStr);

      end;
   DataForm.OutPutToPrinter(LineStr);  }

   if ConfirmedOrder then
      begin
      DataForm.SetBlackFontC;
       if Not OnlyPrintLastTwoDigitalOrderNo then
              PrintStr :='       No.' + Copy(OrderNo, 7, 4)
             else
              PrintStr := '     No.' + Copy(OrderNo, 9, 2);
       DataForm.OutPutToPrinter(PrintStr);
       DataForm.OutPutToPrinter(' ');
       if CustomerName <> '' then DataForm.OutPutToPrinter(CustomerName);
       //DataForm.SetBlackFontA;
       if (PrintCategoryColor = 1) and (FVar.Thermal[CurrentPrinterIndex] = 0) then
          begin
           if JobListFontSize = 0 then DataForm.SetRedFontB else DataForm.SetRedFontC;
          end
         else
          begin
           if JobListFontSize = 0 then DataForm.SetBlackFontB else DataForm.SetBlackFontC;
          end;

       if OrderKindFlag = sTableOrder then
          begin
           PrintStr := 'Table: ' + TableNo;
           if PrintPersonsOnJobList and (ABS(Persons) >= 1) then
              PrintStr := PrintStr + Format('  [%1d]', [Persons]);
           DataForm.OutPutToPrinter(PrintStr);
           if CustomerName <> '' then
                 begin
                  PrintStr := CustomerName;
                  DataForm.OutPutToPrinter(PrintStr);
                 end
          end
         else
          if OrderKindFlag = sQUICKSALE then
             begin
              PrintStr := 'Takeaway';
              DataForm.OutPutToPrinter(PrintStr);
              if CustomerName <> '' then
                 begin
                  PrintStr := CustomerName;
                  DataForm.OutPutToPrinter(PrintStr);
                 end
             end
            else
             begin
              if DeliveryFlag then
                 PrintStr := 'Phone Order/Delivery'
                else
                 if VIPNo > 0 then
                    PrintStr := 'Phone Order/Pick Up'
                   else
                    PrintStr := 'Takeaway';
              DataForm.OutPutToPrinter(PrintStr);
              //if CustomerName <> '' then DataForm.OutPutToPrinter(CustomerName);

             end;
       if JobListFontSize = 0 then DataForm.SetBlackFontB else DataForm.SetBlackFontC;
      end
     else
      begin
       PrintStr := 'Hold Order';
       DataForm.OutPutToPrinter(PrintStr);
       PrintStr := 'Date: ' + OrderDate;
       DataForm.OutPutToPrinter(PrintStr);
       if CustomerName <> '' then
          begin
           PrintStr := CustomerName;
           DataForm.OutPutToPrinter(PrintStr);
          end;
       if Telephone <> '' then
          DataForm.OutPutToPrinter('Phone: ' + Telephone);
      end;

   if PrintServiceOnJobList then
      begin
       PrintStr := 'Staff:  ' + Format('%s', [ServicePerson]);
       DataForm.OutPutToPrinter(PrintStr);
      end;
   if DueTime <> 0 then
      begin
       if (PrintCategoryColor = 1) and (FVar.Thermal[CurrentPrinterIndex] = 0) then
          begin
           if JobListFontSize = 0 then DataForm.SetRedFontB else DataForm.SetRedFontC;
          end;
       PrintStr := 'Due Time: ' + FormatDateTime('h:mmam/pm', DueTime);
       DataForm.OutPutToPrinter(PrintStr);
       if JobListFontSize = 0 then DataForm.SetBlackFontB else DataForm.SetBlackFontC;
      end;
   Category := '';
   for I := 1 to 500 do
    if Buff[I].IDNo > 0 then
       begin
        Total := Total + Buff[I].Qty * Buff[I].Price * (1 - Buff[I].DiscountRate / 100);
        if Not Buff[I].Instruction then // Print Category or Split Line
           begin
            if Category <> Buff[I].Category then
               begin
                DataForm.OutPutToPrinter(LineStr);
                Category := Buff[I].Category;
                if JobListFormat = 1 then
                   begin
                    if PrintCategoryColor = 1 then
                       begin
                        if JobListFontSize = 0 then
                           DataForm.SetRedFontB
                          else
                           DataForm.SetRedFontC;
                       end;
                    if (PrintJobListDescription <> 2) or (Buff[I].Category1 = '') then
                       begin
                        PrintStr := Format('%' + IntToStr((20 - Length(Category)) div 2) + 's%s', ['', Category]);
                        PrintStr := Format('%-20s', [PrintStr]);
                        DataForm.OutPutToPrinter(PrintStr)
                       end
                      else
                       begin
                        PrintStr := Format('%' + IntToStr((20 - Length(Buff[I].Category1)) div 2) + 's%s', ['', Buff[I].Category1]);
                        PrintStr := Format('%-20s', [PrintStr]);
                        DataForm.OutPutToPrinter(PrintStr);
                       end;
                    if (PrintJobListDescription = 0) and (Buff[I].Category <> Buff[I].Category1) then
                       begin
                        PrintStr := Format('%' + IntToStr((20 - Length(Buff[I].Category1)) div 2) + 's%s', ['', Buff[I].Category1]);
                        PrintStr := Format('%-20s', [PrintStr]);
                        DataForm.OutPutToPrinter(PrintStr);
                       end;
                    if PrintCategoryColor = 1 then
                       begin
                        if JobListFontSize = 0 then
                           DataForm.SetBlackFontB
                          else
                           DataForm.SetBlackFontC;
                       end;
                   end
               end
              else
               if I > 1 then DataForm.OutPutToPrinter(' ');
           end
         else
          if I = 1 then DataForm.OutPutToPrinter(LineStr);
         // If VoidItem Change Printer Color to Red;
         if (PrintCategoryColor = 1) and ((Buff[I].Qty < 0) or (Buff[I].JobListColor = 1) or PrintRedColorQtyOnJobList) then
            begin
             if JobListFontSize = 0 then
                DataForm.SetRedFontB
               else
                DataForm.SetRedFontC;
            end;
        if Buff[I].Qty < 0 then
           begin
            if Buff[I].VoidReason <> '' then
               Description := GetVoidReasonPro(Buff[I].VoidReason)
              else
               Description := 'Void';
            Description := Format('%-20s', [Description]);
            DataForm.OutPutToPrinter(Description);
           end;
        if Not Buff[I].Instruction then
           begin
            if ABS(Buff[I].Qty) > 0 then
               begin
                PrintStr := Format('%s X ', [FloatToStr(Buff[I].Qty)]);
                if PrintPriceOnJobList and (ABS(Buff[I].Qty) > 0) and (ABS(Buff[I].Price) > 0) then
                   PrintStr := PrintStr + Format('$%4.2f', [Buff[I].Price * (1 - Buff[I].DiscountRate / 100)]);
                PrintStr := Format('%-20s', [PrintStr]);
                DataForm.OutPutToPrinter(PrintStr);
               end;
           end
          else
           begin
            if ((ABS(Buff[I].Qty) <> 0) and (ABS(Buff[I].Qty) <> 1)) or
               (PrintPriceOnJobList and (ABS(Buff[I].Qty) > 0) and (ABS(Buff[I].Price) > 0)) then
               begin
                PrintStr := Format('  %s', [FloatToStr(Buff[I].Qty)]);
                if PrintPriceOnJobList and (ABS(Buff[I].Qty) > 0) and (ABS(Buff[I].Price) > 0) then
                   PrintStr := PrintStr + Format(' X $%4.2f', [Buff[I].Price * (1 - Buff[I].DiscountRate / 100)]);
                PrintStr := Format('%-20s', [PrintStr]);
                DataForm.OutPutToPrinter(PrintStr);
               end;
           end;
        if (PrintCategoryColor = 1) and ((Buff[I].Qty < 0) or (Buff[I].JobListColor = 1)) then
           begin
            if JobListFontSize = 0 then
               DataForm.SetRedFontB
              else
               DataForm.SetRedFontC;
           end
          else
           begin
            if JobListFontSize = 0 then
               DataForm.SetBlackFontB
              else
               DataForm.SetBlackFontC;
           end;
       if (PrintJobListDescription <> 2) or (Buff[I].Description2 = '') then
           Description := Buff[I].Description1
          else
           Description := Buff[I].Description2;
        if Not Buff[I].Instruction then
           begin
            StrTemp := Copy(Description, 1, 20);
            CharCount := 20;
            PrintStr := Format('%s', [StrTemp]);
            PrintStr := Format('%-20s', [PrintStr]);
            DataForm.OutPutToPrinter(PrintStr);
           end
          else
           begin
            StrTemp := Copy(Description, 1, 18);
            CharCount := 18;
            PrintStr := Format('  %s', [StrTemp]);
            PrintStr := Format('%-20s', [PrintStr]);
            DataForm.OutPutToPrinter(PrintStr);
           end;
        while Length(Description) > CharCount do
         begin
          if Not Buff[I].Instruction then
             begin
              StrTemp := Copy(Description, CharCount + 1, 20);
              CharCount := CharCount + 20;
              PrintStr := Format('%s', [StrTemp]);
              PrintStr := Format('%-20s', [PrintStr]);
              DataForm.OutPutToPrinter(PrintStr);
             end
            else
             begin
              StrTemp := Copy(Description, CharCount + 1, 18);
              CharCount := CharCount + 18;
              PrintStr := Format('  %s', [StrTemp]);
              PrintStr := Format('%-20s', [PrintStr]);
              DataForm.OutPutToPrinter(PrintStr);
             end
         end;
        CharCount := 0;
        if (PrintJobListDescription = 0) and
           (Buff[I].Description1 <> Buff[I].Description2) then
           begin
            Description := Buff[I].Description2;
            if Description <> '' then
               while Length(Description) > CharCount do
                begin
                 if Not Buff[I].Instruction then
                    begin
                     StrTemp := Copy(Description, CharCount + 1, 20);
                     CharCount := CharCount + 20;
                     PrintStr := Format('%s', [StrTemp]);
                     PrintStr := Format('%-20s', [PrintStr]);
                     DataForm.OutPutToPrinter(PrintStr);
                    end
                  else
                   begin
                    StrTemp := Copy(Description, CharCount + 1, 18);
                    CharCount := CharCount + 18;
                    PrintStr := Format('  %s', [StrTemp]);
                    PrintStr := Format('%-20s', [PrintStr]);
                    DataForm.OutPutToPrinter(PrintStr);
                   end
                end;
           end;
        if PrintIngredientsOnJobList and (Buff[I].Ingredients <> '') then
           begin
            CharCount := 1;
            Description := Buff[I].Ingredients;
            StrTemp := '';
            while Length(Description) >= CharCount do
             begin
              if (Description[CharCount] = Chr(13)) and
                 (Description[CharCount + 1] = Chr(10)) then
                 begin
                  if StrTemp <> '' then
                     begin
                      PrintStr := Format('  %s', [StrTemp]);
                      PrintStr := Format('%-20s', [PrintStr]);
                      DataForm.OutPutToPrinter(PrintStr);
                     end;
                  StrTemp := '';
                  CharCount := CharCount + 2;
                 end
                else
                 begin
                  StrTemp := StrTemp + Description[CharCount];
                  Inc(CharCount);
                 end;
             end;
            if StrTemp <> '' then
               begin
                PrintStr := Format('  %s', [StrTemp]);
                PrintStr := Format('%-20s', [PrintStr]);
                DataForm.OutPutToPrinter(PrintStr);
               end;
           end;
        if Buff[I].SpecialOrder <> '' then
           begin
            CharCount := 0;
            Description := Buff[I].SpecialOrder;
            while Length(Description) > CharCount do
             begin
              StrTemp := Copy(Description, CharCount + 1, 18);
              CharCount := CharCount + 18;
              PrintStr := Format('  %s', [StrTemp]);
              PrintStr := Format('%-20s', [PrintStr]);
              DataForm.OutPutToPrinter(PrintStr);
             end
           end;
        if Buff[I].Seat > 0 then
           begin
            PrintStr := Format('Seat No: %1d', [Buff[I].Seat]);
            PrintStr := Format('%-20s', [PrintStr]);
            DataForm.OutPutToPrinter(PrintStr);
           end;
        if (PrintCategoryColor = 1) or (Buff[I].JobListColor = 1) then
           begin
            if JobListFontSize = 0 then
               DataForm.SetBlackFontB
              else
               DataForm.SetBlackFontC;
           end;
       end;

   if PrintPriceOnJobList and (ABS(Total) >= 0.01) then
      begin
       DataForm.OutPutToPrinter(LineStr);
       PrintStr := 'Total: ' + FormatCurrency(Total);
       PrintStr := Format('%20s', [PrintStr]);
       DataForm.OutPutToPrinter(PrintStr);
      end;
   DataForm.OutPutToPrinter(LineStr);
   if OrderKindFlag = sPhoneOrder then
      begin
       if VIPName <> '' then
          DataForm.OutPutToPrinter(VIPName)
         else
          if CustomerName <> '' then DataForm.OutPutToPrinter(CustomerName);
       if VIPTelephone <> '' then DataForm.OutPutToPrinter(VIPTelephone);
       if DeliveryFlag then
          begin
           DataForm.OutPutToPrinter(VIPAddress);
           if VIPState <> '' then
              DataForm.OutPutToPrinter(VIPState);
          end;
       DataForm.OutPutToPrinter(LineStr);
      end;
   {if PrintOrderNoOnJobList then
          begin
           if Not OnlyPrintLastTwoDigitalOrderNo then
              PrintStr := OrderDate + '   No.' + Copy(OrderNo, 7, 4)
             else
              PrintStr := OrderDate + '     No.' + Copy(OrderNo, 9, 2)
          end
         else
          PrintStr := 'Date: ' + OrderDate;
       DataForm.OutPutToPrinter(PrintStr);}
   if PrintOpNameOnJobList then
      begin
       PrintStr := 'Staff: ' + OpName;
       DataForm.OutPutToPrinter(PrintStr);
      end;
      
   DataForm.SetBlackFontA;
   PrintStr := 'Printed Time: ' + FormatDateTime('dd/mm/yyyy  h:mmam/pm', Date + Time);
   DataForm.OutPutToPrinter(PrintStr);
   DataForm.SetBlackFontB;

   DataForm.OutPutToPrinter(' ');
   DataForm.OutPutToPrinter(' ');
   DataForm.CutPaper;
   DataForm.ClosePrinterPort;
   PageCounter := PageCounter + 1;
  end;
end;

procedure TPrintJobListForm.PrintConfirmedOrder;
var
 SQLStr: string;
begin
 if Not PrintAll then
    begin
     SQLStr := 'Select Count(*) From OrderI Where PrintFlag<>0 and ' +
               'OrderNo=' + Chr(39) + CheckQuotes(OrderNo) + Chr(39);
     OpenQuery(SQLStr);
     with Query do
      AddNewItem := Active and (RecordCount > 0) and (Fields[0].AsInteger > 0);
    end
   else
    AddNewItem := False;
 with PrintJObListControlForm.Query do
  begin
   TableNo := DeleteSpace(FieldByName('TableNo').AsString);
   CustomerName := FieldByName('CustomerName').AsString;
   DeliveryFlag := FieldByName('Delivery').AsBoolean;
   Persons := FieldByName('Persons').AsInteger;
   ServicePerson := FieldByName('ServicePerson').AsString;
   OrderDate := FormatDateTime('dd/mm/yyyy', FieldByName('OrderDate').AsDateTime);
   if Not VarIsNull(FieldByName('DueTime').AsDateTime) then
      DueTime := FieldByName('DueTime').AsDateTime
     else
      DueTime := 0;
   OrderKindFlag := FieldByName('BillKind').AsInteger;
   Telephone := '';
   VIPNo := FieldByName('VIPNo').AsInteger;
   OpName := FieldByName('OpName').AsString;
   VIPName := FieldByName('VIPName').AsString;
   VIPTelephone := FieldByName('Telephone').AsString;
   VIPAddress := FieldByName('Number').AsString + ' ' + FieldByName('Address').AsString;
   VIPState := FieldByName('Suburb').AsString + ' ' + FieldByName('State').AsString +
               ' ' + FieldByName('PostCode').AsString;
   if FieldByName('MapReference').AsString <> '' then
      VIPState := VIPState + '(' + FieldByName('MapReference').AsString + ')';
  end;
 SQLStr := 'Select MenuItem.Category, Category1, Description1, Description2, ' +
           'Condition, Qty, OrderI.Price, PriceSelect, SubDescription, SubDescription1, ' +
           'SubDescription2, SubDescription3, Seat, IDNo, JobListColor, OrderI.Discount, ' +
           'VoidReason, SpecialOrder, Ingredients, Multiple ' +
           'From OrderI, Category, MenuItem Left Join IngredientsTable ' +
           'On MenuItem.ItemCode=IngredientsTable.ItemCode ' +
           'Where MenuItem.ItemCode=OrderI.ItemCode and ' +
           'MenuItem.Category=Category.Category and ' +
           'OrderNo=' + Chr(39) + CheckQuotes(OrderNo) + Chr(39) +
           ' and Condition > 0 Order By IDNo';
 OpenInstructionQuery(SQLStr);
 if PrintAll then
    begin
     SQLStr := 'Select Category.Code, MenuItem.Category, Description1, ' +
               'Description2, Condition, Qty, OrderI.Price, PriceSelect, ' +
               'SubDescription, SubDescription1, SubDescription2, SubDescription3, ' +
               'Seat, IDNo, JobListColor, OrderI.Discount, Category1, ' +
               'SubDescriptionSwap, VoidReason, SpecialOrder, Ingredients, ' +
               'Multiple ' +
               'From OrderI, Category, MenuItem Left Join IngredientsTable ' +
               'On MenuItem.ItemCode = IngredientsTable.ItemCode ' +
               'Where MenuItem.ItemCode=OrderI.ItemCode and ' +
               'MenuItem.Category=Category.Category and ' +
               'OrderNo=' + Chr(39) + CheckQuotes(OrderNo) + Chr(39) +
               ' and (PrinterPort=' + IntToStr(PrinterPort) +
               ' or PrinterPort1=' + IntToStr(PrinterPort) +
               ' or PrinterPort2=' + IntToStr(PrinterPort) +
               ' or PrinterPort3=' + IntToStr(PrinterPort) +
               ') and Condition = 0';
     if Not PrintZeroQtyItemsOnJobList then SQLStr := SQLStr + ' and ABS(Qty) >= 0.01 ';
    end
   else
    begin
     SQLStr := 'Select Category.Code, MenuItem.Category, Description1, ' +
               'Description2, Condition, Qty, OrderI.Price, PriceSelect, ' +
               'SubDescription, SubDescription1, SubDescription2, ' +
               'SubDescription3, Seat, IDNo, JobListColor, OrderI.Discount, ' +
               'Category1, SubDescriptionSwap, VoidReason, SpecialOrder, ' +
               'Ingredients, Multiple ' +
               'From OrderI, Category, MenuItem Left Join IngredientsTable ' +
               'On MenuItem.ItemCode=IngredientsTable.ItemCode ' +
               'Where MenuItem.ItemCode=OrderI.ItemCode and ' +
               'Category.Category=MenuItem.Category and ' +
               'OrderNo=' + Chr(39) + CheckQuotes(OrderNo) + Chr(39) +
               ' and (PrinterPort=' + IntToStr(PrinterPort) +
               ' or PrinterPort1=' + IntToStr(PrinterPort) +
               ' or PrinterPort2=' + IntToStr(PrinterPort) +
               ' or PrinterPort3=' + IntToStr(PrinterPort) +
               ') and Condition = 0';
     if Not PrintZeroQtyItemsOnJobList then SQLStr := SQLStr + ' and ABS(Qty) >= 0.01 ';
     if IDStr <> '' then SQLStr := SQLStr + ' and IDNo In (' + IDStr + ')'
       else
        SQLStr := SQLStr + ' and PrintFlag = 0'
    end;
 SQLStr := SQLStr +  ' Order By Category.Code, IDNo';
 OpenQuery(SQLStr);
 if Query.Active and (Query.RecordCount > 0) and (PostDataToBuff > 0) then
    begin
     JobListDuplicated := FVar.JobListDuplicate[PrinterPort] = 1;
     PrintOutPro(PrinterPort);
    end;
 InstructionQuery.Close;
end;

procedure TPrintJobListForm.PrintUnConfirmedOrder;
var
 SQLStr: string;
begin
 AddNewItem := False;
 with PrintJObListControlForm.Query do
  begin
   TableNo := '';
   CustomerName := FieldByName('CustomerName').AsString;
   Persons := 0;
   ServicePerson := FieldByName('OpName').AsString;
   OrderDate := FormatDateTime('dd/mm/yyyy', FieldByName('HoldDate').AsDateTime);
   if Not VarIsNull(FieldByName('DueTime').AsDateTime) then
      DueTime := FieldByName('DueTime').AsDateTime
     else
      DueTime := 0;
   OrderKindFlag := sQuickSale;
   DeliveryFlag := False;
   OpName := FieldByName('OpName').AsString;
   Telephone := FieldByName('Telephone').AsString;
  end;
 VIPName := '';
 VIPAddress := '';
 VIPState := '';
 VIPTelephone := '';
 SQLStr := 'Select MenuItem.Category, Category1, Description1, Description2, ' +
           'Condition, Qty, HoldItem.Price, HoldItem.PriceSelect, SubDescription, ' +
           'SubDescription1, SubDescription2, SubDescription3, 0 As Seat, ' +
           'ID As IDNo, JobListColor, HoldItem.Discount, Null As VoidReason, ' +
           'SpecialOrder, Ingredients, Multiple ' +
           'From HoldItem, Category, MenuItem Left Join IngredientsTable ' +
           'On MenuItem.ItemCode=IngredientsTable.ItemCode ' +
           'Where MenuItem.ItemCode=HoldItem.ItemCode and ' +
           'MenuItem.Category=Category.Category and ' +
           'HoldNo=' + OrderNo + ' and Condition > 0 Order By ID';
 OpenInstructionQuery(SQLStr);
 if PrintAll then
    SQLStr := 'Select Category.Code, MenuItem.Category, Description1, ' +
              'Description2, Condition, Qty, HoldItem.Price, PriceSelect, ' +
              'SubDescription, SubDescription1, SubDescription2, ' +
              'SubDescription3, 0 As Seat, ID As IDNo, JobListColor, ' +
              'HoldItem.Discount, Category1, SubDescriptionSwap, ' +
              'Null As VoidReason, SpecialOrder, Ingredients, Multiple ' +
              'From HoldItem, Category, MenuItem Left Join IngredientsTable ' +
              'On MenuItem.ItemCode=IngredientsTable.ItemCode ' +
              'Where MenuItem.ItemCode=HoldItem.ItemCode and ' +
              'MenuItem.Category=Category.Category and' +
              'HoldNo=' + OrderNo +
              ' and (PrinterPort=' + IntToStr(PrinterPort) +
              ' or PrinterPort1=' + IntToStr(PrinterPort) +
              ' or PrinterPort2=' + IntToStr(PrinterPort) +
              ' or PrinterPort3=' + IntToStr(PrinterPort) +
              ') and Condition = 0 '
   else
    SQLStr := 'Select Category.Code, MenuItem.Category, Description1, ' +
              'Description2, Condition, Qty, HoldItem.Price, PriceSelect, ' +
              'SubDescription, SubDescription1, SubDescription2, ' +
              'SubDescription3, 0 As Seat, ID As IDNo, JobListColor, ' +
              'HoldItem.Discount, Category1, SubDescriptionSwap, ' +
              'Null As VoidReason, SpecialOrder, Ingredients, Multiple ' +
              'From HoldItem, Category, MenuItem Left Join IngredientsTable ' +
              'On MenuItem.ItemCode=IngredientsTable.ItemCode ' +
              'Where MenuItem.ItemCode=HoldItem.ItemCode and ' +
              'MenuItem.Category=Category.Category and ' +
              'HoldNo=' + OrderNo +
              ' and (PrinterPort=' + IntToStr(PrinterPort) +
              ' or PrinterPort1=' + IntToStr(PrinterPort) +
              ' or PrinterPort2=' + IntToStr(PrinterPort) +
              ' or PrinterPort3=' + IntToStr(PrinterPort) +
              ') and Condition = 0 and Printed = 0';
 if Not PrintZeroQtyItemsOnJobList then SQLStr := SQLStr + ' and ABS(Qty) >= 0.01 ';
    SQLStr := SQLStr + 'Order By Category.Code, IDNo';
 OpenQuery(SQLStr);
 if Query.Active and (Query.RecordCount > 0) and (PostDataToBuff > 0) then
    begin
     JobListDuplicated := FVar.JobListDuplicate[PrinterPort] = 1;
     PrintOutPro(PrinterPort);
    end;
 InstructionQuery.Close;
end;

procedure TPrintJobListForm.PrintJobListPro;
begin
 if ConfirmedOrder then
    PrintConfirmedOrder
   else
    PrintUnConfirmedOrder;
end;

procedure TPrintJobListForm.PrintJobList(OrderNo, IDStr: string; PrintAll, ConfirmedOrder: boolean; PrinterPort: integer);
begin
 Application.CreateForm(TPrintJobListForm, PrintJobListForm);
 PrintJobListForm.PrintAll := PrintAll;
 PrintJobListForm.OrderNo := OrderNo;
 PrintJobListForm.IDStr := IDStr;
 PrintJobListForm.ConfirmedOrder := ConfirmedOrder;
 PrintJobListForm.PrinterPort := PrinterPort;
 PrintJobListForm.PrintJobListPro;
 PrintJobListForm.Free;
end;

end.
