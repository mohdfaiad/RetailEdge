unit Receipt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, ExtCtrls, UtilUnit, Db, DBTables, ADODB,
  Grids, bsSkinCtrls, MainMenu, XiButton;

type
  TReceiptForm = class(TForm)
    DataPanel1: TPanel;
    Label4: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    DataPanel2: TPanel;
    Query: TADOQuery;
    StringGrid: TStringGrid;
    BackPanel: TbsSkinPanel;
    TitlePanel: TbsSkinPanel;
    bsSkinStdLabel1: TbsSkinStdLabel;
    DateEdit: TbsSkinLabel;
    bsSkinStdLabel2: TbsSkinStdLabel;
    TableNoEdit: TbsSkinLabel;
    bsSkinStdLabel3: TbsSkinStdLabel;
    OrderNoEdit: TbsSkinLabel;
    StringGridPanel: TbsSkinPanel;
    WorkPanel: TbsSkinPanel;
    TotalPanel: TbsSkinPanel;
    bsSkinStdLabel4: TbsSkinStdLabel;
    bsSkinStdLabel5: TbsSkinStdLabel;
    bsSkinStdLabel6: TbsSkinStdLabel;
    bsSkinStdLabel7: TbsSkinStdLabel;
    bsSkinStdLabel8: TbsSkinStdLabel;
    bsSkinStdLabel9: TbsSkinStdLabel;
    TotalSalesEdit: TbsSkinLabel;
    PaidAmountEdit: TbsSkinLabel;
    ReceivableEdit: TbsSkinLabel;
    RoundingEdit: TbsSkinLabel;
    SurchargeEdit: TbsSkinLabel;
    TipsEdit: TbsSkinLabel;
    TipsButton: TbsSkinButton;
    MethodEdit1: TbsSkinLabel;
    PaymentEdit1: TbsSkinLabel;
    MethodEdit2: TbsSkinLabel;
    PaymentEdit2: TbsSkinLabel;
    bsSkinPanel1: TbsSkinPanel;
    BalanceLabel: TbsSkinStdLabel;
    ChangeEdit: TbsSkinLabel;
    ControlPanel: TbsSkinPanel;
    MoneyButton1: TXiButton;
    MoneyButton2: TXiButton;
    MoneyButton3: TXiButton;
    MoneyButton4: TXiButton;
    MoneyButton5: TXiButton;
    Num7: TXiButton;
    Num8: TXiButton;
    Num9: TXiButton;
    PlusButton: TXiButton;
    Num4: TXiButton;
    Num5: TXiButton;
    Num6: TXiButton;
    StubtractButton: TXiButton;
    Num1: TXiButton;
    Num2: TXiButton;
    Num3: TXiButton;
    Decimal: TXiButton;
    Num0: TXiButton;
    ClearButton: TXiButton;
    Method1: TXiButton;
    Method2: TXiButton;
    Method3: TXiButton;
    Method4: TXiButton;
    Method5: TXiButton;
    OtherMethod: TXiButton;
    ButtonPanel: TbsSkinPanel;
    PrintBillButton: TXiButton;
    PrintInvoiceButton: TXiButton;
    AccountPaymentButton: TXiButton;
    ConfirmButton: TXiButton;
    CancelButton: TXiButton;
    ExitButton: TXiButton;
    PaymentPanel1: TbsSkinPanel;
    PaymentPanel2: TbsSkinPanel;
    DepositPaymentButton: TXiButton;
    procedure PostDataToSecondDisplayPro;
    procedure OpenQuery(SQLStr: string);
    procedure GetPaymentMethod;
    procedure OpenDataQuery;
    procedure InitStringGrid;
    procedure StringGridDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure PostDataToStringGrid;
    procedure PostToSecondDisplay;
    function  CalcTotalSales: double;
    procedure ReadPaymentMethodsPro;
    procedure DisplayNumber;
    function  CalcRounding(CashAmount: double): double;
    procedure InitPayment1;
    procedure InitPayment2;
    procedure CalcPayment1;
    procedure CalcPayment2;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    function  FindIDNo: integer;
    function  SaveData: boolean;
    procedure SaveDataPro;
    procedure ConfirmButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Methods1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EFTTransactionEvent(Sender: TObject);
    procedure EFTPrintReceiptEvent(Sender: TObject; const ReceiptType: WideString);
    procedure EFTGetLastTransactionEvent(Sender: TObject);
    procedure PrintCustomerReceipt;
    procedure PrintMerthantReceiptPro(Receipt: WideString);
    procedure MethodClick(Sender: TObject);
    procedure OtherMethodClick(Sender: TObject);
    procedure MoneyButton1Click(Sender: TObject);
    procedure MoneyButton2Click(Sender: TObject);
    procedure MoneyButton3Click(Sender: TObject);
    procedure MoneyButton4Click(Sender: TObject);
    procedure MoneyButton5Click(Sender: TObject);
    procedure NumClick(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
    procedure StubtractButtonClick(Sender: TObject);
    procedure DecimalClick(Sender: TObject);
    procedure TipsEditClick(Sender: TObject);
    procedure DataPanel1Click(Sender: TObject);
    procedure DataPanel2Click(Sender: TObject);
    procedure PlusButtonClick(Sender: TObject);
    function  ReceiptPro(OrderNo: string): boolean;
    procedure ExitButtonClick(Sender: TObject);
    procedure PrintInvoiceButtonClick(Sender: TObject);
    procedure PrintBillButtonClick(Sender: TObject);
    procedure AccountPaymentButtonClick(Sender: TObject);
    procedure TipsButtonClick(Sender: TObject);
    procedure DepositPaymentButtonClick(Sender: TObject);
    procedure SendToSecurityPortPro;
  private { Private declarations }
    TotalSales, TotalDiscount, NetSales, PaidAmount, Receivable, Payment1, Payment2,
    Surcharge1, Surcharge2, Rounding1, Rounding2, Tips, Change, SurchargeRate1,
    SurchargeRate2, ServiceCharge, OtherCharge: double;
    ReturnFlag, LinkToEFTPOSFlag: boolean;
    OrderNo, ReceiptFlag: string;
    ReferenceNo, VIPNo, BillKind, DepositID1, DepositID2: integer;
    NumberStr: string;
    LinkEFTPOS: array [1..5] of boolean;
    SurchargeRate: array [1..5] of double;
    Instruction: Array [1..500] of integer;
  public
    { Public declarations }
  end;

var
  ReceiptForm: TReceiptForm;

implementation

uses DataUnit, NumPad, MessageBox, PaymentSelect, PrintPickupSlip,
     PrintOrder, PrintOrder1, PrintInvoice, PrintInvoice1, DepositPayment,
     PrintInvoice2, PrintOrder2, PrintOrder3, PrintInvoice3;

{$R *.DFM}

procedure TReceiptForm.PostDataToSecondDisplayPro;
var
 I: integer;
begin
 SecondDisplayForm.InitForm;
 for I := 1 to 500 do
  begin
   if (StringGrid.Cells[1, I] <> '') then
      begin
       SecondDisplayForm.StringGrid.Cells[0, I] := StringGrid.Cells[1, I];
       SecondDisplayForm.StringGrid.Cells[1, I] := StringGrid.Cells[2, I];
       SecondDisplayForm.StringGrid.Cells[2, I] := StringGrid.Cells[3, I];
       SecondDisplayForm.StringGrid.Cells[3, I] := StringGrid.Cells[5, I];
      end;
  end;
end;

procedure TReceiptForm.OpenQuery(SQLStr: string);
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

procedure TReceiptForm.OpenDataQuery;
var
 SQLStr: string;
begin
 Screen.Cursor := crHourGlass;
 SQLStr := 'Select OrderI.ItemCode, Description1, Qty, ' +
           'OrderI.Price, OrderI.Discount, OrderI.TaxRate, ' +
           'PriceSelect, SubDescription, SubDescription1, ' +
           'SubDescription2, SubDescription3, Condition ' +
           'From MenuItem, OrderI ' +
           'Where MenuItem.ItemCode=OrderI.ItemCode and ' +
           'OrderI.Qty <> 0 and ' +
           'OrderNo=' + Chr(39) + CheckQuotes(OrderNo) + Chr(39) + ' Order By IDNo';
 OpenQuery(SQLStr);
end;

procedure TReceiptForm.InitStringGrid;
var
 I: integer;
begin
 with StringGrid do
  begin
   Cells[0, 0] := 'No.';
   Cells[1, 0] := 'Description';
   Cells[2, 0] := 'Qty';
   Cells[3, 0] := 'Price';
   Cells[4, 0] := 'Dis(%)';
   Cells[5, 0] := 'Amount';
   Cells[6, 0] := 'GST%';
   for I := 1 to 500 do
    begin
     Cells[0, I] := IntToStr(I);
     Cells[1, I] := ''; Cells[2, I] := '';
     Cells[3, I] := ''; Cells[4, I] := '';
     Cells[5, I] := ''; Cells[6, I] := '';
     Instruction[I] := 0;
    end;
   Row := 1; Col := 1; TopRow := 1; LeftCol := 1;
  end;
end;

procedure TReceiptForm.StringGridDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
 X: integer;
begin
 with Sender As TStringGrid do
  begin
   if (ARow > 0) and (ACol > 0) then
      begin
       Canvas.Font.Size := 10;
       Canvas.Font.Style := [];
       case ACol of
        1: begin
             SetTextAlign(Canvas.Handle, TA_LEFT);
             if Instruction[ARow] > 1 then
                begin
                 Canvas.Font.Color := clRed;
                 X := Rect.Left + 12;
                end
               else
                if Instruction[ARow] = 1 then
                    begin
                     Canvas.Font.Color := clBlue;
                     X := Rect.Left + 12;
                    end
                   else
                    begin
                     X := Rect.Left + 2;
                     Canvas.Font.Color := clBlack;
                    end
            end;
        else
          begin
           SetTextAlign(Canvas.Handle, TA_RIGHT);
           X := Rect.Right - 2;
          end;
       end;
      end
     else
      begin
       Canvas.Font.Size := 8;
       Canvas.Font.Style := [fsBold];
       SetTextAlign(Canvas.Handle, TA_CENTER);
       X := (Rect.Left + Rect.Right) div 2;
      end;
    if State = [gdSelected] then Canvas.Font.Color := clWhite;
    Canvas.TextRect(Rect,X, Rect.Top + 2, Cells[ACol, ARow]);
 end;
end;

procedure TreceiptForm.PostDataToStringGrid;
var
 I: integer;
 Temp: string;
 Qty, Price: double;
begin
 I := 1;
 with Query do
  begin
   First;
   while Not EOF do
    begin
     Temp := FieldByName('Description1').AsString;
     case FieldByName('PriceSelect').AsInteger of
      0: if FieldByName('SubDescription').AsString <> '' then
            Temp := Temp + ' / ' + FieldByName('SubDescription').AsString;
      1: if FieldByName('SubDescription1').AsString <> '' then
            Temp := Temp + ' / ' + FieldByName('SubDescription1').AsString;
      2: if FieldByName('SubDescription2').AsString <> '' then
            Temp := Temp + ' / ' + FieldByName('SubDescription2').AsString;
      3: if FieldByName('SubDescription3').AsString <> '' then
            Temp := Temp + ' / ' + FieldByName('SubDescription3').AsString;
     end;
     case FieldByName('Condition').AsInteger of
      1: Temp := ' [*] ' + Temp;
      2: Temp := ' [A] ' + Temp;
      3: Temp := ' [C] ' + Temp;
      4: Temp := ' [M] ' + Temp;
      5: Temp := ' [L] ' + Temp;
     end;
     Instruction[I] := FieldByName('Condition').AsInteger;
     StringGrid.Cells[1, I] := Temp;
     Qty := FieldByName('Qty').AsFloat;
     Price := FieldByName('Price').AsFloat;
     if Abs(Qty) >= 0.01 then
        StringGrid.Cells[2, I] := Format('%4.2f', [Qty]);
     if Abs(Price) >= 0.01 then
        StringGrid.Cells[3, I] := Format('%4.2f', [Price]);
     if Abs(FieldByName('Discount').AsFloat) >= 0.01 then
        StringGrid.Cells[4, I] := Format('%4.2f', [FieldByName('Discount').AsFloat]);
     if (Abs(Qty) >= 0.01) and (Abs(Price) >= 0.01) then
        StringGrid.Cells[5, I] := Format('%4.2f', [Qty * Price]);
     if Abs(FieldByName('TaxRate').AsFloat) >= 0.01 then
        StringGrid.Cells[6, I] := Format('%4.2f', [FieldByName('TaxRate').AsFloat]);
     Next;
     I := I + 1;
    end;
  end;
end;

function TReceiptForm.CalcTotalSales: double;
var
 TotalSales: double;
begin
 TotalSales := 0;
 with Query do
  begin
   First;
   while Not EOF do
    begin
     TotalSales := TotalSales + FieldByName('Qty').AsFloat * FieldByName('Price').AsFloat;
     Next;
    end;
  end;
 Result := TotalSales;
end;

procedure TReceiptForm.GetPaymentMethod;
var
 SQLStr: string;
begin
 SQLStr := 'Select Payment, LinkToEFTPOS, SurchargeRate From Payment ' +
           'Where ShowOnList <> 0 Order By Code';
 OpenQuery(SQLStr);
end;

procedure TReceiptForm.ReadPaymentMethodsPro;
var
 I: integer;
begin
 for I := 1 to 5 do
  with TPanel(FindComponent('Method' + IntToStr(I))) do
   begin
    Caption := '';
    LinkEFTPOS[I] := False;
    SurchargeRate[I] := 0;
   end;
 I := 1;
 Query.First;
 while Not Query.EOF and (I <= 5) do
  begin
   with TPanel(FindComponent('Method' + IntToStr(I))) do
    Caption := Uppercase(Query.FieldByName('Payment').AsString);
   LinkEFTPOS[I] := Query.FieldByName('LinkToEFTPOS').AsBoolean;
   SurchargeRate[I] := Query.FieldByName('SurchargeRate').AsFloat;
   I := I + 1;
   Query.Next;
  end;
 Query.Close;
end;

procedure TReceiptForm.PostToSecondDisplay;
var
 S1, S2: string;
begin
 S1 := 'Total:' + Format('%14s', [FormatCurrency(Receivable + Rounding1 + Rounding2)]);
 if Change <= -0.009 then
    S2 := 'Balance:' + Format('%12s', [FormatCurrency(ABS(Change))])
   else
    S2 := 'Change:' + Format('%13s', [FormatCurrency(ABS(Change))]);
 DataForm.SendToPoleDisp(S1, S2);
 if FVar.SecondDisplay = 1 then
    begin
     SecondDisplayForm.TotalSalesEdit.Caption := FormatCurrency(TotalSales) + ' ';
     if ABS(TotalDiscount) >= 0.01 then
        begin
         SecondDisplayForm.DiscountLabel.Visible := True;
         SecondDisplayForm.DiscountEdit.Visible := True;
         SecondDisplayForm.DiscountEdit.Caption := FormatCurrency(TotalDiscount) + ' ';
        end;
     SecondDisplayForm.ReceivableEdit.Caption := FormatCurrency(Receivable) + ' ';
     SecondDisplayForm.MethodLabel1.Caption := MethodEdit1.Caption + ':';
     SecondDisplayForm.PaymentEdit1.Caption := FormatCurrency(Payment1) + ' ';
     if MethodEdit2.Caption <> '' then
       begin
         SecondDisplayForm.MethodLabel2.Caption := MethodEdit2.Caption + ':';
         SecondDisplayForm.MethodLabel2.Visible := True;
         SecondDisplayForm.PaymentEdit2.Caption := FormatCurrency(Payment2) + ' ';
         SecondDisplayForm.PaymentEdit2.Visible := True;
        end
       else
        begin
         SecondDisplayForm.MethodLabel2.Caption := '';
         SecondDisplayForm.MethodLabel2.Visible := False;
         SecondDisplayForm.PaymentEdit2.Caption := '';
         SecondDisplayForm.PaymentEdit2.Visible := False;
        end;
     if ABS(Tips) >= 0.01 then
        begin
         SecondDisplayForm.TipsEdit.Caption := FormatCurrency(Tips) + ' ';
         SecondDisplayForm.TipsEdit.Visible := True;
         SecondDisplayForm.TipsLabel.Visible := True;
        end
       else
        begin
         SecondDisplayForm.TipsEdit.Visible := False;
         SecondDisplayForm.TipsLabel.Visible := False;
        end;
     if ABS(Surcharge1 + Surcharge2) >= 0.01 then
        begin
         SecondDisplayForm.BankChargeEdit.Caption := FormatCurrency(Surcharge1 + Surcharge2) + ' ';
         SecondDisplayForm.BankChargeEdit.Visible := True;
         SecondDisplayForm.BankChargeLabel.Visible := True;
        end
       else
        begin
         SecondDisplayForm.BankChargeEdit.Visible := False;
         SecondDisplayForm.BankChargeLabel.Visible := False;
        end;
     if ABS(Rounding1 + Rounding2) >= 0.01 then
        begin
         SecondDisplayForm.RoundingEdit.Caption := FormatCurrency(ABS(Rounding1 + Rounding2)) + ' ';
         SecondDisplayForm.RoundingEdit.Visible := True;
         SecondDisplayForm.RoundingLabel.Visible := True;
        end
       else
        begin
         SecondDisplayForm.RoundingEdit.Visible := False;
         SecondDisplayForm.RoundingLabel.Visible := False;
        end;
     if Change <= -0.009 then
        SecondDisplayForm.ChangeLabel.Caption := 'Balance:'
       else
        SecondDisplayForm.ChangeLabel.Caption := 'Change:';
     SecondDisplayForm.ChangeEdit.Caption := FormatCurrency(ABS(Change)) + ' ';
    end;
end;

procedure TReceiptForm.DisplayNumber;
begin
 if DataPanel2.Color = $00FFFF80 then
    PaymentEdit2.Caption := Format('%4.2f ', [StrToFloat(NumberStr)])
   else
    PaymentEdit1.Caption := Format('%4.2f ', [StrToFloat(NumberStr)]);
end;

function TReceiptForm.CalcRounding(CashAmount: double): double;
var
 RoundFlag: integer;
 Temp, Ch: string;
 Rounding: double;
begin
 Temp := Format('%4.2f', [CashAmount]);
 Ch := Temp[Length(Temp)];
 RoundFlag := StrToInt(Ch);
 Rounding := 0;
 if RoundingFlag = 0 then
    begin
     RoundFlag := StrToInt(Ch);
     Case ABS(RoundFlag) of
      0, 5: Rounding := 0;
      1, 6: Rounding := -0.01;
      2, 7: Rounding := -0.02;
      3, 8: Rounding := 0.02;
      4, 9: Rounding := 0.01;
     end
    end
   else
    if RoundingFlag = 1 then
       begin
        if ABS(RoundFlag) <= 4 then
           Rounding := -ABS(RoundFlag)/100
          else
           Rounding := (10 - ABS(RoundFlag)) / 100;
       end;
 if CashAmount < 0 then Rounding := 0 - Rounding;
 if ABS(Rounding) < 0.005 then Rounding := 0;
 Result := Rounding;
end;

procedure TReceiptForm.InitPayment1;
begin
 Receivable := NetSales - PaidAmount;
 TotalSalesEdit.Caption := Format('%4.2f ', [NetSales]);
 PaidAmountEdit.Caption := Format('%4.2f ', [PaidAmount]);
 ReceivableEdit.Caption := Format('%4.2f ', [Receivable]);
 if TipsEdit.Caption <> '' then
    Tips := StrToFloat(TipsEdit.Caption)
   else
    Tips := 0;
 if MethodEdit1.Caption = 'CASH' then
    begin
     Rounding1 := CalcRounding(Receivable + Tips);
     Surcharge1 := 0;
     SurchargeRate1 := 0;
     Payment1 := Receivable + Tips + Rounding1;
    end
   else
    begin
     Rounding1 := 0;
     Surcharge1 := RoundToCurrency(Receivable * SurchargeRate1 / 100);
     Payment1 := Receivable + Tips + Rounding1 + Surcharge1;
    end;
 DataPanel1.Color := $00FFFF80;
 DataPanel2.Color := $00EAD2BF;
 MethodEdit2.Caption := '';
 PaymentEdit2.Caption := '';
 Payment2 := 0;
 Surcharge2 := 0;
 SurchargeRate2 := 0;
 Rounding2 := 0;
 DepositID1 := 0;
 DepositID2 := 0;
 NumberStr := '0';
 Change := Payment1 + Payment2 - Tips - Receivable - Rounding1 - Rounding2 - Surcharge1 - Surcharge2;
 if Change <= -0.009 then
    BalanceLabel.Caption := 'Balance'
   else
    BalanceLabel.Caption := 'Change';
 RoundingEdit.Caption := Format('%4.2f ', [Rounding1 + Rounding2]);
 SurchargeEdit.Caption := Format('%4.2f ', [Surcharge1 + Surcharge2]);
 PaymentEdit1.Caption := Format('%4.2f ', [Payment1]);
 PaymentEdit2.Caption := Format('%4.2f ', [Payment2]);
 ChangeEdit.Caption := Format('%4.2f ', [ABS(Change)]);
 PostToSecondDisplay;
end;

procedure TReceiptForm.InitPayment2;
begin
 if MethodEdit2.Caption = '' then MethodEdit2.Caption := 'CASH';
 if MethodEdit2.Caption = 'CASH' then
    begin
     Payment2 := Receivable + Surcharge1 + Tips + Rounding1 - Payment1;
     Rounding2 := CalcRounding(Payment2);
     Payment2 := Receivable + Surcharge1 + Tips + Rounding1 + Rounding2 - Payment1;
     Surcharge2 := 0;
     SurchargeRate2 := 0;
    end
   else
    begin
     Rounding2 := 0;
     Surcharge2 := RoundToCurrency((Receivable + Surcharge1 - Payment1) * SurchargeRate2 / 100);
     Payment2 := Receivable + Surcharge1 + Surcharge2 + Tips + Rounding1 - Payment1;
    end;
 NumberStr := '0';
 DataPanel2.Color := $00FFFF80;
 DataPanel1.Color := $00EAD2BF;
 Change := Payment1 + Payment2 - Tips - Receivable - Rounding1 - Rounding2 - Surcharge1 - Surcharge2;
 if Change <= -0.009 then
    BalanceLabel.Caption := 'Balance'
   else
    BalanceLabel.Caption := 'Change';
 RoundingEdit.Caption := Format('%4.2f ', [Rounding1 + Rounding2]);
 SurchargeEdit.Caption := Format('%4.2f ', [Surcharge1 + Surcharge2]);
 PaymentEdit1.Caption := Format('%4.2f ', [Payment1]);
 PaymentEdit2.Caption := Format('%4.2f ', [Payment2]);
 ChangeEdit.Caption := Format('%4.2f ', [ABS(Change)]);
 PostToSecondDisplay;
end;

procedure TReceiptForm.CalcPayment1;
begin
 if PaymentEdit1.Caption <> '' then
    Payment1 := StrToFloat(PaymentEdit1.Caption)
   else
    Payment1 := 0;
 if MethodEdit1.Caption <> 'CASH' then
    begin
     Rounding1 := 0;
     Surcharge1 := RoundToCurrency(Receivable * SurchargeRate1 / 100);
     if (Payment1 > Receivable + Surcharge1 + Tips) then
         Payment1 := Receivable + Tips + Surcharge1
        else
         Surcharge1 := RoundToCurrency(Payment1 * SurchargeRate1 / 100);
    end
   else
    begin
     Surcharge1 := 0; SurchargeRate1 := 0;
     Rounding1 := CalcRounding(Receivable + Tips);
    end;
 Rounding2 := 0;
 MethodEdit2.Caption := '';
 PaymentEdit2.Caption := '';
 Payment2 := 0;
 Surcharge2 := 0;
 SurchargeRate2 := 0;
 DataPanel1.Color := $00FFFF80;
 DataPanel2.Color := $00EAD2BF;
 Change := Payment1 + Payment2 - Tips - Receivable - Rounding1 - Rounding2 - Surcharge1 - Surcharge2;
 if Change <= -0.009 then
    BalanceLabel.Caption := 'Balance'
   else
    BalanceLabel.Caption := 'Change';
 RoundingEdit.Caption := Format('%4.2f ', [Rounding1 + Rounding2]);
 SurchargeEdit.Caption := Format('%4.2f ', [Surcharge1 + Surcharge2]);
 PaymentEdit1.Caption := Format('%4.2f ', [Payment1]);
 PaymentEdit2.Caption := Format('%4.2f ', [Payment2]);
 ChangeEdit.Caption := Format('%4.2f ', [ABS(Change)]);
 PostToSecondDisplay;
end;

procedure TReceiptForm.CalcPayment2;
begin
 if PaymentEdit2.Caption <> '' then
    Payment2 := StrToFloat(PaymentEdit2.Caption)
   else
    Payment2 := 0;
 if MethodEdit2.Caption = 'CASH' then
    begin
     Rounding2 := CalcRounding(Payment2);
     Surcharge2 := 0; SurchargeRate2 := 0;
    end
   else
    begin
     Rounding2 := 0;
     Surcharge2 := RoundToCurrency((Receivable + Surcharge1 - Payment1) * SurchargeRate2 / 100);
     Payment2 := Receivable + Surcharge1 + Surcharge2 + Tips + Rounding1 - Payment1;
    end;
 DataPanel2.Color := $00FFFF80;
 DataPanel1.Color := $00EAD2BF;
 Change := Payment1 + Payment2 - Tips - Receivable - Rounding1 - Rounding2 - Surcharge1 - Surcharge2;
 if Change <= -0.009 then
    BalanceLabel.Caption := 'Balance'
   else
    BalanceLabel.Caption := 'Change';
 RoundingEdit.Caption := Format('%4.2f ', [Rounding1 + Rounding2]);
 SurchargeEdit.Caption := Format('%4.2f ', [Surcharge1 + Surcharge2]);
 PaymentEdit1.Caption := Format('%4.2f ', [Payment1]);
 PaymentEdit2.Caption := Format('%4.2f ', [Payment2]);
 ChangeEdit.Caption := Format('%4.2f ', [ABS(Change)]);
 PostToSecondDisplay;
end;

procedure TReceiptForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 DataForm.SendToPoleDisp('NEXT CUSTOMER PLEASE', '');
 if FVar.SecondDisplay = 1 then SecondDisplayForm.SetWaitingStatus;
 if EFTPOSStatus then
    begin
     DataForm.EFTPOS.OnTransactionEvent := NIL;
     DataForm.EFTPOS.OnPrintReceiptEvent := NIL;
     DataForm.EFTPOS.OnGetLastTransactionEvent := NIL;
     DataForm.EFTPOS.ReceiptAutoPrint := False;
     DataForm.EFTPOS.CutReceipt := False;
    end;
 Action := caFree;
end;

procedure TReceiptForm.CancelButtonClick(Sender: TObject);
begin
 if FVar.SecondDisplay = 1 then SecondDisplayForm.SetSalesStatus;
 ReturnFlag := False;
 Close;
end;

function TReceiptForm.FindIDNo: integer;
var
 SQLStr: String;
begin
 SQLStr := 'Select Max(IDNo) From RecvAcct Where OrderNo=' + Chr(39) + CheckQuotes(OrderNo) + Chr(39);
 OpenQuery(SQLStr);
 if Query.Active and (Query.RecordCount <> 0) then
    Result := Query.Fields[0].AsInteger + 1
   else
    Result := 1;
 Query.Close;
end;

procedure TReceiptForm.SendToSecurityPortPro;
var
 PrintStr, Temp: string;
begin
 if FVar.SecurityCameraPort = 0 then Exit;
 DataForm.OpenSecurityCameraPort;

 PrintStr := 'Date: ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Date + Time);
 DataForm.SendMsgToSecurityCameraPort(PrintStr);

 PrintStr := 'Operator: ' + sUserName;
 DataForm.SendMsgToSecurityCameraPort(PrintStr);

 PrintStr := 'Order Date:';
 PrintStr := Format('%s%' + IntToStr(40 - (Length(PrintStr) + Length(DateEdit.Caption))) + 's%s', [PrintStr, '', DateEdit.Caption]);
 DataForm.SendMsgToSecurityCameraPort(PrintStr);

 PrintStr := 'Order No.:';
 PrintStr := Format('%s%' + IntToStr(40 - (Length(PrintStr) + Length(OrderNoEdit.Caption))) + 's%s', [PrintStr, '', OrderNoEdit.Caption]);
 DataForm.SendMsgToSecurityCameraPort(PrintStr);

 if TotalSalesEdit.Caption < '' then
    begin
     PrintStr := 'Total Sales:';
     Temp := FormatCurrency(StrToFloat(TotalSalesEdit.Caption));
     PrintStr := Format('%s%' + IntToStr(40 - (Length(PrintStr) + Length(Temp))) + 's%s', [PrintStr, '', Temp]);
     DataForm.SendMsgToSecurityCameraPort(PrintStr);
    end;

 if PaidAmountEdit.Caption <> '' then
    begin
     PrintStr := 'Paid Amount:';
     Temp := FormatCurrency(StrToFloat(PaidAmountEdit.Caption));
     PrintStr := Format('%s%' + IntToStr(40 - (Length(PrintStr) + Length(Temp))) + 's%s', [PrintStr, '', Temp]);
     DataForm.SendMsgToSecurityCameraPort(PrintStr);
    end;

 if ReceivableEdit.Caption <> '' then
    begin
     PrintStr := 'Receivable:';
     Temp := FormatCurrency(StrToFloat(ReceivableEdit.Caption));
     PrintStr := Format('%s%' + IntToStr(40 - (Length(PrintStr) + Length(Temp))) + 's%s', [PrintStr, '', Temp]);
     DataForm.SendMsgToSecurityCameraPort(PrintStr);
    end;

 if RoundingEdit.Caption <> '' then
    begin
     PrintStr := 'Rounding:';
     Temp := FormatCurrency(StrToFloat(RoundingEdit.Caption));
     PrintStr := Format('%s%' + IntToStr(40 - (Length(PrintStr) + Length(Temp))) + 's%s', [PrintStr, '', Temp]);
     DataForm.SendMsgToSecurityCameraPort(PrintStr);
    end;

 if SurchargeEdit.Caption <> '' then
    begin
     PrintStr := 'Bank Charge:';
     Temp := FormatCurrency(StrToFloat(SurchargeEdit.Caption));
     PrintStr := Format('%s%' + IntToStr(40 - (Length(PrintStr) + Length(Temp))) + 's%s', [PrintStr, '', Temp]);
     DataForm.SendMsgToSecurityCameraPort(PrintStr);
    end;

 if TipsEdit.Caption <> '' then
    begin
     PrintStr := 'Tips:';
     Temp := FormatCurrency(StrToFloat(TipsEdit.Caption));
     PrintStr := Format('%s%' + IntToStr(40 - (Length(PrintStr) + Length(Temp))) + 's%s', [PrintStr, '', Temp]);
     DataForm.SendMsgToSecurityCameraPort(PrintStr);
    end;

 if (PaymentEdit1.Caption <> '') and (ABS(StrToFloat(PaymentEdit1.Caption)) >= 0.01) then
    begin
     PrintStr := MethodEdit1.Caption;
     Temp := FormatCurrency(StrToFloat(PaymentEdit1.Caption));
     PrintStr := Format('%s%' + IntToStr(40 - (Length(PrintStr) + Length(Temp))) + 's%s', [PrintStr, '', Temp]);
     DataForm.SendMsgToSecurityCameraPort(PrintStr);
    end;

 if (PaymentEdit2.Caption <> '') and (ABS(StrToFloat(PaymentEdit2.Caption)) >= 0.01) then
    begin
     PrintStr := MethodEdit2.Caption;
     Temp := FormatCurrency(StrToFloat(PaymentEdit2.Caption));
     PrintStr := Format('%s%' + IntToStr(40 - (Length(PrintStr) + Length(Temp))) + 's%s', [PrintStr, '', Temp]);
     DataForm.SendMsgToSecurityCameraPort(PrintStr);
    end;

 if (ChangeEdit.Caption <> '') and (ABS(StrToFloat(ChangeEdit.Caption)) >= 0.01) then
    begin
     PrintStr := BalanceLabel.Caption;
     Temp := FormatCurrency(StrToFloat(ChangeEdit.Caption));
     PrintStr := Format('%s%' + IntToStr(40 - (Length(PrintStr) + Length(Temp))) + 's%s', [PrintStr, '', Temp]);
     DataForm.SendMsgToSecurityCameraPort(PrintStr);
    end;
 DataForm.CloseSecurityCameraPort;
end;

function TReceiptForm.SaveData: boolean;
var
 IDNo: integer;
 SQLStr: string;
begin
  Result := True;
  IDNo := FindIDNo;
  if ABS(Payment1) > 0.005 then
     Result := DataForm.SaveAccountRecord(OrderNo, Payment1, MethodEdit1.Caption, IDNo, DepositID1);
  if Result and (ABS(Payment2) > 0.005) then
     begin
      IDNo := IDNo + 1;
      Result := DataForm.SaveAccountRecord(OrderNo, Payment2, MethodEdit2.Caption, IDNo, DepositID2);
     end;
  if Result and (Change >= -0.001) and (ABS(Rounding1 + Rounding2) > 0.005) then
     begin
      IDNo := IDNo + 1;
      Result := DataForm.SaveAccountRecord(OrderNo, -(Rounding1 + Rounding2), 'ROUNDING', IDNo, 0);
     end;
  if Result and (Change >= 0.005) then
     begin
      IDNo := IDNo + 1;
      Result := DataForm.SaveAccountRecord(OrderNo, -Change, 'CASH', IDNo, 0);
     end;
  if Result and LoyaltyAwardAvailible and (VIPNo >= 1) and (Change >= -0.0) and
     (TotalSales > 0) then
     Result := DataForm.SaveAwardPoints(OrderNo, VIPNo, Trunc(TotalSales * SalesPoints));
  if Result then
     Result := DataForm.UpdateOrderPayment(OrderNo, False);
  if Result and ((DepositID1 >= 1) or (DepositID2 >= 1)) then
     begin
      SQLStr := 'Update OrderH Set Credit = 1 Where OrderNo = '+ Chr(39) + CheckQuotes(OrderNo) + Chr(39);
      Result := DataForm.ExecQueryPro(SQLStr);
     end;
  if Result then
     begin
      SQLStr := 'Update OrderH Set Tips=Tips + ' + FloatToStr(Tips) +
                ', Surcharge=Surcharge + ' + FloatToStr(Surcharge1 + Surcharge2) +
                ' Where OrderNo=' + Chr(39) + CheckQuotes(OrderNo) + Chr(39);
      Result := DataForm.ExecQueryPro(SQLStr);
     end;
end;

procedure TReceiptForm.SaveDataPro;
var
 Flag: boolean;
begin
 ReturnFlag := False;
 Flag := False;
 if Not DataForm.BeginTransaction then Exit;
 try
  Flag := SaveData;
 finally
  if Flag then
     begin
      DataForm.CommitTransaction;
      SendToSecurityPortPro;
      ReturnFlag := True;
      WorkPanel.Enabled := False;
      ControlPanel.Enabled := False;
      ButtonPanel.Enabled := True;
      ExitButton.Visible := True;
      CancelButton.Visible := False;
      ConfirmButton.Visible := False;
      AccountPaymentButton.Visible := False;
      PrintBillButton.Enabled := True;
      PrintInvoiceButton.Enabled := True;
      ExitButton.SetFocus;
      if Not OnlyOpenDrawerForCashPayment or
         ((Uppercase(MethodEdit1.Caption) = 'CASH') and (ABS(Payment1) >= 0.01)) or
         ((Uppercase(MethodEdit2.Caption) = 'CASH') and (ABS(Payment2) >= 0.01)) or
         (ABS(Change) >= 0.01) then
         begin
          CurrentDrawerNumber := DefaultDrawerPortNumber;
          DataForm.OpenDrawer(True, CurrentDrawerNumber);
         end;
      if (BillKind = sQuickSale) and AutoPrintPickupSlip then
         begin
          PrintPickupSlipForm.PrintPickupSlipPro(OrderNo);
          Application.ProcessMessages;
         end;
      if (AutoPrintBill and (BillKind <> sQuickSale)) or
         (AutoPrintPOSOrderList and (BillKind = sQuickSale)) then
         case PrintBillMode of
          0, 1: PrintOrderForm.PrintOrderPro(OrderNo);
          2:    PrintOrderForm1.PrintOrderPro(OrderNo, True);
          3:    PrintOrderForm1.PrintOrderPro(OrderNo, False);
          4:    PrintOrderForm2.PrintOrderPro(OrderNo);
          5:    PrintOrderForm3.PrintOrderPro(OrderNo);
         end;
      if (AutoPrintInvoice and (BillKind <> sQuickSale)) or
         (AutoPrintPOSInvoice and (BillKind = sQuickSale)) then
         begin
          if DataForm.BeginTransaction then
             try
              Flag := DataForm.SetInvoiceNo(OrderNo);
             finally
              if Flag then
                 begin
                  DataForm.CommitTransaction;
                  case PrintInvoiceMode of
                   0, 1: PrintInvoiceForm.PrintInvoicePro(OrderNo);
                   2:    PrintInvoiceForm1.PrintInvoicePro(OrderNo, True);
                   3:    PrintInvoiceForm1.PrintInvoicePro(OrderNo, False);
                   4:    PrintInvoiceForm2.PrintInvoicePro(OrderNo);
                   5:    PrintInvoiceForm3.PrintInvoicePro(OrderNo);
                  end;
                 end
                else
                 DataForm.RollBack;
             end;
         end;
      //if Not ShowPrintInvoiceWindow then Close;
     end
    else
     DataForm.RollBack;
 end;
end;

procedure TReceiptForm.ConfirmButtonClick(Sender: TObject);
begin
 if (Change <= -0.009) and
    (MessageBoxForm.MessagePro('Payment does not compeleted, do you want to save?', sConfirmMsg) = mrNo) then Exit;
 if LinkToEFTPOSFlag then
    begin
     if ABS(Payment1) < 0.01 then
        MessageBoxForm.MessagePro('EFTPOS Payment can not be Zero!', sErrorMsg)
       else
        begin
         CancelButton.Visible := False;
         ConfirmButton.Visible := False;
         AccountPaymentButton.Visible := False;
         PrintInvoiceButton.Enabled := False;
         PrintBillButton.Enabled := False;
         if Payment1 > 0 then
            DataForm.EFTPOS.TxnType := 'P'
           else
            DataForm.EFTPOS.TxnType := 'R';
         DataForm.EFTPOS.EnableTip := False;
         DataForm.EFTPOS.AmtTip := 0;
         DataForm.EFTPOS.AmtCash := 0;
         DataForm.EFTPOS.AmtPurchase := ABS(Payment1);
         DataForm.EFTPOS.ReceiptAutoPrint := False;
         DataForm.EFTPOS.CutReceipt := False;
         DataForm.EFTPOS.TxnRef := IntToStr(ReferenceNo + 1);
         DataForm.EFTPOS.DoTransaction();
        end;
    end
   else
    SaveDataPro;
 StringGrid.SetFocus;
end;

procedure TReceiptForm.EFTTransactionEvent(Sender: TObject);
begin
 if DataForm.EFTPOS.Success then
    begin
     if UpperCase(DataForm.EFTPOS.AccountType) = 'SAVINGS' then
        MethodEdit1.Caption := UpperCase(DataForm.EFTPOS.AccountType)
       else
        MethodEdit1.Caption := UpperCase(DataForm.EFTPOS.CardType);
     SaveDataPro;
     PrintCustomerReceipt;
     Application.ProcessMessages;
    end
   else
    begin
     CancelButton.Visible := True;
     ConfirmButton.Visible := True;
     AccountPaymentButton.Visible := True;
     PrintInvoiceButton.Visible := True;
     PrintBillButton.Visible := True;
     ExitButton.Visible := False;
     ReturnFlag := False;
    end;
end;

procedure TReceiptForm.PrintCustomerReceipt;
var
 ReceiptStr: string;
begin
 if (FVar.DefaultPrinter = 0) or (String(FVar.POSPrinter[FVar.DefaultPrinter].Name) = 'N/A') then Exit;
 DataForm.OpenPrinterPort(FVar.DefaultPrinter);
 DataForm.PrintBillHead;
 DataForm.SetBlackFontB;
 DataForm.OutPutToPrinter(' ');
 DataForm.OutPutToPrinter('  CUSTOMER RECEIPT  ' );
 DataForm.SetBlackFontA;
 ReceiptStr := '========================================';
 DataForm.OutPutToPrinter(ReceiptStr);
 ReceiptStr := 'MERCHANT ID: ' + DataForm.EFTPOS.Caid;
 DataForm.OutPutToPrinter(ReceiptStr);
 ReceiptStr := 'TERMINAL ID: ' + DataForm.EFTPOS.Catid;
 DataForm.OutPutToPrinter(ReceiptStr);
 ReceiptStr := 'CARD NUMBER: ' + Copy(DataForm.EFTPOS.Pan, 1, 6) + '-' +
               Copy(DataForm.EFTPOS.Pan, Length(DataForm.EFTPOS.Pan) - 2, 3);
 DataForm.OutPutToPrinter(ReceiptStr);
 ReceiptStr:= 'ACCOUNT TYPE: ' + UpperCase(DataForm.EFTPOS.AccountType) + '  ' +
               UpperCase(DataForm.EFTPOS.CardType);
 DataForm.OutPutToPrinter(ReceiptStr);
 ReceiptStr := 'EXPIRE DATE: ' + Copy(DataForm.EFTPOS.DateExpiry, 1, 2) + '/' +
               Copy(DataForm.EFTPOS.DateExpiry, 3, 2);
 DataForm.OutPutToPrinter(ReceiptStr);
 DataForm.OutPutToPrinter(' ');
 if DataForm.EFTPOS.TxnType = 'P' then
    begin
     ReceiptStr := 'PURCHASE:     ' + Format('%10s', [FormatCurrency(DataForm.EFTPOS.AmtPurchase)]);
     DataForm.OutPutToPrinter(ReceiptStr);
     if DataForm.EFTPOS.AmtCash >= 0.01 then
        begin
         ReceiptStr := 'CASH OUT:     ' + Format('%10s', [FormatCurrency(DataForm.EFTPOS.AmtCash)]);
         DataForm.OutPutToPrinter(ReceiptStr);
        end;
    end
   else
    if DataForm.EFTPOS.TxnType = 'R' then
       begin
        ReceiptStr := 'REFUND:       ' + Format('%10s', [FormatCurrency(DataForm.EFTPOS.AmtPurchase)]);
        DataForm.OutPutToPrinter(ReceiptStr);
       end;
 ReceiptStr := Format('%24s', ['----------']);
 DataForm.OutPutToPrinter(ReceiptStr);
 ReceiptStr := 'TOTAL:        ' + Format('%10s', [FormatCurrency(DataForm.EFTPOS.AmtPurchase + DataForm.EFTPOS.AmtCash)]);
 DataForm.OutPutToPrinter(ReceiptStr);
 ReceiptStr := DataForm.EFTPOS.ResponseText + '         AUTH NO: ' + DataForm.EFTPOS.AuthCode;
 DataForm.OutPutToPrinter(ReceiptStr);
 DataForm.OutPutToPrinter(' ');
 ReceiptStr := 'DATE: ' + Copy(DataForm.EFTPOS.Date, 1, 2) + '/' +  Copy(DataForm.EFTPOS.Date, 3, 2) + '/' +
               Copy(DataForm.EFTPOS.Date, 5, 2) +
               '  TIME: ' + Copy(DataForm.EFTPOS.Time, 1, 2) + ':' + Copy(DataForm.EFTPOS.Time, 3, 2) + '  ' +
               Format('%6.6d', [DataForm.EFTPOS.Stan]);
 DataForm.OutPutToPrinter(ReceiptStr);
 ReceiptStr := '========================================';
 DataForm.OutPutToPrinter( ReceiptStr );
 DataForm.OutPutToPrinter(' ');
 DataForm.OutPutToPrinter(' ');
 DataForm.CutPaper;
 DataForm.ClosePrinterPort;
end;

procedure TReceiptForm.PrintMerthantReceiptPro(Receipt: WideString);
var
 ReceiptList: TStringList;
 TempStr: string;
 I, J: integer;
begin
 if (FVar.DefaultPrinter = 0) or (String(FVar.POSPrinter[FVar.DefaultPrinter].Name) = 'N/A') then Exit;
 ReceiptList := TStringList.Create;
 ReceiptList.Clear;
 ReceiptList.Add('MERCHANT RECEIPT');
 ReceiptList.Add('');
 J := 1;
 for I := 1 to Length(Receipt) do
  begin
   if (Receipt[I] <> #13) and (Receipt[I] <> #10) then
      ReceiptList[J] := ReceiptList[J] + Receipt[I]
     else
      if Receipt[I] = #13 then
         begin
          ReceiptList.Add('');
          J := J + 1;
         end;
  end;
 DataForm.OpenPrinterPort(FVar.DefaultPrinter);
 DataForm.SetBlackFontA;
 for I := 0 to ReceiptList.Count - 1 do
  begin
   TempStr := ReceiptList[I];
   TempStr := Format('%' + IntToStr((40 - Length(TempStr)) div 2) + 's%s', ['', TempStr]);
   DataForm.OutPutToPrinter(TempStr);
  end;
 DataForm.CutPaper;
 DataForm.ClosePrinterPort;
end;

procedure TReceiptForm.EFTPrintReceiptEvent(Sender: TObject; const ReceiptType: WideString);
begin
 if ReceiptType[1] <> 'R' then
    ReceiptFlag := ReceiptType[1]
   else
    if ReceiptFlag = 'M' then
       PrintMerthantReceiptPro(DataForm.EFTPOS.Receipt);
end;

procedure TReceiptForm.Methods1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if Key = VK_RETURN then PaymentEdit1.SetFocus;
end;

procedure TReceiptForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = Chr(27) then CancelButtonClick(Sender)
end;

procedure TReceiptForm.EFTGetLastTransactionEvent(Sender: TObject);
begin
 if DataForm.EFTPOS.Success then
    ReferenceNo := StrToIntDef(DataForm.EFTPOS.TxnRef, 0);
end;

procedure TReceiptForm.MethodClick(Sender: TObject);
var
 Temp: string;
begin
 with Sender As TXiButton do
  if Caption <> '' then
     begin
      Temp := Copy(Name, 7, 1);
      if LinkEFTPOS[StrToInt(Temp)] and (Not EFTPOSStatus or Not DataForm.EFTPOS.Installed) then
         MessageBoxForm.MessagePro('EFTPOS machine has not been connected.', sERRORMsg)
        else
         begin
          if DataPanel1.Color = $00FFFF80 then
             begin
              MethodEdit1.Caption := Caption;
              LinkToEFTPOSFlag := LinkEFTPOS[StrToInt(Temp)];
              SurchargeRate1 := SurchargeRate[StrToInt(Temp)];
              InitPayment1;
              DepositID1 := 0;
             end
            else
             begin
              if LinkEFTPOS[StrToInt(Temp)] then
                 MessageBoxForm.MessagePro('Can not use EFTPOS do second payment.', sERRORMsg)
                else
                 begin
                  MethodEdit2.Caption := Caption;
                  SurchargeRate2 := SurchargeRate[StrToInt(Temp)];
                  InitPayment2;
                  DepositID2 := 0;
                 end;
             end;
         end;
     end
end;

procedure TReceiptForm.OtherMethodClick(Sender: TObject);
var
 PaymentMethod: string;
 LinkToEFTPOS: boolean;
 BankChargeRate: double;
begin
 if PaymentSelectForm.PaymentSelectPro(PaymentMethod, BankChargeRate, LinkToEFTPOS) then
    begin
     if LinkToEFTPOS and (Not EFTPOSStatus or Not DataForm.EFTPOS.Installed) then
        MessageBoxForm.MessagePro('EFTPOS machine has not been connected.', sERRORMsg)
       else
        begin
         if DataPanel1.Color = $00FFFF80 then
            begin
             MethodEdit1.Caption := PaymentMethod;
             LinkToEFTPOSFlag := LinkToEFTPOS;
             SurchargeRate1 := BankChargeRate;
             InitPayment1;
             DepositID1 := 0;
            end
           else
            begin
             if LinkToEFTPOS then
                MessageBoxForm.MessagePro('Can not use EFTPOS do second payment.', sERRORMsg)
               else
                begin
                 MethodEdit2.Caption := PaymentMethod;
                 SurchargeRate2 := BankChargeRate;
                 InitPayment2;
                 DepositID2 := 0;
                end;
             end;
        end;
    end;
end;

procedure TReceiptForm.MoneyButton1Click(Sender: TObject);
begin
 if ((DataPanel1.Color = $00FFFF80) and (DepositID1 <> 0)) or
    ((DataPanel2.Color = $00FFFF80) and (DepositID2 <> 0)) then Exit;
 if (Length(NumberStr) < 16) then
    begin
     if NumberStr <> '0' then
        NumberStr := FloatToStr(StrToFloat(NumberStr) + 5)
       else
        NumberStr := '5';
    end;
 DisplayNumber;
 if (DataPanel2.Color = $00FFFF80) then
    CalcPayment2
   else
    CalcPayment1;
end;

procedure TReceiptForm.MoneyButton2Click(Sender: TObject);
begin
 if ((DataPanel1.Color = $00FFFF80) and (DepositID1 <> 0)) or
    ((DataPanel2.Color = $00FFFF80) and (DepositID2 <> 0)) then Exit;
 if (Length(NumberStr) < 16) then
    begin
     if NumberStr <> '0' then
        NumberStr := FloatToStr(StrToFloat(NumberStr) + 10)
       else
        NumberStr := '10';
    end;
 DisplayNumber;
 if (DataPanel2.Color = $00FFFF80) then
    CalcPayment2
   else
    CalcPayment1;
end;

procedure TReceiptForm.MoneyButton3Click(Sender: TObject);
begin
 if ((DataPanel1.Color = $00FFFF80) and (DepositID1 <> 0)) or
    ((DataPanel2.Color = $00FFFF80) and (DepositID2 <> 0)) then Exit;
 if (Length(NumberStr) < 16) then
    begin
     if NumberStr <> '0' then
        NumberStr := FloatToStr(StrToFloat(NumberStr) + 20)
       else
        NumberStr := '20';
    end;
 DisplayNumber;
 if (DataPanel2.Color = $00FFFF80) then
    CalcPayment2
   else
    CalcPayment1;
end;

procedure TReceiptForm.MoneyButton4Click(Sender: TObject);
begin
 if ((DataPanel1.Color = $00FFFF80) and (DepositID1 <> 0)) or
    ((DataPanel2.Color = $00FFFF80) and (DepositID2 <> 0)) then Exit;
 if (Length(NumberStr) < 16) then
    begin
     if NumberStr <> '0' then
        NumberStr := FloatToStr(StrToFloat(NumberStr) + 50)
       else
        NumberStr := '50';
    end;
 DisplayNumber;
 if (DataPanel2.Color = $00FFFF80) then
    CalcPayment2
   else
    CalcPayment1;
end;

procedure TReceiptForm.MoneyButton5Click(Sender: TObject);
begin
 if ((DataPanel1.Color = $00FFFF80) and (DepositID1 <> 0)) or
    ((DataPanel2.Color = $00FFFF80) and (DepositID2 <> 0)) then Exit;
 if (Length(NumberStr) < 16) then
    begin
     if NumberStr <> '0' then
        NumberStr := FloatToStr(StrToFloat(NumberStr) + 100)
       else
        NumberStr := '100';
    end;
 DisplayNumber;
 if (DataPanel2.Color = $00FFFF80) then
    CalcPayment2
   else
    CalcPayment1;
end;

procedure TReceiptForm.NumClick(Sender: TObject);
var
 Temp: string;
begin
 if ((DataPanel1.Color = $00FFFF80) and (DepositID1 <> 0)) or
    ((DataPanel2.Color = $00FFFF80) and (DepositID2 <> 0)) then Exit;
 with Sender As TXiButton do
  Temp := Caption;
 if Length(NumberStr) < 16 then
    begin
     if NumberStr <> '0'  then
        NumberStr := NumberStr + Temp
       else
        NumberStr := Temp;
    end;
 DisplayNumber;
 if (DataPanel2.Color = $00FFFF80) then
    CalcPayment2
   else
    CalcPayment1;
end;

procedure TReceiptForm.ClearButtonClick(Sender: TObject);
begin
 if ((DataPanel1.Color = $00FFFF80) and (DepositID1 <> 0)) or
    ((DataPanel2.Color = $00FFFF80) and (DepositID2 <> 0)) then Exit;
 NumberStr := '0';
 DisplayNumber;
 if (DataPanel2.Color = $00FFFF80) then
    CalcPayment2
   else
    CalcPayment1;
end;

procedure TReceiptForm.StubtractButtonClick(Sender: TObject);
var
 Temp: double;
begin
 if ((DataPanel1.Color = $00FFFF80) and (DepositID1 <> 0)) or
    ((DataPanel2.Color = $00FFFF80) and (DepositID2 <> 0)) then Exit;
 Temp := StrToFloat(NumberStr);
 if Temp > 0 then
    begin
     Temp := 0 - Temp;
     NumberStr := FloatToStr(Temp);
     DisplayNumber;
     if (DataPanel2.Color = $00FFFF80) then
        CalcPayment2
       else
        CalcPayment1;
    end;
end;

procedure TReceiptForm.PlusButtonClick(Sender: TObject);
var
 Temp: double;
begin
 if ((DataPanel1.Color = $00FFFF80) and (DepositID1 <> 0)) or
    ((DataPanel2.Color = $00FFFF80) and (DepositID2 <> 0)) then Exit;
 Temp := StrToFloat(NumberStr);
 if Temp < 0 then
    begin
     Temp := ABS(Temp);
     NumberStr := FloatToStr(Temp);
     DisplayNumber;
     if (DataPanel2.Color = $00FFFF80) then
        CalcPayment2
       else
        CalcPayment1;
    end;
end;

procedure TReceiptForm.DecimalClick(Sender: TObject);
begin
 if ((DataPanel1.Color = $00FFFF80) and (DepositID1 <> 0)) or
    ((DataPanel2.Color = $00FFFF80) and (DepositID2 <> 0)) then Exit;
 if POS('.', NumberStr) = 0 then
    begin
     NumberStr := NumberStr + '.';
     DisplayNumber;
     if (DataPanel2.Color = $00FFFF80) then
        CalcPayment2
       else
        CalcPayment1;
    end;
end;

procedure TReceiptForm.TipsEditClick(Sender: TObject);
var
 NumStr: string;
begin
 NumStr := TipsEdit.Caption;
 if NumberPadForm.ReadNumberPro(NumStr, False, True, 'Tips Amount',  0) then
    begin
     TipsEdit.Caption := Format('%4.2f ', [StrToFloat(NumStr)]);
     InitPayment1;
    end;
end;

procedure TReceiptForm.TipsButtonClick(Sender: TObject);
begin
 TipsEditClick(Sender);
end;

procedure TReceiptForm.DataPanel1Click(Sender: TObject);
begin
 MethodEdit1.Caption := 'CASH';
 InitPayment1;
end;

procedure TReceiptForm.DataPanel2Click(Sender: TObject);
begin
 if (MethodEdit1.Caption <> 'CASH') and
    (Payment1 - Receivable - Rounding1 - Rounding2 - Surcharge1 - Tips <= -0.01) then
    InitPayment2;
end;

procedure TReceiptForm.ExitButtonClick(Sender: TObject);
begin
 DataForm.TestDrawerStatus(CurrentDrawerNumber);
 if DrawerIsOpen then
    MessageBoxForm.MessagePro('Cash Drawer is opened, please close it.', sInformationMsg)
   else
    Close;
end;

procedure TReceiptForm.PrintInvoiceButtonClick(Sender: TObject);
var
 Flag: boolean;
begin
 if MessageBoxForm.MessagePro('Are you sure you want to print the invoice?', sConfirmMsg) = mrNo then Exit;
 Flag := False;
 if Not DataForm.BeginTransaction then Exit;
 try
  Flag := DataForm.SetInvoiceNo(OrderNo);
 finally
  if Flag then
     DataForm.CommitTransaction
    else
     DataForm.RollBack;
 end;
 if Flag then
    case PrintInvoiceMode of
     0, 1: PrintInvoiceForm.PrintInvoicePro(OrderNo);
     2:    PrintInvoiceForm1.PrintInvoicePro(OrderNo, True);
     3:    PrintInvoiceForm1.PrintInvoicePro(OrderNo, False);
     4:    PrintInvoiceForm2.PrintInvoicePro(OrderNo);
     5:    PrintInvoiceForm3.PrintInvoicePro(OrderNo);
    end;
end;

procedure TReceiptForm.PrintBillButtonClick(Sender: TObject);
begin
 case PrintBillMode of
  0, 1: PrintOrderForm.PrintOrderPro(OrderNo);
  2:    PrintOrderForm1.PrintOrderPro(OrderNo, True);
  3:    PrintOrderForm1.PrintOrderPro(OrderNo, False);
  4:    PrintOrderForm2.PrintOrderPro(OrderNo);
  5:    PrintOrderForm3.PrintOrderPro(OrderNo);
 end; 
end;

procedure TReceiptForm.AccountPaymentButtonClick(Sender: TObject);
var
 SQLStr: string;
 Flag: boolean;
begin
 if Not DataForm.CheckVIPCreditStatus(VIPNo, Receivable, OrderNo) then
    begin
     MessageBoxForm.MessagePro('This customer credit is over.', sErrorMsg );
     Exit;
    end;
 if MessageBoxForm.MessagePro('Are you sure you want to put this order to account payment?', sConfirmMsg) = mrNo then
    Exit;
 SQLStr := 'Update OrderH Set Credit = 1 Where OrderNo=' + Chr(39) + CheckQuotes(OrderNo) + Chr(39);
 Flag := False;
 if Not DataForm.BeginTransaction then Exit;
 try
  Flag := DataForm.ExecQueryPro(SQLStr);
 finally
  if Flag then
     begin
      DataForm.CommitTransaction;
      ReturnFlag := True;
      WorkPanel.Enabled := False;
      ControlPanel.Enabled := False;
      ExitButton.Visible := True;
      CancelButton.Visible := False;
      ConfirmButton.Visible := False;
      AccountPaymentButton.Enabled := False;
      if Not OnlyOpenDrawerForCashPayment then
         begin
          CurrentDrawerNumber := DefaultDrawerPortNumber;
          DataForm.OpenDrawer(True, CurrentDrawerNumber);
         end; 
      PrintBillButtonClick(Sender);
     end
    else
     DataForm.RollBack;
 end;
end;

procedure TReceiptForm.DepositPaymentButtonClick(Sender: TObject);
var
 DepositBalance, Remain: double;
 DepositID: integer;
begin
 if DepositPaymentForm.DepositPaymentPro(VIPNo, DepositBalance, DepositID) then
    begin
     if DataPanel1.Color = $00FFFF80 then
        begin
         LinkToEFTPOSFlag := False;
         SurchargeRate1 := 0;
         DepositID1 := DepositID;
         MethodEdit1.Caption := 'Deposit';
         Rounding1 := 0;
         if DepositBalance >= Receivable then
            PaymentEdit1.Caption := Format('%4.2f ', [Receivable])
           else
            PaymentEdit1.Caption := Format('%4.2f ', [DepositBalance]);
         CalcPayment1;
        end
       else
        begin
         if DepositID = DepositID1 then
            MessageBoxForm.MessagePro('Can not use this deposit to do the payment.', sERRORMsg)
           else
            begin
             SurchargeRate2 := 0;
             MethodEdit2.Caption := 'Deposit';
             Rounding2 := 0;
             Remain := Receivable + Rounding1 + Surcharge1 + Tips - Payment1;
             if DepositBalance >= Remain then
                PaymentEdit2.Caption := Format('%4.2f ', [Remain])
               else
                PaymentEdit2.Caption := Format('%4.2f ', [DepositBalance]);
             CalcPayment2;
           end;
        end
    end;
end;

procedure TReceiptForm.FormShow(Sender: TObject);
var
 SQLStr: string;
 TipsTemp, SurchargeTemp, GST, AvailableCredit: double;
 CurrentPriceIncludesGST: boolean;
begin
 GetPaymentMethod;
 ReadPaymentMethodsPro;
 SQLStr := 'Select * From OrderH Where OrderNo=' + Chr(39) + CheckQuotes(OrderNo) + Chr(39);
 OpenQuery(SQLStr);
 with Query do
  begin
   if FieldByName('PriceIncludesGST').AsBoolean then
      NetSales := FieldByName('Amount').AsFloat +
                    FieldByName('ServiceCharge').AsFloat +
                    FieldByName('OtherCharge').AsFloat
     else
      NetSales := FieldByName('Amount').AsFloat +
                    FieldByName('ServiceCharge').AsFloat +
                    FieldByName('OtherCharge').AsFloat +
                    FieldByName('GST').AsFloat;
   CurrentPriceIncludesGST := FieldByName('PriceIncludesGST').AsBoolean;
   GST := FieldByName('GST').AsFloat;
   ServiceCharge := FieldByName('ServiceCharge').AsFloat;
   OtherCharge := FieldByName('OtherCharge').AsFloat;
   TipsTemp := FieldByName('Tips').AsFloat;
   SurchargeTemp := FieldByName('Surcharge').AsFloat;
   VIPNo := FieldByName('VIPNo').AsInteger;
   BillKind := FieldByName('BillKind').AsInteger;
   OrderNoEdit.Caption := OrderNo;
   TableNoEdit.Caption := FieldByName('TableNo').AsString;
   DateEdit.Caption := FormatDateTime('dd/mm/yyyy hh:mm:ss', FieldByName('OrderDate').AsDateTime);
   Close;
  end;
 SQLStr := 'Select Sum(PaidAmount) From RecvAcct ' +
           'Where OrderNo=' + Chr(39) + CheckQuotes(OrderNo) + Chr(39);
 OpenQuery(SQLStr);
 with Query do
  begin
   PaidAmount := Fields[0].AsFloat - TipsTemp - SurchargeTemp;
   Close;
  end;
 InitStringGrid;
 OpenDataQuery;
 if CurrentPriceIncludesGST then
    TotalSales := CalcTotalSales + ServiceCharge + OtherCharge
   else
    TotalSales := CalcTotalSales + ServiceCharge + OtherCharge + GST;
 TotalDiscount := TotalSales - NetSales;
 PostDataToStringGrid;
 Query.Close;
 if (FVar.SecondDisplay = 1) then
    begin
     SecondDisplayForm.AvailableCreditLabel.Visible := False;
     SecondDisplayForm.AvailableCreditEdit.Visible := False;
     if (VIPNo > 0) then
        AvailableCredit := DataForm.GetAvailableCredit(VIPNo)
       else
        AvailableCredit := 0;
     if AvailableCredit >= 0.01 then
        begin
         SecondDisplayForm.AvailableCreditLabel.Visible := True;
         SecondDisplayForm.AvailableCreditEdit.Visible := True;
         SecondDisplayForm.AvailableCreditEdit.Caption := Format('%4.2m', [AvailableCredit]);
        end;
    end;
 if EFTPOSStatus then
    begin
     DataForm.EFTPOS.OnTransactionEvent := EFTTransactionEvent;
     DataForm.EFTPOS.OnPrintReceiptEvent := EFTPrintReceiptEvent;
     DataForm.EFTPOS.OnGetLastTransactionEvent := EFTGetLastTransactionEvent;
     DataForm.EFTPOS.ReceiptAutoPrint := False;
     DataForm.EFTPOS.CutReceipt := False;
     if DataForm.EFTPOS.Installed then DataForm.EFTPOS.DoGetLastTransaction;
    end;
 ExitButton.Visible := False;
 Top := 0;
 Left := 0;
 Height := Screen.Height;
 Width := Screen.Width;
 BackPanel.Height := 768;
 BackPanel.Width := 1024;
 BackPanel.Left := (Screen.Width - BackPanel.Width) div 2;
 BackPanel.Top := (Screen.Height - BackPanel.Height) div 2;
 WorkPanel.Left := 568;
 ButtonPanel.Left := 568;
 ControlPanel.Left := 568;
 PrintBillButton.Caption := 'Print' + Chr(13) + 'Bill';
 PrintInvoiceButton.Caption := 'Print' + Chr(13) + 'Invoice';
 AccountPaymentButton.Caption := 'Account' + Chr(13) + 'Payment';
 ConfirmButton.Caption := 'OK';
 CancelButton.Caption := 'Cancel';
 ExitButton.Caption := 'Exit';
 DepositPaymentButton.Caption := 'Deposit' + Chr(13) + 'Payment';
 AccountPaymentButton.Enabled := VIPNo >= 1;
 DepositPaymentButton.Enabled := VIPNo >= 1;
 MoneyButton1.Caption := sCurrency + '5';
 MoneyButton2.Caption := sCurrency + '10';
 MoneyButton3.Caption := sCurrency + '20';
 MoneyButton4.Caption := sCurrency + '50';
 MoneyButton5.Caption := sCurrency + '100';
 MethodEdit1.Caption := 'CASH';
 LinkToEFTPOSFlag := False;
 Surcharge1 := 0;
 Surcharge2 := 0;
 SurchargeRate1 := 0;
 SurchargeRate2 := 0;
 DepositID1 := 0;
 DepositID2 := 0;
 Tips := 0;
 ReferenceNo := 0;
 MethodEdit2.Caption := '';
 InitPayment1;
 if FVar.SecondDisplay = 1 then
    begin
     SecondDisplayForm.SetPaymentStatus;
     PostDataToSecondDisplayPro;
    end;
 StringGrid.SetFocus;
end;

function TReceiptForm.ReceiptPro(OrderNo: string): boolean;
begin
 Application.CreateForm(TReceiptForm, ReceiptForm);
 ReceiptForm.OrderNo := OrderNo;
 ReceiptForm.ShowModal;
 Result := ReceiptForm.ReturnFlag;
 ReceiptForm.Free;
end;

end.
