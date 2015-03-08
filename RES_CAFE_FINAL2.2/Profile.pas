unit Profile;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, Buttons, UtilUnit, Mask, Spin, ComCtrls, TabNotBk,
  ADODB, bsSkinTabs, BusinessSkinForm, bsSkinCtrls, XiButton,
  PanelButton;

type
  TProfileSetupForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    CompanyNameEdit: TEdit;
    TelephoneEdit: TEdit;
    FaxEdit: TEdit;
    AddressEdit: TMemo;
    BusinessRegistNameLabel: TLabel;
    ABNEdit: TEdit;
    Label6: TLabel;
    InitEdit: TEdit;
    PasswordCheckBox: TCheckBox;
    Label7: TLabel;
    TimeEdit1: TMaskEdit;
    Label8: TLabel;
    TimeEdit2: TMaskEdit;
    Label9: TLabel;
    LayOutComboBox: TComboBox;
    Label10: TLabel;
    TableTrackCheckBox: TCheckBox;
    PersonCountCheckBox: TCheckBox;
    TableStatusCheckBox: TCheckBox;
    PrintBillNoCheckBox: TCheckBox;
    RoundingComboBox: TComboBox;
    ForceVIPDiscountCheckBox: TCheckBox;
    NotAllowModifyCheckBox: TCheckBox;
    Label12: TLabel;
    Label13: TLabel;
    CategoryLineEdit: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    POSCategoryLineEdit: TEdit;
    MenuLineEdit: TSpinEdit;
    POSMenuLineEdit: TSpinEdit;
    NotAllowChangeQtyCheckBox: TCheckBox;
    AutoOpenTillCheckBox: TCheckBox;
    AutoPrintJobListCheckBox: TCheckBox;
    PrintServicePersonCheckBox: TCheckBox;
    PrintPersonsCheckBox: TCheckBox;
    PrintPriceCheckBox: TCheckBox;
    PrintTimeOnInvoiceCheckBox: TCheckBox;
    Query: TADOQuery;
    HappyHourCheckBox: TCheckBox;
    HappyHourStartEdit: TMaskEdit;
    HappyHourEndEdit: TMaskEdit;
    ShowTaxCheckBox: TCheckBox;
    GroupBox1: TGroupBox;
    Label17: TLabel;
    JobListComboBox: TComboBox;
    OrderListComboBox: TComboBox;
    Label18: TLabel;
    Label19: TLabel;
    InvoiceComboBox: TComboBox;
    POSJobListCheckBox: TCheckBox;
    POSOrderListCheckBox: TCheckBox;
    POSInvoiceCheckBox: TCheckBox;
    GroupBox3: TGroupBox;
    BillCategoryComboBox: TComboBox;
    InvoiceCategoryComboBox: TComboBox;
    Label20: TLabel;
    ColorComboBox: TComboBox;
    Label21: TLabel;
    VIPDefaultSearchComboBox: TComboBox;
    PrintPickupSlipCheckBox: TCheckBox;
    AutoPrintPhoneOrderJobListCheckBox: TCheckBox;
    AutoInstructionSelectionCheckBox: TCheckBox;
    PrintTableNoCheckBox: TCheckBox;
    AutoPrintBillCheckBox: TCheckBox;
    AutoPrintInvoiceCheckBox: TCheckBox;
    PrintDateOnDailyReportCheckBox: TCheckBox;
    AutoPriceWindowCheckBox: TCheckBox;
    PrintZeroPriceItemOnInvoiceCheckBox: TCheckBox;
    AutoPopVoidReasonCheckBox: TCheckBox;
    AutoSaveOrderCheckBox: TCheckBox;
    ScaleBarcodeComboBox: TComboBox;
    ManuallyEnterTableNumberCheckBox: TCheckBox;
    PrintGoWithInstructionCheckBox: TCheckBox;
    PrintInvoiceNoCheckBox: TCheckBox;
    PrintOpNameOnJobListCheckBox: TCheckBox;
    AutoPrintMergedOrderCheckBox: TCheckBox;
    ServiceChargeRateEdit: TStaticText;
    AutoPrintJobListForHoldOrderCheckBox: TCheckBox;
    AutoSurchargeCheckBox: TCheckBox;
    SurchargeStartTimeEdit: TMaskEdit;
    Label22: TLabel;
    SurchargeEndTimeEdit: TMaskEdit;
    SurchargeNameEdit: TEdit;
    OtherChargeCheckBox: TCheckBox;
    OtherChargeNameEdit: TEdit;
    Label24: TLabel;
    OtherChargeRateEdit: TStaticText;
    GSTStatusCheckBox: TCheckBox;
    Label5: TLabel;
    DefaultGSTRateEdit: TStaticText;
    Label23: TLabel;
    DefaultVIPStateEdit: TEdit;
    Label16: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    HappyHourStartEdit1: TMaskEdit;
    HappyHourStartEdit2: TMaskEdit;
    HappyHourStartEdit3: TMaskEdit;
    HappyHourStartEdit4: TMaskEdit;
    HappyHourStartEdit5: TMaskEdit;
    HappyHourStartEdit6: TMaskEdit;
    HappyHourEndEdit1: TMaskEdit;
    HappyHourEndEdit2: TMaskEdit;
    HappyHourEndEdit3: TMaskEdit;
    HappyHourEndEdit4: TMaskEdit;
    HappyHourEndEdit5: TMaskEdit;
    HappyHourEndEdit6: TMaskEdit;
    PrintIngredientsOnJobListCheckBox: TCheckBox;
    LoyaltyAwardCheckBox: TCheckBox;
    Label33: TLabel;
    SalesPointsEdit: TStaticText;
    Label34: TLabel;
    PaymentPointsEdit: TStaticText;
    Label35: TLabel;
    Label36: TLabel;
    MaxDiscountPercentageEdit: TStaticText;
    MaxDollarDiscountEdit: TStaticText;
    Label37: TLabel;
    Label38: TLabel;
    ReachPointsEdit: TStaticText;
    Label39: TLabel;
    Label40: TLabel;
    JobListFontSizeComboBox: TComboBox;
    OpenDialog: TOpenDialog;
    ShowPrintInvoiceWindowCheckBox: TCheckBox;
    bsBusinessSkinForm: TbsBusinessSkinForm;
    PageControl: TbsSkinPageControl;
    Profile: TbsSkinTabSheet;
    Condition: TbsSkinTabSheet;
    Promotion: TbsSkinTabSheet;
    PrintOption: TbsSkinTabSheet;
    Backup: TbsSkinTabSheet;
    SaveButton: TXiButton;
    CancelButton: TXiButton;
    Label42: TLabel;
    Label43: TLabel;
    ChangeQtyWithCondimentCheckBox: TCheckBox;
    CompulsoryEnterCustomerNameCheckBox: TCheckBox;
    AutoPrintCheckListCheckBox: TCheckBox;
    Label41: TLabel;
    BackupPathEdit: TEdit;
    PathSearchButton: TXiButton;
    PrintOrderNoOnJobListCheckBox: TCheckBox;
    AutoBackupCheckBox: TCheckBox;
    Label44: TLabel;
    FrequencyRadioGroup: TRadioGroup;
    BackupTimeComboBox: TComboBox;
    BackupOnceTimeEdit: TMaskEdit;
    DiscountRateEnterModeComboBox: TComboBox;
    ManuallyPrintJobListCheckBox: TCheckBox;
    ShowNegativeQtyCheckBox: TCheckBox;
    PrintOrderNoOnTaxInvoiceCheckBox: TCheckBox;
    Label47: TLabel;
    CheckListFormatComboBox: TComboBox;
    AutoLogOutCheckBox: TCheckBox;
    TimeOutComboBox: TComboBox;
    PrintRedColorQtyOnJobListCheckBox: TCheckBox;
    MinimumChargeComboBox: TComboBox;
    MinimumChargePerPersonLabel: TLabel;
    MinimumChargePerPersonEdit: TStaticText;
    MinimumChargeItemCodeLabel: TLabel;
    MinimumChargeItemCodeEdit: TStaticText;
    OnlyOpenDrawerForCashPaymentCheckBox: TCheckBox;
    PrintDiscountRateOnBillCheckBox: TCheckBox;
    Label48: TLabel;
    Label49: TLabel;
    PhoneOrderMenuLineEdit: TSpinEdit;
    PhoneOrderCategoryLineEdit: TEdit;
    OnlyPrintSimpleFormatDailyReportCheckBox: TCheckBox;
    PrintFormat: TbsSkinTabSheet;
    OnlyPrintLastTwoDigitalOrderNoCheckBox: TCheckBox;
    CheckPrinterStatusCheckBox: TCheckBox;
    AutoPrintBillWhenPhoneOrderSavedCheckBox: TCheckBox;
    AutoAddDeliveryChargeForPhoneOrderCheckBox: TCheckBox;
    Label50: TLabel;
    DeliveryChargeItemCodeEdit: TStaticText;
    EnableTableLockCheckBox: TCheckBox;
    PrintZeroQtyItemsOnJobListCheckBox: TCheckBox;
    GroupBox2: TGroupBox;
    JobListFormatForPrinterComboBox1: TComboBox;
    Label51: TLabel;
    Label52: TLabel;
    JobListFormatForPrinterComboBox7: TComboBox;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    JobListFormatForPrinterComboBox2: TComboBox;
    JobListFormatForPrinterComboBox3: TComboBox;
    JobListFormatForPrinterComboBox4: TComboBox;
    JobListFormatForPrinterComboBox5: TComboBox;
    JobListFormatForPrinterComboBox6: TComboBox;
    JobListFormatForPrinterComboBox8: TComboBox;
    JobListFormatForPrinterComboBox9: TComboBox;
    JobListFormatForPrinterComboBox10: TComboBox;
    JobListFormatForPrinterComboBox11: TComboBox;
    JobListFormatForPrinterComboBox12: TComboBox;
    SecondDisplayDescriptionComboBox: TComboBox;
    CompanyNamePnel: TbsSkinPanel;
    ButtonLayoutPanel: TbsSkinPanel;
    OthersPanel: TbsSkinPanel;
    SystemOptionPanel: TbsSkinPanel;
    HappyHourEditPanel: TbsSkinPanel;
    LoyaltyAwardEditPanel: TbsSkinPanel;
    DiscountPanel: TbsSkinPanel;
    PrintOptionPanel: TbsSkinPanel;
    bsSkinPanel1: TbsSkinPanel;
    DollarOtherChargeBox: TCheckBox;
    procedure ReadCompanyDetail;
    procedure SaveButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure InitEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ProfileSetupPro;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure TimeEditClick(Sender: TObject);
    procedure ServiceChargeRateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure MenuPanelComboBoxKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure MenuLineEditChange(Sender: TObject);
    procedure POSMenuLineEditChange(Sender: TObject);
    procedure HappyHourCheckBoxClick(Sender: TObject);
    procedure EditDblClick(Sender: TObject);
    procedure ServiceChargeRateEditClick(Sender: TObject);
    procedure InitEditDblClick(Sender: TObject);
    procedure AutoSurchargeCheckBoxClick(Sender: TObject);
    procedure OtherChargeCheckBoxClick(Sender: TObject);
    procedure OtherChargeRateEditClick(Sender: TObject);
    procedure DefaultGSTRateEditClick(Sender: TObject);
    procedure LoyaltyAwardCheckBoxClick(Sender: TObject);
    procedure SalesPointsEditClick(Sender: TObject);
    procedure PaymentPointsEditClick(Sender: TObject);
    procedure MaxDollarDiscountEditClick(Sender: TObject);
    procedure MaxDiscountPercentageEditClick(Sender: TObject);
    procedure ReachPointsEditClick(Sender: TObject);
    procedure AddressEditDblClick(Sender: TObject);
    procedure PathSearchButtonClick(Sender: TObject);
    procedure ManuallyEnterTableNumberCheckBoxClick(Sender: TObject);
    procedure FrequencyRadioGroupClick(Sender: TObject);
    procedure AutoBackupCheckBoxClick(Sender: TObject);
    procedure AutoPrintJobListCheckBoxClick(Sender: TObject);
    procedure PasswordCheckBoxClick(Sender: TObject);
    procedure AutoLogOutCheckBoxClick(Sender: TObject);
    procedure MinimumChargePerPersonEditClick(Sender: TObject);
    procedure MinimumChargeComboBoxChange(Sender: TObject);
    procedure MinimumChargeItemCodeEditClick(Sender: TObject);
    procedure PhoneOrderMenuLineEditChange(Sender: TObject);
    procedure DeliveryChargeItemCodeEditClick(Sender: TObject);
    procedure AutoAddDeliveryChargeForPhoneOrderCheckBoxClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ProfileSetupForm: TProfileSetupForm;

implementation

uses DataUnit, MainMenu, TimePanel, Keyboard, NumPad, MessageBox,
     ItemSelect;

{$R *.DFM}

procedure TProfileSetupForm.InitEditKeyPress(Sender: TObject; var Key: Char);
begin
 if Key In ['a'..'z'] then Key := UpCase(Key);
end;

procedure TProfileSetupForm.HappyHourCheckBoxClick(Sender: TObject);
begin
 if HappyHourCheckBox.Checked then
    begin
     HappyHourEditPanel.Enabled := True;
     HappyHourStartEdit.Text := '00:00';
     HappyHourStartEdit1.Text := '00:00';
     HappyHourStartEdit2.Text := '00:00';
     HappyHourStartEdit3.Text := '00:00';
     HappyHourStartEdit4.Text := '00:00';
     HappyHourStartEdit5.Text := '00:00';
     HappyHourStartEdit6.Text := '00:00';
     HappyHourEndEdit.Text := '00:00';
     HappyHourEndEdit1.Text := '00:00';
     HappyHourEndEdit2.Text := '00:00';
     HappyHourEndEdit3.Text := '00:00';
     HappyHourEndEdit4.Text := '00:00';
     HappyHourEndEdit5.Text := '00:00';
     HappyHourEndEdit6.Text := '00:00';
    end
   else
    begin
     HappyHourEditPanel.Enabled := False;
     HappyHourStartEdit.Text := '';
     HappyHourStartEdit1.Text := '';
     HappyHourStartEdit2.Text := '';
     HappyHourStartEdit3.Text := '';
     HappyHourStartEdit4.Text := '';
     HappyHourStartEdit5.Text := '';
     HappyHourStartEdit6.Text := '';
     HappyHourEndEdit.Text := '';
     HappyHourEndEdit1.Text := '';
     HappyHourEndEdit2.Text := '';
     HappyHourEndEdit3.Text := '';
     HappyHourEndEdit4.Text := '';
     HappyHourEndEdit5.Text := '';
     HappyHourEndEdit6.Text := '';
    end
end;

procedure TProfileSetupForm.LoyaltyAwardCheckBoxClick(Sender: TObject);
begin
 if LoyaltyAwardCheckBox.Checked then
    LoyaltyAwardEditPanel.Enabled := True
   else
    LoyaltyAwardEditPanel.Enabled := False;
end;

procedure TProfileSetupForm.AutoSurchargeCheckBoxClick(Sender: TObject);
begin
 if AutoSurchargeCheckBox.Checked then
    begin
     SurchargeStartTimeEdit.Enabled := True;
     SurchargeEndTimeEdit.Enabled := True;
     SurchargeNameEdit.Enabled := True;
     SurchargeStartTimeEdit.Text := '00:00';
     SurchargeEndTimeEdit.Text := '00:00';
     ServiceChargeRateEdit.Enabled := True;
    end
   else
    begin
     SurchargeStartTimeEdit.Enabled := False;
     SurchargeEndTimeEdit.Enabled := False;
     SurchargeNameEdit.Enabled := False;
     SurchargeStartTimeEdit.Text := '';
     SurchargeEndTimeEdit.Text := '';
     SurchargeNameEdit.Text := 'Surcharge';
     ServiceChargeRateEdit.Enabled := False;
    end
end;

procedure TProfileSetupForm.OtherChargeCheckBoxClick(Sender: TObject);
begin
 if OtherChargeCheckBox.Checked then
    begin
     OtherChargeNameEdit.Enabled := True;
     OtherChargeRateEdit.Enabled := True;
    end
   else
    begin
     OtherChargeNameEdit.Enabled := False;
     OtherChargeRateEdit.Enabled := False;
    end
end;

procedure TProfileSetupForm.ManuallyEnterTableNumberCheckBoxClick(Sender: TObject);
begin
 if ManuallyEnterTableNumberCheckBox.Checked then
    TableTrackCheckBox.Enabled := True
   else
    begin
     TableTrackCheckBox.Enabled := False;
     TableTrackCheckBox.Checked := True;
    end;
end;

procedure TProfileSetupForm.AutoPrintJobListCheckBoxClick(Sender: TObject);
begin
 ManuallyPrintJobListCheckBox.Enabled := Not AutoPrintJobListCheckBox.Checked;
end;

procedure TProfileSetupForm.MenuPanelComboBoxKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if Key = VK_RETURN then LayOutComboBox.SetFocus;
end;

procedure TProfileSetupForm.ServiceChargeRateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if Key = VK_RETURN then RoundingComboBox.SetFocus;
end;

procedure TProfileSetupForm.ReadCompanyDetail;
begin
 Screen.Cursor := crHourGlass;
 with Query do
  begin
   Active := False;
   Connection := DataForm.ADOConnection;
   SQL.Clear;
   SQL.Add('Select * From Profile');
   try
    Active := True;
   finally
    Screen.Cursor := crDefault;
   end;
   if Active then
      begin
       CompanyNameEdit.Text := FieldByName('CompanyName').AsString;
       TelephoneEdit.Text := FieldByName('Telephone').AsString;
       FaxEdit.Text := FieldByName('Fax').AsString;
       AddressEdit.Text := FieldByName('Address').AsString;
       ABNEdit.Text := FieldByName('ABN').AsString;
       InitEdit.Text := FieldByName('Initial').AsString;
       PasswordCheckBox.Checked := FieldByName('CheckPassword').AsBoolean;
       AutoLogoutCheckBox.Checked := FieldByName('AutoLogout').AsBoolean;
       TimeOutComboBox.ItemIndex := FieldByName('AutoLogoutTimeout').AsInteger;
       AutoLogoutCheckBox.Enabled := Not PasswordCheckBox.Checked;
       TimeOutComboBox.Enabled := AutoLogoutCheckBox.Enabled and AutoLogoutCheckBox.Checked;
       TimeEdit1.Text := FormatDateTime('hh:mm', FieldByName('BeginTime').AsDateTime);
       TimeEdit2.Text := FormatDateTime('hh:mm', FieldByName('EndTime').AsDateTime);
       HappyHourCheckBox.Checked := FieldByName('HappyHour').AsBoolean;
       HappyHourStartEdit.Text := FormatDateTime('hh:mm', FieldByName('HappyHourStartTime').AsDateTime);
       HappyHourStartEdit1.Text := FormatDateTime('hh:mm', FieldByName('HappyHourStartTime1').AsDateTime);
       HappyHourStartEdit2.Text := FormatDateTime('hh:mm', FieldByName('HappyHourStartTime2').AsDateTime);
       HappyHourStartEdit3.Text := FormatDateTime('hh:mm', FieldByName('HappyHourStartTime3').AsDateTime);
       HappyHourStartEdit4.Text := FormatDateTime('hh:mm', FieldByName('HappyHourStartTime4').AsDateTime);
       HappyHourStartEdit5.Text := FormatDateTime('hh:mm', FieldByName('HappyHourStartTime5').AsDateTime);
       HappyHourStartEdit6.Text := FormatDateTime('hh:mm', FieldByName('HappyHourStartTime6').AsDateTime);
       HappyHourEndEdit.Text := FormatDateTime('hh:mm', FieldByName('HappyHourEndTime').AsDateTime);
       HappyHourEndEdit1.Text := FormatDateTime('hh:mm', FieldByName('HappyHourEndTime1').AsDateTime);
       HappyHourEndEdit2.Text := FormatDateTime('hh:mm', FieldByName('HappyHourEndTime2').AsDateTime);
       HappyHourEndEdit3.Text := FormatDateTime('hh:mm', FieldByName('HappyHourEndTime3').AsDateTime);
       HappyHourEndEdit4.Text := FormatDateTime('hh:mm', FieldByName('HappyHourEndTime4').AsDateTime);
       HappyHourEndEdit5.Text := FormatDateTime('hh:mm', FieldByName('HappyHourEndTime5').AsDateTime);
       HappyHourEndEdit6.Text := FormatDateTime('hh:mm', FieldByName('HappyHourEndTime6').AsDateTime);
       LoyaltyAwardCheckBox.Checked := FieldByName('LoyaltyAward').AsBoolean;
       SalesPointsEdit.Caption := Format('%1d ', [FieldByName('SalesPoints').AsInteger]);
       PaymentPointsEdit.Caption := Format('%1d ', [FieldByName('PaymentPoints').AsInteger]);
       ReachPointsEdit.Caption := Format('%1d ', [FieldByName('ReachPoints').AsInteger]);
       AutoSurchargeCheckBox.Checked := FieldByName('AutoSurcharge').AsBoolean;
       SurchargeStartTimeEdit.Text := FormatDateTime('hh:mm', FieldByName('SurchargeStartTime').AsDateTime);
       SurchargeEndTimeEdit.Text := FormatDateTime('hh:mm', FieldByName('SurchargeEndTime').AsDateTime);
       ServiceChargeRateEdit.Caption := Format('%4.2f ', [FieldByName('ServiceChargeRate').AsFloat]);
       ManuallyEnterTableNumberCheckBox.Checked := FieldByName('ManuallyEnterTableNumber').AsBoolean;

       if ManuallyEnterTableNumberCheckBox.Checked then
          begin
           TableTrackCheckBox.Enabled := True;
           TableTrackCheckBox.Checked := FieldByName('TableTracking').AsBoolean;
          end
        else
         begin
          TableTrackCheckBox.Enabled := False;
          TableTrackCheckBox.Checked := True;
         end;
       TableStatusCheckBox.Checked := FieldByName('CheckTableStatus').AsBoolean;
       LayOutComboBox.ItemIndex := FieldByName('ButtonLayOut').AsInteger;
       MenuLineEdit.Value := FieldByName('MainMenuLine').AsInteger;
       POSMenuLineEdit.Value := FieldByName('POSMenuLine').AsInteger;
       PhoneOrderMenuLineEdit.Value := FieldByName('PhoneOrderMenuLine').AsInteger;
       NotAllowModifyCheckBox.Checked := FieldByName('NotAllowModify').AsBoolean;
       NotAllowChangeQtyCheckBox.Checked := FieldByName('NotAllowChangeQty').AsBoolean;
       PersonCountCheckBox.Checked := FieldByName('PersonCount').AsBoolean;
       PrintBillNoCheckBox.Checked := FieldByName('PrintBillNo').AsBoolean;
       PrintInvoiceNoCheckBox.Checked := FieldByName('PrintInvoiceNo').AsBoolean;
       RoundingComboBox.ItemIndex := FieldByName('RoundingFlag').AsInteger;
       ForceVIPDiscountCheckBox.Checked := FieldByName('ForceVIPDiscount').AsBoolean;
       AutoOpenTillCheckBox.Checked := FieldByName('AutoOpenTill').AsBoolean;
       AutoPrintJobListCheckBox.Checked := FieldByName('AutoPrintJobList').AsBoolean;
       ManuallyPrintJobListCheckBox.Enabled := Not AutoPrintJobListCheckBox.Checked;
       ManuallyPrintJobListCheckBox.Checked := FieldByName('ManuallyPrintJobList').AsBoolean;
       PrintServicePersonCheckBox.Checked := FieldByName('PrintServiceOnJobList').AsBoolean;
       PrintPersonsCheckBox.Checked := FieldByName('PrintPersonsOnJobList').AsBoolean;
       PrintPriceCheckBox.Checked := FieldByName('PrintPriceOnJobList').AsBoolean;
       PrintTimeOnInvoiceCheckBox.Checked := FieldByName('PrintTimeOnInvoice').AsBoolean;
       ShowTaxCheckBox.Checked := FieldByName('ShowTaxOnSalesSection').AsBoolean;
       JobListComboBox.ItemIndex := FieldByName('JobListDescription').AsInteger;
       OrderListComboBox.ItemIndex := FieldByName('OrderListDescription').AsInteger;
       InvoiceComboBox.ItemIndex := FieldByName('InvoiceDescription').AsInteger;
       POSJobListCheckBox.Checked := FieldByName('POSJobList').AsBoolean;
       POSOrderListCheckBox.Checked := FieldByName('POSOrderList').AsBoolean;
       POSInvoiceCheckBox.Checked := FieldByName('POSInvoice').AsBoolean;
       PrintPickupSlipCheckBox.Checked := FieldByName('PrintPickupSlip').AsBoolean;
       JobListFormatForPrinterComboBox1.ItemIndex := FieldByName('JobListFormatForPrinter1').AsInteger;
       JobListFormatForPrinterComboBox2.ItemIndex := FieldByName('JobListFormatForPrinter2').AsInteger;
       JobListFormatForPrinterComboBox3.ItemIndex := FieldByName('JobListFormatForPrinter3').AsInteger;
       JobListFormatForPrinterComboBox4.ItemIndex := FieldByName('JobListFormatForPrinter4').AsInteger;
       JobListFormatForPrinterComboBox5.ItemIndex := FieldByName('JobListFormatForPrinter5').AsInteger;
       JobListFormatForPrinterComboBox6.ItemIndex := FieldByName('JobListFormatForPrinter6').AsInteger;
       JobListFormatForPrinterComboBox7.ItemIndex := FieldByName('JobListFormatForPrinter7').AsInteger;
       JobListFormatForPrinterComboBox8.ItemIndex := FieldByName('JobListFormatForPrinter8').AsInteger;
       JobListFormatForPrinterComboBox9.ItemIndex := FieldByName('JobListFormatForPrinter9').AsInteger;
       JobListFormatForPrinterComboBox10.ItemIndex := FieldByName('JobListFormatForPrinter10').AsInteger;
       JobListFormatForPrinterComboBox11.ItemIndex := FieldByName('JobListFormatForPrinter11').AsInteger;
       JobListFormatForPrinterComboBox12.ItemIndex := FieldByName('JobListFormatForPrinter12').AsInteger;
       JobListFontSizeComboBox.ItemIndex := FieldByName('JobListFontSize').AsInteger;
       BillCategoryComboBox.ItemIndex := FieldByName('PrintBillCategory').AsInteger;
       InvoiceCategoryComboBox.ItemIndex := FieldByName('PrintInvoiceCategory').AsInteger;
       CheckListFormatComboBox.ItemIndex := FieldByName('CheckListFormat').AsInteger;
       ColorComboBox.ItemIndex := FieldByName('PrintCategoryColor').AsInteger;
       VIPDefaultSearchComboBox.ItemIndex := FieldByName('VIPDefaultSearch').AsInteger;
       AutoPrintPhoneOrderJobListCheckBox.Checked := FieldByName('AutoPrintPhoneOrderJobList').AsBoolean;
       AutoInstructionSelectionCheckBox.Checked := FieldByName('AutoInstructionSelection').AsBoolean;
       PrintTableNoCheckBox.Checked := FieldByName('PrintTableNo').AsBoolean;
       PrintDateOnDailyReportCheckBox.Checked := FieldByName('PrintDateOnDailyReport').AsBoolean;
       AutoPrintBillCheckBox.Checked := FieldByName('AutoPrintBill').AsBoolean;
       AutoPrintInvoiceCheckBox.Checked := FieldByName('AutoPrintInvoice').AsBoolean;
       AutoPriceWindowCheckBox.Checked := FieldByName('AutoPriceWindow').AsBoolean;
       PrintZeroPriceItemOnInvoiceCheckBox.Checked := FieldByName('PrintZeroPriceItemOnInvoice').AsBoolean;
       PrintDiscountRateOnBillCheckBox.Checked := FieldByName('PrintDiscountRateOnBill').AsBoolean;
       AutoPopVoidReasonCheckBox.Checked := FieldByName('AutoPopVoidReason').AsBoolean;
       AutoSaveOrderCheckBox.Checked := FieldByName('AutoSaveOrder').AsBoolean;
       ScaleBarcodeComboBox.ItemIndex := FieldByName('ScaleBarcode').AsInteger;
       PrintGoWithInstructionCheckBox.Checked := FieldByName('PrintGoWithInstruction').AsBoolean;
       PrintOpNameOnJobListCheckBox.Checked := FieldByName('PrintOpNameOnJobList').AsBoolean;
       AutoPrintMergedOrderCheckBox.Checked := FieldByName('AutoPrintMergedOrder').AsBoolean;
       AutoPrintJobListForHoldOrderCheckBox.Checked := FieldByName('AutoPrintJobListForHoldOrder').AsBoolean;
       SurchargeNameEdit.Text := FieldByName('SurchargeName').AsString;
       OtherChargeCheckBox.Checked := FieldByName('OtherCharge').AsBoolean;
       OtherChargeNameEdit.Text := FieldByName('OtherChargeName').AsString;
       OtherChargeRateEdit.Caption := Format('%4.2f ', [FieldByName('OtherChargeRate').AsFloat]);
       GSTStatusCheckBox.Checked := FieldByName('PriceIncludesGST').AsBoolean;
       DefaultGSTRateEdit.Caption := Format('%4.2f ', [FieldByName('DefaultGSTRate').AsFloat]);
       DefaultVIPStateEdit.Text := FieldByName('DefaultVIPState').AsString;
       PrintIngredientsOnJobListCheckBox.Checked := FieldByName('PrintIngredientsOnJobList').AsBoolean;
       HappyHourEditPanel.Enabled := HappyHourCheckBox.Checked;
       LoyaltyAwardEditPanel.Enabled := LoyaltyAwardCheckBox.Checked;
       MaxDiscountPercentageEdit.Caption := Format('%4.2f ', [FieldByName('MaxDiscountPercentage').AsFloat]);
       MaxDollarDiscountEdit.Caption := Format(' %4.2f ', [FieldByName('MaxDollarDiscount').AsFloat]);
       BackupPathEdit.Text := FieldByName('DefaultBackupPath').AsString;
       ShowPrintInvoiceWindowCheckBox.Checked := FieldByName('ShowPrintInvoiceWindow').AsBoolean;
       ChangeQtyWithCondimentCheckBox.Checked := FieldByName('ChangeQtyWithCondiment').AsBoolean;
       CompulsoryEnterCustomerNameCheckBox.Checked := FieldByName('CompulsoryEnterCustomerName').AsBoolean;
       AutoPrintCheckListCheckBox.Checked := FieldByName('AutoPrintCheckList').AsBoolean;
       PrintOrderNoOnJobListCheckBox.Checked := FieldByName('PrintOrderNoOnJobList').AsBoolean;
       AutoBackupCheckBox.Checked := FieldByName('AutoBackup').AsBoolean;
       BackupTimeComboBox.ItemIndex := FieldByName('BackupTime').AsInteger;
       FrequencyRadioGroup.ItemIndex := FieldByName('BackupFrequency').AsInteger;
       BackupOnceTimeEdit.Text := FormatDateTime('hh:mm', FieldByName('BackupOnceTime').AsDateTime);
       BackupTimeComboBox.Enabled := AutoBackupCheckBox.Checked and (FrequencyRadioGroup.ItemIndex = 0);
       BackupOnceTimeEdit.Enabled := AutoBackupCheckBox.Checked and (FrequencyRadioGroup.ItemIndex = 1);
       BackupPathEdit.Enabled := AutoBackupCheckBox.Checked;
       PathSearchButton.Enabled := AutoBackupCheckBox.Checked;
       FrequencyRadioGroup.Enabled := AutoBackupCheckBox.Checked;
       DiscountRateEnterModeComboBox.ItemIndex := FieldByName('DiscountRateEnterMode').AsInteger;
       ShowNegativeQtyCheckBox.Checked := FieldByName('ShowNegativeQty').AsBoolean;
       PrintOrderNoOnTaxInvoiceCheckBox.Checked := FieldByName('PrintOrderNoOnTaxInvoice').AsBoolean;
       PrintRedColorQtyOnJobListCheckBox.Checked := FieldByName('PrintRedColorQtyOnJobList').AsBoolean;
       MinimumChargeComboBox.ItemIndex := FieldByName('MinimumChargeKind').AsInteger;
       MinimumChargeItemCodeEdit.Caption := FieldByName('MinimumChargeItemCode').AsString;
       MinimumChargePerPersonEdit.Caption := Format('%4.2f ', [FieldByName('MinimumChargePerPerson').AsFloat]);
       MinimumChargeItemCodeLabel.Visible := MinimumChargeComboBox.ItemIndex >= 1;
       MinimumChargeItemCodeEdit.Visible := MinimumChargeComboBox.ItemIndex >= 1;
       MinimumChargePerPersonLabel.Visible := MinimumChargeComboBox.ItemIndex = 1;
       MinimumChargePerPersonEdit.Visible := MinimumChargeComboBox.ItemIndex = 1;
       OnlyOpenDrawerForCashPaymentCheckBox.Checked := FieldByName('OnlyOpenDrawerForCashPayment').AsBoolean;
       OnlyPrintSimpleFormatDailyReportCheckBox.Checked := FieldByName('OnlyPrintSimpleFormatDailyReport').AsBoolean;
       OnlyPrintLastTwoDigitalOrderNoCheckBox.Checked := FieldByName('OnlyPrintLastTwoDigitalOrderNo').AsBoolean;
       AutoPrintBillWhenPhoneOrderSavedCheckBox.Checked := FieldByName('AutoPrintBillWhenPhoneOrderSaved').AsBoolean;
       AutoAddDeliveryChargeForPhoneOrderCheckBox.Checked := FieldByName('AutoAddDeliveryChargeForPhoneOrder').AsBoolean;
       DeliveryChargeItemCodeEdit.Enabled := AutoAddDeliveryChargeForPhoneOrderCheckBox.Checked;
       DeliveryChargeItemCodeEdit.Caption := FieldByName('DeliveryChargeItemCode').AsString;
       EnableTableLockCheckBox.Checked := FieldByName('TableLockFunctionEnabled').AsBoolean;
       PrintZeroQtyItemsOnJobListCheckBox.Checked := FieldByName('PrintZeroQtyItemsOnJobList').AsBoolean;
       //DollarOtherChargeBox.Checked := FieldByName('DollarOtherCharge').AsBoolean;
       if AutoSurchargeCheckBox.Checked then
          begin
           SurchargeStartTimeEdit.Enabled := True;
           SurchargeEndTimeEdit.Enabled := True;
           ServiceChargeRateEdit.Enabled := True;
           SurchargeNameEdit.Enabled := True;
          end
         else
          begin
           SurchargeStartTimeEdit.Enabled := False;
           SurchargeEndTimeEdit.Enabled := False;
           ServiceChargeRateEdit.Enabled := False;
           SurchargeNameEdit.Enabled := False;
          end;
       if OtherChargeCheckBox.Checked then
          begin
           OtherChargeRateEdit.Enabled := True;
           OtherChargeNameEdit.Enabled := True;
          end
         else
          begin
           OtherChargeRateEdit.Enabled := False;
           OtherChargeNameEdit.Enabled := False;
          end;
       CheckPrinterStatusCheckBox.Checked := FieldByName('CheckPrinterStatus').AsBoolean;
       SecondDisplayDescriptionComboBox.ItemIndex := FieldByName('SecondDisplayDescription').AsInteger;
      end;
    Active := False;
  end;
end;

procedure TProfileSetupForm.SaveButtonClick(Sender: TObject);
var
 SQLStr, CompanyNameTemp, TelephoneTemp, FaxTemp, AddressTemp,
 ABNTemp, PasswordTemp, InitTemp, BeginTimeTemp, EndTimeTemp,
 HappyHourTemp, HappyHourStartTimeTemp, HappyHourEndTimeTemp,
 HappyHourStartTimeTemp1, HappyHourEndTimeTemp1,
 HappyHourStartTimeTemp2, HappyHourEndTimeTemp2,
 HappyHourStartTimeTemp3, HappyHourEndTimeTemp3,
 HappyHourStartTimeTemp4, HappyHourEndTimeTemp4,
 HappyHourStartTimeTemp5, HappyHourEndTimeTemp5,
 HappyHourStartTimeTemp6, HappyHourEndTimeTemp6,
 ButtonLayOutTemp, ServiceChargeRateTemp, TableTrackTemp,
 ManuallyEnterTableNumberTemp, CheckTableStatusTemp, PersonCountTemp,
 PrintBillNoTemp, PrintInvoiceNoTemp, MenuLineTemp, POSMenuLineTemp,
 CategoryLineTemp, POSCategoryLineTemp, PhoneOrderMenuLineTemp,
 PhoneOrderCategoryLineTemp, RoundingTemp, ForceVIPDiscountTemp,
 NotAllowModifyTemp, NotAllowChangeQtyTemp, AutoOpenTillTemp,
 AutoPrintJobListTemp, ManuallyPrintJobListTemp, PrintServicePersonOnJobListTemp,
 PrintPersonsOnJobListTemp, PrintPriceOnJobListTemp,
 PrintTimeOnInvoiceTemp, ShowTaxOnSalesSectionTemp,
 POSJobListFlag, POSOrderListFlag, POSInvoiceFlag,
 PrintCategoryColorFlag, JobListDescriptionFlag, OrderListDescriptionFlag,
 InvoiceDescriptionFlag, PrintBillCategoryFlag, PrintInvoiceCategoryFlag,
 VIPDefaultSearchFlag, AutoInstructionSelectionFlag,
 PrintPickupSlipFlag, AutoPrintPhoneOrderJobListFlag, PrintTableNoFlag,
 PrintDateOnDailyReportFlag, AutoPrintBillFlag, AutoPrintInvoiceFlag,
 AutoPriceWindowTemp, PrintZeroPriceItemOnInvoiceTemp,
 AutoPopVoidReasonTemp, AutoSaveOrderTemp, ScaleBarcodeTemp,
 PrintGoWithInstructionTemp, PrintOpNameOnJobListTemp,
 AutoPrintMergedOrderTemp, AutoPrintJobListForHoldOrderTemp,
 AutoSurchargeTemp, SurchargeStartTimeTemp, SurchargeEndTimeTemp,
 SurchargeNameTemp, OtherChargeFlag, OtherChargeNameTemp,
 OtherChargeRateTemp, PriceIncludesGSTTemp, DefaultGSTRateTemp,
 DefaultVIPStateTemp, PrintIngredientsOnJobListTemp,
 LoyaltyAwardTemp, SalesPointsTemp, PaymentPointsTemp, ReachPointsTemp,
 MaxDiscountPercentageTemp, MaxDollarDiscountTemp, DefaultBackupPathTemp,
 ShowPrintInvoiceWindowTemp, ChangeQtyWithCondimentTemp,
 CompulsoryEnterCustomerNameTemp, AutoPrintCheckListTemp,
 PrintOrderNoOnJobListTemp, AutoBackupTemp, BackupTimeTemp,
 BackupFrequencyTemp, BackupOnceTimeTemp, DiscountRateEnterModeFlag,
 ShowNegativeQtyFlag, PrintOrderNoOnTaxInvoiceFlag, CheckListFormatTemp,
 AutoLogoutTemp, AutoLogoutTimeOutTemp, PrintRedColorQtyOnJobListTemp,
 MinimumChargeKindTemp, MinimumChargeItemCodeTemp,
 MinimumChargePerPersonTemp, OnlyOpenDrawerForCashPaymentTemp,
 PrintDiscountRateOnBillTemp, OnlyPrintSimpleFormatDailyReportTemp,
 OnlyPrintLastTwoDigitalOrderNoTemp, CheckPrinterStatusTemp,
 AutoPrintBillWhenPhoneOrderSavedTemp, AutoAddDeliveryChargeForPhoneOrderTemp,
 DeliveryChargeItemCodeTemp, TableLockFunctionEnabledTemp,
 PrintZeroQtyItemsOnJobListTemp, JobListFormatForPrinterTemp1,
 JobListFormatForPrinterTemp2, JobListFormatForPrinterTemp3,
 JobListFormatForPrinterTemp4, JobListFormatForPrinterTemp5,
 JobListFormatForPrinterTemp6, JobListFormatForPrinterTemp7,
 JobListFormatForPrinterTemp8, JobListFormatForPrinterTemp9,
 JobListFormatForPrinterTemp10, JobListFormatForPrinterTemp11,
 JobListFormatForPrinterTemp12, SecondDisplayDescriptionTemp,DollarOtherChargeTemp: string;
 Flag: boolean;
begin
 if (MinimumChargeComboBox.ItemIndex > 0) and (MinimumChargeItemCodeEdit.Caption = '') then
    begin
     MessageBoxForm.MessagePro('Minimum Charge Item Code Invalid.', sErrorMsg);
     Exit;
    end; 
 if CompanyNameEdit.Text = '' then
    CompanyNameTemp := 'NULL'
   else
    CompanyNametemp := Chr(39) + CheckQuotes(CompanyNameEdit.Text) + Chr(39);
 if TelephoneEdit.Text = '' then
    TelephoneTemp := 'NULL'
   else
    TelephoneTemp := Chr(39) + CheckQuotes(TelephoneEdit.Text) + Chr(39);
 if FaxEdit.Text = '' then
    FaxTemp := 'NULL'
   else
    FaxTemp := Chr(39) + CheckQuotes(FaxEdit.Text) + Chr(39);
 if AddressEdit.Text = '' then
    AddressTemp := 'NULL'
   else
    AddressTemp := Chr(39) + CheckQuotes(AddressEdit.Text) + Chr(39);
 if ABNEdit.Text = '' then
    ABNTemp := 'NULL'
   else
    ABNTemp := Chr(39) + CheckQuotes(ABNEdit.Text) + Chr(39);
 if InitEdit.Text = '' then
    InitTemp := 'NULL'
   else
    InitTemp := Chr(39) + CheckQuotes(InitEdit.Text) + Chr(39);
 if PasswordCheckBox.Checked then
    PasswordTemp := '1'
   else
    PasswordTemp := '0';
 if ServiceChargeRateEdit.Caption <> '' then
    ServiceChargeRateTemp := ServiceChargeRateEdit.Caption
   else
    ServiceChargeRateTemp := '0';
 if TableTrackCheckBox.Checked then
    TableTrackTemp := '1'
   else
    TableTrackTemp := '0';
 if ManuallyEnterTableNumberCheckBox.Checked then
    ManuallyEnterTableNumberTemp := '1'
   else
    ManuallyEnterTableNumberTemp := '0';
 if TableStatusCheckBox.Checked then
    CheckTableStatusTemp := '1'
   else
    CheckTableStatusTemp := '0';
 if PersonCountCheckBox.Checked then
    PersonCountTemp := '1'
   else
    PersonCountTemp := '0';
 if PrintBillNoCheckBox.Checked then
    PrintBillNoTemp := '1'
   else
    PrintBillNoTemp := '0';
 if PrintInvoiceNoCheckBox.Checked then
    PrintInvoiceNoTemp := '1'
   else
    PrintInvoiceNoTemp := '0';
 if ForceVIPDiscountCheckBox.Checked then
    ForceVIPDiscountTemp := '1'
   else
    ForceVIPDiscountTemp := '0';
 if NotAllowModifyCheckBox.Checked then
    NotAllowModifyTemp := '1'
   else
    NotAllowModifyTemp := '0';
 if NotAllowChangeQtyCheckBox.Checked then
    NotAllowChangeQtyTemp := '1'
   else
    NotAllowChangeQtyTemp := '0';
 if AutoOpenTillCheckBox.Checked then
    AutoOpenTillTemp := '1'
   else
    AutoOpenTillTemp := '0';
 if AutoPrintJobListCheckBox.Checked then
    AutoPrintJobListTemp := '1'
   else
    AutoPrintJobListTemp := '0';
 if ManuallyPrintJobListCheckBox.Checked then
    ManuallyPrintJobListTemp := '1'
   else
    ManuallyPrintJobListTemp := '0';
 if PrintServicePersonCheckBox.Checked then
    PrintServicePersonOnJobListTemp := '1'
   else
    PrintServicePersonOnJobListTemp := '0';
 if PrintPersonsCheckBox.Checked then
    PrintPersonsOnJobListTemp := '1'
   else
    PrintPersonsOnJobListTemp := '0';
 if PrintPriceCheckBox.Checked then
    PrintPriceOnJobListTemp := '1'
   else
    PrintPriceOnJobListTemp := '0';
 if PrintTimeOnInvoiceCheckBox.Checked then
    PrintTimeOnInvoiceTemp := '1'
   else
    PrintTimeOnInvoiceTemp := '0';
 if ShowTaxCheckBox.Checked then
    ShowTaxOnSalesSectionTemp := '1'
   else
    ShowTaxOnSalesSectionTemp := '0';
 if HappyHourCheckBox.Checked then
    begin
     HappyHourTemp := '1';
     HappyHourStartTimeTemp := ConvertDateTime(StrToTime(HappyHourStartEdit.Text));
     HappyHourStartTimeTemp1 := ConvertDateTime(StrToTime(HappyHourStartEdit1.Text));
     HappyHourStartTimeTemp2 := ConvertDateTime(StrToTime(HappyHourStartEdit2.Text));
     HappyHourStartTimeTemp3 := ConvertDateTime(StrToTime(HappyHourStartEdit3.Text));
     HappyHourStartTimeTemp4 := ConvertDateTime(StrToTime(HappyHourStartEdit4.Text));
     HappyHourStartTimeTemp5 := ConvertDateTime(StrToTime(HappyHourStartEdit5.Text));
     HappyHourStartTimeTemp6 := ConvertDateTime(StrToTime(HappyHourStartEdit6.Text));
     HappyHourEndTimeTemp := ConvertDateTime(StrToTime(HappyHourEndEdit.Text));
     HappyHourEndTimeTemp1 := ConvertDateTime(StrToTime(HappyHourEndEdit1.Text));
     HappyHourEndTimeTemp2 := ConvertDateTime(StrToTime(HappyHourEndEdit2.Text));
     HappyHourEndTimeTemp3 := ConvertDateTime(StrToTime(HappyHourEndEdit3.Text));
     HappyHourEndTimeTemp4 := ConvertDateTime(StrToTime(HappyHourEndEdit4.Text));
     HappyHourEndTimeTemp5 := ConvertDateTime(StrToTime(HappyHourEndEdit5.Text));
     HappyHourEndTimeTemp6 := ConvertDateTime(StrToTime(HappyHourEndEdit6.Text));
    end
   else
    begin
     HappyHourTemp := '0';
     HappyHourStartTimeTemp := ConvertDateTime(StrToTime('00:00'));
     HappyHourStartTimeTemp1 := ConvertDateTime(StrToTime('00:00'));
     HappyHourStartTimeTemp2 := ConvertDateTime(StrToTime('00:00'));
     HappyHourStartTimeTemp3 := ConvertDateTime(StrToTime('00:00'));
     HappyHourStartTimeTemp4 := ConvertDateTime(StrToTime('00:00'));
     HappyHourStartTimeTemp5 := ConvertDateTime(StrToTime('00:00'));
     HappyHourStartTimeTemp6 := ConvertDateTime(StrToTime('00:00'));
     HappyHourEndTimeTemp := ConvertDateTime(StrToTime('00:00'));
     HappyHourEndTimeTemp1 := ConvertDateTime(StrToTime('00:00'));
     HappyHourEndTimeTemp2 := ConvertDateTime(StrToTime('00:00'));
     HappyHourEndTimeTemp3 := ConvertDateTime(StrToTime('00:00'));
     HappyHourEndTimeTemp4 := ConvertDateTime(StrToTime('00:00'));
     HappyHourEndTimeTemp5 := ConvertDateTime(StrToTime('00:00'));
     HappyHourEndTimeTemp6 := ConvertDateTime(StrToTime('00:00'));
    end;
 BeginTimeTemp := ConvertDateTime(StrToTime(TimeEdit1.Text));
 EndTimeTemp := ConvertDateTime(StrToTime(TimeEdit2.Text));
 ButtonLayOutTemp := IntToStr(LayOutComboBox.ItemIndex);
 RoundingTemp := IntToStr(RoundingComboBox.ItemIndex);
 MenuLineTemp := IntToStr(MenuLineEdit.Value);
 POSMenuLineTemp := IntToStr(POSMenuLineEdit.Value);
 PhoneOrderMenuLineTemp := IntToStr(PhoneOrderMenuLineEdit.Value);
 CategoryLineTemp := CategoryLineEdit.Text;
 POSCategoryLineTemp := POSCategoryLineEdit.Text;
 PhoneOrderCategoryLineTemp := PhoneOrderCategoryLineEdit.Text;
 if POSJobListCheckBox.Checked then
    POSJobListFlag := '1'
   else
    POSJobListFlag := '0';
 if POSOrderListCheckBox.Checked then
    POSOrderListFlag := '1'
   else
    POSOrderListFlag := '0';
 if POSInvoiceCheckBox.Checked then
    POSInvoiceFlag := '1'
   else
    POSInvoiceFlag := '0';
 if PrintPickupSlipCheckBox.Checked then
    PrintPickupSlipFlag := '1'
   else
    PrintPickupSlipFlag := '0';
 PrintCategoryColorFlag := IntToStr(ColorComboBox.ItemIndex);
 JobListDescriptionFlag := IntToStr(JobListComboBox.ItemIndex);
 OrderListDescriptionFlag := IntToStr(OrderListComboBox.ItemIndex);
 InvoiceDescriptionFlag := IntToStr(InvoiceComboBox.ItemIndex);
 JobListFormatForPrinterTemp1 := IntToStr(JobListFormatForPrinterComboBox1.ItemIndex);
 JobListFormatForPrinterTemp2 := IntToStr(JobListFormatForPrinterComboBox2.ItemIndex);
 JobListFormatForPrinterTemp3 := IntToStr(JobListFormatForPrinterComboBox3.ItemIndex);
 JobListFormatForPrinterTemp4 := IntToStr(JobListFormatForPrinterComboBox4.ItemIndex);
 JobListFormatForPrinterTemp5 := IntToStr(JobListFormatForPrinterComboBox5.ItemIndex);
 JobListFormatForPrinterTemp6 := IntToStr(JobListFormatForPrinterComboBox6.ItemIndex);
 JobListFormatForPrinterTemp7 := IntToStr(JobListFormatForPrinterComboBox7.ItemIndex);
 JobListFormatForPrinterTemp8 := IntToStr(JobListFormatForPrinterComboBox8.ItemIndex);
 JobListFormatForPrinterTemp9 := IntToStr(JobListFormatForPrinterComboBox9.ItemIndex);
 JobListFormatForPrinterTemp10 := IntToStr(JobListFormatForPrinterComboBox10.ItemIndex);
 JobListFormatForPrinterTemp11 := IntToStr(JobListFormatForPrinterComboBox11.ItemIndex);
 JobListFormatForPrinterTemp12 := IntToStr(JobListFormatForPrinterComboBox12.ItemIndex);
 PrintBillCategoryFlag := IntToStr(BillCategoryComboBox.ItemIndex);
 PrintInvoiceCategoryFlag := IntToStr(InvoiceCategoryComboBox.ItemIndex);
 CheckListFormatTemp := IntToStr(CheckListFormatComboBox.ItemIndex);
 VIPDefaultSearchFlag := IntToStr(VIPDefaultSearchComboBox.ItemIndex);
 if AutoPrintPhoneOrderJobListCheckBox.Checked then
    AutoPrintPhoneOrderJobListFlag := '1'
   else
    AutoPrintPhoneOrderJobListFlag := '0';
 if AutoInstructionSelectionCheckBox.Checked then
    AutoInstructionSelectionFlag := '1'
   else
    AutoInstructionSelectionFlag := '0';
 if PrintTableNoCheckBox.Checked then
    PrintTableNoFlag := '1'
   else
    PrintTableNoFlag := '0';
 if PrintDateOnDailyReportCheckBox.Checked then
    PrintDateOnDailyReportFlag := '1'
   else
    PrintDateOnDailyReportFlag := '0';
 if AutoPrintBillCheckBox.Checked then
    AutoPrintBillFlag := '1'
   else
    AutoPrintBillFlag := '0';
 if AutoPrintInvoiceCheckBox.Checked then
    AutoPrintInvoiceFlag := '1'
   else
    AutoPrintInvoiceFlag := '0';
 if AutoPriceWindowCheckBox.Checked then
    AutoPriceWindowTemp := '1'
   else
    AutoPriceWindowTemp := '0';
 if PrintZeroPriceItemOnInvoiceCheckBox.Checked then
    PrintZeroPriceItemOnInvoiceTemp := '1'
   else
    PrintZeroPriceItemOnInvoiceTemp := '0';
 if AutoPopVoidReasonCheckBox.Checked then
    AutoPopVoidReasonTemp := '1'
   else
    AutoPopVoidReasonTemp := '0';
 if AutoSaveOrderCheckBox.Checked then
    AutoSaveOrderTemp := '1'
   else
    AutoSaveOrderTemp := '0';
 ScaleBarcodeTemp := IntToStr(ScaleBarcodeComboBox.ItemIndex);
 if PrintGoWithInstructionCheckBox.Checked then
    PrintGoWithInstructionTemp := '1'
   else
    PrintGoWithInstructionTemp := '0';
 if PrintOpNameOnJobListCheckBox.Checked then
    PrintOpNameOnJobListTemp := '1'
   else
    PrintOpNameOnJobListTemp := '0';
 if AutoPrintMergedOrderCheckBox.Checked then
    AutoPrintMergedOrderTemp := '1'
   else
    AutoPrintMergedOrderTemp := '0';
 if AutoPrintJobListForHoldOrderCheckBox.Checked then
    AutoPrintJobListForHoldOrderTemp := '1'
   else
    AutoPrintJobListForHoldOrderTemp := '0';
 if AutoSurchargeCheckBox.Checked then
    begin
     AutoSurchargeTemp := '1';
     SurchargeStartTimeTemp := ConvertDateTime(StrToTime(SurchargeStartTimeEdit.Text));
     SurchargeEndTimeTemp := ConvertDateTime(StrToTime(SurchargeEndTimeEdit.Text));
    end
   else
    begin
     AutoSurchargeTemp := '0';
     SurchargeStartTimeTemp := ConvertDateTime(StrToTime('00:00'));
     SurchargeEndTimeTemp := ConvertDateTime(StrToTime('00:00'));
    end;
 if SurchargeNameEdit.Text <> '' then
    SurchargeNameTemp := Chr(39) + CheckQuotes(SurchargeNameEdit.Text) + Chr(39)
   else
    SurchargeNameTemp := Chr(39) + 'Surcharge' + Chr(39);
 if OtherChargeCheckBox.Checked then
    OtherChargeFlag := '1'
   else
    OtherChargeFlag := '0';
 if OtherChargeNameEdit.Text <> '' then
    OtherChargeNameTemp := Chr(39) + CheckQuotes(OtherChargeNameEdit.Text) + Chr(39)
   else
    OtherChargeNameTemp := Chr(39) + 'Other Charge' + Chr(39);
 if OtherChargeRateEdit.Caption <> '' then
    OtherChargeRateTemp := OtherChargeRateEdit.Caption
   else
    OtherChargeRateTemp := '0';
 if GSTStatusCheckBox.Checked then
    PriceIncludesGSTTemp := '1'
   else
    PriceIncludesGSTTemp := '0';
 if DefaultGSTRateEdit.Caption <> '' then
    DefaultGSTRateTemp := DefaultGSTRateEdit.Caption
   else
    DefaultGSTRateTemp := '0';
 if DefaultVIPStateEdit.Text <> '' then
    DefaultVIPStateTemp := Chr(39) + CheckQuotes(DefaultVIPStateEdit.Text) + Chr(39)
   else
    DefaultVIPStateTemp := 'Null';
 if PrintIngredientsOnJobListCheckBox.Checked then
    PrintIngredientsOnJobListTemp := '1'
   else
    PrintIngredientsOnJobListTemp := '0';
 if LoyaltyAwardCheckBox.Checked then
    LoyaltyAwardTemp := '1'
   else
    LoyaltyAwardTemp := '0';
 if SalesPointsEdit.Caption <> '' then
    SalesPointsTemp := SalesPointsEdit.Caption
   else
    SalesPointsTemp := '0';
 if PaymentPointsEdit.Caption <> '' then
    PaymentPointsTemp := PaymentPointsEdit.Caption
   else
    PaymentPointsTemp := '0';
 if ReachPointsEdit.Caption <> '' then
    ReachPointsTemp := ReachPointsEdit.Caption
   else
    ReachPointsTemp := '0';
 if MaxDiscountPercentageEdit.Caption <> '' then
    MaxDiscountPercentageTemp := MaxDiscountPercentageEdit.Caption
   else
    MaxDiscountPercentageTemp := '0';
 if MaxDollarDiscountEdit.Caption <> '' then
    MaxDollarDiscountTemp := MaxDollarDiscountEdit.Caption
   else
    MaxDollarDiscountTemp := '0';
 if BackupPathEdit.Text <> '' then
    DefaultBackupPathTemp := Chr(39) + CheckQuotes(BackupPathEdit.Text) + Chr(39)
   else
    DefaultBackupPathTemp := 'Null';
 if ShowPrintInvoiceWindowCheckBox.Checked then
    ShowPrintInvoiceWindowTemp := '1'
   else
    ShowPrintInvoiceWindowTemp := '0';
 if ChangeQtyWithCondimentCheckBox.Checked then
    ChangeQtyWithCondimentTemp := '1'
   else
    ChangeQtyWithCondimentTemp := '0';
 if CompulsoryEnterCustomerNameCheckBox.Checked then
    CompulsoryEnterCustomerNameTemp := '1'
   else
    CompulsoryEnterCustomerNameTemp := '0';
 if AutoPrintCheckListCheckBox.Checked then
    AutoPrintCheckListTemp := '1'
   else
    AutoPrintCheckListTemp := '0';
 if PrintOrderNoOnJobListCheckBox.Checked then
    PrintOrderNoOnJobListTemp := '1'
   else
    PrintOrderNoOnJobListTemp := '0';
 if AutoBackupCheckBox.Checked then
    AutoBackupTemp := '1'
   else
    AutoBackupTemp := '0';
 if ShowNegativeQtyCheckBox.Checked then
    ShowNegativeQtyFlag := '1'
   else
    ShowNegativeQtyFlag := '0';
 if PrintOrderNoOnTaxInvoiceCheckBox.Checked then
    PrintOrderNoOnTaxInvoiceFlag := '1'
   else
    PrintOrderNoOnTaxInvoiceFlag := '0';
 BackupFrequencyTemp := IntToStr(FrequencyRadioGroup.ItemIndex);
 BackupOnceTimeTemp := ConvertDateTime(StrToTime(BackupOnceTimeEdit.Text));
 BackupTimeTemp := IntToStr(BackupTimeComboBox.ItemIndex);
 DiscountRateEnterModeFlag := IntToStr(DiscountRateEnterModeComboBox.ItemIndex);
 if AutoLogoutCheckBox.Checked then
    AutoLogoutTemp := '1'
   else
    AutoLogoutTemp := '0';
 AutoLogoutTimeoutTemp := IntToStr(TimeOutComboBox.ItemIndex);
 if PrintRedColorQtyOnJobListCheckBox.Checked then
    PrintRedColorQtyOnJobListTemp := '1'
   else
    PrintRedColorQtyOnJobListTemp := '0';
 MinimumChargeKindTemp := IntToStr(MinimumChargeComboBox.ItemIndex);
 if MinimumChargeItemCodeEdit.Caption <> '' then
    MinimumChargeItemCodeTemp := Chr(39) + CheckQuotes(MinimumChargeItemCodeEdit.Caption) + Chr(39)
   else
    MinimumChargeItemCodeTemp := 'Null';
 MinimumChargePerPersonTemp := MinimumChargePerPersonEdit.Caption;
 if OnlyOpenDrawerForCashPaymentCheckBox.Checked then
    OnlyOpenDrawerForCashPaymentTemp := '1'
   else
    OnlyOpenDrawerForCashPaymentTemp := '0';
 if PrintDiscountRateOnBillCheckBox.Checked then
    PrintDiscountRateOnBillTemp := '1'
   else
    PrintDiscountRateOnBillTemp := '0';
 if OnlyPrintSimpleFormatDailyReportCheckBox.Checked then
    OnlyPrintSimpleFormatDailyReportTemp := '1'
   else
    OnlyPrintSimpleFormatDailyReportTemp := '0';
 if OnlyPrintLastTwoDigitalOrderNoCheckBox.Checked then
    OnlyPrintLastTwoDigitalOrderNoTemp := '1'
   else
    OnlyPrintLastTwoDigitalOrderNoTemp := '0';
 if CheckPrinterStatusCheckBox.Checked then
    CheckPrinterStatusTemp := '1'
   else
    CheckPrinterStatusTemp := '0';
 if AutoPrintBillWhenPhoneOrderSavedCheckBox.Checked then
    AutoPrintBillWhenPhoneOrderSavedTemp := '1'
   else
    AutoPrintBillWhenPhoneOrderSavedTemp := '0';
 if AutoAddDeliveryChargeForPhoneOrderCheckBox.Checked then
    AutoAddDeliveryChargeForPhoneOrderTemp := '1'
   else
    AutoAddDeliveryChargeForPhoneOrderTemp := '0';
 if DeliveryChargeItemCodeEdit.Caption <> '' then
    DeliveryChargeItemCodeTemp := Chr(39) + DeliveryChargeItemCodeEdit.Caption + Chr(39)
   else
    DeliveryChargeItemCodeTemp := 'Null';
 if EnableTableLockCheckBox.Checked then
    TableLockFunctionEnabledTemp := '1'
   else
    TableLockFunctionEnabledTemp := '0';
 if PrintZeroQtyItemsOnJobListCheckBox.Checked then
    PrintZeroQtyItemsOnJobListTemp := '1'
   else
    PrintZeroQtyItemsOnJobListTemp := '0';
 if DollarOtherChargeBox.Checked then
    DollarOtherChargeTemp := 'True'
   else
    DollarOtherChargeTemp := 'False';
 SecondDisplayDescriptionTemp := IntToStr(SecondDisplayDescriptionComboBox.ItemIndex);
 SQLStr := 'Insert Into Profile(CompanyName, Telephone, Fax, Address, ABN, ' +
           'Initial, CheckPassword, BeginTime, EndTime, HappyHour, HappyHourStartTime, ' +
           'HappyHourEndTime, HappyHourStartTime1, HappyHourEndTime1, ' +
           'HappyHourStartTime2, HappyHourEndTime2,  HappyHourStartTime3, ' +
           'HappyHourEndTime3, HappyHourStartTime4, HappyHourEndTime4, ' +
           'HappyHourStartTime5, HappyHourEndTime5, HappyHourStartTime6, ' +
           'HappyHourEndTime6, ButtonLayOut, MainMenuLine, MainCategoryLine, ' +
           'POSMenuLine, POSCategoryLine, PhoneOrderMenuLine, PhoneOrderCategoryLine, ' +
           'ServiceChargeRate, TableTracking, ManuallyEnterTableNumber, CheckTableStatus, ' +
           'PersonCount, PrintBillNo, PrintInvoiceNo, RoundingFlag, ForceVIPDiscount, ' +
           'NotAllowModify, NotAllowChangeQty, AutoOpenTill, AutoPrintJobList, ' +
           'ManuallyPrintJobList, PrintServiceOnJobList, PrintPersonsOnJobList, ' +
           'PrintPriceOnJobList, PrintTimeOnInvoice, ShowTaxOnSalesSection, ' +
           'JobListDescription, OrderListDescription, InvoiceDescription, POSJobList, POSOrderList, ' +
           'POSInvoice, PrintPickupSlip, PrintBillCategory, PrintInvoiceCategory, PrintCategoryColor, ' +
           'VIPDefaultSearch, AutoPrintPhoneOrderJobList, AutoInstructionSelection, PrintTableNo, ' +
           'PrintDateOnDailyReport, AutoPrintBill, AutoPrintInvoice, AutoPriceWindow, ' +
           'PrintZeroPriceItemOnInvoice, AutoPopVoidReason, AutoSaveOrder, ScaleBarcode, ' +
           'PrintGoWithInstruction, PrintOpNameOnJobList, AutoPrintMergedOrder, ' +
           'AutoPrintJobListForHoldOrder, AutoSurcharge, SurchargeStartTime, ' +
           'SurchargeEndTime, SurchargeName, OtherCharge, OtherChargeName, OtherChargeRate, ' +
           'PriceIncludesGST, DefaultGSTRate, DefaultVIPState, PrintIngredientsOnJobList, ' +
           'LoyaltyAward, SalesPoints, PaymentPoints, ReachPoints, MaxDiscountPercentage, ' +
           'MaxDollarDiscount, JobListFontSize, DefaultBackupPath, ShowPrintInvoiceWindow, ' +
           'ChangeQtyWithCondiment, CompulsoryEnterCustomerName, AutoPrintCheckList, ' +
           'PrintOrderNoOnJobList, AutoBackup, BackupTime, BackupFrequency, ' +
           'BackupOnceTime, DiscountRateEnterMode, ShowNegativeQty, PrintOrderNoOnTaxInvoice, ' +
           'CheckListFormat, AutoLogout, AutoLogoutTimeOut, PrintRedColorQtyOnJobList, ' +
           'MinimumChargeKind, MinimumChargeItemCode, MinimumChargePerPerson, ' +
           'OnlyOpenDrawerForCashPayment, PrintDiscountRateOnBill, OnlyPrintSimpleFormatDailyReport, ' +
           'OnlyPrintLastTwoDigitalOrderNo, CheckPrinterStatus, AutoPrintBillWhenPhoneOrderSaved, ' +
           'AutoAddDeliveryChargeForPhoneOrder, DeliveryChargeItemCode, TableLockFunctionEnabled, ' +
           'PrintZeroQtyItemsOnJobList, JobListFormatForPrinter1, JobListFormatForPrinter2, ' +
           'JobListFormatForPrinter3, JobListFormatForPrinter4, JobListFormatForPrinter5, ' +
           'JobListFormatForPrinter6, JobListFormatForPrinter7, JobListFormatForPrinter8, ' +
           'JobListFormatForPrinter9, JobListFormatForPrinter10, JobListFormatForPrinter11, ' +
           'JobListFormatForPrinter12, SecondDisplayDescription ) ' +
           'Values(' + CompanyNameTemp + ',' + TelephoneTemp + ',' +
           FaxTemp + ',' + AddressTemp + ',' + ABNTemp + ',' +
           InitTemp + ',' + PasswordTemp + ',' + BeginTimeTemp + ',' +
           EndTimeTemp + ',' + HappyHourTemp + ',' +
           HappyHourStartTimeTemp + ',' + HappyHourEndTimeTemp + ',' +
           HappyHourStartTimeTemp1 + ',' + HappyHourEndTimeTemp1 + ',' +
           HappyHourStartTimeTemp2 + ',' + HappyHourEndTimeTemp2 + ',' +
           HappyHourStartTimeTemp3 + ',' + HappyHourEndTimeTemp3 + ',' +
           HappyHourStartTimeTemp4 + ',' + HappyHourEndTimeTemp4 + ',' +
           HappyHourStartTimeTemp5 + ',' + HappyHourEndTimeTemp5 + ',' +
           HappyHourStartTimeTemp6 + ',' + HappyHourEndTimeTemp6 + ',' +
           ButtonLayOutTemp + ',' + MenuLineTemp + ',' + CategoryLineTemp + ',' +
           POSMenuLineTemp + ',' + POSCategoryLineTemp + ',' +
           PhoneOrderMenuLineTemp + ',' + PhoneOrderCategoryLineTemp + ',' +
           ServiceChargeRateTemp + ',' + TableTrackTemp + ',' +
           ManuallyEnterTableNumberTemp + ',' + CheckTableStatusTemp + ',' +
           PersonCountTemp + ',' + PrintBillNoTemp + ',' + PrintInvoiceNoTemp + ',' +
           RoundingTemp + ',' + ForceVIPDiscountTemp + ',' +
           NotAllowModifyTemp + ',' + NotAllowChangeQtyTemp + ',' +
           AutoOpenTillTemp + ',' + AutoPrintJobListTemp + ',' +
           ManuallyPrintJobListTemp + ',' + PrintServicePersonOnJobListTemp + ',' +
           PrintPersonsOnJobListTemp + ',' + PrintPriceOnJobListTemp + ',' +
           PrintTimeOnInvoiceTemp + ',' + ShowTaxOnSalesSectionTemp + ',' +
           JobListDescriptionFlag + ',' + OrderListDescriptionFlag + ',' +
           InvoiceDescriptionFlag + ',' + POSJobListFlag + ',' +
           POSOrderListFlag + ',' + POSInvoiceFlag + ',' + PrintPickupSlipFlag + ',' +
           PrintBillCategoryFlag + ',' + PrintInvoiceCategoryFlag + ',' + PrintCategoryColorFlag + ',' +
           VIPDefaultSearchFlag + ',' + AutoPrintPhoneOrderJobListFlag + ',' +
           AutoInstructionSelectionFlag + ',' + PrintTableNoFlag + ',' +
           PrintDateOnDailyReportFlag + ',' + AutoPrintBillFlag + ',' +
           AutoPrintInvoiceFlag + ',' + AutoPriceWindowTemp + ',' +
           PrintZeroPriceItemOnInvoiceTemp + ',' + AutoPopVoidReasonTemp + ',' +
           AutoSaveOrderTemp + ',' + ScaleBarcodeTemp + ',' +
           PrintGoWithInstructionTemp + ',' + PrintOpNameOnJobListTemp + ',' +
           AutoPrintMergedOrderTemp + ',' + AutoPrintJobListForHoldOrderTemp + ',' +
           AutoSurchargeTemp + ',' + SurchargeStartTimeTemp + ',' +
           SurchargeEndTimeTemp + ',' + SurchargeNameTemp + ',' +
           OtherChargeFlag + ',' + OtherChargeNameTemp + ',' +
           OtherChargeRateTemp + ',' + PriceIncludesGSTTemp + ',' +
           DefaultGSTRateTemp + ',' + DefaultVIPStateTemp + ',' +
           PrintIngredientsOnJobListTemp + ',' + LoyaltyAwardTemp + ',' +
           SalespointsTemp + ',' + PaymentPointsTemp + ',' + ReachPointsTemp + ',' +
           MaxDiscountPercentageTemp + ',' + MaxDollarDiscountTemp + ',' +
           IntToStr(JobListFontSizeComboBox.ItemIndex) + ',' +
           DefaultBackupPathTemp + ',' + ShowPrintInvoiceWindowTemp + ',' +
           ChangeQtyWithCondimentTemp + ',' + CompulsoryEnterCustomerNameTemp + ',' +
           AutoPrintCheckListTemp + ',' + PrintOrderNoOnJobListTemp + ',' +
           AutoBackupTemp + ',' + BackupTimeTemp + ',' + BackupFrequencyTemp + ',' +
           BackupOnceTimeTemp + ',' + DiscountRateEnterModeFlag + ',' + ShowNegativeQtyFlag + ',' +
           PrintOrderNoOnTaxInvoiceFlag + ',' + CheckListFormatTemp + ',' +
           AutoLogoutTemp + ',' + AutoLogoutTimeoutTemp + ',' + PrintRedColorQtyOnJobListtEMP + ',' +
           MinimumChargeKindTemp + ',' + MinimumChargeItemCodeTemp + ',' +
           MinimumChargePerPersonTemp + ',' + OnlyOpenDrawerForCashPaymentTemp + ',' +
           PrintDiscountRateOnBillTemp + ',' + OnlyPrintSimpleFormatDailyReportTemp + ',' +
           OnlyPrintLastTwoDigitalOrderNoTemp + ',' + CheckPrinterStatusTemp + ',' +
           AutoPrintBillWhenPhoneOrderSavedTemp + ',' + AutoAddDeliveryChargeForPhoneOrderTemp + ',' +
           DeliveryChargeItemCodeTemp + ',' + TableLockFunctionEnabledTemp + ',' +
           PrintZeroQtyItemsOnJobListTemp + ',' +
           JobListFormatForPrinterTemp1 + ',' + JobListFormatForPrinterTemp2 + ',' +
           JobListFormatForPrinterTemp3 + ',' + JobListFormatForPrinterTemp4 + ',' +
           JobListFormatForPrinterTemp5 + ',' + JobListFormatForPrinterTemp6 + ',' +
           JobListFormatForPrinterTemp7 + ',' + JobListFormatForPrinterTemp8 + ',' +
           JobListFormatForPrinterTemp9 + ',' + JobListFormatForPrinterTemp10 + ',' +
           JobListFormatForPrinterTemp11 + ',' + JobListFormatForPrinterTemp12 + ',' +
           SecondDisplayDescriptionTemp +   ')';
 Flag := False;
 if Not DataForm.BeginTransaction then Exit;
 try
  Flag := DataForm.ExecQueryPro('Delete From Profile');
  if Flag then
     Flag := DataForm.ExecQueryPro(SQLStr);
 finally
  if Flag then
     begin
      DataForm.CommitTransaction;
      Password := PasswordCheckBox.Checked;
      BeginTime := StrToTime(TimeEdit1.Text);
      EndTime := StrToTime(TimeEdit2.Text);
      ButtonLayOut := LayOutComboBox.ItemIndex;
      MainMenuLine := MenuLineEdit.Value;
      MainCategoryLine := 13 - MainMenuLine;
      POSMenuLine := POSMenuLineEdit.Value;
      POSCategoryLine := 13 - POSMenuLine;
      PhoneOrderMenuLine := PhoneOrderMenuLineEdit.Value;
      PhoneOrderCategoryLine := 13 - PhoneOrderMenuLine;
      TableTracking := TableTrackCheckBox.Checked;
      CheckTableStatus := TableStatusCheckBox.Checked;
      PersonCount := PersonCountCheckBox.Checked;
      PrintBillNo := PrintBillNoCheckBox.Checked;
      PrintInvoiceNo := PrintInvoiceNoCheckBox.Checked;
      RoundingFlag := RoundingComboBox.ItemIndex;
      NotAllowModify := NotAllowModifyCheckBox.Checked;
      NotAllowChangeQty := NotAllowChangeQtyCheckBox.Checked;
      ForceVIPDiscount := ForceVIPDiscountCheckBox.Checked;
      AutoOpenTill := AutoOpenTillCheckBox.Checked;
      AutoPrintJobList := AutoPrintJobListCheckBox.Checked;
      ManuallyPrintJobList := ManuallyPrintJobListCheckBox.Checked;
      PrintServiceOnJobList := PrintServicePersonCheckBox.Checked;
      PrintPersonsOnJobList := PrintPersonsCheckBox.Checked;
      PrintPriceOnJobList := PrintPriceCheckBox.Checked;
      PrintTimeOnInvoice := PrintTimeOnInvoiceCheckBox.Checked;
      HappyHourAvailable := HappyHourCheckBox.Checked;
      AutoSurcharge := AutoSurchargeCheckBox.Checked;
      AutoPrintPOSJobList := POSJobListCheckBox.Checked;
      AutoPrintPOSOrderList := POSOrderListCheckBox.Checked;
      AutoPrintPOSInvoice := POSInvoiceCheckBox.Checked;
      AutoPrintPickupSlip := PrintPickupSlipCheckBox.Checked;
      PrintCategoryColor := ColorComboBox.ItemIndex;
      PrintJobListDescription := JobListComboBox.ItemIndex;
      PrintOrderListDescription := OrderListComboBox.ItemIndex;
      PrintInvoiceDescription := InvoiceComboBox.ItemIndex;
      JobListFormatForPrinter[1] := JobListFormatForPrinterComboBox1.ItemIndex;
      JobListFormatForPrinter[2] := JobListFormatForPrinterComboBox2.ItemIndex;
      JobListFormatForPrinter[3] := JobListFormatForPrinterComboBox3.ItemIndex;
      JobListFormatForPrinter[4] := JobListFormatForPrinterComboBox4.ItemIndex;
      JobListFormatForPrinter[5] := JobListFormatForPrinterComboBox5.ItemIndex;
      JobListFormatForPrinter[6] := JobListFormatForPrinterComboBox6.ItemIndex;
      JobListFormatForPrinter[7] := JobListFormatForPrinterComboBox7.ItemIndex;
      JobListFormatForPrinter[8] := JobListFormatForPrinterComboBox8.ItemIndex;
      JobListFormatForPrinter[9] := JobListFormatForPrinterComboBox9.ItemIndex;
      JobListFormatForPrinter[10] := JobListFormatForPrinterComboBox10.ItemIndex;
      JobListFormatForPrinter[11] := JobListFormatForPrinterComboBox11.ItemIndex;
      JobListFormatForPrinter[12] := JobListFormatForPrinterComboBox12.ItemIndex;
      PrintBillMode := BillCategoryComboBox.ItemIndex;
      PrintInvoiceMode := InvoiceCategoryComboBox.ItemIndex;
      CheckListFormat := CheckListFormatComboBox.ItemIndex;
      VIPDefaultSearch := VIPDefaultSearchComboBox.ItemIndex;
      AutoPrintPhoneOrderJobList := AutoPrintPhoneOrderJobListCheckBox.Checked;
      AutoInstructionSelection := AutoInstructionSelectionCheckBox.Checked;
      PrintTableNo := PrintTableNoCheckBox.Checked;
      PrintDateOnDailyReport := PrintDateOnDailyReportCheckBox.Checked;
      AutoPrintBill := AutoPrintBillCheckBox.Checked;
      AutoPrintInvoice := AutoPrintInvoiceCheckBox.Checked;
      AutoPriceWindow := AutoPriceWindowCheckBox.Checked;
      PrintZeroPriceItemOnInvoice := PrintZeroPriceItemOnInvoiceCheckBox.Checked;
      AutoPopVoidReason := AutoPopVoidReasonCheckBox.Checked;
      AutoSaveOrder := AutoSaveOrderCheckBox.Checked;
      ScaleBarcode := ScaleBarcodeComboBox.ItemIndex;
      ManuallyEnterTableNumber := ManuallyEnterTableNumberCheckBox.Checked;
      PrintGoWithInstruction := PrintGoWithInstructionCheckBox.Checked;
      PrintOpNameOnJobList := PrintOpNameOnJobListCheckBox.Checked;
      AutoPrintMergedOrder := AutoPrintMergedOrderCheckBox.Checked;
      AutoPrintJobListForHoldOrder := AutoPrintJobListForHoldOrderCheckBox.Checked;
      ShowTaxOnSalesSection := ShowTaxCheckBox.Checked;
      SurchargeName := SurchargeNameEdit.Text;
      OtherChargeEnable := OtherChargeCheckBox.Checked;
      PriceIncludesGST := GSTStatusCheckBox.Checked;
      DefaultVIPState := DefaultVIPStateEdit.Text;
      PrintIngredientsOnJobList := PrintIngredientsOnJobListCheckBox.Checked;
      JobListFontSize := JobListFontSizeComboBox.ItemIndex;
      if DefaultGSTRateEdit.Caption <> '' then
         DefaultGSTRate := StrToFloat(DefaultGSTRateEdit.Caption)
        else
         DefaultGSTRate := 0;
      OtherChargeName := OtherChargeNameEdit.Text;
      DefaultBackupPath := BackupPathEdit.Text;
      if HappyHourAvailable then
         begin
          HappyHourStartTime := StrToTime(HappyHourStartEdit.Text);
          HappyHourStartTime1 := StrToTime(HappyHourStartEdit1.Text);
          HappyHourStartTime2 := StrToTime(HappyHourStartEdit2.Text);
          HappyHourStartTime3 := StrToTime(HappyHourStartEdit3.Text);
          HappyHourStartTime4 := StrToTime(HappyHourStartEdit4.Text);
          HappyHourStartTime5 := StrToTime(HappyHourStartEdit5.Text);
          HappyHourStartTime6 := StrToTime(HappyHourStartEdit6.Text);
          HappyHourEndTime := StrToTime(HappyHourEndEdit.Text);
          HappyHourEndTime1 := StrToTime(HappyHourEndEdit1.Text);
          HappyHourEndTime2 := StrToTime(HappyHourEndEdit2.Text);
          HappyHourEndTime3 := StrToTime(HappyHourEndEdit3.Text);
          HappyHourEndTime4 := StrToTime(HappyHourEndEdit4.Text);
          HappyHourEndTime5 := StrToTime(HappyHourEndEdit5.Text);
          HappyHourEndTime6 := StrToTime(HappyHourEndEdit6.Text);
         end
        else
         begin
          HappyHourStartTime := StrToTime('0:0');
          HappyHourStartTime1 := StrToTime('0:0');
          HappyHourStartTime2 := StrToTime('0:0');
          HappyHourStartTime3 := StrToTime('0:0');
          HappyHourStartTime4 := StrToTime('0:0');
          HappyHourStartTime5 := StrToTime('0:0');
          HappyHourStartTime6 := StrToTime('0:0');
          HappyHourEndTime := StrToTime('0:0');
          HappyHourEndTime1 := StrToTime('0:0');
          HappyHourEndTime2 := StrToTime('0:0');
          HappyHourEndTime3 := StrToTime('0:0');
          HappyHourEndTime4 := StrToTime('0:0');
          HappyHourEndTime5 := StrToTime('0:0');
          HappyHourEndTime6 := StrToTime('0:0');
         end;
      LoyaltyAwardAvailible := LoyaltyAwardCheckBox.Checked;
      SalesPoints := Trunc(StrToFloat(SalesPointsEdit.Caption));
      PaymentPoints := Trunc(StrToFloat(PaymentPointsEdit.Caption));
      ReachPoints := Trunc(StrToFloat(ReachPointsEdit.Caption));
      MaxDiscountPercentage := StrToFloat(MaxDiscountPercentageEdit.Caption);
      MaxDollarDiscount := StrToFloat(MaxDollarDiscountEdit.Caption);
      ShowPrintInvoiceWindow := ShowPrintInvoiceWindowCheckBox.Checked;
      ChangeQtyWithCondiment := ChangeQtyWithCondimentCheckBox.Checked;
      CompulsoryEnterCustomerName := CompulsoryEnterCustomerNameCheckBox.Checked;
      AutoPrintCheckList := AutoPrintCheckListCheckBox.Checked;
      PrintOrderNoOnJobList := PrintOrderNoOnJobListCheckBox.Checked;
      DataForm.BackupTimer.Enabled := False;
      DiscountRateEnterMode := DiscountRateEnterModeComboBox.ItemIndex;
      ShowNegativeQty := ShowNegativeQtyCheckBox.Checked;
      PrintOrderNoOnTaxInvoice := PrintOrderNoOnTaxInvoiceCheckBox.Checked;
      AutoLogout := AutoLogoutCheckBox.Checked;
      AutoLogoutTimeout := TimeOutComboBox.ItemIndex;
      PrintRedColorQtyOnJobList := PrintRedColorQtyOnJobListCheckBox.Checked;
      MinimumChargeKind := MinimumChargeComboBox.ItemIndex;
      MinimumChargeItemCode := MinimumChargeItemCodeEdit.Caption;
      MinimumChargePerPerson := StrToFloat(MinimumChargePerPersonEdit.Caption);
      OnlyOpenDrawerForCashPayment := OnlyOpenDrawerForCashPaymentCheckBox.Checked;
      PrintDiscountRateOnBill := PrintDiscountRateOnBillCheckBox.Checked;
      OnlyPrintSimpleFormatDailyReport := OnlyPrintSimpleFormatDailyReportCheckBox.Checked;
      OnlyPrintLastTwoDigitalOrderNo := OnlyPrintLastTwoDigitalOrderNoCheckBox.Checked;
      CheckPrinterStatus := CheckPrinterStatusCheckBox.Checked;
      AutoPrintBillWhenPhoneOrderSaved := AutoPrintBillWhenPhoneOrderSavedCheckBox.Checked;
      AutoAddDeliveryChargeForPhoneOrder := AutoAddDeliveryChargeForPhoneOrderCheckBox.Checked;
      DeliveryChargeItemCode := DeliveryChargeItemCodeEdit.Caption;
      TableLockFunctionEnabled := EnableTableLockCheckBox.Checked;
      PrintZeroQtyItemsOnJobList := PrintZeroQtyItemsOnJobListCheckBox.Checked;
      SecondDisplayDescription := SecondDisplayDescriptionComboBox.ItemIndex;
      if AutoBackupCheckBox.Checked then
         begin
          BackupFrequency := FrequencyRadioGroup.ItemIndex;
          if BackupFrequency = 0 then
             DataForm.BackupTimer.Interval := (BackupTimeComboBox.ItemIndex + 1) * 3600000
            else
             DataForm.BackupTimer.Interval := 1000;
          BackupOnceTime := StrToTime(BackupOnceTimeEdit.Text);
          DataForm.BackupTimer.Enabled := True;
         end;
      if AutoSurcharge then
         begin
          SurchargeStartTime := StrToTime(SurchargeStartTimeEdit.Text);
          SurchargeEndTime := StrToTime(SurchargeEndTimeEdit.Text);
         end
        else
         begin
          SurchargeStartTime := StrToTime('0:0');
          SurchargeEndTime := StrToTime('0:0');
         end;
      if ServiceChargeRateEdit.Caption <> '' then
         ServiceChargeRate := StrToFloat(ServiceChargeRateEdit.Caption)
        else
         ServiceChargeRate := 0;
      if OtherChargeRateEdit.Caption <> '' then
         OtherChargeRate := StrToFloat(OtherChargeRateEdit.Caption)
        else
         OtherChargeRate := 0;
      Close
     end
    else
     DataForm.RollBack;
 end;
end;

procedure TProfileSetupForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = Chr(27) then CancelButtonClick(Sender);
end;

procedure TProfileSetupForm.TimeEditClick(Sender: TObject);
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

procedure TProfileSetupForm.MenuLineEditChange(Sender: TObject);
begin
 if MenuLineEdit.Value > 11 then MenuLineEdit.Value := 11;
 if MenuLineEdit.Value < 2 then MenuLineEdit.Value := 2;
 CategoryLineEdit.Text := IntToStr(13 - MenuLineEdit.Value);
end;

procedure TProfileSetupForm.POSMenuLineEditChange(Sender: TObject);
begin
 if POSMenuLineEdit.Value > 11 then POSMenuLineEdit.Value := 11;
 if POSMenuLineEdit.Value < 2 then POSMenuLineEdit.Value := 2;
 POSCategoryLineEdit.Text := IntToStr(13 - POSMenuLineEdit.Value);
end;

procedure TProfileSetupForm.PhoneOrderMenuLineEditChange(Sender: TObject);
begin
 if PhoneOrderMenuLineEdit.Value > 11 then PhoneOrderMenuLineEdit.Value := 11;
 if PhoneOrderMenuLineEdit.Value < 2 then PhoneOrderMenuLineEdit.Value := 2;
 PhoneOrderCategoryLineEdit.Text := IntToStr(13 - PhoneOrderMenuLineEdit.Value);
end;

procedure TProfileSetupForm.EditDblClick(Sender: TObject);
var
 Str: string;
begin
 if KeyboardForm.KeyboardPro(Str) then
    with Sender As TEdit do
     Text := Str;
end;

procedure TProfileSetupForm.AddressEditDblClick(Sender: TObject);
var
 Str: string;
begin
 if KeyboardForm.KeyboardPro(Str) then
    with Sender As TMemo do
     Text := Str;
end;

procedure TProfileSetupForm.ServiceChargeRateEditClick(Sender: TObject);
var
 NumStr: string;
begin
 with Sender As TStaticText do
  begin
   NumStr := Caption;
   if NumberPadForm.ReadNumberPro(NumStr, False, False, 'Surcharge Rate (%)', 0) then
      Caption := Format('%4.2f ', [StrToFloat(NumStr)]);
  end;
end;

procedure TProfileSetupForm.OtherChargeRateEditClick(Sender: TObject);
var
 NumStr: string;
begin
 with Sender As TStaticText do
  begin
   NumStr := Caption;
   if NumberPadForm.ReadNumberPro(NumStr, False, False, 'Other Charge Rate (%)', 0) then
      Caption := Format('%4.2f ', [StrToFloat(NumStr)]);
  end;
end;

procedure TProfileSetupForm.DefaultGSTRateEditClick(Sender: TObject);
var
 NumStr: string;
begin
 with Sender As TStaticText do
  begin
   NumStr := Caption;
   if NumberPadForm.ReadNumberPro(NumStr, False, False, 'Default GST Rate (%)', 0) then
      Caption := Format('%4.2f ', [StrToFloat(NumStr)]);
  end;
end;

procedure TProfileSetupForm.InitEditDblClick(Sender: TObject);
var
 Str: string;
begin
 if KeyboardForm.KeyboardPro(Str) then
    with Sender As TEdit do
     if Length(Str) >= 1 then
        Text := Str[1]
       else
        Text := '';
end;

procedure TProfileSetupForm.SalesPointsEditClick(Sender: TObject);
var
 NumStr: string;
begin
 with Sender As TStaticText do
  begin
   NumStr := Caption;
   if NumberPadForm.ReadNumberPro(NumStr, False, False, 'Sales Points', 0) then
      Caption := Format('%1d ', [Trunc(StrToFloat(NumStr))]);
  end;
end;

procedure TProfileSetupForm.PaymentPointsEditClick(Sender: TObject);
var
 NumStr: string;
begin
 with Sender As TStaticText do
  begin
   NumStr := Caption;
   if NumberPadForm.ReadNumberPro(NumStr, False, False, 'Payment Points', 0) then
      Caption := Format('%1d ', [Trunc(StrToFloat(NumStr))]);
  end;
end;

procedure TProfileSetupForm.ReachPointsEditClick(Sender: TObject);
var
 NumStr: string;
begin
 with Sender As TStaticText do
  begin
   NumStr := Caption;
   if NumberPadForm.ReadNumberPro(NumStr, False, False, 'Reward Points', 0) then
      Caption := Format('%1d ', [Trunc(StrToFloat(NumStr))]);
  end;
end;

procedure TProfileSetupForm.MaxDollarDiscountEditClick(Sender: TObject);
var
 NumStr: string;
begin
 with Sender As TStaticText do
  begin
   NumStr := Caption;
   if NumberPadForm.ReadNumberPro(NumStr, False, False, 'Max discount', 0) then
      Caption := Format('%4.2f ', [StrToFloat(NumStr)]);
  end;
end;

procedure TProfileSetupForm.MaxDiscountPercentageEditClick(Sender: TObject);
var
 NumStr: string;
begin
 with Sender As TStaticText do
  begin
   NumStr := Caption;
    if NumberPadForm.ReadNumberPro(NumStr, False, False, 'Max discount Rate (%)', 0) then
       begin
        if StrToFloat(NumStr) > 100 then
           MessageBoxForm.MessagePro('Discount rate can not be ' + NumStr + ' %', sErrorMsg)
          else
           Caption := Format('%4.2f ', [StrToFloat(NumStr)]);
       end;
  end;
end;

procedure TProfileSetupForm.PathSearchButtonClick(Sender: TObject);
begin
 if BackupPathEdit.Text <> '' then
    OpenDialog.FileName := ExtractFileName(BackupPathEdit.Text);
 if OpenDialog.Execute then
    BackupPathEdit.Text := OpenDialog.FileName;
end;

procedure TProfileSetupForm.FrequencyRadioGroupClick(Sender: TObject);
begin
 BackupTimeComboBox.Enabled := AutoBackupCheckBox.Checked and (FrequencyRadioGroup.ItemIndex = 0);
 BackupOnceTimeEdit.Enabled := AutoBackupCheckBox.Checked and (FrequencyRadioGroup.ItemIndex = 1);
end;

procedure TProfileSetupForm.AutoBackupCheckBoxClick(Sender: TObject);
begin
 BackupPathEdit.Enabled := AutoBackupCheckBox.Checked;
 PathSearchButton.Enabled := AutoBackupCheckBox.Checked;
 FrequencyRadioGroup.Enabled := AutoBackupCheckBox.Checked;
 BackupTimeComboBox.Enabled := AutoBackupCheckBox.Checked and (FrequencyRadioGroup.ItemIndex = 0);
 BackupOnceTimeEdit.Enabled := AutoBackupCheckBox.Checked and (FrequencyRadioGroup.ItemIndex = 1);
end;

procedure TProfileSetupForm.PasswordCheckBoxClick(Sender: TObject);
begin
 AutoLogoutCheckBox.Enabled := Not PasswordCheckBox.Checked;
 TimeOutComboBox.Enabled := AutoLogoutCheckBox.Enabled and AutoLogOutCheckBox.Checked;
end;

procedure TProfileSetupForm.AutoLogOutCheckBoxClick(Sender: TObject);
begin
 TimeOutComboBox.Enabled := AutoLogoutCheckBox.Checked;
end;

procedure TProfileSetupForm.MinimumChargePerPersonEditClick(Sender: TObject);
var
 NumStr: string;
begin
 with Sender As TStaticText do
  begin
   NumStr := Caption;
   if NumberPadForm.ReadNumberPro(NumStr, False, True, 'Minimum Charge', 0) then
      Caption := Format('%4.2f ', [StrToFloat(NumStr)]);
  end;
end;

procedure TProfileSetupForm.MinimumChargeItemCodeEditClick(Sender: TObject);
var
 ItemCode: string;
begin
 if ItemSelectForm.ItemSelectPro(ItemCode) then
    MinimumChargeItemCodeEdit.Caption := ItemCode
end;

procedure TProfileSetupForm.MinimumChargeComboBoxChange(Sender: TObject);
begin
 MinimumChargeItemCodeLabel.Visible := MinimumChargeComboBox.ItemIndex >= 1;
 MinimumChargeItemCodeEdit.Visible := MinimumChargeComboBox.ItemIndex >= 1;
 MinimumChargePerPersonLabel.Visible := MinimumChargeComboBox.ItemIndex = 1;
 MinimumChargePerPersonEdit.Visible := MinimumChargeComboBox.ItemIndex = 1;
end;

procedure TProfileSetupForm.AutoAddDeliveryChargeForPhoneOrderCheckBoxClick(Sender: TObject);
begin
 DeliveryChargeItemCodeEdit.Enabled := AutoAddDeliveryChargeForPhoneOrderCheckBox.Checked;
end;

procedure TProfileSetupForm.DeliveryChargeItemCodeEditClick(Sender: TObject);
var
 ItemCode: string;
begin
 if ItemSelectForm.ItemSelectPro(ItemCode) then
    DeliveryChargeItemCodeEdit.Caption := ItemCode
end;

procedure TProfileSetupForm.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TProfileSetupForm.FormShow(Sender: TObject);
begin
 Width := PageControl.Width + 28;
 Height := CancelButton.Top + 86;
 Top := (MainForm.ClientHeight - Height - MainForm.bsSkinMainMenuBar.Height) div 2;
 Left := (MainForm.ClientWidth - Width) div 2;
 BusinessRegistNameLabel.Caption := 'A B N';
 ReadCompanyDetail;
 CompanyNameEdit.SetFocus;
end;

procedure TProfileSetupForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action := caFree;
 ProfileSetupForm := NIL;
end;

procedure TProfileSetupForm.ProfileSetupPro;
begin
  Application.CreateForm(TProfileSetupForm, ProfileSetupForm);
  ProfileSetupForm.ShowModal;
  ProfileSetupForm.Free;
end;

end.
