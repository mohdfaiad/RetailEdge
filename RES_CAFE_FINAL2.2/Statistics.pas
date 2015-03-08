unit Statistics;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, TeeProcs, TeEngine, Chart, DBChart, StdCtrls, Buttons, Mask,
  Series, Db, DataUnit, UtilUnit, ADODB, bsSkinCtrls, BusinessSkinForm,
  XiButton;

type
  TStatisticsForm = class(TForm)
    DBChart: TDBChart;
    Series: TBarSeries;
    ComboBox: TComboBox;
    Label1: TLabel;
    DateEdit1: TMaskEdit;
    Label2: TLabel;
    DateEdit2: TMaskEdit;
    Label3: TLabel;
    Query: TADOQuery;
    bsBusinessSkinForm1: TbsBusinessSkinForm;
    DBChartPanel: TbsSkinPanel;
    ControlPanel: TbsSkinPanel;
    CalcButton: TXiButton;
    PrintButton: TXiButton;
    ExitButton: TXiButton;
    PrintDialog: TPrintDialog;
    procedure OpenQuery(SQLStr: string);
    procedure DateEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DateEdit2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CalcButtonClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DateEditClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StatisticsPro;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBoxChange(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StatisticsForm: TStatisticsForm;

implementation

uses MainMenu, DatePanel;

{$R *.DFM}

procedure TStatisticsForm.OpenQuery(SQLStr: string);
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

procedure TStatisticsForm.DateEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if Key = VK_RETURN then DateEdit2.SetFocus;
end;

procedure TStatisticsForm.DateEdit2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if Key = VK_RETURN then CalcButton.SetFocus;
end;

procedure TStatisticsForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = Chr(27) then Close;
end;

procedure TStatisticsForm.DateEditClick(Sender: TObject);
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

procedure TStatisticsForm.ComboBoxChange(Sender: TObject);
begin
 case ComboBox.ItemIndex of
  0: DBChart.BottomAxis.Title.Caption := 'Time';
  1: DBChart.BottomAxis.Title.Caption := 'Day';
  2: DBChart.BottomAxis.Title.Caption := 'Month';
 end;
end;

procedure TStatisticsForm.CalcButtonClick(Sender: TObject);
var
 SQLStr: string;
 DateTemp1, DateTemp2: TDateTime;
begin
 DataForm.OpenCompanyQuery;
 DBChart.Title.Text.Clear;
 DBChart.Title.Text.Add(DataForm.CompanyQuery.FieldByName('CompanyName').AsString +
                       '  ' + DateEdit1.Text + ' - ' + DateEdit2.Text);
 DataForm.CompanyQuery.Close;
 DateTemp1 := TransferDate(DateEdit1.Text) + StrToTime('00:00:01');
 DateTemp2 := TransferDate(DateEdit2.Text) + StrToTime('23:59:59');
 case ComboBox.ItemIndex of
  0: begin
      SQLStr := 'Select Sum(Amount) As Y, DATEPART(Hour, OrderDate) As X From OrderH ' +
                'Where OrderDate>=' + ConvertDateTime(DateTemp1) +
                ' and OrderDate<=' + ConvertDateTime(DateTemp2) +
                ' Group By DATEPART(Hour, OrderDate)';
     end;
  1: begin
      SQLStr := 'Select Sum(Amount) As Y, DATEPART(Day, OrderDate) As X From OrderH ' +
                'Where OrderDate>=' + ConvertDateTime(DateTemp1 ) +
                ' and OrderDate<=' + ConvertDateTime(DateTemp2) +
                ' Group By DATEPART(Day, OrderDate)';
     end;
  2: begin
      SQLStr := 'Select Sum(Amount) As Y, DATEPART(Month, OrderDate) As X From OrderH ' +
                'Where OrderDate>=' + ConvertDateTime(DateTemp1) +
                ' and OrderDate<=' + ConvertDateTime(DateTemp2) +
                ' Group By DATEPART(Month, OrderDate)';
     end;
 end;
 OpenQuery(SQLStr);
end;

procedure TStatisticsForm.PrintButtonClick(Sender: TObject);
begin
 if PrintDialog.Execute then
    DBChart.PrintLandscape;
end;

procedure TStatisticsForm.ExitButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TStatisticsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Query.Close;
 Action := caFree;
 StatisticsForm := Nil;
end;

procedure TStatisticsForm.FormShow(Sender: TObject);
begin
 Top := (MainForm.ClientHeight - Height - MainForm.bsSkinMainMenuBar.Height) div 2;
 Left := (MainForm.ClientWidth - Width) div 2 ;
 DateEdit1.Text := FormatDateTime('dd/mm/yyyy', Date);
 DateEdit2.Text := FormatDateTime('dd/mm/yyyy', Date);
 ComboBox.ItemIndex := 0;
 ComboBox.Text := ComboBox.Items[0];
 DBChart.Title.Text.Clear;
end;

procedure TStatisticsForm.StatisticsPro;
begin
 Application.CreateForm(TStatisticsForm, StatisticsForm);
 StatisticsForm.ShowModal;
 StatisticsForm.Free;
end;

end.
