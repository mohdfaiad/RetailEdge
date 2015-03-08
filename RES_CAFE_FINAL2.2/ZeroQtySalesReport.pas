unit ZeroQtySalesReport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Db, StdCtrls, Buttons, Mask, UtilUnit,
  ADODB, bsSkinCtrls, BusinessSkinForm, XiButton;

type
  TZeroQtySalesReportForm = class(TForm)
    DBGrid: TDBGrid;
    DataSource: TDataSource;
    Label1: TLabel;
    DateEdit1: TMaskEdit;
    Label2: TLabel;
    DateEdit2: TMaskEdit;
    TimeEdit1: TMaskEdit;
    TimeEdit2: TMaskEdit;
    Query: TADOQuery;
    bsBusinessSkinForm: TbsBusinessSkinForm;
    DBGridPanel: TbsSkinPanel;
    ControlPanel: TbsSkinPanel;
    SearchButton: TXiButton;
    PrintButton: TXiButton;
    ExitButton: TXiButton;
    QueryOrderNo: TWideStringField;
    QueryOrderDate: TDateTimeField;
    QueryDescription1: TWideStringField;
    QuerySubDescription: TWideStringField;
    QueryQty: TFloatField;
    QuerySalesPrice: TFloatField;
    QueryOrderOperator: TWideStringField;
    QueryDescription: TStringField;
    QueryFixPrice: TFloatField;
    procedure OpenQuery(SQLStr: string);
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SearchButtonClick(Sender: TObject);
    procedure DateEditClick(Sender: TObject);
    procedure DateEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DateEdit2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PrintButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure ZeroQtySalesReportPro;
    procedure QueryCalcFields(DataSet: TDataSet);
    procedure TimeEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TimeEdit2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TimeEditClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ZeroQtySalesReportForm: TZeroQtySalesReportForm;

implementation

uses DatePanel, SaleshistoryDetail, MainMenu, DataUnit, PrintSalesVoidReport,
     TimePanel, PrintZeroQtySalesReport;

{$R *.DFM}

procedure TZeroQtySalesReportForm.OpenQuery(SQLStr: string);
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

procedure TZeroQtySalesReportForm.ExitButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TZeroQtySalesReportForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Query.Close;
 Action := caFree;
 ZeroQtySalesReportForm := NIL;
end;

procedure TZeroQtySalesReportForm.SearchButtonClick(Sender: TObject);
var
 SQLStr: string;
 DateTemp1, DateTemp2: TDateTime;
begin
 DateTemp1 := TransferDate(DateEdit1.Text) + StrToTime(TimeEdit1.Text);
 DateTemp2 := TransferDate(DateEdit2.Text) + StrToTime(TimeEdit2.Text);
 SQLStr := 'Select OrderH.OrderNo, OrderDate, Description1, SubDescription, ' +
           'OrderI.Qty, OrderI.Price As SalesPrice, MenuItem.Price As FixPrice, ' +
           'OrderOperator ' +
           'From OrderH, OrderI, MenuItem ' +
           'Where OrderH.OrderNo=OrderI.OrderNo and PriceSelect = 0 and ' +
           'OrderI.ItemCode=MenuItem.ItemCode and OrderI.Qty = 0 and ' +
           '(OrderI.Price > 0 or MenuItem.Price > 0) and ' +
           'OrderDate>=' + ConvertDateTime(DateTemp1) + ' and ' +
           'OrderDate<=' + ConvertDateTime(DateTemp2) +
           ' Union All ' +
           'Select OrderH.OrderNo, OrderDate, Description1, SubDescription, ' +
           'OrderI.Qty, OrderI.Price As SalesPrice, MenuItem.Price1 As FixPrice, ' +
           'OrderOperator ' +
           'From OrderH, OrderI, MenuItem ' +
           'Where OrderH.OrderNo=OrderI.OrderNo and PriceSelect = 1 and ' +
           'OrderI.ItemCode=MenuItem.ItemCode and OrderI.Qty = 0 and ' +
           '(OrderI.Price > 0 or MenuItem.Price1 > 0) and ' +
           'OrderDate>=' + ConvertDateTime(DateTemp1) + ' and ' +
           'OrderDate<=' + ConvertDateTime(DateTemp2) +
           ' Union All ' +
           'Select OrderH.OrderNo, OrderDate, Description1, SubDescription, ' +
           'OrderI.Qty, OrderI.Price As SalesPrice, MenuItem.Price2 As FixPrice, ' +
           'OrderOperator ' +
           'From OrderH, OrderI, MenuItem ' +
           'Where OrderH.OrderNo=OrderI.OrderNo and PriceSelect = 2 and ' +
           'OrderI.ItemCode=MenuItem.ItemCode and OrderI.Qty = 0 and ' +
           '(OrderI.Price > 0 or MenuItem.Price2 > 0) and ' +
           'OrderDate>=' + ConvertDateTime(DateTemp1) + ' and ' +
           'OrderDate<=' + ConvertDateTime(DateTemp2) +
           ' Union All ' +
           'Select OrderH.OrderNo, OrderDate, Description1, SubDescription, ' +
           'OrderI.Qty, OrderI.Price As SalesPrice, MenuItem.Price3 As FixPrice, ' +
           'OrderOperator ' +
           'From OrderH, OrderI, MenuItem ' +
           'Where OrderH.OrderNo=OrderI.OrderNo and PriceSelect = 3 and ' +
           'OrderI.ItemCode=MenuItem.ItemCode and OrderI.Qty = 0 and ' +
           '(OrderI.Price > 0 or MenuItem.Price3 > 0) and ' +
           'OrderDate>=' + ConvertDateTime(DateTemp1) + ' and ' +
           'OrderDate<=' + ConvertDateTime(DateTemp2) +
           ' Order By OrderH.OrderNo';
 OpenQuery(SQLStr);
end;

procedure TZeroQtySalesReportForm.QueryCalcFields(DataSet: TDataSet);
begin
 with Query do
  if FieldByName('SubDescription').AsString <> '' then
     FieldByName('Description').AsString :=
             FieldByName('Description1').AsString + ' / ' + FieldByName('SubDescription').AsString
    else
     FieldByName('Description').AsString := FieldByName('Description1').AsString
end;

procedure TZeroQtySalesReportForm.DateEditClick(Sender: TObject);
var
 DateTemp: TDateTime;
begin
 with Sender As TMaskEdit do
  begin
   DateTemp := TransferDate(Text);
   if DateForm.ReadDatePro(DateTemp) then
      Text := FormatDateTime('dd/mm/yyyy', DateTemp);
  end;
end;

procedure TZeroQtySalesReportForm.TimeEditClick(Sender: TObject);
var
 TimeStr: string;
begin
 with Sender As TMaskEdit do
  begin
   TimeStr := Text;
   if TimeForm.ReadTimePro(TimeStr) then
      Text := TimeStr;
  end;
end;

procedure TZeroQtySalesReportForm.DateEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if Key = VK_RETURN then TimeEdit1.SetFocus;
end;

procedure TZeroQtySalesReportForm.DateEdit2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if Key = VK_RETURN then TimeEdit2.SetFocus;
end;

procedure TZeroQtySalesReportForm.TimeEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if Key = VK_RETURN then DateEdit2.SetFocus;
end;

procedure TZeroQtySalesReportForm.TimeEdit2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if Key = VK_RETURN then SearchButton.SetFocus;
end;

procedure TZeroQtySalesReportForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = Chr(27) then Close;
end;

procedure TZeroQtySalesReportForm.PrintButtonClick(Sender: TObject);
begin
 if Query.Active and (Query.RecordCount > 0) then
    PrintZeroQtySalesReportForm.PrintZeroQtySalesReportPro;
end;

procedure TZeroQtySalesReportForm.DBGridDblClick(Sender: TObject);
var
 OrderNo: string;
begin
 if Query.Active and (Query.RecordCount > 0) then
    begin
     OrderNo := Query.FieldByName('OrderNo').AsString;
     SalesHistoryDetailForm.SalesDetailPro(OrderNo);
    end;
end;

procedure TZeroQtySalesReportForm.FormShow(Sender: TObject);
begin
 Width := DBGridPanel.Width + 28;
 Height := ExitButton.Top + 86;
 QueryFixPrice.DisplayFormat := sCurrency + ',0.#0';
 QuerySalesPrice.DisplayFormat := sCurrency + ',0.#0';
 DateEdit1.Text := FormatDateTime('dd/mm/yyyy', Date);
 DateEdit2.Text := FormatDateTime('dd/mm/yyyy', Date);
 TimeEdit1.Text := '00:00';
 TimeEdit2.Text := '23:59';
end;

procedure TZeroQtySalesReportForm.ZeroQtySalesReportPro;
begin
 Application.CreateForm(TZeroQtySalesReportForm, ZeroQtySalesReportForm);
 ZeroQtySalesReportForm.ShowModal;
 ZeroQtySalesReportForm.Free;
end;

end.