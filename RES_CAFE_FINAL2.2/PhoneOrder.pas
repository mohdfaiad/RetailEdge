unit PhoneOrder;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, StdCtrls, ExtCtrls, Buttons, Grids, UtilUnit, Db, DataUnit,
  ADODB, CommDrv, bsSkinCtrls, PanelButton, XiButton;

type
  TPhoneOrderForm = class(TForm)
    StringGrid: TStringGrid;
    Query: TADOQuery;
    MenuQuery: TADOQuery;
    CategoryQuery: TADOQuery;
    BackPanel: TbsSkinPanel;
    TitlePanel: TbsSkinPanel;
    bsSkinStdLabel1: TbsSkinStdLabel;
    OrderDateEdit: TbsSkinLabel;
    bsSkinStdLabel4: TbsSkinStdLabel;
    VIPNoEdit: TbsSkinLabel;
    bsSkinStdLabel5: TbsSkinStdLabel;
    OrderNoEdit: TbsSkinLabel;
    BillKindEdit: TbsSkinLabel;
    bsSkinStdLabel7: TbsSkinStdLabel;
    ServiceEdit: TbsSkinLabel;
    StringGridPanel: TbsSkinPanel;
    TotalPanel: TbsSkinPanel;
    SummaryPanel: TbsSkinPanel;
    AmountLabel: TbsSkinStdLabel;
    DiscountTitleLabel: TbsSkinStdLabel;
    RewardPointsLabel: TbsSkinStdLabel;
    OtherChargeLabel: TbsSkinStdLabel;
    TotalLabel: TbsSkinStdLabel;
    GSTLabel: TbsSkinStdLabel;
    AmountEdit: TbsSkinStdLabel;
    DiscountEdit: TbsSkinStdLabel;
    RewardPointsDiscountEdit: TbsSkinStdLabel;
    ServiceChargeEdit: TbsSkinStdLabel;
    OtherChargeEdit: TbsSkinStdLabel;
    TotalEdit: TbsSkinStdLabel;
    GSTEdit: TbsSkinStdLabel;
    ServiceChargeLabel: TbsSkinStdLabel;
    LangurageButton: TXiButton;
    SplitLineButton: TXiButton;
    ZoomButton: TXiButton;
    EditPanel: TbsSkinPanel;
    bsSkinStdLabel2: TbsSkinStdLabel;
    CustomerNameEdit: TbsSkinLabel;
    ControlButton1: TXiButton;
    ControlButton2: TXiButton;
    ControlButton3: TXiButton;
    ControlButton4: TXiButton;
    ControlButton5: TXiButton;
    ControlButton6: TXiButton;
    ControlButton7: TXiButton;
    ControlButton8: TXiButton;
    ControlButton9: TXiButton;
    ControlButton10: TXiButton;
    ControlButton11: TXiButton;
    ControlButton12: TXiButton;
    ControlButton13: TXiButton;
    ControlButton14: TXiButton;
    ControlButton15: TXiButton;
    ControlButton16: TXiButton;
    ControlButton17: TXiButton;
    ControlButton18: TXiButton;
    ControlButton19: TXiButton;
    ControlButton20: TXiButton;
    ControlButton21: TXiButton;
    ControlButton22: TXiButton;
    ControlButton23: TXiButton;
    ControlButton24: TXiButton;
    MenuPanel: TbsSkinPanel;
    Menu1: TPanelButton;
    Menu2: TPanelButton;
    Menu3: TPanelButton;
    Menu4: TPanelButton;
    Menu5: TPanelButton;
    Menu6: TPanelButton;
    Menu7: TPanelButton;
    Menu8: TPanelButton;
    Menu9: TPanelButton;
    Menu10: TPanelButton;
    Menu11: TPanelButton;
    Menu12: TPanelButton;
    Menu13: TPanelButton;
    Menu14: TPanelButton;
    Menu15: TPanelButton;
    Menu16: TPanelButton;
    Menu17: TPanelButton;
    Menu18: TPanelButton;
    Menu19: TPanelButton;
    Menu20: TPanelButton;
    Menu21: TPanelButton;
    Menu22: TPanelButton;
    Menu23: TPanelButton;
    Menu24: TPanelButton;
    Menu25: TPanelButton;
    Menu26: TPanelButton;
    Menu27: TPanelButton;
    Menu28: TPanelButton;
    Menu29: TPanelButton;
    Menu30: TPanelButton;
    Menu31: TPanelButton;
    Menu32: TPanelButton;
    Menu33: TPanelButton;
    Menu34: TPanelButton;
    Menu35: TPanelButton;
    Menu36: TPanelButton;
    Menu37: TPanelButton;
    Menu38: TPanelButton;
    PageUpButton: TPanelButton;
    PageDownButton: TPanelButton;
    Menu39: TPanelButton;
    Menu40: TPanelButton;
    Menu41: TPanelButton;
    Menu42: TPanelButton;
    Menu47: TPanelButton;
    Menu50: TPanelButton;
    Menu49: TPanelButton;
    Menu48: TPanelButton;
    Menu46: TPanelButton;
    Menu45: TPanelButton;
    Menu44: TPanelButton;
    Menu43: TPanelButton;
    CategoryPanel: TbsSkinPanel;
    Category1: TPanelButton;
    Category2: TPanelButton;
    Category3: TPanelButton;
    Category4: TPanelButton;
    Category5: TPanelButton;
    Category6: TPanelButton;
    Category7: TPanelButton;
    Category8: TPanelButton;
    Category9: TPanelButton;
    Category10: TPanelButton;
    Category11: TPanelButton;
    Category12: TPanelButton;
    Category13: TPanelButton;
    Category14: TPanelButton;
    Category15: TPanelButton;
    Category16: TPanelButton;
    Category17: TPanelButton;
    Category18: TPanelButton;
    Category19: TPanelButton;
    Category20: TPanelButton;
    Category21: TPanelButton;
    Category22: TPanelButton;
    Category23: TPanelButton;
    Category24: TPanelButton;
    Category25: TPanelButton;
    Category26: TPanelButton;
    Category27: TPanelButton;
    Category28: TPanelButton;
    Category29: TPanelButton;
    Category30: TPanelButton;
    Category31: TPanelButton;
    Category32: TPanelButton;
    Category33: TPanelButton;
    Category34: TPanelButton;
    Category35: TPanelButton;
    Category36: TPanelButton;                                                                       
    Category37: TPanelButton;
    Category38: TPanelButton;
    Category39: TPanelButton;
    Category40: TPanelButton;
    Category41: TPanelButton;
    Category42: TPanelButton;
    CategoryPageUpButton: TPanelButton;
    CategoryPageDownButton: TPanelButton;
    procedure InitControlButtons;
    procedure InitFixedButtons;
    procedure SetTotalPanelLabelPosition;
    procedure PostDataToSecondDisplayPro;
    procedure InitMenuPanel;
    procedure InitCategoryPanel;
    procedure OpenCategoryQuery(SQLStr: string);
    procedure OpenMenuQuery(SQLStr: string);
    procedure OpenCategory;
    procedure OpenMenu(Category: string);
    procedure ProcessCategoryButtonTouch(Position: integer);
    procedure ProcessInstruction(Buff: InstructionBuffType);
    procedure ProcessMenuButtonTouch(Position: integer);
    procedure AssignCategoryKeyBoard;
    procedure AssignMenuKeyBoard;
    procedure InitCells(ARow: integer);
    procedure InitStringGrid;
    procedure InitForm;
    procedure StringGridDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CancelButtonClick(Sender: TObject);
    function  OpenQuery(SQLStr: string): boolean;
    procedure FormShow(Sender: TObject);
    procedure MoveToNextCell;
    procedure StringGridClick(Sender: TObject);
    procedure DeleteLine(CurRow: integer);
    function  FindLastRow: integer;
    procedure CopyMealPackage;
    function  CheckCells(ACol, ARow: integer): boolean;
    procedure CalcAmount;
    function  TestItemCode(ItemCode: string; var PriceFlag: integer): boolean;
    function  OpenHeadQuery(OrderNo: string): boolean;
    procedure ReadHeadData;
    function  OpenItemQuery(OrderNo: string): boolean;
    procedure ReadItemData;
    function  SaveOrderHeadTable(OrderNo: string): boolean;
    function  SaveOrderItemTable(OrderNo: string): boolean;
    function  UpdateBookingMessage: boolean;
    function  CheckOrderStatus(OrderNo: string): boolean;
    procedure BalanceButtonClick(Sender: TObject);
    function  SaveData(OrderNo: string): boolean;
    procedure PrintJobListPro(OrderNo: string);
    function  SaveOrderPro(var OrderNo: string): boolean;
    procedure ServiceEditKeyPress(Sender: TObject; var Key: Char);
    procedure ProcessDiscount;
    function  VoidItemPro(ARow: integer; VoidReasonCode: string): integer;
    procedure VoidItemButtonClick(Sender: TObject);
    function  GetLastNonInstructionItem: integer;
    procedure QtyButtonClick(Sender: TObject);
    procedure PageUpButtonClick(Sender: TObject);
    procedure PageDownButtonClick(Sender: TObject);
    procedure MenuButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SetDescription(ARow: integer);
    procedure InstructionButtonClick(Sender: TObject);
    procedure PriceButtonClick(Sender: TObject);
    procedure DiscountButtonClick(Sender: TObject);
    procedure CategoryPageUpButtonClick(Sender: TObject);
    procedure CategoryPageDownButtonClick(Sender: TObject);
    procedure CategoryButtonClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ConvertLangurage(Firstrow, EndRow: integer);
    procedure LangurageButtonClick(Sender: TObject);
    procedure ServiceEditClick(Sender: TObject);
    procedure UpdatePoleMessage;
    procedure InsertLine(CurrentLine: integer);
    procedure SplitLineButtonClick(Sender: TObject);
    procedure InsertItemButtonClick(Sender: TObject);
    procedure MoreFunctionButtonClick(Sender: TObject);
    procedure WeightButtonClick(Sender: TObject);
    procedure SpellInstructionButtonClick(Sender: TObject);
    procedure AssignDriverButtonClick(Sender: TObject);
    procedure ZoomButtonClick(Sender: TObject);
    function  GetSurchargeRate: double;
    function  GetOtherChargeRate: double;
    procedure MenuGroupButtonClick(Sender: TObject);
    procedure RewardPointsProcess;
    procedure PickupOrDeliveryButtonClick(Sender: TObject);
    procedure SearchCustomerButtonClick(Sender: TObject);
    procedure ReadReservationHead(BookingNo: string);
    procedure ReadReservationItem(BookingNo: string);
    procedure ReadReservationDetailPro(BookingNo: string);
    procedure DisplayBillKind;
    procedure DisplayVIPNamePro(VIPNo: integer);
    function  PhoneOrderPro(VIPNo, OrderType: integer; OrderNo, CustomerName, BookingNo: string): boolean;
    procedure ViewCustomerDetailButtonClick(Sender: TObject);
    procedure DepositButtonClick(Sender: TObject);
    procedure CustomerOrderHistoryButtonClick(Sender: TObject);
    procedure VoidAllItemButtonClick(Sender: TObject);
    procedure SendToSecurityPortPro(OperationMessage, PayBy1, PayBy2: string; Payment1, Payment2, Rounding, Change: double);
    function  CheckDeliveryCharge: boolean;
    procedure AddDeliveryCharge;
    procedure StringGridDblClick(Sender: TObject);
  private { Private declarations }
  public  { Public declarations }
    CurrentCol, CurrentRow, StatusFlag, CategoryCurrentPage, MenuCurrentPage,
    CategoryRowCount, MenuCount, CategoryCount, LastMenuPosition: integer;
    Changed, Credit, Langurage, CurrentPriceIncludesGST: boolean;
    sOrderNo, sBookingNo, InvoiceNo, MachineName, KeyBuff, MenuGroupCode,
    PresetDiscountCode, sCustomerName, DiscountOperator: string;
    OrderDate, DueTime: TDateTime;
    EditFlag, VoidFlag, PrintFlag, CheckListPrinted, SentToKitchen,
    DiscountFlag, OrderInstruction: array [1..500] of Boolean;
    Instruction, PriceSelect: array [1..500] of integer;
    PaidQty: array [1..500] of double;
    OpenPrice: array [1..500] of Boolean;
    VoidReason: array [1..500] of string;
    OrderOperator: array [1..500] of string;
    OriginalPrice: array [1..500] of double;
    SecondScreenDescription: array [1..500] of string;
    DiscountRate, PaidAmount, Tips, Surcharge, CurrentServiceChargeRate,
    CurrentOtherChargeRate, DollarDiscount, PreAmount, CurrentGSTRate,
    RewardPointsDiscount : double;
    DiscountKind, PreItemCount, sVIPNo, OrderType: integer;
    ReturnFlag: boolean;
  end;

var
  PhoneOrderForm: TPhoneOrderForm;

implementation

uses PrintJobCard, StaffList, MealPackage, NumPad, MainMenu, Instruction,
     PriceSelect, MessageBox, InstructionList, MenuPrintJobList, MenuSetup,
     VIPList, Discount, ShowIngredients, TimePanel, SendToScreen, Keyboard,
     MenuGroupSelect, RewardPoints, PhoneOrderSelect, VIPEdit, PrintCheckList,
     DiscountRateSelect, Deposit, PhoneFunctions, SaleshistoryDetail,
     CustomerLastOrderDetail, PrintOrder, PrintOrder1, PrintOrder2,
     ReadCustomerName, ViewVIPDetail, VoidReasonSelect, PrintJobListControl,
     PrintOrder3, SubMenu;

{$R *.DFM}

procedure TPhoneOrderForm.InitControlButtons;
var
 SQLStr, ButtonName: string;
 I, Position, ButtonWidth, ButtonHeight: integer;
begin
 ButtonWidth := 90;
 ButtonHeight := 55;
 for I := 1 to 24 do
  begin
   ButtonName := 'ControlButton' + IntToStr(I);
   with TXiButton(FindComponent(ButtonName)) do
     Visible := False;
  end;
 SQLStr := 'Select * From ButtonsTable Where Disable = 0 and CanRelocate <> 0 and ' +
           'Kind=' + IntToStr(sPhoneOrderButton) + ' Order By ButtonName';
 OpenQuery(SQLStr);
 if Query.Active and (Query.RecordCount > 0) then
    begin
     Query.First;
     while Not Query.EOF do
      begin
       Position := Query.FieldByName('Position').AsInteger;
       ButtonName := 'ControlButton' + IntToStr(Position);
       with TXiButton(FindComponent(ButtonName)) do
        begin
         Ctl3D := True;
         case Query.FieldByName('ButtonColor').AsInteger of
          bcNeoDesert: ColorScheme := csNeoDesert;
          bcNeoSky:    ColorScheme := csNeoSky;
          bcNeoGrass:  ColorScheme := csNeoGrass;
          bcNeoSilver: ColorScheme := csNeoSilver;
          bcNeoRose:   ColorScheme := csNeoRose;
          bcNeoSun:    ColorScheme := csNeoSun;
          bcDesert:    ColorScheme := csDesert;
          bcGrass:     ColorScheme := csGrass;
          bcSky:       ColorScheme := csSky;
          bcSun:       ColorScheme := csSun;
          bcRose:      ColorScheme := csRose;
          bcSilver:    ColorScheme := csSilver;
         end;
         Caption := Query.FieldByName('Caption').AsString;
         Font.Name := Query.FieldByName('FontName').AsString;
         Font.Size := Query.FieldByName('FontSize').AsInteger;
         Font.Color := clBlack;
         Font.Style := [];
         if Query.FieldByName('FontBold').AsBoolean then Font.Style := Font.Style + [fsBold];
         if Query.FieldByName('FontItalic').AsBoolean then Font.Style := Font.Style + [fsItalic];
         if Query.FieldByName('FontUnderline').AsBoolean then Font.Style := Font.Style + [fsUnderline];
         if Query.FieldByName('FontStrikeout').AsBoolean then Font.Style := Font.Style + [fsStrikeout];
         case Query.FieldByName('ButtonSize').AsInteger of
          sButtonNormalSize: begin Height := ButtonHeight; Width := ButtonWidth; end;
          sButtonDoubleWidth: begin Height := ButtonHeight; Width := ButtonWidth * 2 + 1; end;
          sButtonDoubleHeight: begin Height := ButtonHeight * 2 + 1; Width := ButtonWidth end;
          sButtonDoubleWidthDoubleHeight: begin Height := ButtonHeight * 2 + 1; Width := ButtonWidth * 2 + 1 end;
         end;
         Visible := True;
         case Query.FieldByName('Event').AsInteger of
          poQtyButtonClick: OnClick := QtyButtonClick;
          poPriceButtonClick: OnClick := PriceButtonClick;
          poDiscountButtonClick: OnClick := DiscountButtonClick;
          poSpellInstructionButtonClick: OnClick := SpellInstructionButtonClick;
          poAssignDriverButtonClick: OnClick := AssignDriverButtonClick;
          poBalanceButtonClick: OnClick := BalanceButtonClick;
          poWeightButtonClick: OnClick := WeightButtonClick;
          poVoidItemButtonClick: OnClick := VoidItemButtonClick;
          poInsertItemButtonClick: OnClick := InsertItemButtonClick;
          poInstructionButtonClick: OnClick := InstructionButtonClick;
          poMenuGroupButtonClick: OnClick := MenuGroupButtonClick;
          poMoreFunctionButtonClick: OnClick := MoreFunctionButtonClick;
          poSearchCustomerButtonClick: OnClick := SearchCustomerButtonClick;
          poPickupOrDeliveryButtonClick: OnClick := PickupOrDeliveryButtonClick;
          poVoidAllItemButtonClick: OnClick := VoidAllItemButtonClick;
          poViewCustomerDetailButtonClick: OnClick := ViewCustomerDetailButtonClick;
          poCancelButtonClick: OnClick := CancelButtonClick;
          poDepositButtonClick: OnClick := DepositButtonClick;
          poCustomerOrderHistoryButtonClick: OnClick := CustomerOrderHistoryButtonClick;
         end;
         BringToFront;
        end;
       Query.Next;
      end;
     Query.Close;
    end;
end;

procedure TPhoneOrderForm.InitFixedButtons;
var
 SQLStr, ButtonName: string;
begin
 SQLStr := 'Select * From ButtonsTable Where CanRelocate = 0 and ' +
           'Kind=' + IntToStr(sPhoneOrderButton) + ' ' +
           'Order By ButtonName';
 OpenQuery(SQLStr);
 if Query.Active and (Query.RecordCount > 0) then
    begin
     Query.First;
     while Not Query.EOF do
      begin
       ButtonName := Query.FieldByName('ButtonName').AsString;
       with TXiButton(FindComponent(ButtonName)) do
        begin
         case Query.FieldByName('ButtonColor').AsInteger of
          bcNeoDesert: ColorScheme := csNeoDesert;
          bcNeoSky:    ColorScheme := csNeoSky;
          bcNeoGrass:  ColorScheme := csNeoGrass;
          bcNeoSilver: ColorScheme := csNeoSilver;
          bcNeoRose:   ColorScheme := csNeoRose;
          bcNeoSun:    ColorScheme := csNeoSun;
          bcDesert:    ColorScheme := csDesert;
          bcGrass:     ColorScheme := csGrass;
          bcSky:       ColorScheme := csSky;
          bcSun:       ColorScheme := csSun;
          bcRose:      ColorScheme := csRose;
          bcSilver:    ColorScheme := csSilver;
         end;
         Caption := Query.FieldByName('Caption').AsString;
         Font.Name := Query.FieldByName('FontName').AsString;
         Font.Size := Query.FieldByName('FontSize').AsInteger;
         Font.Color := clBlack;
         Font.Style := [];
         if Query.FieldByName('FontBold').AsBoolean then Font.Style := Font.Style + [fsBold];
         if Query.FieldByName('FontItalic').AsBoolean then Font.Style := Font.Style + [fsItalic];
         if Query.FieldByName('FontUnderline').AsBoolean then Font.Style := Font.Style + [fsUnderline];
         if Query.FieldByName('FontStrikeout').AsBoolean then Font.Style := Font.Style + [fsStrikeout];
         BringToFront;
        end;
       Query.Next;
      end;
     Query.Close;
    end;
end;

procedure TPhoneOrderForm.SetTotalPanelLabelPosition;
var
 TotalLabels, SpaceLength, LabelPosition: integer;
begin
 TotalLabels := 4;
 if LoyaltyAwardAvailible then Inc(TotalLabels);
 if AutoSurcharge then Inc(TotalLabels);
 if OtherChargeEnable then Inc(TotalLabels);
 SpaceLength := (SummaryPanel.Height - TotalLabels * 17 - 4) div (TotalLabels + 1);
 if SpaceLength = 0 then
    LabelPosition := SpaceLength + 4
   else
    LabelPosition := SpaceLength + 3;
 AmountLabel.Top := LabelPosition + 4;
 AmountEdit.Top := LabelPosition;
 LabelPosition := LabelPosition + SpaceLength + 17;
 DiscountTitleLabel.Top := LabelPosition + 4;
 DiscountEdit.Top := LabelPosition;
 LabelPosition := LabelPosition + SpaceLength + 17;
 if LoyaltyAwardAvailible then
    begin
     RewardPointsLabel.Top := LabelPosition + 4;
     RewardPointsDiscountEdit.Top := LabelPosition;
     LabelPosition := LabelPosition + SpaceLength + 17;
    end
   else
    begin
     RewardPointsLabel.Visible := False;
     RewardPointsDiscountEdit.Visible := False;
    end;
 if AutoSurcharge then
    begin
     ServiceChargeLabel.Top := LabelPosition + 4;
     ServiceChargeEdit.Top := LabelPosition;
     LabelPosition := LabelPosition + SpaceLength + 17;
    end
   else
    begin
     ServiceChargeLabel.Visible := False;
     ServiceChargeEdit.Visible := False;
    end;
 if OtherChargeEnable then
    begin
     OtherChargeLabel.Top := LabelPosition + 4;
     OtherChargeEdit.Top := LabelPosition;
     LabelPosition := LabelPosition + SpaceLength + 17;
    end
   else
    begin
     OtherChargeLabel.Visible := False;
     OtherChargeEdit.Visible := False;
    end;
 TotalLabel.Top := LabelPosition + 2;
 TotalEdit.Top := LabelPosition;
 LabelPosition := LabelPosition + SpaceLength + 17;
 GSTLabel.Top := LabelPosition + 4;
 GSTEdit.Top := LabelPosition;
end;

procedure TPhoneOrderForm.PostDataToSecondDisplayPro;
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
       SecondDisplayForm.StringGrid.Cells[3, I] := StringGrid.Cells[6, I];
      end;
  end;
end;

procedure TPhoneOrderForm.InitMenuPanel;
var
 I: integer;
 ButtonName: string;
begin
 for I := 1 to 50 do
  begin
   ButtonName := 'Menu' + IntToStr(I);
   with TPanel(FindComponent(ButtonName)) do
    Visible := I <= MenuCount;
  end;
 //MenuPanel.Top := 3;
 //MenuPanel.Left := 568;
 //MenuPanel.Height := PhoneOrderMenuLine * 57 + 9;
 //PageUpButton.Top := (PhoneOrderMenuLine - 1) * 57 + 6;
 //PageDownButton.Top := PageUpButton.Top;
end;

procedure TPhoneOrderForm.InitCategoryPanel;
var
 I: integer;
 ButtonName: string;
begin
 for I := 1 to 11 do
  begin
   ButtonName := 'Category' + IntToStr(I);
   with TPanel(FindComponent(ButtonName)) do
    Visible := I <= CategoryCount;
  end;
 //CategoryPanel.Top := MenuPanel.Height + 5;
 //CategoryPanel.Left := 568;
 //CategoryPanel.Height := PhoneOrderCategoryLine * 57 + 9;
 //CategoryPageUpButton.Top := (PhoneOrderCategoryLine - 1) * 57 + 6;
 //CategoryPageDownButton.Top := CategoryPageUpButton.Top;
end;

procedure TPhoneOrderForm.OpenCategoryQuery(SQLStr: string);
begin
 Screen.Cursor := crHourGlass;
 with CategoryQuery do
  begin
   Active := False;
   Connection := Dataform.ADOConnection;
   SQL.Clear;
   SQL.Add(SQLStr);
   try
    Active := True;
   finally
    Screen.Cursor := crDefault;
   end;
   CategoryRowCount := RecordCount;
   CategoryCurrentPage := 1;
  end;
end;

procedure TPhoneOrderForm.OpenMenuQuery(SQLStr: string);
begin
 Screen.Cursor := crHourGlass;
 with MenuQuery do
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
   MenuCurrentPage := 1;
   if RecordCount > 0 then
      begin
       Last;
       LastMenuPosition := FieldByName('MenuPosition').AsInteger;
      end
     else
      LastMenuPosition := 0;
  end;
end;

procedure TPhoneOrderForm.OpenCategory;
var
 SQLStr: string;
begin
 SQLStr := 'Select Code, Category, ButtonColor, FontName, FontColor, FontSize, ' +
           'FontBold, FontItalic, FontUnderline, FontStrikeout, Category1, ' +
           'ButtonColor1, FontName1, FontColor1, FontSize1, FontBold1, FontItalic1, ' +
           'FontUnderline1, FontStrikeout1 ' +
           'From Category ' +
           'Where MenuGroupCode=' + Chr(39) + CheckQuotes(MenuGroupCode) + Chr(39) +
           ' and ShowOnPhoneOrderMenu <> 0 Order By Code';
 OpenCategoryQuery(SQLStr);
end;

procedure TPhoneOrderForm.OpenMenu(Category: string);
var
 SQLStr: string;
begin
 SQLStr := 'Select MenuItem.ItemCode, Description1, Description2, ButtonColor, FontName, ' +
           'FontColor, FontSize, FontBold, FontItalic, FontUnderline, FontStrikeout, ' +
           'ButtonColor1, FontName1, FontColor1, FontSize1, FontBold1, FontItalic1, ' +
           'FontUnderline1, FontStrikeout1, SubCategory, PhoneOrderPosition As MenuPosition,Scalable ' +
           'From MenuItem Left Join ' +
           '(Select ItemCode, SubCategory From SubMenuLinkHead) As SubMenuTable ' +
           'On MenuItem.ItemCode=SubMenuTable.ItemCode ' +
           'Where (Active <> 0) and (OnlyShowOnSubMenu = 0) and ' +
           'Category=' + Chr(39) + CheckQuotes(Category) + Chr(39) +
           ' Order By PhoneOrderPosition';
 OpenMenuQuery(SQLStr);
end;

procedure TPhoneOrderForm.AssignMenuKeyBoard;
var
 I, MenuPosition: integer;
 ButtonName: string;
begin
 for I := 1 to MenuCount do
  begin
   ButtonName := 'Menu' + IntToStr(I);
   MenuPosition := (MenuCurrentPage - 1) * MenuCount + I;
   MenuQuery.Locate('MenuPosition', IntToStr(MenuPosition), [loPartialKey]);
   with TPanelButton(FindComponent(ButtonName)) do
    if MenuQuery.FieldByName('MenuPosition').AsInteger = MenuPosition then
       begin
        if Langurage or (MenuQuery.FieldByName('Description2').AsString = '') then
           begin
            Caption := CopyDescription(MenuQuery.FieldByName('Description1').AsString);
            Color := MenuQuery.FieldByName('ButtonColor').AsInteger;
            Font.Size := MenuQuery.FieldByName('FontSize').AsInteger;;
            Font.Name := MenuQuery.FieldByName('FontName').AsString;
            Font.Color := MenuQuery.FieldByName('FontColor').AsInteger;
            Font.Style := [];
            if MenuQuery.FieldByName('FontBold').AsBoolean then
               Font.Style := Font.Style + [fsBold];
            if MenuQuery.FieldByName('FontItalic').AsBoolean then
               Font.Style := Font.Style + [fsItalic];
            if MenuQuery.FieldByName('FontUnderline').AsBoolean then
               Font.Style := Font.Style + [fsUnderline];
            if MenuQuery.FieldByName('FontStrikeout').AsBoolean then
               Font.Style := Font.Style + [fsStrikeout];
           end
          else
           begin
            Caption := CopyDescription(MenuQuery.FieldByName('Description2').AsString);
            Color := MenuQuery.FieldByName('ButtonColor1').AsInteger;
            Font.Size := MenuQuery.FieldByName('FontSize1').AsInteger;;
            Font.Name := MenuQuery.FieldByName('FontName1').AsString;
            Font.Color := MenuQuery.FieldByName('FontColor1').AsInteger;
            Font.Style := [];
            if MenuQuery.FieldByName('FontBold1').AsBoolean then
               Font.Style := Font.Style + [fsBold];
            if MenuQuery.FieldByName('FontItalic1').AsBoolean then
               Font.Style := Font.Style + [fsItalic];
            if MenuQuery.FieldByName('FontUnderline1').AsBoolean then
               Font.Style := Font.Style + [fsUnderline];
            if MenuQuery.FieldByName('FontStrikeout1').AsBoolean then
               Font.Style := Font.Style + [fsStrikeout];
           end;
       end
      else
       begin
        Caption := '';
        Color := $00D9D9D9;
       end;
  end;
end;

procedure TPhoneOrderForm.AssignCategoryKeyBoard;
var
 I: integer;
 ButtonName: string;
begin
 CategoryQuery.First;
 CategoryQuery.MoveBy((CategoryCurrentPage - 1) * CategoryCount);
 for I := 1 to CategoryCount do
  begin
   ButtonName := 'Category' + IntToStr(I);
   with TPanelButton(FindComponent(ButtonName)) do
    if Not CategoryQuery.EOF then
       begin
        if Langurage or (CategoryQuery.FieldByName('Category1').AsString = '') then
           begin
            Caption := CopyDescription(CategoryQuery.FieldByName('Category').AsString);
            Color := CategoryQuery.FieldByName('ButtonColor').AsInteger;
            Font.Size := CategoryQuery.FieldByName('FontSize').AsInteger;;
            Font.Name := CategoryQuery.FieldByName('FontName').AsString;
            Font.Color := CategoryQuery.FieldByName('FontColor').AsInteger;
            Font.Style := [];
            if CategoryQuery.FieldByName('FontBold').AsBoolean then
               Font.Style := Font.Style + [fsBold];
            if CategoryQuery.FieldByName('FontItalic').AsBoolean then
               Font.Style := Font.Style + [fsItalic];
            if CategoryQuery.FieldByName('FontUnderline').AsBoolean then
               Font.Style := Font.Style + [fsUnderline];
            if CategoryQuery.FieldByName('FontStrikeout').AsBoolean then
               Font.Style := Font.Style + [fsStrikeout];
           end
          else
           begin
            Caption := CopyDescription(CategoryQuery.FieldByName('Category1').AsString);
            Color := CategoryQuery.FieldByName('ButtonColor1').AsInteger;
            Font.Size := CategoryQuery.FieldByName('FontSize1').AsInteger;;
            Font.Name := CategoryQuery.FieldByName('FontName1').AsString;
            Font.Color := CategoryQuery.FieldByName('FontColor1').AsInteger;
            Font.Style := [];
            if CategoryQuery.FieldByName('FontBold1').AsBoolean then
               Font.Style := Font.Style + [fsBold];
            if CategoryQuery.FieldByName('FontItalic1').AsBoolean then
               Font.Style := Font.Style + [fsItalic];
            if CategoryQuery.FieldByName('FontUnderline1').AsBoolean then
               Font.Style := Font.Style + [fsUnderline];
            if CategoryQuery.FieldByName('FontStrikeout1').AsBoolean then
               Font.Style := Font.Style + [fsStrikeout];
           end;
        CategoryQuery.Next;
       end
      else
       begin
        Caption := '';
        Color := $00D9D9D9;
        Visible := True;
       end;
  end;
end;

procedure TPhoneOrderForm.ProcessCategoryButtonTouch(Position: integer);
var
 Category: string;
begin
 CategoryQuery.First;
 CategoryQuery.MoveBy((CategoryCurrentPage - 1) * CategoryCount + Position - 1);
 Category := CategoryQuery.FieldByName('Category').AsString;
 OpenMenu(Category);
 AssignMenuKeyBoard;
 if TitlePanel.Enabled then StringGrid.SetFocus;
end;

procedure TPhoneOrderForm.ProcessInstruction(Buff: InstructionBuffType);
var
 I, K, FirstRow, EndRow, CurRow: integer;
begin
 CurRow := CurrentRow;
 I := CurRow + 1;
 FirstRow := I;
 for K := 1 to 50 do
  if (Buff.Code[K] <> '') and (I <= 500) then
     begin
      InsertLine(I);
      StringGrid.Cells[1, I] := Buff.Description1[K];
      StringGrid.Cells[2, I] := Format('%4.2f', [Buff.Qty[K]]);
      StringGrid.Cells[3, I] := Format('%4.2f', [Buff.Price[K]]);
      StringGrid.Cells[7, I] := Buff.Code[K];
      Instruction[I] := Buff.Condition[K];
      DiscountFlag[I] := Buff.Discount[K];
      OriginalPrice[I] := Buff.Price[K];
      if (DiscountFlag[I] or (ForceVIPDiscount and (VIPNoEdit.Caption <>'')))
         and (DiscountRate >= 0.01) then
         StringGrid.Cells[5, I] := Format('%4.2f', [DiscountRate])
        else
         StringGrid.Cells[5, I] := '';
      StringGrid.Cells[6, I] := Format('%4.2f', [Buff.TaxRate[K]]);
      SetDescription(I);
      I := I + 1;
     end;
 EndRow := I;
 ConvertLangurage(FirstRow, EndRow);
end;

procedure TPhoneOrderForm.ProcessMenuButtonTouch(Position: integer);
var
 ItemCode, MainItemDescription1, MainItemDescription2,ScalableItem: string;
 Buff: InstructionBuffType;
 MenuPosition: integer;
 SubMenuForm: TSubMenuForm;
 DirectLinkSubMenu: boolean;
 NumberOfChoice: Integer;
begin
 MenuPosition := (MenuCurrentPage - 1) * MenuCount + Position;
 MenuQuery.Locate('MenuPosition', IntToStr(MenuPosition), [loPartialKey]);
 ItemCode := MenuQuery.FieldByName('ItemCode').AsString;
 ScalableItem := MenuQuery.FieldByName('Scalable').AsString;
 if Not MenuQuery.FieldByName('SubCategory').AsBoolean then
    begin
     if StringGrid.Cells[1, CurrentRow] <> '' then CurrentRow := FindLastRow;
     if (CurrentRow <= 500) and (StringGrid.Cells[7, CurrentRow] = '') then
        begin
         StringGrid.Row := CurrentRow;
         CurrentCol := 1;
         StringGrid.Col := 1;
         StringGrid.Cells[7, CurrentRow] := ItemCode;
         if DataForm.CheckInstructionLink(ItemCode) and
            InstructionListForm.InstructionPro(ItemCode, Langurage, Buff) then
            ProcessInstruction(Buff);
         if StringGrid.Enabled then StringGrid.SetFocus;
         Changed := True;
         if CheckCells(CurrentCol, CurrentRow) then
          begin
            if ScalableItem = 'True' then
              WeightButtonClick(self);
            MoveToNextCell;
          end;
        end;
    end;

 if DataForm.CheckSubMenuLink(ItemCode, MainItemDescription1, MainItemDescription2, NumberOfChoice, DirectLinkSubMenu) then
    begin
     Application.CreateForm(TSubMenuForm, SubMenuForm);
     SubMenuForm.MainItemCode := ItemCode;
     SubMenuForm.MainItemDescription1 := MainItemDescription1;
     SubMenuForm.MainItemDescription2 := MainItemDescription2;
     SubMenuForm.Langurage := Langurage;
     SubMenuForm.NumberOfChoice := NumberOfChoice;
     SubMenuForm.OwnerNumber := sPHONEORDER;
     if DirectLinkSubMenu then
        SubMenuForm.ProcessDirectLinkSubMenu
       else
        SubMenuForm.ShowModal;
     SubMenuForm.Free;
    end;
end;

procedure TPhoneOrderForm.InitCells(ARow: integer);
begin
 with StringGrid do
  begin
   Cells[1, ARow] := '';
   Cells[2, ARow] := '';
   Cells[3, ARow] := '';
   Cells[4, ARow] := '';
   Cells[5, ARow] := '';
   Cells[6, ARow] := '';
   Cells[7, ARow] := '';
  end;
 EditFlag[ARow] := True;
 VoidFlag[ARow] := False;
 OpenPrice[ARow] := True;
 Instruction[ARow] := 0;
 OrderInstruction[ARow] := False;
 DiscountFlag[ARow] := False;
 PriceSelect[ARow] := 0;
 PaidQty[ARow] := 0;
 PrintFlag[ARow] := False;
 CheckListPrinted[ARow] := False;
 SentToKitchen[ARow] := False;
 VoidReason[ARow] := '';
 OrderOperator[ARow] := '';
 OriginalPrice[ARow] := 0;
end;

procedure TPhoneOrderForm.InitStringGrid;
var
 I: integer;
begin
 with StringGrid do
  begin
   Cells[0, 0] := 'No.';
   Cells[1, 0] := 'Description';
   Cells[2, 0] := 'Qty';
   Cells[3, 0] := 'Price';
   Cells[4, 0] := 'Amount';
   Cells[5, 0] := 'Dis(%)';
   Cells[6, 0] := 'GST%';
   Cells[7, 0] := 'Code';
   for I := 1 to 500 do
    begin
     Cells[0, I] := IntToStr(I);
     InitCells(I);
    end;
   Row := 1; Col := 1; TopRow := 1; LeftCol := 1;
   CurrentRow := 1; CurrentCol := 1;
  end;
end;

procedure TPhoneOrderForm.StringGridDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
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
             if Instruction[ARow] >= 1 then
                X := Rect.Left + 12
               else
                X := Rect.Left + 2;
             if VoidFlag[ARow] then
                Canvas.Font.Color := clGray
               else
                if OrderInstruction[ARow] then
                   Canvas.Font.Color := clRed
                  else
                   if Instruction[ARow] >= 1 then
                      Canvas.Font.Color := clBlue
                     else
                      Canvas.Font.Color := clBlack;
            end;
         7: begin
             if VoidFlag[ARow] then Canvas.Font.Color := clGray;
             SetTextAlign(Canvas.Handle, TA_CENTER);
             X := (Rect.Left + Rect.Right) div 2;
            end;
        else
          begin
           SetTextAlign(Canvas.Handle, TA_RIGHT);
           X := Rect.Right - 2;
          end;
       end;
       if EditFlag[ARow] then
          Canvas.Brush.Color := clWhite
         else
          Canvas.Brush.Color := $00D9FFD9;
       Canvas.FillRect(Rect);
      end
     else
      begin
       Canvas.Font.Size := 8;
       Canvas.Font.Style := [fsBold];
       SetTextAlign(Canvas.Handle, TA_CENTER);
       X := (Rect.Left + Rect.Right) div 2;
      end;
  Canvas.TextRect(Rect,X, Rect.Top + 2, Cells[ACol, ARow]);
 end;
end;

procedure TPhoneOrderForm.InitForm;
begin
 DataForm.SendToPoleDisp('NEXT CUSTOMER PLEASE', '');
 if FVar.SecondDisplay = 1 then SecondDisplayForm.SetSalesStatus;
 PaidAmount := 0;
 Tips := 0;
 Surcharge := 0;
 DiscountKind := 0;
 DollarDiscount := 0;
 DiscountRate := 0;
 CurrentServiceChargeRate := 0;
 CurrentOtherChargeRate := 0;
 DueTime := 0;
 PreAmount := 0;
 PreItemCount := 0;
 OrderDateEdit.Caption := '';
 OrderNoEdit.Caption := '';
 ServiceEdit.Caption := '';
 VIPNoEdit.Caption := '';
 PresetDiscountCode := '';
 CategoryPanel.Visible := True;
 MenuPanel.Visible := True;
 CurrentPriceIncludesGST := PriceIncludesGST;
 CurrentGSTRate := DefaultGSTRate;
 RewardPointsDiscount := 0;
 DiscountOperator := '';
 DiscountTitleLabel.Caption := 'DISCOUNT (' + Format('%4.2f', [DiscountRate]) + '%)';
 ServiceChargeLabel.Caption := Uppercase(SurchargeName) + ' (' + Format('%4.2f', [CurrentServiceChargeRate]) + '%)';
 OtherChargeLabel.Caption := Uppercase(OtherChargeName) + ' (' + Format('%4.2f', [CurrentOtherChargeRate]) + '%)';
 InitStringGrid;
end;

procedure TPhoneOrderForm.FormKeyPress(Sender: TObject; var Key: Char);
var
 CurRow: integer;
begin
 if Not StringGrid.Enabled then
    Key := Chr(0)
   else
    if Key In ['0'..'9', 'a'..'z', 'A'..'Z'] then
       KeyBuff := KeyBuff + Key
      else
       if Key = Chr(13) then
          begin
           if KeyBuff <> '' then
              with StringGrid do
               begin
                CurRow := FindLastRow;
                if ((Copy(KeyBuff, 1, 2) = '02') and (Length(KeyBuff) = 13)) or
                   ((Copy(KeyBuff, 1, 1) = '2') and (Length(KeyBuff) = 12)) then
                   begin
                    if Length(KeyBuff) = 13 then
                       begin
                        if ScaleBarcode = 0 then
                           begin
                            Cells[7, CurRow] := Copy(KeyBuff, 3, 5);
                            Cells[2, CurRow] := Format('%4.2f', [StrToFloat(Copy(KeyBuff, 8, 5)) / 1000]);
                           end
                          else
                           begin
                            Cells[7, CurRow] := Copy(KeyBuff, 3, 5);
                            Cells[2, CurRow] := '1.00';
                            Cells[3, CurRow] := Format('%4.2f', [StrToFloat(Copy(KeyBuff, 9, 4)) / 100]);
                            OriginalPrice[CurRow] := StrToFloat(Copy(KeyBuff, 9, 4)) / 100;
                           end
                       end
                      else
                       begin
                        if ScaleBarcode = 0 then
                           begin
                            Cells[7, CurRow] := Copy(KeyBuff, 2, 5);
                            Cells[2, CurRow] := FloatToStr(StrToFloat(Copy(KeyBuff, 7, 5)) / 1000);
                           end
                          else
                           begin
                            Cells[7, CurRow] := Copy(KeyBuff, 2, 5);
                            Cells[2, CurRow] := '1.00';
                            Cells[3, CurRow] := Format('%4.2f', [StrToFloat(Copy(KeyBuff, 8, 4)) / 100]);
                            OriginalPrice[CurRow] := StrToFloat(Copy(KeyBuff, 8, 4)) / 100;
                           end
                       end
                   end
                  else
                   begin
                    Cells[7, CurRow] := KeyBuff;
                    Cells[2, CurRow] := '';
                   end;
                KeyBuff := '';
                Changed := True;
                if CheckCells(1, CurRow) then
                   begin
                    Row := FindLastRow;
                    CurrentRow := Row;
                    LeftCol := 1;
                   end
                  else
                   Cells[7, CurRow] := '';
               end;
          end
           else Key := Chr(0);
end;

procedure TPhoneOrderForm.CancelButtonClick(Sender: TObject);
begin
 SendToSecurityPortPro('[Cancel] Button Clicked', '', '', 0, 0, 0, 0);
 ReturnFlag := False;
 Close;
end;

procedure TPhoneOrderForm.ServiceEditKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = Chr(13) then StringGrid.SetFocus;
end;

function TPhoneOrderForm.OpenQuery(SQLStr: string): boolean;
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
   if RecordCount = 0 then
      Result := False
     else
      Result := True;
  end;
end;

procedure TPhoneOrderForm.MoveToNextCell;
begin
 with StringGrid do
  begin
   Col := 1;
   Row := FindLastRow;
   CurrentRow := Row;
   CurrentCol := Col;
  end;
end;

procedure TPhoneOrderForm.DeleteLine(CurRow: Integer);
var
 I, J: Integer;
begin
 for I := CurRow to 499 do
  begin
   for J := 1 to 7 do StringGrid.Cells[J, I] := StringGrid.Cells[J, I + 1];
   EditFlag[I] := EditFlag[I + 1];
   VoidFlag[I] := VoidFlag[I + 1];
   PrintFlag[I] := PrintFlag[I + 1];
   CheckListPrinted[I] := CheckListPrinted[I + 1];
   SentToKitchen[I] := SentToKitchen[I + 1];
   OpenPrice[I] := OpenPrice[I + 1];
   Instruction[I] := Instruction[I + 1];
   OrderInstruction[I] := OrderInstruction[I + 1];
   DiscountFlag[I] := DiscountFlag[I + 1];
   PriceSelect[I] := PriceSelect[I + 1];
   PaidQty[I] := PaidQty[I + 1];
   VoidReason[I] := VoidReason[I + 1];
   OrderOperator[I] := OrderOperator[I + 1];
   OriginalPrice[I] := OriginalPrice[I + 1];
  end;
 InitCells(500);
end;

procedure TPhoneOrderForm.StringGridClick(Sender: TObject);
begin
 if (StringGrid.Row = CurrentRow) and (StringGrid.Col = CurrentCol) then
    Exit;
 if CheckCells(CurrentCol, CurrentRow) then
    begin
     CurrentCol := StringGrid.Col;
     CurrentRow := StringGrid.Row;
    end
   else
    begin
     StringGrid.Col := CurrentCol;
     StringGrid.Row := CurrentRow;
    end;
 CalcAmount;
end;

function TPhoneOrderForm.FindLastRow: integer;
var
 I, J, K: integer;
begin
 J := 1;
 for I := 1 to 500 do
  begin
   if (StringGrid.Cells[1, I] <> '') then
      begin
       if (J <> I) then
          begin
           for K := 1 to 7 do StringGrid.Cells[K, J] := StringGrid.Cells[K, I];
           EditFlag[J] := EditFlag[I];
           VoidFlag[J] := VoidFlag[I];
           PrintFlag[J] := PrintFlag[I];
           CheckListPrinted[J] := CheckListPrinted[I];
           SentToKitchen[J] := SentToKitchen[I];
           OpenPrice[J] := OpenPrice[I];
           Instruction[J] := Instruction[I];
           OrderInstruction[J] := OrderInstruction[I];
           DiscountFlag[J] := DiscountFlag[I];
           PriceSelect[J] := PriceSelect[I];
           PaidQty[J] := PaidQty[I];
           VoidReason[J] := VoidReason[I];
           OrderOperator[J] := OrderOperator[I];
           OriginalPrice[J] := OriginalPrice[I];
           InitCells(I);
          end;
       J := J + 1;
      end;
  end;
 if J <= 500 then
    Result := J
   else
    Result := 500;
end;

procedure TPhoneOrderForm.CopyMealPackage;
var
 I: integer;
 SQLStr, FieldName: string;
 Qty: double;
begin
 if Not PackageSetup.SetupMealPackagePro(Qty, False) then Exit;
 SQLStr := 'Select MealPackage.ItemCode, Description1, Description2, ' +
           'MealPackage.Qty, MealPackage.Price, TaxRate, AllowDiscount, ' +
           'MealPackage.Condition, Multiple, PriceSelect, ' +
           'SubDescription, SubDescription1, SubDescription2, ' +
           'SubDescription3, OpenPrice ' +
           'From MealPackage, MenuItem ' +
           'Where MenuItem.ItemCode=MealPackage.ItemCode and ' +
           'MealPackage.IDNo>=20 Order By ID';
 Screen.Cursor := crHourGlass;
 if OpenQuery(SQLStr) then
    with Query do
     begin
      First; I := FindLastRow;
      while Not EOF and (I <= 500) do
        begin
         Instruction[I] := FieldByName('Condition').AsInteger;
         DiscountFlag[I] := FieldByName('AllowDiscount').AsBoolean;
         OpenPrice[I] := FieldByName('OpenPrice').AsBoolean;
         PriceSelect[I] := FieldByName('PriceSelect').AsInteger;
         EditFlag[I] := True; PrintFlag[I] := False;
         OriginalPrice[I] := FieldByName('Price').AsFloat;
         VoidFlag[I] := False;
         SentToKitchen[I] := False;
         CheckListPrinted[I] := False;
         PaidQty[I] := 0;
         VoidReason[I] := '';
         OrderOperator[I] := sUserName;
         OrderInstruction[I] := False;
         StringGrid.Cells[7, I] := FieldByName('ItemCode').AsString;
         if Langurage or (FieldByName('Description2').AsString = '') then
            StringGrid.Cells[1, I] := FieldByName('Description1').AsString
           else
            StringGrid.Cells[1, I] := FieldByName('Description2').AsString;
         if FieldByName('Multiple').AsBoolean then
            begin
             FieldName := GenerateSubDescriptionFieldName(PriceSelect[I]);
             if FieldByName(FieldName).AsString <> '' then
                StringGrid.Cells[1, I] :=
                 StringGrid.Cells[1, I] + ' / ' + FieldByName(FieldName).AsString;
            end;
         if ABS(FieldByName('Qty').AsFloat) >= 0.01 then
            StringGrid.Cells[2, I] := Format('%4.2f', [Qty * FieldByName('Qty').AsFloat]);
         if ABS(FieldByName('Price').AsFloat) >= 0.01 then
            StringGrid.Cells[3, I] := Format('%4.2f', [FieldByName('Price').AsFloat]);
         if (FieldByName('AllowDiscount').AsBoolean or
            (ForceVIPDiscount and (VIPNoEdit.Caption <>''))) then
            StringGrid.Cells[5, I] := Format('%4.2f', [DiscountRate]);
         StringGrid.Cells[4, I] := '';
         StringGrid.Cells[6, I] := Format('%4.2f', [FieldByName('TaxRate').AsFloat]);
         StringGrid.Cells[8, I] := '';
         SetDescription(I);
         Next; I := I + 1;
        end;
      Close;
     end;
 CalcAmount;
end;

function TPhoneOrderForm.CheckCells(ACol, ARow: integer): boolean;
var
 CellsStr, FieldName, NumStr: string;
 Temp, PriceFlag: integer;
 HappyHourPrice: boolean;
begin
 Result := True;
 if Not Changed then Exit;
 Changed := False;
 if HappyHourAvailable and CheckHappyHourTime then
    HappyHourPrice := True
   else
    HappyHourPrice := False;
 if ACol = 1 then
    CellsStr := StringGrid.Cells[7, ARow]
   else
    CellsStr := StringGrid.Cells[ACol, ARow];
 if (CellsStr = '') or (StringGrid.Cells[7, ARow] = '----') then
    Exit;
 if (CellsStr <> '0000') and (CellsStr <> '0001') and (CellsStr <> '0002') and
    (CellsStr <> '0003') and (CellsStr <> '0004') and (CellsStr <> '0005') and
    (CellsStr <> '0006') and (CellsStr <> '0007') and (CellsStr <> '0008') and
    (CellsStr <> '0009') and (CellsStr <> '0010') and (CellsStr <> '00011')
      then
 begin
 case ACol of
  1: begin
      if Not TestItemCode(CellsStr, PriceFlag) then
         begin
          Result := False;
          InitCells(ARow);
         end
        else
         with Query do
          begin
           StringGrid.Cells[7, ARow] := FieldByName('ItemCode').AsString;
           DiscountFlag[ARow] := FieldByName('AllowDiscount').AsBoolean;
           OpenPrice[ARow] := FieldByName('OpenPrice').AsBoolean;
           VoidReason[ARow] := '';
           OrderOperator[ARow] := sUserName;
           OrderInstruction[ARow] := False;
           if Not FieldByName('Instruction').AsBoolean then
              begin
               if StringGrid.Cells[2, ARow] = '' then
                  StringGrid.Cells[2, ARow] := Format('%4.2f', [FieldByName('DefaultQty').AsFloat]);
               if StringGrid.Cells[3, ARow] = '' then
                  begin
                   if Not FieldByName('Multiple').AsBoolean then
                      begin
                       if HappyHourPrice and (ABS(FieldByName('HappyHourPrice1').AsFloat) >= 0.01) then
                          begin
                           StringGrid.Cells[3, ARow] := Format('%4.2f', [FieldByName('HappyHourPrice1').AsFloat]);
                           OriginalPrice[ARow] := FieldByName('HappyHourPrice1').AsFloat;
                           DiscountFlag[ARow] := False;
                          end
                         else
                          begin
                           StringGrid.Cells[3, ARow] := Format('%4.2f', [FieldByName('Price').AsFloat]);
                           OriginalPrice[ARow] := FieldByName('Price').AsFloat;
                          end
                      end
                     else
                      begin
                       if PriceFlag = 0 then
                          PriceSelectForm.ReadPricePro(CellsStr, PriceSelect[ARow], HappyHourPrice)
                         else
                          PriceSelect[ARow] := PriceFlag - 1;
                       if PriceSelect[ARow] >= 0 then
                          begin
                           FieldName := GeneratePriceFieldName(PriceSelect[ARow], HappyHourPrice);
                           StringGrid.Cells[3, ARow] := Format('%4.2f', [FieldByName(FieldName).AsFloat]);
                           OriginalPrice[ARow] := FieldByName(FieldName).AsFloat;
                          end
                         else
                          begin
                           repeat
                            DeleteLine(ARow);
                           until Instruction[ARow] = 0;
                           PriceSelect[ARow] := 0;
                           DiscountFlag[ARow] := False;
                           Exit;
                          end;
                      end;
                  end;
              end
             else
              if Instruction[ARow] = 0 then
                 begin
                  if AutoInstructionSelection then
                     Temp := InstructionForm.InstructionPro
                    else
                     Temp := 1;
                  if Temp >= 0 then Instruction[ARow] := Temp
                    else
                     begin
                      InitCells(ARow);
                      StringGrid.Col := 1; StringGrid.Row := ARow;
                      Exit;
                     end;
                  if (Temp = 2) or (Temp = 0) or Not AutoInstructionSelection then
                     begin
                      if ABS(FieldByName('DefaultQty').AsFloat) >= 0.01 then
                         StringGrid.Cells[2, ARow] := Format('%4.2f', [FieldByName('DefaultQty').AsFloat])
                        else
                         StringGrid.Cells[2, ARow] := '';
                      if Not FieldByName('Multiple').AsBoolean then
                         begin
                          if HappyHourPrice and (ABS(FieldByName('HappyHourPrice1').AsFloat) >= 0.01) then
                             begin
                              StringGrid.Cells[3, ARow] := Format('%4.2f', [FieldByName('HappyHourPrice1').AsFloat]);
                              OriginalPrice[ARow] := FieldByName('HappyHourPrice1').AsFloat;
                             end
                            else
                             if ABS(FieldByName('Price').AsFloat) >= 0.01 then
                                begin
                                 StringGrid.Cells[3, ARow] := Format('%4.2f', [FieldByName('Price').AsFloat]);
                                 OriginalPrice[ARow] := FieldByName('Price').AsFloat;
                                end;
                         end
                        else
                         begin
                          if PriceFlag = 0 then
                             PriceSelectForm.ReadPricePro(CellsStr, PriceSelect[ARow], HappyHourPrice)
                            else
                             PriceSelect[ARow] := PriceFlag - 1;
                          if PriceSelect[ARow] >= 0 then
                             begin
                              FieldName := GeneratePriceFieldName(PriceSelect[ARow], HappyHourPrice);
                              StringGrid.Cells[3, ARow] := Format('%4.2f', [FieldByName(FieldName).AsFloat]);
                              OriginalPrice[ARow] := FieldByName(FieldName).AsFloat;
                             end
                           else
                            begin
                             repeat
                              DeleteLine(ARow);
                             until Instruction[ARow] = 0;
                             PriceSelect[ARow] := 0;
                             DiscountFlag[ARow] := False;
                             Exit;
                            end;
                         end;
                     end
                    else
                     begin
                      StringGrid.Cells[2, ARow] := '';
                      StringGrid.Cells[3, ARow] := '';
                     end;
                 end;
           if (DiscountFlag[ARow] or (ForceVIPDiscount and (VIPNoEdit.Caption <> '')))
              and (DiscountRate >= 0.01) then
              StringGrid.Cells[5, ARow] := Format('%4.2f', [DiscountRate])
             else
              StringGrid.Cells[5, ARow] := '';
           if Langurage or (FieldByName('Description2').AsString = '') then
              StringGrid.Cells[1, ARow] := FieldByName('Description1').AsString
             else
              StringGrid.Cells[1, ARow] := FieldByName('Description2').AsString;
           if FieldByName('Multiple').AsBoolean then
              begin
               FieldName := GenerateSubDescriptionFieldName(PriceSelect[ARow]);
               if FieldByName(FieldName).AsString <> '' then
                  StringGrid.Cells[1, ARow] :=
                   StringGrid.Cells[1, ARow] + ' / ' + FieldByName(FieldName).AsString;
              end;
           StringGrid.Cells[6, ARow] := Format('%4.2f', [FieldByName('TaxRate').AsFloat]);
           SetDescription(ARow);
           if AutoPriceWindow and OpenPrice[ARow] and (Instruction[ARow] = 0) and
              ((StringGrid.Cells[3, ARow] = '') or (StrToFloat(StringGrid.Cells[3, ARow]) = 0)) then
              begin
               NumStr := '0';
               if NumberPadForm.ReadNumberPro(NumStr, False, False, 'Sales Price', 0) then
                  StringGrid.Cells[3, ARow] := Format('%4.2f', [StrToFloat(NumStr)]);
              end;
           if FieldByName('AutoPopSpellInstructionKeyboard').AsBoolean then
              SpellInstructionButtonClick(Self);
          end;
      Query.Close;
     end;
  2: if Not CheckNum(CellsStr, 7, 999.99, -999.99, 'F') then
        begin
         StringGrid.Cells[ACol, ARow] := '';
         Result := False
        end
       else
        StringGrid.Cells[ACol, ARow] := Format('%4.2f', [StrToFloat(CellsStr)]);
  3: if Not CheckNum(CellsStr, 10, 9999999.99, 0, 'F') then
        begin
         StringGrid.Cells[ACol, ARow] := '';
         Result := False
        end
       else
        StringGrid.Cells[ACol, ARow] := Format('%4.2f', [Abs(StrToFloat(CellsStr))]);
 end;
 end;
 UpdatePoleMessage;
end;

procedure TPhoneOrderForm.CalcAmount;
var
 I: integer;
 Qty, Price, RealPrice, TaxRate, DiscRate, Amount, GST, Discount,
 TotalAmount, TotalGST, TotalDiscount, TotalServiceCharge,
 TotalOtherCharge, TotalInvoice, Receivable: double;
 LabelPosition1, LabelPosition2: integer;
begin
 if CurrentPriceIncludesGST then
    begin
     if TotalEdit.Top > GSTEdit.Top then
        begin
         LabelPosition1 := TotalEdit.Top;
         LabelPosition2 := GSTEdit.Top;
         TotalLabel.Top := LabelPosition2 + 2;
         TotalEdit.Top := LabelPosition2;
         GSTLabel.Top := LabelPosition1 + 4;
         GSTEdit.Top := LabelPosition1;
        end;
    end
   else
    begin
     if TotalEdit.Top < GSTEdit.Top then
        begin
         LabelPosition1 := TotalEdit.Top;
         LabelPosition2 := GSTEdit.Top;
         TotalLabel.Top := LabelPosition2;
         TotalEdit.Top := LabelPosition2;
         GSTLabel.Top := LabelPosition1 + 2;
         GSTEdit.Top := LabelPosition1;
        end;
    end;
 TotalAmount := 0; TotalGST := 0; TotalDiscount := 0;
 with StringGrid do
  for I := 1 to 500 do
   if Cells[7, I] <> '----' then
      begin
       if Cells[2, I] <> '' then Qty := StrToFloat(Cells[2, I]) else Qty := 0;
       if Cells[3, I] <> '' then Price := StrToFloat(Cells[3, I]) else Price := 0;
       if ABS(Price * Qty) >= 0.01 then
          begin
           Amount := Price * Qty;
           Cells[4, I] := Format('%4.2f', [Amount]);
          end
         else
          begin
           Amount := 0;
           Cells[4, I] := '';
          end;
       if Cells[5, I] <> '' then
          DiscRate := StrToFloat(Format('%6.4f', [StrToFloat(Cells[5, I]) / 100]))
         else
          DiscRate := 0;
       if Cells[6, I] <> '' then
          TaxRate:= StrToFloat(Cells[6, I])
         else
          TaxRate := 0;
       RealPrice := Price * (1 - DiscRate);
       Discount := (Price - RealPrice) * Qty;
       if CurrentPriceIncludesGST then
          GST := (Amount - Discount) * (1 - 1 / (1 + TaxRate / 100))
         else
          GST := (Amount - Discount) * TaxRate / 100;
       TotalAmount := TotalAmount + Amount;
       TotalDiscount := TotalDiscount + Discount;
       TotalGST := TotalGST + GST;
      end;

 TotalAmount := RoundToCurrency(TotalAmount);

 if DiscountKind = 0 then
    DiscountTitleLabel.Caption := 'DISCOUNT (' + Format('%4.2f', [DiscountRate]) + '%)'
   else
    begin
     DiscountTitleLabel.Caption := 'DISCOUNT';
     if DiscountKind = 2 then
        begin
         TotalDiscount := DollarDiscount;
         if CurrentPriceIncludesGST then
            TotalGST := TotalGST - DollarDiscount * (1 - 1 / (1 + CurrentGSTRate / 100))
           else
            TotalGST := TotalGST - DollarDiscount * CurrentGSTRate / 100;
        end
    end;

 if ABS(TotalDiscount) <= 0.001 then TotalDiscount := 0;
 TotalDiscount := RoundToCurrency(TotalDiscount);

 if CurrentPriceIncludesGST then
    TotalGST := TotalGST - RewardPointsDiscount * (1 - 1 / (1 + CurrentGSTRate / 100))
   else
    TotalGST := TotalGST - RewardPointsDiscount * CurrentGSTRate / 100;

 TotalServiceCharge := (TotalAmount - TotalDiscount - RewardPointsDiscount) * CurrentServiceChargeRate / 100;
 TotalServiceCharge := RoundToCurrency(TotalServiceCharge);
 TotalOtherCharge := (TotalAmount - TotalDiscount - RewardPointsDiscount) * CurrentOtherChargeRate / 100;
 TotalOtherCharge := RoundToCurrency(TotalOtherCharge);

 if CurrentPriceIncludesGST then
    TotalGST := TotalGST + (TotalServiceCharge + TotalOtherCharge) * (1 - 1 / (1 + CurrentGSTRate / 100))
   else
    TotalGST := TotalGST + (TotalServiceCharge + TotalOtherCharge) * CurrentGSTRate / 100;
 if (TotalAmount >= 0) and (TotalGST <= 0) then TotalGST := 0;
 TotalGST := RoundToCurrency(TotalGST);

  if CurrentPriceIncludesGST then
    begin
     TotalInvoice := TotalAmount + TotalServiceCharge + TotalOtherCharge;
     Receivable := TotalAmount - TotalDiscount - RewardPointsDiscount + TotalServiceCharge + TotalOtherCharge
    end
   else
    begin
     TotalInvoice := TotalAmount + TotalServiceCharge + TotalOtherCharge + TotalGST;
     Receivable := TotalAmount - TotalDiscount - RewardPointsDiscount + TotalServiceCharge + TotalOtherCharge + TotalGST;
    end;
 TotalInvoice := RoundToCurrency(TotalInvoice);
 Receivable := RoundToCurrency(Receivable);

 AmountEdit.Caption := Format('%4.2f ', [TotalAmount]);
 DiscountEdit.Caption := Format('%4.2f ', [TotalDiscount]);
 RewardPointsDiscountEdit.Caption := Format('%4.2f ', [RewardPointsDiscount]);
 ServiceChargeLabel.Caption := Uppercase(SurchargeName) + ' (' + Format('%4.2f', [CurrentServiceChargeRate]) + '%)';
 ServiceChargeEdit.Caption := Format('%4.2f ', [TotalServiceCharge]);
 OtherChargeLabel.Caption := Uppercase(OtherChargeName) + ' (' + Format('%4.2f', [CurrentOtherChargeRate]) + '%)';
 OtherChargeEdit.Caption := Format('%4.2f ', [TotalOtherCharge]);
 GSTEdit.Caption := Format('%4.2f ', [TotalGST]);
 TotalEdit.Caption := Format('%4.2f ', [Receivable]);

 if FVar.SecondDisplay = 1 then
    begin
     PostDataToSecondDisplayPro;
     SecondDisplayForm.GotoCurrentRow;
     SecondDisplayForm.TotalSalesEdit.Caption := FormatCurrency(TotalInvoice) + ' ';
     if ABS(TotalDiscount + RewardPointsDiscount) >= 0.01 then
        begin
         SecondDisplayForm.DiscountLabel.Visible := True;
         SecondDisplayForm.DiscountEdit.Visible := True;
         SecondDisplayForm.DiscountEdit.Caption := FormatCurrency(TotalDiscount + RewardPointsDiscount) + ' ';
        end
       else
        begin
         SecondDisplayForm.DiscountLabel.Visible := False;
         SecondDisplayForm.DiscountEdit.Visible := False;
        end;
     SecondDisplayForm.ReceivableEdit.Caption := FormatCurrency(Receivable) + ' ';
    end;
end;

function TPhoneOrderForm.TestItemCode(ItemCode: string; var PriceFlag: integer): boolean;
var
 SQLStr: string;
begin
 PriceFlag := -1;
 SQLStr := 'Select * From MenuItem Where ItemCode=' +
           Chr(39) + CheckQuotes(UpperCase(ItemCode)) + Chr(39);
 Result := OpenQuery(SQLStr);
 if Not Result then
    begin
     SQLStr := 'Select * From MenuItem Where BarCode=' +
               Chr(39) + CheckQuotes(ItemCode) + Chr(39) +
               ' Or BarCode1=' + Chr(39) + CheckQuotes(ItemCode) + Chr(39) +
               ' Or BarCode2=' + Chr(39) + CheckQuotes(ItemCode) + Chr(39) +
               ' Or BarCode3=' + Chr(39) + CheckQuotes(ItemCode) + Chr(39);
     Result := OpenQuery(SQLStr);
    end;
 if Not Result then
    MessageBoxForm.MessagePro('Invalid item code!', sErrorMsg)
   else
    with Query do
     begin
      if Uppercase(ItemCode) = FieldByName('ItemCode').AsString then PriceFlag := 0;
      if ItemCode = FieldByName('BarCode').AsString then PriceFlag := 1;
      if ItemCode = FieldByName('BarCode1').AsString then PriceFlag := 2;
      if ItemCode = FieldByName('BarCode2').AsString then PriceFlag := 3;
      if ItemCode = FieldByName('BarCode3').AsString then PriceFlag := 4;
     end;
end;

function TPhoneOrderForm.SaveOrderHeadTable(OrderNo: string): boolean;
var
 SQLStr, OrderDateTime, OrderNoStr, TableNo, Person, ServicePerson,
 Amount, GST, VIPNo, InvoiceNoStr, ReservationNo, CreditFlag, DueTimeTemp,
 ServiceChargeRateTemp, ServiceChargeTemp, MachineNameTemp, DeliveryTemp,
 OtherChargeRateTemp, OtherChargeTemp, PriceIncludesGSTTemp, CustomerName,
 PresetDiscountCodeTemp, DiscountOperatorTemp: string;
begin
 OrderNoStr := Chr(39) + CheckQuotes(OrderNo) + Chr(39);
 OrderDateTime := ConvertDateTime(OrderDate);
 TableNo := Chr(39) + 'PhoneOrder' + Chr(39);
 Person := '0';
 if DueTime <> 0 then
    DueTimeTemp := ConvertDateTime(DueTime)
   else
    DueTimeTemp := 'Null';
 if ServiceEdit.Caption <> '' then
    ServicePerson := Chr(39) + CheckQuotes(ServiceEdit.Caption) + Chr(39)
   else
    ServicePerson := 'Null';
 if VIPNoEdit.Caption <> '' then
    VIPNo := VIPNoEdit.Caption
   else
    VIPNo := '0';
 if InvoiceNo <> '' then
    InvoiceNoStr := Chr(39) + CheckQuotes(InvoiceNo) + Chr(39)
   else
    InvoiceNoStr := 'Null';
 if sBookingNo <> '' then
    ReservationNo := Chr(39) + CheckQuotes(sBookingNo) + Chr(39)
   else
    ReservationNO := 'Null';
 if Credit then
    CreditFlag := '1'
   else
    CreditFlag := '0';
 if MachineName <> '' then
    MachineNameTemp := Chr(39) + CheckQuotes(MachineName) + Chr(39)
   else
    MachineNameTemp := 'Null';
 if CustomerNameEdit.Caption <> '' then
    CustomerName := Chr(39) + CheckQuotes(CustomerNameEdit.Caption) + Chr(39)
   else
    CustomerName := 'Null';
 if PresetDiscountCode <> '' then
    PresetDiscountCodeTemp := Chr(39) + CheckQuotes(PresetDiscountCode) + Chr(39)
   else
    PresetDiscountCodeTemp := 'Null';
 Amount := FloatToStr(StrToFloat(AmountEdit.Caption) -
           StrToFloat(DiscountEdit.Caption) - RewardPointsDiscount);
 GST := FloatToStr(StrToFloat(GSTEdit.Caption));
 ServiceChargeRateTemp := FloatToStr(CurrentServiceChargeRate);
 ServiceChargeTemp := ServiceChargeEdit.Caption;
 OtherChargeRateTemp := FloatToStr(CurrentOtherChargeRate);
 OtherChargeTemp := OtherChargeEdit.Caption;
 if OrderType = 0 then
    DeliveryTemp := '1'
   else
    DeliveryTemp := '0';
 if CurrentPriceIncludesGST then
    PriceIncludesGSTTemp := '1'
   else
    PriceIncludesGSTTemp := '0';
 if DiscountOperator <> '' then
    DiscountOperatorTemp := Chr(39) + CheckQuotes(DiscountOperator) + Chr(39)
   else
    DiscountOperatorTemp := 'Null';
 SQLStr := 'Insert Into OrderH(OrderDate, OrderNo, Persons, TableNo, ' +
           'ServicePerson, Amount, GST, PaidAmount, Tips, Surcharge, ' +
           'VIPNo, OpName, InvoiceNo, BookingNo, Credit, ServiceChargeRate, ' +
           'ServiceCharge, OrderPrinted, MachineID, BillKind, DollarDiscount, ' +
           'DueTime, DiscountKind, Delivery, OtherChargeRate, OtherCharge, ' +
           'PriceIncludesGST, CurrentGSTRate, RewardPoints, CustomerName, ' +
           'SplitBill, PresetDiscountCode, DiscountOperator) ' +
           'Values(' + OrderDateTime + ',' + OrderNoStr + ',' +
           Person + ',' + TableNo + ',' + ServicePerson + ',' + Amount +
           ',' + GST + ',' + FloatToStr(PaidAmount) + ',' +
           FloatToStr(Tips) + ',' + FloatToStr(Surcharge) + ',' +
           VIPNo + ',' + Chr(39) + CheckQuotes(sUserName) + Chr(39) + ',' +
           InvoiceNoStr + ',' + ReservationNo + ',' + CreditFlag + ',' +
           ServiceChargeRateTemp + ',' + ServiceChargeTemp + ', 0,' +
           MachineNameTemp + ',' + IntToStr(sPhoneOrder) + ',' +
           FloatToStr(DollarDiscount) + ',' + DueTimeTemp + ',' +
           IntToStr(DiscountKind) + ',' + DeliveryTemp + ',' +
           OtherChargeRateTemp + ',' + OtherChargeTemp + ',' +
           PriceIncludesGSTTemp + ',' + FloatToStr(CurrentGSTRate) + ',' +
           FloatToStr(RewardPointsDiscount) + ',' + CustomerName + ', 0, ' +
           PresetDiscountCodeTemp + ',' + DiscountOperatorTemp + ')';
 Result := DataForm.ExecQueryPro(SQLStr);
end;

function TPhoneOrderForm.SaveOrderItemTable(OrderNo: string): boolean;
var
 I, IDNo: integer;
 OrderQty: double;
 SQLStr, OrderNoStr, ItemCode, Qty, Price, TaxRate, Discount,
 PrintFlagTemp, SentToKitchenTemp, PriceSel, Seat, VoidReasonTemp,
 SpecialOrderTemp, CheckListPrintedTemp, InstructionTemp,
 VoidFlagTemp, OrderOperatorTemp, OriginalPriceTemp: string;
begin
 I := 1; IDNo := 1; Result := True;
 OrderNoStr := Chr(39) + CheckQuotes(OrderNo) + Chr(39);
 while (I <= 500) and Result do
  begin
   ItemCode := StringGrid.Cells[7, I];
   if ItemCode <> '' then
      begin
       if ItemCode <> '----' then
          begin
           if Stringgrid.Cells[2, I] <> '' then
              OrderQty := StrToFloat(StringGrid.Cells[2, I])
             else
              OrderQty := 0;
           Qty := FloatToStr(OrderQty);
           if Stringgrid.Cells[3, I] <> '' then
              Price := StringGrid.Cells[3, I]
             else
              Price := '0';
           Seat := '0';
           if Stringgrid.Cells[5, I] <> '' then
              Discount := StringGrid.Cells[5, I]
             else
              Discount := '0.0';
           if StringGrid.Cells[6, I] <> '' then
              TaxRate := StringGrid.cells[6, I]
             else
              TaxRate := '0';
           PriceSel := IntToStr(PriceSelect[I]);
          end
         else
          begin
           Qty := '0'; Price := '0'; Seat := '0';
           Discount := '0.0'; TaxRate := '0';
           PriceSel := '0';
          end;
       if PrintFlag[I] then
          PrintFlagTemp := '1'
         else
          PrintFlagTemp := '0';
       if CheckListPrinted[I] then
          CheckListPrintedTemp := '1'
         else
          CheckListPrintedTemp := '0';
       if SentToKitchen[I] then SentToKitchenTemp := '1' else SentToKitchenTemp := '0';
       if VoidReason[I] <> '' then
          VoidReasonTemp := Chr(39) + CheckQuotes(VoidReason[I]) + Chr(39)
         else
          VoidReasonTemp := 'Null';
       if VoidFlag[I] then VoidFlagTemp := '1' else VoidFlagTemp := '0';
       if OrderOperator[I] <> '' then
          OrderOperatorTemp := Chr(39) + OrderOperator[I] + Chr(39)
         else
          OrderOperatorTemp := 'Null';
       InstructionTemp := IntToStr(Instruction[I]);
       OriginalPriceTemp := FloatToStr(OriginalPrice[I]);
       if OrderInstruction[I + 1] and (StringGrid.Cells[1, I + 1] <> '') then
          begin
           I := I + 1;
           SpecialOrderTemp := Chr(39) + CheckQuotes(StringGrid.Cells[1, I]) + Chr(39);
          end
         else
          SpecialOrderTemp := 'Null';
       SQLStr := 'Insert Into OrderI(OrderNo, ItemCode, Qty, PaidQty, ' +
                 'Price, Discount, TaxRate, PrintFlag, Condition, ' +
                 'PriceSelect, Seat, SentToKitchen, IDNo, VoidReason, ' +
                 'SpecialOrder, CheckListPrinted, VoidFlag, OrderOperator, ' +
                 'OriginalPrice) ' +
                 'Values(' + OrderNoStr + ',' + Chr(39) + CheckQuotes(ItemCode) + Chr(39) + ',' +
                 Qty + ',' + FloatToStr(PaidQty[I]) + ',' + Price + ',' +
                 Discount + ',' + TaxRate + ',' + PrintFlagTemp + ',' +
                 InstructionTemp + ',' + PriceSel + ',' + Seat + ',' +
                 SentToKitchenTemp + ',' + IntToStr(IDNo) + ',' + VoidReasonTemp + ',' +
                 SpecialOrderTemp + ',' + CheckListPrintedTemp + ',' +
                 VoidFlagTemp + ',' + OrderOperatorTemp + ',' + OriginalPriceTemp + ')';
       Result := DataForm.ExecQueryPro(SQLStr);
       Inc(IDNo);
      end;
   Inc(I);
 end;
end;

function TPhoneOrderForm.UpdateBookingMessage: boolean;
var
 SQLStr: string;
begin
 SQLStr := 'Update BookTable Set Arrived = 1 Where BookingNo=' +
           Chr(39) + CheckQuotes(sBookingNo) + Chr(39);
 Result := DataForm.ExecQueryPro(SQLStr);
end;

function TPhoneOrderForm.SaveData(OrderNo: string): boolean;
var
 SQLStr: string;
begin
 SQLStr := 'Delete From OrderH Where OrderNo=' + Chr(39) + CheckQuotes(OrderNo) + Chr(39);
 Result := DataForm.ExecQueryPro(SQLStr);
 if Result then
    begin
     SQLStr := 'Delete From OrderI Where OrderNo=' + Chr(39) + CheckQuotes(OrderNo) + Chr(39);
     Result := DataForm.ExecQueryPro(SQLStr);
    end;
 if Result then Result := SaveOrderHeadTable(OrderNo);
 if Result then Result := SaveOrderItemTable(OrderNo);
 if Result and (sBookingNo <> '') then Result := UpdateBookingMessage;
 if Result then Result := DataForm.UpdateOrderPayment(OrderNo, False);
end;

function TPhoneOrderForm.CheckOrderStatus(OrderNo: string): boolean;
var
 SQLStr: string;
 OrderAmount, PrePaidAmount: double;
 OrderItemCount: integer;
begin
 SQLStr := 'Select Amount, ServiceCharge, OtherCharge, Tips, Surcharge, ' +
           'GST, PaidAmount, PriceIncludesGST ' +
           'From OrderH Where OrderNo=' + Chr(39) + CheckQuotes(OrderNo) + Chr(39);
 OpenQuery(SQLStr);
 with Query do
  begin
   if FieldByName('PriceIncludesGST').AsBoolean then
      OrderAmount := FieldByName('Amount').AsFloat + FieldByName('ServiceCharge').AsFloat +
                     FieldByName('OtherCharge').AsFloat + FieldByName('Tips').AsFloat +
                     FieldByName('Surcharge').AsFloat
     else
      OrderAmount := FieldByName('Amount').AsFloat + FieldByName('ServiceCharge').AsFloat +
                     FieldByName('OtherCharge').AsFloat + FieldByName('Tips').AsFloat +
                     FieldByName('Surcharge').AsFloat + FieldByName('GST').AsFloat;
   PrePaidAmount := Query.FieldByName('PaidAmount').AsFloat;
   Close;
  end;
 Result := (ABS(PreAmount - OrderAmount) <= 0.005) and (ABS(PrePaidAmount - PaidAmount) < 0.005);
 if Result then
    begin
     SQLStr := 'Select Count(*) As ItemCount ' +
               'From OrderI Where OrderNo=' + Chr(39) + CheckQuotes(OrderNo) + Chr(39);
     OpenQuery(SQLStr);
     OrderItemCount := Query.FieldByName('ItemCount').AsInteger;
     Query.Close;
     Result := OrderItemCount = PreItemCount;
    end;
end;

function TPhoneOrderForm.SaveOrderPro(var OrderNo: string): boolean;
begin
 BackPanel.SetFocus;
 Result := False;
 if Not DataForm.BeginTransaction then Exit;
 if StatusFlag = sNewStatus then
    begin
     DataForm.GenerateOrderNo(sOrderNo);
     MachineName := MachineID;
    end
   else
    sOrderNo := OrderNoEdit.Caption;
 if (StatusFlag = sEditStatus) and Not CheckOrderStatus(sOrderNo) then
    begin
     DataForm.RollBack;
     MessageBoxForm.MessagePro('This order has been changed by another user.' +
                               Chr(13) + Chr(10) + Chr(13) + Chr(10) +
                               'You can not save this order.', sErrorMsg);
     Exit;
    end;
 try
  Result := SaveData(sOrderNo);
  if Result and LoyaltyAwardAvailible and (VIPNoEdit.Caption <> '') and
     (RewardPointsDiscount >= 0.01) then
     Result := DataForm.SavePointsPayment(sOrderNo, StrToInt(VIPNoEdit.Caption),
               Round(RewardPointsDiscount * PaymentPoints));
 finally
  if Result then
     begin
      DataForm.CommitTransaction;
      OrderNo := sOrderNo;
     end
    else
     DataForm.RollBack;
 end;
end;

procedure TPhoneOrderForm.PrintJobListPro(OrderNo: string);
begin
 if AutoPrintPhoneOrderJobList then
    begin
     PrintJobListControlForm.PrintJobListControlPro(OrderNo, '', False, sConfirmedOrder);
     if AutoPrintCheckList then
        PrintCheckListForm.PrintCheckList(OrderNo, '', False, sConfirmedOrder);
     Application.ProcessMessages;
    end;
 if FVar.KitchenScreen = 1 then
    begin
     SendToScreenForm.SendToScreenPro(OrderNo, '', False);
     Application.ProcessMessages;
    end;
end;

function TPhoneOrderForm.CheckDeliveryCharge: boolean;
var
 I: integer;
begin
 I := 1;
 repeat
  if StringGrid.Cells[7, I] <> DeliveryChargeItemCode then
     I := I + 1;
 until (StringGrid.Cells[7, I] = DeliveryChargeItemCode) or (I > 500);
 Result := (I < 500) and (StringGrid.Cells[7, I] = DeliveryChargeItemCode);
end;

procedure TPhoneOrderForm.AddDeliveryCharge;
begin
 CurrentRow := FindLastRow;
 if (CurrentRow <= 500) and (StringGrid.Cells[1, CurrentRow] = '') then
    begin
     StringGrid.Row := CurrentRow;
     CurrentCol := 1;
     StringGrid.Col := 1;
     StringGrid.Cells[7, CurrentRow] := DeliveryChargeItemCode;
     Changed := True;
     if CheckCells(CurrentCol, CurrentRow) then MoveToNextCell;
    end;
end;

procedure TPhoneOrderForm.BalanceButtonClick(Sender: TObject);
var
 OrderNo: string;
 TotalSales, Amount, Discount: double;
begin
 if ((StatusFlag <> sEditStatus) and (FindLastRow = 1)) or Not DataForm.CheckItemCode(StringGrid, 7) then Exit;
 CalcAmount;
 if (MaxDollarDiscount >= 0.01) and (DiscountEdit.Caption <> '') and
    (StrToFloat(DiscountEdit.Caption) > MaxDollarDiscount) then
    begin
     MessageBoxForm.MessagePro('Discount is over ' + FormatCurrency(MaxDollarDiscount) + '.' +
     Chr(13) + Chr(10) + Chr(13) + Chr(10) +
     'System will auto change discount to ' + FormatCurrency(MaxDollarDiscount) + '.', sErrorMsg);
     DiscountRate := 0;
     DollarDiscount := MaxDollarDiscount;
     DiscountKind := 2;
     ProcessDiscount;
    end;
 Amount := StrToFloat(AmountEdit.Caption);
 Discount := StrToFloat(DiscountEdit.Caption);
 TotalSales := StrToFloat(TotalEdit.Caption);
 if (ABS(Amount) <= 0.005) and (ABS(Discount) >= 0.01) then
    begin
     MessageBoxForm.MessagePro('Can not do discount for zero amount order.', sErrorMsg);
     Exit;
    end;
 if (TotalSales < 0) and Not AuthoriseRefund then
    begin
     MessageBoxForm.MessagePro('You have not been authorised to do sales refund.', sErrorMsg);
     Exit;
    end;
 if (OrderType <> sTakeAway) and (sVIPNo = 0) then
    begin
     MessageBoxForm.MessagePro('This order has not been setup customer.' , sErrorMsg);
     Exit;
    end;
 if (OrderType = sPhoneOrderDelivery) and Not DataForm.TestVIPAddress(sVIPNo) then
    begin
     MessageBoxForm.MessagePro('This delivery order has not been setup address.' , sErrorMsg);
     Exit;
    end;
 if (OrderType = sTakeAway) and (CustomerNameEdit.Caption = '') then
    begin
     MessageBoxForm.MessagePro('This Take Away order has not been setup customer name.' , sErrorMsg);
     Exit;
    end;
 if (OrderType = sPhoneOrderDelivery) and AutoAddDeliveryChargeForPhoneOrder and Not CheckDeliveryCharge then
    begin
     MessageBoxForm.MessagePro('This delivery order has not been add delivery charge.' +
       Chr(13) + Chr(10) + Chr(13) + Chr(10) + 'System add delivery charge for this order.', sErrorMsg);
     AddDeliveryCharge;
     Exit;
    end;
 CalcAmount;
 if ((StatusFlag = sEditStatus) or (FindLastRow > 1)) and SaveOrderPro(OrderNo) then
    begin
     SendToSecurityPortPro('[Balance] Button Clicked', '', '', 0, 0, 0, 0);
     PrintJobListPro(OrderNo);
     if AutoPrintBillWhenPhoneOrderSaved then
        case PrintBillMode of
         0, 1: PrintOrderForm.PrintOrderPro(OrderNo);
         2:    PrintOrderForm1.PrintOrderPro(OrderNo, True);
         3:    PrintOrderForm1.PrintOrderPro(OrderNo, False);
         4:    PrintOrderForm2.PrintOrderPro(OrderNo);
         5:    PrintOrderForm3.PrintOrderPro(OrderNo);
        end;
     ReturnFlag := True;
     Close;
    end;
end;

function TPhoneOrderForm.VoidItemPro(ARow: integer; VoidReasonCode: string): integer;
var
 Code, Description, Qty, Price, TaxRate, DiscountRateTemp: string;
 CurRow, InstructionTemp, PriceSelectTemp: integer;
 PaidQtyTemp, OriginalPriceTemp: double;
 DiscountFlagTemp, OpenPriceTemp: boolean;
begin
 CurRow := ARow;
 if StringGrid.Cells[7, CurRow] <> '' then
    repeat
     if  Not VoidFlag[CurRow] and Not OrderInstruction[CurRow] then
         begin
          InstructionTemp := Instruction[CurRow];
          DiscountFlagTemp := DiscountFlag[CurRow];
          OpenPriceTemp := OpenPrice[CurRow];
          PriceSelectTemp := PriceSelect[CurRow];
          PaidQtyTemp := PaidQty[CurRow];
          Code := StringGrid.Cells[7, CurRow];
          Description := StringGrid.Cells[1, CurRow];
          Qty := StringGrid.Cells[2, CurRow];
          Price := StringGrid.Cells[3, CurRow];
          OriginalPriceTemp := OriginalPrice[CurRow];
          if DiscountFlagTemp then
             DiscountRateTemp := StringGrid.Cells[5, CurRow]
            else
             DiscountRateTemp := '0.00';
          TaxRate := StringGrid.Cells[6, CurRow];
          EditFlag[CurRow] := False;
          VoidFlag[CurRow] := True;
          CurrentRow := FindLastRow;
          StringGrid.Cells[7, CurrentRow] := Code;
          StringGrid.Cells[1, CurrentRow] := Description;
          if Qty <> '' then
             Qty := FloatToStr( 0 - StrToFloat(Qty))
            else
             Qty := '0';
          StringGrid.Cells[2, CurrentRow] := Format('%4.2f', [StrToFloat(Qty)]);
          StringGrid.Cells[3, CurrentRow] := Price;
          StringGrid.Cells[5, CurrentRow] := DiscountRateTemp;
          StringGrid.Cells[6, CurrentRow] := TaxRate;
          Instruction[CurrentRow] := InstructionTemp;
          if Instruction[CurrentRow] = 0 then
             VoidReason[CurrentRow] := VoidReasonCode;
          EditFlag[CurrentRow] := False;
          VoidFlag[CurrentRow] := True;
          PrintFlag[CurrentRow] := False;
          CheckListPrinted[CurrentRow] := False;
          SentToKitchen[CurrentRow] := False;
          OpenPrice[CurrentRow] := OpenPriceTemp;
          DiscountFlag[CurrentRow] := DiscountFlagTemp;
          PriceSelect[CurrentRow] := PriceSelectTemp;
          PaidQty[CurrentRow] := PaidQtyTemp;
          OrderOperator[CurrentRow] := sUserName;
          OriginalPrice[CurrentRow] := OriginalPriceTemp;
         end;
     CurRow := CurRow + 1;
    until Instruction[CurRow] = 0;
 StringGrid.Row := CurRow;
 Result := CurRow;
end;

procedure TPhoneOrderForm.InsertItemButtonClick(Sender: TObject);
begin
 StringGrid.SetFocus;
 InsertLine(CurrentRow);
 StringGrid.Row := CurrentRow;
 CurrentCol := 1; StringGrid.Col := 1;
end;

procedure TPhoneOrderForm.VoidItemButtonClick(Sender: TObject);
var
 VoidReasonCode: string;
begin
 StringGrid.SetFocus;
 if Not VoidFlag[CurrentRow] then
    begin
     if Not ShowNegativeQty or EditFlag[CurrentRow] or
        (StringGrid.Cells[7, CurrentRow] = '----') or
        OrderInstruction[CurrentRow] then
        begin
         if (Instruction[CurrentRow] <> 0) or (StringGrid.Cells[7, CurrentRow] = '----') then
            DeleteLine(CurrentRow)
           else
            repeat
             DeleteLine(CurrentRow)
            until Instruction[CurrentRow] = 0;
        end
       else
        if VoidItemAuthority then
           begin
            if Instruction[CurrentRow] <> 0 then
               DeleteLine(CurrentRow)
              else
               begin
                VoidReasonCode := '';
                if AutoPopVoidReason then
                   VoidReasonSelectForm.VoidReasonSelectPro(VoidReasonCode);
                VoidItemPro(CurrentRow, VoidReasonCode);
               end;
           end;
     CalcAmount;
     StringGrid.Refresh;
    end;
end;

procedure TPhoneOrderForm.VoidAllItemButtonClick(Sender: TObject);
var
 I, LastRow: integer;
 VoidReasonCode: string;
begin
 StringGrid.SetFocus;
 if Not VoidItemAuthority and Not Supervisor then
    MessageBoxForm.MessagePro('You have not been authrised to do void item.', sErrorMsg)
   else
    if MessageBoxForm.MessagePro('Are you sure you want to void all items?', sConfirmMsg) = mrYes then
       begin
        LastRow := FindLastRow;
        if Not ShowNegativeQty or (StatusFlag = sNewStatus) then
           for I := 1 to LastRow do DeleteLine(1)
          else
           begin
            if AutoPopVoidReason then VoidReasonSelectForm.VoidReasonSelectPro(VoidReasonCode);
            I := 1;
            while I < LastRow do
             if (StringGrid.Cells[7, I] <> '') and (StringGrid.Cells[7, I] <> '----') then
                I := VoidItemPro(I, '')
               else
                I := I + 1;
            StringGrid.Refresh;
           end;
        CalcAmount;
       end;
end;

function TPhoneOrderForm.GetLastNonInstructionItem: integer;
var
 I: integer;
begin
 I := FindLastRow;
 if I > 1 then Dec(I);
 while (I > 1) and (Instruction[I] = 1) do
  I := I - 1;
 Result := I;
end;

procedure TPhoneOrderForm.QtyButtonClick(Sender: TObject);
var
 NumStr: string;
begin
 with StringGrid do
  begin
   SetFocus;
   if (Cells[1, Row] = '') or OrderInstruction[Row] then Row := GetLastNonInstructionItem;
   if (Row > 0) and (Cells[1, Row] <> '') and (Cells[7, Row] <> '----') and
      Not VoidFlag[Row] and (EditFlag[Row] or Supervisor or Not NotAllowChangeQty) then
      begin
       if (Cells[2, Row] <> '') and (StrToFloat(Cells[2, Row]) <> 0) then
          NumStr := Cells[2, Row]
         else
          NumStr := '1';
       if NumberPadForm.ReadNumberPro(NumStr, False, False, 'Sales Qty', 0) then
          begin
           Col := 2; CurrentCol := 2;
           if Not ChangeQtyWithCondiment or (Instruction[Row] <> 0) then
              Cells[Col, Row] := Format('%4.2f', [StrToFloat(NumStr)])
             else
              repeat
               Cells[Col, Row] := Format('%4.2f', [StrToFloat(NumStr)]);
               Row := Row + 1;
              until Instruction[Row] = 0;
           CurrentRow := Row;
           Changed := True;
           MoveToNextCell;
          end;
      end;
  end;
end;

procedure TPhoneOrderForm.PriceButtonClick(Sender: TObject);
var
 NumStr: string;
begin
 with StringGrid do
  begin
   SetFocus;
   if (Cells[1, Row] = '') or OrderInstruction[Row] then Row := GetLastNonInstructionItem;
   if (Row > 0) and (Cells[1, Row] <> '') and (Cells[7, Row] <> '----') and Not VoidFlag[Row] and
      (Supervisor or (OpenPrice[Row] and (EditFlag[Row] or Not NotAllowChangeQty))) then
      begin
       if (Cells[3, Row] <> '') and (StrToFloat(Cells[3, Row]) <> 0) then
          NumStr := Cells[3, Row]
         else
          NumStr := '0';
       if NumberPadForm.ReadNumberPro(NumStr, False, False, 'Sales Price', 0) then
          begin
           Col := 3; CurrentCol := 3;
           Cells[Col, Row] := NumStr;
           Changed := True;
           MoveToNextCell;
          end;
      end;
  end;
end;

procedure TPhoneOrderForm.DiscountButtonClick(Sender: TObject);
var
 NumStr: string;
 NewDiscountKind: integer;
 Temp: double;
begin
 StringGrid.SetFocus;

 if Not DiscountEnable then
    begin
     MessageBoxForm.MessagePro('You have not been authrised to do discount.', sErrorMsg);
     Exit;
    end;

 NewDiscountKind := DiscountKind;
 if DiscountRateEnterMode = 0 then
    begin
     if Not DiscountForm.ReadDiscountPro(NumStr, NewDiscountKind) then
        Exit
       else
        PresetDiscountCode := ''; 
    end
   else
    begin
     if Not DiscountRateSelectForm.DiscountRateSelectPro(Temp, NewDiscountKind, PresetDiscountCode) then Exit
       else
        NumStr := FloatToStr(Temp);
    end;
 if (NewDiscountKind <= 1) and (StrToFloat(NumStr) > MaxDiscountPercentage) then
    begin
     MessageBoxForm.MessagePro('Discount rate is over ' + Format('%4.2f', [MaxDiscountPercentage]) + ' %.', sErrorMsg);
     Exit;
    end
   else
    if (NewDiscountKind = 2) and (MaxDollarDiscount >= 0.01) and (StrToFloat(NumStr) > MaxDollarDiscount) then
       begin
        MessageBoxForm.MessagePro('Discount is over ' + FormatCurrency(MaxDollarDiscount) + '.', sErrorMsg);
        Exit;
       end;
 case NewDiscountKind of
  0:  begin
       DiscountRate := StrToFloat(NumStr);
       DollarDiscount := 0;
       DiscountKind := NewDiscountKind;
       ProcessDiscount;
      end;
  1:  begin
       if DiscountKind <> 1 then
          begin
           DiscountRate := 0;
           DollarDiscount := 0;
           DiscountKind := 0;
           ProcessDiscount;
          end;
       with StringGrid do
        begin
         if Cells[1, Row] = '' then
            begin
             Row := GetLastNonInstructionItem;
             CurrentRow := Row;
            end;
         if (Row > 0) and (Cells[1, Row] <> '') and (Supervisor Or DiscountFlag[Row]) then
            begin
             Col := 5; CurrentCol := 5;
             Cells[Col, Row] := Format('%4.2f', [StrToFloat(NumStr)]);
             Changed := True;
             MoveToNextCell;
            end;
        end;
       DiscountKind := NewDiscountKind;
      end;
  2:  begin
       DiscountRate := 0;
       DollarDiscount := StrToFloat(NumStr);
       DiscountKind := NewDiscountKind;
       ProcessDiscount;
      end;
 end;
 if (MaxDollarDiscount >= 0.01) and (DiscountEdit.Caption <> '') and
    (StrToFloat(DiscountEdit.Caption) > MaxDollarDiscount) then
    begin
     MessageBoxForm.MessagePro('Discount is over ' + FormatCurrency(MaxDollarDiscount) + '.' +
     Chr(13) + Chr(10) + Chr(13) + Chr(10) +
     'System will auto change discount to ' + FormatCurrency(MaxDollarDiscount) + '.',
     sErrorMsg);
     DiscountRate := 0;
     DollarDiscount := MaxDollarDiscount;
     DiscountKind := 2;
     ProcessDiscount;
    end;
 DiscountOperator := sUserName;
end;

procedure TPhoneOrderForm.CategoryPageUpButtonClick(Sender: TObject);
begin
 if CategoryCurrentPage >= 2 then
    begin
     CategoryCurrentPage := CategoryCurrentPage - 1;
     AssignCategoryKeyBoard;
    end;
 BackPanel.SetFocus;
end;

procedure TPhoneOrderForm.CategoryPageDownButtonClick(Sender: TObject);
begin
 if (CategoryCurrentPage * CategoryCount) < CategoryRowCount then
    begin
     CategoryCurrentPage := CategoryCurrentPage + 1;
     AssignCategoryKeyBoard;
    end;
 BackPanel.SetFocus;
end;

procedure TPhoneOrderForm.PageUpButtonClick(Sender: TObject);
begin
 if MenuCurrentPage >= 2 then
    begin
     MenuCurrentPage := MenuCurrentPage - 1;
     AssignMenuKeyBoard;
    end;
 BackPanel.SetFocus;
end;

procedure TPhoneOrderForm.PageDownButtonClick(Sender: TObject);
begin
 if (MenuCurrentPage * MenuCount) < LastMenuPosition then
    begin
     MenuCurrentPage := MenuCurrentPage + 1;
     AssignMenuKeyBoard;
    end;
 BackPanel.SetFocus;
end;

procedure TPhoneOrderForm.MenuButtonClick(Sender: TObject);
var
 Num: string;
begin
 if TitlePanel.Enabled then
    with Sender As TPanelButton do
     begin
      Num := Copy(Name, 5, 2);
      if Caption <>'' then ProcessMenuButtonTouch(StrToInt(Num));
     end;
end;

procedure TPhoneOrderForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 MenuQuery.Close;
 CategoryQuery.Close;
 Action := caFree;
end;

procedure TPhoneOrderForm.SetDescription(ARow: integer);
var
 Temp: string;
begin
 with StringGrid do
  begin
   Temp := Copy(Cells[1, ARow], 1, 4);
   if (Temp = '[*] ') or (Temp = '[A] ') or (Temp = '[C] ') or (Temp = '[M] ') or (Temp = '[L] ') then
      Temp := Copy(Cells[1, ARow], 5, Length(Cells[1, ARow]) - 4)
    else
      Temp := Cells[1, ARow];
   case Instruction[ARow] of
     0: Cells[1, ARow] := Temp;
     1: Cells[1, ARow] := '[*] ' + Temp;
     2: Cells[1, ARow] := '[+] ' + Temp;
     3: Cells[1, ARow] := '[-] ' + Temp;
     4: Cells[1, ARow] := '[++] ' + Temp;
     5: Cells[1, ARow] := '[L] ' + Temp;
   end;
  end;
end;

procedure TPhoneOrderForm.InstructionButtonClick(Sender: TObject);
var
 Temp, CurRow: integer;
 ItemCode: string;
 Buff: InstructionBuffType;
begin
 StringGrid.SetFocus;
 CurRow := StringGrid.Row;
 if (StringGrid.Cells[7, CurRow] <> '') and (Instruction[CurRow] > 0) and
    (StringGrid.Cells[7, CurRow] <> '----') and Not OrderInstruction[CurRow] and
    Not VoidFlag[CurRow] then
    begin
     Temp := InstructionForm.InstructionPro;
     if Temp >= 0 then
        begin
         Instruction[CurRow] := Temp;
         SetDescription(CurRow);
        end;
    end
   else
    if Not VoidFlag[CurRow] and (StringGrid.Cells[7, CurRow] <> '') and
      (StringGrid.Cells[7, CurRow] <> '----') and Not OrderInstruction[CurRow] then
       begin
        ItemCode := StringGrid.Cells[7, CurRow];
        if DataForm.CheckInstructionLink(ItemCode) and
           InstructionListForm.InstructionPro(ItemCode, Langurage, Buff) then
           ProcessInstruction(Buff);
       end;
 if StringGrid.Enabled then StringGrid.SetFocus;
end;

procedure TPhoneOrderForm.ProcessDiscount;
var
 I, J: integer;
begin
 if DiscountKind = 0 then
    DiscountTitleLabel.Caption := 'DISCOUNT (' + Format('%4.2f', [DiscountRate]) + '%)'
   else
    DiscountTitleLabel.Caption := 'DISCOUNT';
 for I := 1 to 500 do
  with StringGrid do
   if (Cells[7, I] <> '----') then
      begin
       if (Cells[1, I] <> '') and (DiscountKind < 2) and Not VoidFlag[I] and
          Not OrderInstruction[I] and
          (DiscountFlag[I] or (ForceVIPDiscount and (VIPNoEdit.Caption <> ''))) then
          Cells[5, I] := Format('%4.2f', [DiscountRate])
         else
          Cells[5, I] := '';
      end
     else
      for J := 1 to 85 do Cells[5, I] := Cells[5, I] + '-';
 CalcAmount;
end;

procedure TPhoneOrderForm.CategoryButtonClick(Sender: TObject);
var
 Num: string;
begin
 with Sender As TPanelButton do
  begin
   Num := Copy(Name, 9, 2);
   if Caption <>'' then ProcessCategoryButtonTouch(StrToInt(Num));
  end;
end;

function  TPhoneOrderForm.GetSurchargeRate: double;
var
 CurrentDateTime, SurchargeStartDateTime, SurchargeEndDateTime: TDateTime;
begin
 CurrentDateTime := Date + Time;
 if (Time < SurchargeEndTime) and (SurchargeEndTime < SurchargeStartTime) then
    begin
     SurchargeStartDateTime := Date - 1 + SurchargeStartTime;
     SurchargeEndDateTime := Date + SurchargeEndTime;
    end
   else
    if (Time > SurchargeStartTime) and (SurchargeEndTime < SurchargeStartTime) then
       begin
        SurchargeStartDateTime := Date + SurchargeStartTime;
        SurchargeEndDateTime := Date + 1 + SurchargeEndTime;
       end
      else
       begin
        SurchargeStartDateTime := Date + SurchargeStartTime;
        SurchargeEndDateTime := Date + SurchargeEndTime;
       end;
 if (CurrentDateTime >= SurchargeStartDateTime) and (CurrentDateTime <= SurchargeEndDateTime) then
    Result := ServiceChargeRate
   else
    Result := 0;
end;

function  TPhoneOrderForm.GetOtherChargeRate: double;
begin
 if OtherChargeEnable then
    Result := OtherChargeRate
   else
    Result := 0;
end;

procedure TPhoneOrderForm.ServiceEditClick(Sender: TObject);
var
 StaffName: string;
begin
 if Not AssignDriverAuthorised then
    MessageBoxForm.MessagePro('You have not been authorised to assign delivery driver.', sErrorMsg)
   else
    if StaffListForm.ListStaffPro(StaffName) then
       ServiceEdit.Caption := StaffName;
 StringGrid.SetFocus;
end;

procedure TPhoneOrderForm.ConvertLangurage(FirstRow, EndRow: integer);
var
 SQLStr, Description, FieldName: string;
 I: integer;
begin
 for I := FirstRow to EndRow do
  with StringGrid do
   begin
    if (Cells[7, I] <> '') and (Cells[7, I] <> '----') then
       begin
        SQLStr := 'Select Description1, Description2, SubDescription, ' +
           'SubDescription1, SubDescription2, SubDescription3, Multiple ' +
           'From MenuItem ' +
           'Where ItemCode=' + Chr(39) + CheckQuotes(Cells[7, I]) + Chr(39);
        if OpenQuery(SQLStr) then
           begin
            if Langurage or (Query.FieldByName('Description2').AsString = '') then
               Description := Query.FieldByName('Description1').AsString
              else
               Description := Query.FieldByName('Description2').AsString;
            Cells[1, I] := Description;
            if Query.FieldByName('Multiple').AsBoolean then
               begin
                FieldName := GenerateSubDescriptionFieldName(PriceSelect[I]);
                if Query.FieldByName(FieldName).AsString <> '' then
                   Cells[1, I] := Cells[1, I] + ' / ' + Query.FieldByName(FieldName).AsString;
               end;
            SetDescription(I);
           end;
       Query.Close;
     end;
   end;
end;

procedure TPhoneOrderForm.LangurageButtonClick(Sender: TObject);
begin
 Langurage := Not Langurage;
 AssignCategoryKeyBoard;
 AssignMenuKeyBoard;
 ConvertLangurage(1, 500);
end;

procedure TPhoneOrderForm.UpdatePoleMessage;
var
 I: integer;
 Price, Qty: double;
 S1, S2: string;
begin
 with StringGrid do
  begin
   I := Row;
   if (Cells[1, I] = '') Or OrderInstruction[I]  then
      begin
       if (Row > 1) and (Cells[1, I - 1] <> '') then
          I := I - 1;
      end;
   if (Cells[1, I] <> '') and (Cells[7, I] <> '----') then
      begin
       S1 := Cells[1, I];
       if Cells[2, I] <> '' then
          Qty := StrToFloat(Cells[2, I])
         else
          Qty := 0;
       if Cells[3, I] <> '' then
          Price := StrToFloat(Cells[3, I])
         else
          Price := 0;
       if FVar.SendDescription = 0 then
          begin
           S1 := FormatCurrency(Price) + ' X ' + Format('%4.2f', [Qty]);
           S1 := Format('%20s', [S1]);
           S2 := 'Amount' + Format('%14s', [FormatCurrency(Qty * Price)]);
          end
         else
          begin
           S1 := Copy(Cells[1, I], 1, 20);
           if Length(S1) < 20 then
              S1 := S1 + Format('%' + IntToStr(20 - Length(S1)) + 's', [' ']);
           S2 := FormatCurrency(Price) + ' X ' + Format('%4.2f', [Qty]);
           S2 := Format('%20s', [S2]);
          end;
       if FVar.PoleDisplayPort > 0 then DataForm.SendToPoleDisp(S1, S2);
       if FVar.SecondDisplay = 1 then SecondDisplayForm.SetSalesStatus;
      end;
  end;
end;

procedure TPhoneOrderForm.InsertLine(CurrentLine: integer);
var
 I, J: integer;
begin
 for I := 500 Downto CurrentLine + 1 do
  begin
   for J := 1 to 7 do StringGrid.Cells[J, I] := StringGrid.Cells[J, I - 1];
   EditFlag[I] := EditFlag[I - 1];
   VoidFlag[I] := VoidFlag[I - 1];
   PrintFlag[I] := PrintFlag[I - 1];
   CheckListPrinted[I] := CheckListPrinted[I - 1];
   SentToKitchen[I] := SentToKitchen[I - 1];
   OpenPrice[I] := OpenPrice[I - 1];
   DiscountFlag[I] := DiscountFlag[I - 1];
   Instruction[I] := Instruction[I - 1];
   OrderInstruction[I] := OrderInstruction[I - 1];
   PriceSelect[I] := PriceSelect[I - 1];
   PaidQty[I] := PaidQty[I - 1];
   VoidReason[I] := VoidReason[I - 1];
   OrderOperator[I] := OrderOperator[I - 1];
   OriginalPrice[I] := OriginalPrice[I - 1];
  end;
 InitCells(CurrentLine);
end;

procedure TPhoneOrderForm.SplitLineButtonClick(Sender: TObject);
var
 I, J: integer;
begin
 if (StringGrid.Cells[7, CurrentRow] <> '----') and Not OrderInstruction[CurrentRow] and 
    ((CurrentRow > 1) and (StringGrid.Cells[7, CurrentRow - 1] <> '----')) and
    ((CurrentRow < 500) and (StringGrid.Cells[7, CurrentRow + 1] <> '----')) then
    begin
     if (StringGrid.Cells[7, CurrentRow] <> '') or OrderInstruction[CurrentRow] then
        InsertLine(CurrentRow);
     StringGrid.Row := CurrentRow;
     CurrentCol := 1; StringGrid.Col := 1;
     for J := 1 to 6 do
       for I := 1 to 85 do
         StringGrid.Cells[J, CurrentRow] := StringGrid.Cells[J, CurrentRow] + '-';
     StringGrid.Cells[7, CurrentRow] := '----';
     StringGrid.SetFocus;
     if FVar.SecondDisplay = 1 then PostDataToSecondDisplayPro;
    end;
end;

procedure TPhoneOrderForm.MoreFunctionButtonClick(Sender: TObject);
var
 Operation: integer;
 Temp, NumStr: string;
begin
 StringGrid.SetFocus;
 if PhoneFunctionsForm.FunctionPro(Operation) then
    case Operation of
     1: begin
         if DueTime <> 0 then
            Temp := FormatDateTime('hh:mm', DueTime)
           else
            Temp := FormatDateTime('hh:mm', Time);
         if TimeForm.ReadTimePro(Temp) then
            DueTime := StrToTime(Temp);
        end;
     2: CopyMealPackage;
     3: if AutoSurcharge then
           begin
            NumStr := FloatToStr(CurrentServiceChargeRate);
            if NumberPadForm.ReadNumberPro(NumStr, False, False, 'Surcharge Rate', 0) then
               begin
                CurrentServiceChargeRate := Round(StrToFloat(NumStr));
                CalcAmount;
               end;
           end
          else
           MessageBoxForm.MessagePro('Surcharge function is inactive.', sErrorMsg);
     4: if OtherChargeEnable then
           begin
            NumStr := FloatToStr(CurrentOtherChargeRate);
            if NumberPadForm.ReadNumberPro(NumStr, False, False, 'Other Charge Rate', 0) then
               begin
                CurrentOtherChargeRate := Round(StrToFloat(NumStr));
                CalcAmount;
               end;
           end
          else
           MessageBoxForm.MessagePro('Other Charge function is inactive.', sErrorMsg);
     5: RewardPointsProcess;
    end;
end;

procedure TPhoneOrderForm.WeightButtonClick(Sender: TObject);
var
 Flag: boolean;
 Weight: double;
begin
 if FVar.ScalePort = 0 then Exit;
 with StringGrid do
  begin
   SetFocus;
   if Cells[1, Row] = '' then
      begin
       Row := GetLastNonInstructionItem;
       CurrentRow := Row;
     end;
   Flag := False;
   case FVar.ScaleModel of
    0, 5:    Flag := DataForm.ReadDataFromScaleCASAP1W(Weight);  // CAS AP-1W, ACom
    1, 2: Flag := DataForm.ReadDataFromScalePSC(Weight);  // PSC Mettler
    3:    Flag := DataForm.ReadDataFromScaleWedderburn(Weight); // Wedderburn
    4:    Flag := DataForm.ReadDataFromScaleCASPDII(Weight);  // CAS PD-II
   end;
   if Flag and Not VoidFlag[Row] and (Row > 0) and (Cells[1, Row] <> '') and
     (Cells[7, Row] <> '----') and (EditFlag[Row] or Supervisor or Not NotAllowChangeQty) then
      begin
       Col := 2; CurrentCol := 2;
       Cells[Col, Row] := FloatToStr(Weight);
       Changed := True;
       MoveToNextCell;
      end;
  end;
end;

procedure TPhoneOrderForm.SpellInstructionButtonClick(Sender: TObject);
var
 Temp: string;
 CurRow: integer;
begin
 with StringGrid do
  begin
   CurRow := Row;
   if Not EditFlag[CurRow] or
      ((CurRow > 1) and OrderInstruction[CurRow - 1]) or
      ((Cells[1, CurRow] = '') and (CurRow > 1) and (Cells[1, CurRow - 1] = '')) or
      (Cells[7, CurRow] = '----') or
      ((CurRow > 1) and (Cells[7, CurRow - 1] = '----')) then Exit;
   if (CurRow > 0) and (Cells[1, CurRow] <> '') and Not OrderInstruction[CurRow] then
      CurRow := FindLastRow;
   if (KeyboardForm.KeyboardPro(Temp)) and (Temp <> '') then
      begin
       Cells[1, CurRow] := Temp;
       OrderInstruction[CurRow] := True;
       Instruction[CurRow] := 1;
      end;
   SetFocus;
  end;
end;

procedure TPhoneOrderForm.AssignDriverButtonClick(Sender: TObject);
begin
 ServiceEditClick(Sender);
end;

procedure TPhoneOrderForm.RewardPointsProcess;
var
 CurrentSalesAmount, AsDollars: double;
begin
 if Not LoyaltyAwardAvailible then
    MessageBoxForm.MessagePro('Loyalty function is inactive.', sErrorMsg)
   else
    if sVIPNo = 0 then
       MessageBoxForm.MessagePro('There is no customer information for this order.', sErrorMsg)
      else
       begin
        CurrentSalesAmount := StrToFloat(AmountEdit.Caption) - StrToFloat(DiscountEdit.Caption);
        if RewardPointsForm.GetRewardPointsPro(AsDollars, sVIPNo, CurrentSalesAmount, OrderNoEdit.Caption) then
           begin
            RewardPointsDiscount := AsDollars;
            CalcAmount;
           end;
       end;
end;

procedure TPhoneOrderForm.ZoomButtonClick(Sender: TObject);
var
 CurrentRow: integer;
begin
 CurrentRow := FindLastRow;
 EditPanel.Visible := Not EditPanel.Visible;
 if EditPanel.Visible then
    begin
     TotalPanel.Top := BackPanel.Height - TotalPanel.Height - EditPanel.Height - 6;
     StringGridPanel.Height := BackPanel.Height - TotalPanel.Height - EditPanel.Height - TitlePanel.Height - 12;
     if CurrentRow > 12 then
        StringGrid.TopRow := CurrentRow - 11
       else
        StringGrid.TopRow := 1;
    end
   else
    begin
     TotalPanel.Top := BackPanel.Height - TotalPanel.Height - 4;
     StringGridPanel.Height := BackPanel.Height - TotalPanel.Height - TitlePanel.Height - 10;
     if CurrentRow > 22 then
        StringGrid.TopRow := CurrentRow - 21
       else
        StringGrid.TopRow := 1;
    end
end;

procedure TPhoneOrderForm.MenuGroupButtonClick(Sender: TObject);
var
 Temp: string;
begin
 if MenuGroupSelectForm.MenuGroupSelectPro(MenuGroupCode, Temp) then
    begin
     OpenCategory;
     AssignCategoryKeyBoard;
     ProcessCategoryButtonTouch(1);
     AssignMenuKeyBoard;
    end;
end;

procedure TPhoneOrderForm.PickupOrDeliveryButtonClick(Sender: TObject);
begin
 if PhoneOrderSelectForm.SelectPhoneOrder(OrderType) then
    begin
     DisplayBillKind;
     case OrderType of
      sPhoneOrderDelivery: if sVIPNo = 0 then
                              begin
                               MessageBoxForm.MessagePro('This delivery order has not been setup customer.' , sErrorMsg);
                               SearchCustomerButtonClick(Sender);
                               if (sVIPNo > 0) and DataForm.TestVIPAddress(sVIPNo) then
                                  begin
                                   MessageBoxForm.MessagePro('This delivery order has not been setup address.' , sErrorMsg);
                                   ViewCustomerDetailButtonClick(Sender);
                                  end;

                              end;
      sPhoneOrderPickup:   if sVIPNo = 0 then
                              begin
                               MessageBoxForm.MessagePro('This order has not been setup customer.' , sErrorMsg);
                               SearchCustomerButtonClick(Sender);
                              end;
      sTakeAway: begin
                  sVIPNo := 0;
                  if ReadCustomerNameForm.ReadCustomerNamePro(sCustomerName) then
                     CustomerNameEdit.Caption := sCustomerName;
                 end;
     end;
     DisplayVIPNamePro(sVIPNo);
    end;
end;

procedure TPhoneOrderForm.SearchCustomerButtonClick(Sender: TObject);
var
 Flag: boolean;
begin
 if OrderType <> sTakeAway then
    Flag := VIPListForm.VIPListPro(sVIPNo)
   else
    Flag := ReadCustomerNameForm.ReadCustomerNamePro(sCustomerName);
 if Flag then DisplayVIPNamePro(sVIPNo);
end;

procedure TPhoneOrderForm.DisplayBillKind;
begin
 case OrderType of
  sPhoneOrderDelivery: BillKindEdit.Caption := 'Delivery';
  sPhoneOrderPickUp: BillKindEdit.Caption := 'Pick Up';
  sTakeAway: BillKindEdit.Caption := 'Take Away';
 end;
end;

function TPhoneOrderForm.OpenHeadQuery(OrderNo: string): boolean;
var
 SQLStr: string;
begin
 SQLStr := 'Select * From OrderH Where OrderNo=' + Chr(39) + CheckQuotes(OrderNo) + Chr(39);
 Result := OpenQuery(SQLStr);
end;

procedure TPhoneOrderForm.ReadHeadData;
var
 AvailableCredit: double;
begin
 with Query do
  begin
   PaidAmount := FieldByName('PaidAmount').AsFloat;
   Tips := FieldByName('Tips').AsFloat;
   Surcharge := FieldByName('Surcharge').AsFloat;
   OrderDate := FieldByName('OrderDate').AsDateTime;
   DueTime := FieldByName('DueTime').AsDateTime;
   OrderDateEdit.Caption := FormatDateTime('dd/mm/yyyy', OrderDate);
   OrderNoEdit.Caption := FieldByName('OrderNo').AsString;
   if FieldByName('Delivery').AsBoolean then
      OrderType := sPhoneOrderDelivery
     else
      if FieldByName('VIPNo').AsInteger > 0 then
         OrderType := sPhoneOrderPickUp
        else
         OrderType := sTakeAway;
   CurrentPriceIncludesGST := FieldByName('PriceIncludesGST').AsBoolean;
   CurrentGSTRate := FieldByName('CurrentGSTRate').AsFloat;
   ServiceEdit.Caption := FieldByName('ServicePerson').AsString;
   sBookingNo := FieldByName('BookingNo').AsString;
   sVIPNo := FieldByName('VIPNo').AsInteger;
   sCustomerName := FieldByName('CustomerName').AsString;
   InvoiceNo := FieldByName('InvoiceNo').AsString;
   Credit := FieldByName('Credit').AsBoolean;
   CurrentServiceChargeRate := FieldByName('ServiceChargeRate').AsFloat;
   CurrentOtherChargeRate := FieldByName('OtherChargeRate').AsFloat;
   MachineName := FieldByName('MachineID').AsString;
   DollarDiscount := FieldByName('DollarDiscount').AsFloat;
   DiscountKind := FieldByName('DiscountKind').AsInteger;
   RewardPointsDiscount := FieldByName('RewardPoints').AsFloat;
   PresetDiscountCode := FieldByName('PresetDiscountCode').AsString;
   DiscountOperator := FieldByName('DiscountOperator').AsString;
   if CurrentPriceIncludesGST then
      PreAmount := FieldByName('Amount').AsFloat + FieldByName('ServiceCharge').AsFloat +
                   FieldByName('Tips').AsFloat + FieldByName('Surcharge').AsFloat +
                   FieldByName('OtherCharge').AsFloat
    else
      PreAmount := FieldByName('Amount').AsFloat + FieldByName('ServiceCharge').AsFloat +
                   FieldByName('Tips').AsFloat + FieldByName('Surcharge').AsFloat +
                   FieldByName('OtherCharge').AsFloat + FieldByName('GST').AsFloat;
   Close;
  end;
  if (FVar.SecondDisplay = 1) then
     begin
      SecondDisplayForm.AvailableCreditLabel.Visible := False;
      SecondDisplayForm.AvailableCreditEdit.Visible := False;
      if (sVIPNo > 0) then
         AvailableCredit := DataForm.GetAvailableCredit(sVIPNo)
        else
         AvailableCredit := 0;
      if AvailableCredit >= 0.01 then
         begin
          SecondDisplayForm.AvailableCreditLabel.Visible := True;
          SecondDisplayForm.AvailableCreditEdit.Visible := True;
          SecondDisplayForm.AvailableCreditEdit.Caption := Format('%4.2m', [AvailableCredit]);
         end;
     end;
end;

function TPhoneOrderForm.OpenItemQuery(OrderNo: string): boolean;
var
 SQLStr: string;
begin
 SQLStr := 'Select OrderI.ItemCode, Qty, PaidQty, OrderI.Price, ' +
           'Description1, Description2, OrderI.TaxRate, OpenPrice, ' +
           'OrderI.Discount, AllowDiscount, Condition, Multiple, ' +
           'PriceSelect, SubDescription, SubDescription1, ' +
           'SubDescription2, SubDescription3, Seat, IDNo, ' +
           'PrintFlag, CheckListPrinted, SentToKitchen, ' +
           'VoidReason, SpecialOrder, VoidFlag, OrderOperator, ' +
           'OriginalPrice ' +
           'From OrderI, MenuItem ' +
           'Where OrderI.ItemCode = MenuItem.ItemCode and ' +
           'OrderNo=' + Chr(39) + CheckQuotes(OrderNo) + Chr(39) +
           ' Union All ' +
           'Select OrderI.ItemCode, 0, 0, 0, Null, Null, 0, 0, 0, ' +
           '0 As AllowDiscount, 0, CAST(0 As Bit), 0, Null, Null, ' +
           'Null, Null, 0, IDNo, PrintFlag, CheckListPrinted, ' +
           'SentToKitchen, VoidReason, SpecialOrder, Cast(0 As Bit), Null, 0 ' +
           'From OrderI ' +
           'Where OrderI.ItemCode = ' + Chr(39) + '----' + Chr(39) +
           ' and OrderNo=' + Chr(39) + CheckQuotes(OrderNo) + Chr(39) +
           ' Order By IDNo';
 Result := OpenQuery(SQLStr);
end;

procedure TPhoneOrderForm.ReadItemData;
var
 Loop, I, J: integer;
 FieldName: string;
 DisRate: double;
begin
 Loop := 1; PreItemCount := 0;
 with Query do
  begin
   First;
   while Not EOF do
    begin
     if FieldByName('ItemCode').AsString <> '----' then
        begin
         Instruction[Loop] := FieldByName('Condition').AsInteger;
         EditFlag[Loop] := False;
         OrderInstruction[Loop] := False;
         VoidFlag[Loop] := FieldByName('VoidFlag').AsBoolean;
         PrintFlag[Loop] := FieldByName('PrintFlag').AsBoolean;
         CheckListPrinted[Loop] := FieldByName('CheckListPrinted').AsBoolean;
         SentToKitchen[Loop] := FieldByName('SentToKitchen').AsBoolean;
         OpenPrice[Loop] := FieldByName('OpenPrice').AsInteger <> 0;
         DiscountFlag[Loop] := FieldByName('AllowDiscount').AsInteger <> 0;
         PriceSelect[Loop] := FieldByName('PriceSelect').AsInteger;
         PaidQty[Loop] := FieldByName('PaidQty').AsFloat;
         StringGrid.Cells[7, Loop] := FieldByName('ItemCode').AsString;
         VoidReason[Loop] := FieldByName('VoidReason').AsString;
         OrderOperator[Loop] := FieldByName('OrderOperator').AsString;
         OriginalPrice[Loop] := FieldByName('OriginalPrice').AsFloat;
         if Langurage or (FieldByName('Description2').AsString = '') then
            StringGrid.Cells[1, Loop] := FieldByName('Description1').AsString
           else
            StringGrid.Cells[1, Loop] := FieldByName('Description2').AsString;
         if FieldByName('Multiple').AsBoolean then
            begin
             FieldName := GenerateSubDescriptionFieldName(PriceSelect[Loop]);
             if FieldByName(FieldName).AsString <> '' then
                StringGrid.Cells[1, Loop] :=
                 StringGrid.Cells[1, Loop] + ' / ' + FieldByName(FieldName).AsString;
            end;
         if ABS(FieldByName('Qty').AsFloat) >= 0.01 then
            StringGrid.Cells[2, Loop] := Format('%4.2f', [FieldByName('Qty').AsFloat])
           else
            StringGrid.Cells[2, Loop] := '';
         if ABS(FieldByName('Price').AsFloat) >= 0.01 then
            StringGrid.Cells[3, Loop] := Format('%4.2f', [FieldByName('Price').AsFloat])
           else
            StringGrid.Cells[3, Loop] := '';
         DisRate := FieldByName('Discount').AsFloat;
         StringGrid.Cells[5, Loop] := Format('%4.2f', [DisRate]);
         if (DiscountKind = 0) and (Abs(DisRate) >= 0.01) then
            DiscountRate := DisRate;
         StringGrid.Cells[6, Loop] := Format('%4.2f', [FieldByName('TaxRate').AsFloat]);
         SetDescription(Loop);
         if FieldByName('SpecialOrder').AsString <> '' then
            begin
             Loop := Loop + 1;
             StringGrid.Cells[1, Loop] := FieldByName('SpecialOrder').AsString;
             StringGrid.Cells[2, Loop] := '';
             StringGrid.Cells[3, Loop] := '';
             StringGrid.Cells[4, Loop] := '';
             StringGrid.Cells[5, Loop] := '';
             StringGrid.Cells[6, Loop] := '';
             StringGrid.Cells[7, Loop] := '';
             OrderInstruction[Loop] := True;
             Instruction[Loop] := 1;
             EditFlag[Loop] := False;
             VoidFlag[Loop] := FieldByName('VoidFlag').AsBoolean;
             PrintFlag[Loop] := FieldByName('PrintFlag').AsBoolean;
             CheckListPrinted[Loop] := FieldByName('CheckListPrinted').AsBoolean;
             SentToKitchen[Loop] := FieldByName('SentToKitchen').AsBoolean;
             OpenPrice[Loop] := FieldByName('OpenPrice').AsInteger <> 0;
             DiscountFlag[Loop] := False;
             PriceSelect[Loop] := 0;
             PaidQty[Loop] := 0;
             VoidReason[Loop] := '';
             OrderOperator[Loop] := '';
             OriginalPrice[Loop] := 0;
            end;
        end
       else
        begin
         for J := 1 to 6 do
           for I := 1 to 85 do
            StringGrid.Cells[J, Loop] := StringGrid.Cells[J, Loop] + '-';
         StringGrid.cells[7, Loop] := '----';
         EditFlag[Loop] := False;
         PrintFlag[Loop] := FieldByName('PrintFlag').AsBoolean;
         CheckListPrinted[Loop] := FieldByName('CheckListPrinted').AsBoolean;
        end;
      Next; Loop := Loop + 1; PreItemCount := PreItemCount + 1;
    end;
   Close;
  end;
 if Loop < 500 then
    StringGrid.Row := Loop
   else
    StringGrid.Row := 500;
 CurrentRow := StringGrid.Row;
end;

procedure TPhoneOrderForm.DisplayVIPNamePro(VIPNo: integer);
var
 VIPName: string;
 VIPDiscountRate: double;
begin
 if (VIPNo > 0) and DataForm.ReadVIPInformation(VIPNo, VIPName, VIPDiscountRate) then
    begin
     CustomerNameEdit.Caption := VIPName;
     VIPNoEdit.Caption := Format('%8.8d', [sVIPNO]);
     DiscountRate := VIPDiscountRate;
     ProcessDiscount;
     DiscountOperator := sUserName;
    end
   else
    begin
     sVIPNo := 0;
     CustomerNameEdit.Caption := sCustomerName;
     VIPNoEdit.Caption := '';
    end;
end;

procedure TPhoneOrderForm.ReadReservationHead(BookingNo: string);
var
 SQLStr: string;
begin
 SQLStr := 'Select * From BookTable Where BookingNo=' + Chr(39) + CheckQuotes(BookingNo) + Chr(39);
 OpenQuery(SQLStr);
 with Query do
  begin
   sVIPNo := FieldByName('VIPNo').AsInteger;
   sCustomerName := FieldByName('CustomerName').AsString;
   Close;
  end;
end;

procedure TPhoneOrderForm.ReadReservationItem(BookingNo: string);
var
 SQLStr, FieldName: string;
 Loop, I, J: integer;
begin
 SQLStr := 'Select BookDetail.ItemCode, Qty, BookDetail.Price, ' +
           'Description1, Description2, BookDetail.TaxRate, OpenPrice, ' +
           'AllowDiscount, Condition, Multiple, PriceSelect, SubDescription, ' +
           'SubDescription1, SubDescription2, SubDescription3, IDNo, ' +
           'SpecialOrder ' +
           'From BookDetail, MenuItem ' +
           'Where BookDetail.ItemCode = MenuItem.ItemCode and ' +
           'BookingNo=' + Chr(39) + CheckQuotes(BookingNo) + Chr(39) +
           ' Union All ' +
           'Select BookDetail.ItemCode, 0 As Qty, 0 As Price, Null As Description1, ' +
           'Null As Description2, 0 As TaxRate, 0 As OpenPrice, 0 As AllowDiscount, ' +
           '0 As Condition, CAST(0 As Bit) As Multiple, 0 As PriceSelect, ' +
           'Null As SubDescription, Null As SubDescription1, Null As SubDescription2, ' +
           'Null As SubDescription3, IDNo, Null As SpecialOrder ' +
           'From BookDetail ' +
           'Where BookDetail.ItemCode = ' + Chr(39) + '----' + Chr(39) +
           ' and BookingNo=' + Chr(39) + CheckQuotes(BookingNo) + Chr(39) +
           ' Order By IDNo';
 OpenQuery(SQLStr);
 Loop := 1;
 with Query do
  begin
   while Not EOF do
    begin
     if FieldByName('ItemCode').AsString <> '----' then
        begin
         Instruction[Loop] := FieldByName('Condition').AsInteger;
         EditFlag[Loop] := False;
         VoidFlag[Loop] := False;
         PrintFlag[Loop] := False;
         OrderInstruction[Loop] := False;
         CheckListPrinted[Loop] := False;
         SentToKitchen[Loop] := False;
         OpenPrice[Loop] := FieldByName('OpenPrice').AsInteger <> 0;
         DiscountFlag[Loop] := FieldByName('AllowDiscount').AsInteger <> 0;
         PriceSelect[Loop] := FieldByName('PriceSelect').AsInteger;
         PaidQty[Loop] := 0;
         StringGrid.Cells[7, Loop] := FieldByName('ItemCode').AsString;
         VoidReason[Loop] := '';
         OrderOperator[Loop] := sUserName;
         OrderOperator[Loop] := sUserName;
         if Langurage or (FieldByName('Description2').AsString = '') then
            StringGrid.Cells[1, Loop] := FieldByName('Description1').AsString
           else
            StringGrid.Cells[1, Loop] := FieldByName('Description2').AsString;
         if FieldByName('Multiple').AsBoolean then
            begin
             FieldName := GenerateSubDescriptionFieldName(PriceSelect[Loop]);
             if FieldByName(FieldName).AsString <> '' then
                StringGrid.Cells[1, Loop] :=
                 StringGrid.Cells[1, Loop] + ' / ' + FieldByName(FieldName).AsString;
            end;
         if ABS(FieldByName('Qty').AsFloat) >= 0.01 then
            StringGrid.Cells[2, Loop] := Format('%4.2f', [FieldByName('Qty').AsFloat])
           else
            StringGrid.Cells[2, Loop] := '';
         if ABS(FieldByName('Price').AsFloat) >= 0.01 then
            StringGrid.Cells[3, Loop] := Format('%4.2f', [FieldByName('Price').AsFloat])
           else
            StringGrid.Cells[3, Loop] := '';
         OriginalPrice[Loop] := FieldByName('Price').AsFloat;   
         StringGrid.Cells[4, Loop] := '';
         StringGrid.Cells[6, Loop] := Format('%4.2f', [FieldByName('TaxRate').AsFloat]);
         SetDescription(Loop);
         if FieldByName('SpecialOrder').AsString <> '' then
            begin
             Loop := Loop + 1;
             StringGrid.Cells[1, Loop] := FieldByName('SpecialOrder').AsString;
             Instruction[Loop] := 1;
             EditFlag[Loop] := True;
             VoidFlag[Loop] := False;
             OrderInstruction[Loop] := True;
             PrintFlag[Loop] := False;
             CheckListPrinted[Loop] := False;
             SentToKitchen[Loop] := False;
             OpenPrice[Loop] := False;
             DiscountFlag[Loop] := False;
             PriceSelect[Loop] := 0;
             PaidQty[Loop] := 0;
             OrderOperator[Loop] := sUserName;
            end;
        end
       else
        begin
         StringGrid.cells[7, Loop] := '----';
         PrintFlag[Loop] := False;
         CheckListPrinted[Loop] := False;
         for J := 1 to 6 do
           for I := 1 to 85 do
            StringGrid.Cells[J, Loop] := StringGrid.Cells[J, Loop] + '-';
        end;
      Next; Loop := Loop + 1;
    end;
   Close;
  end;
 if Loop < 500 then
    StringGrid.Row := Loop
   else
    StringGrid.Row := 500;
 CurrentRow := StringGrid.Row;
 PreItemCount := 0;
end;

procedure TPhoneOrderForm.DepositButtonClick(Sender: TObject);
begin
 if sVIPNo >= 1 then
    DepositForm.DepositPro(sVIPNo)
   else
    MessageBoxForm.MessagePro('This order has not been entered the VIP Number.', sErrorMsg);
 StringGrid.SetFocus;
end;

procedure TPhoneOrderForm.ReadReservationDetailPro(BookingNo: string);
begin
 ReadReservationHead(BookingNo);
 ReadReservationItem(BookingNo);
end;

procedure TPhoneOrderForm.FormResize(Sender: TObject);
begin
 BackPanel.Left := (Screen.Width - BackPanel.Width) div 2;
 BackPanel.Top := (Screen.Height - BackPanel.Height) div 2;
end;

procedure TPhoneOrderForm.CustomerOrderHistoryButtonClick(Sender: TObject);
var
 SQLStr: string;
 OrderStatus: boolean;
begin
 if (OrderType <> sTakeAway) and (sVIPNo >= 1) then
    begin
     SQLStr := 'Select Count(*) From OrderH Where VIPNo = ' + IntToStr(sVIPNo);
     if StatusFlag = sEditStatus then SQLStr := SQLStr + ' and OrderNo <> ' + Chr(39) + sOrderNo + Chr(39);
     OpenQuery(SQLStr);
     with Query do
      begin
       OrderStatus := Active and (RecordCount >= 1);
       Close;
      end;
     if OrderStatus then
        CustomerLastOrderDetailForm.CustomerLastOrderDetailPro(sVIPNo)
       else
        MessageBoxForm.MessagePro('Can not find any order for this customer.', sErrorMsg);
    end
end;

procedure TPhoneOrderForm.StringGridDblClick(Sender: TObject);
var
 I, LastRow, CurRow: integer;
begin
 CurRow := StringGrid.Row;
 if Not VoidFlag[CurRow] and Not OrderInstruction[CurRow] and (Instruction[CurRow] = 0) and
   (StringGrid.Cells[7, CurRow] <> '----') and (StringGrid.Cells[7, CurRow] <> '') and
    (MessageBoxForm.MessagePro('Are you sure you want to re-order this item?', sConfirmMsg) = mrYes) then
    begin
     LastRow := FindLastRow;
     for I := 1 to 7 do StringGrid.Cells[I, LastRow] := StringGrid.Cells[I, CurRow];
     EditFlag[LastRow] := True;
     VoidFlag[LastRow] := False;
     OrderInstruction[LastRow] := False;
     OrderOperator[LastRow] := sUserName;
     PrintFlag[LastRow] := False;
     CheckListPrinted[LastRow] := False;
     SentToKitchen[LastRow] := False;
     OpenPrice[LastRow] := OpenPrice[CurRow];
     DiscountFlag[LastRow] := DiscountFlag[CurRow];
     PriceSelect[LastRow] := PriceSelect[CurRow];
     OriginalPrice[LastRow] := OriginalPrice[CurRow];
     PaidQty[LastRow] := 0;
     StringGrid.Row := FindLastRow;
     CalcAmount;
    end;
end;

procedure TPhoneOrderForm.ViewCustomerDetailButtonClick(Sender: TObject);
begin
 if (OrderType <> sTakeAway) and (sVIPNo > 0) then
    ViewVIPDetailForm.ViewVIPDetailPro(sVIPNo);
end;

procedure TPhoneOrderForm.SendToSecurityPortPro(OperationMessage, PayBy1, PayBy2: string; Payment1, Payment2, Rounding, Change: double);
var
 Description, PrintStr: string;
 I, CharCount: integer;
 Qty, Price, Amount: double;
begin
 if FVar.SecurityCameraPort = 0 then Exit;
 DataForm.OpenSecurityCameraPort;

 PrintStr := 'Date: ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Date + Time);
 DataForm.SendMsgToSecurityCameraPort(PrintStr);

 PrintStr := 'Operator: ' + sUserName;
 DataForm.SendMsgToSecurityCameraPort(PrintStr);

 for I := 1 to 500 do
  with StringGrid do
   if Cells[1, I] <> '' then
      begin
       Description := Cells[1, I];
       PrintStr := Copy(Description, 1, 40);
       CharCount := 40;
       DataForm.SendMsgToSecurityCameraPort(PrintStr);
       while Length(Description) > CharCount do
        begin
         PrintStr := Copy(Description, CharCount + 1, 40);
         CharCount := CharCount + 40;
         DataForm.SendMsgToSecurityCameraPort(PrintStr);
        end;
       if Cells[2, I] <> '' then
          Qty := StrToFloat(Cells[2, I])
         else
          Qty := 0;
       if Cells[3, I] <> '' then
          Price := StrToFloat(Cells[3, I])
         else
          Price := 0;
       if Cells[4, I] <> '' then
          Amount := StrToFloat(Cells[4, I])
         else
          Amount := 0;
       if (ABS(Qty) >= 0.01) or (ABS(Price) >= 0.01) then
          begin
           PrintStr := Format('%3.2f X %3.2m = %3.2m', [Qty, Price, Amount]);
           PrintStr := Format('%40s', [PrintStr]);
           DataForm.SendMsgToSecurityCameraPort(PrintStr);
          end;
      end;
 PrintStr := 'Amount: ' + Format('%8s', [FormatCurrency(StrToFloat(AmountEdit.Caption))]);
 PrintStr := Format('%40s', [PrintStr]);
 DataForm.SendMsgToSecurityCameraPort(PrintStr);

 PrintStr := DiscountTitleLabel.Caption + ': ' + Format('%8s', [FormatCurrency(StrToFloat(DiscountEdit.Caption))]);
 PrintStr := Format('%40s', [PrintStr]);
 DataForm.SendMsgToSecurityCameraPort(PrintStr);

 if RewardPointsDiscountEdit.Visible then
    begin
     PrintStr := 'POINTS REDEEM: ' + Format('%8s', [FormatCurrency(StrToFloat(RewardPointsDiscountEdit.Caption))]);
     PrintStr := Format('%40s', [PrintStr]);
     DataForm.SendMsgToSecurityCameraPort(PrintStr);
    end;

 if OtherChargeEdit.Visible then
    begin
     PrintStr := OtherChargeLabel.Caption + ': ' + Format('%8s', [FormatCurrency(StrToFloat(OtherChargeEdit.Caption))]);
     PrintStr := Format('%40s', [PrintStr]);
     DataForm.SendMsgToSecurityCameraPort(PrintStr);
    end;

 PrintStr := 'Total: ' + Format('%8s', [FormatCurrency(StrToFloat(TotalEdit.Caption))]);
 PrintStr := Format('%40s', [PrintStr]);
 DataForm.SendMsgToSecurityCameraPort(PrintStr);

  if ABS(Payment1) > 0.01 then
    begin
     PrintStr := PayBy1 + ': ' + Format('%8s', [FormatCurrency(Payment1)]);
     PrintStr := Format('%40s', [PrintStr]);
     DataForm.SendMsgToSecurityCameraPort(PrintStr);
    end;

 if ABS(Payment2) > 0.01 then
    begin
     PrintStr := PayBy2 + ': ' + Format('%8s', [FormatCurrency(Payment2)]);
     PrintStr := Format('%40s', [PrintStr]);
     DataForm.SendMsgToSecurityCameraPort(PrintStr);
    end;

 if ABS(Rounding) > 0.01 then
    begin
     PrintStr := 'Rounding: ' + Format('%8s', [FormatCurrency(Rounding)]);
     PrintStr := Format('%40s', [PrintStr]);
     DataForm.SendMsgToSecurityCameraPort(PrintStr);
    end;

 if ABS(Change) > 0.01 then
    begin
     PrintStr := 'Change: ' + Format('%8s', [FormatCurrency(Change)]);
     PrintStr := Format('%40s', [PrintStr]);
     DataForm.SendMsgToSecurityCameraPort(PrintStr);
    end;

 PrintStr := '*** ' + OperationMessage + ' ***';
 PrintStr := Format('%' + IntToStr((40 - Length(PrintStr)) div 2) + 's%s', ['', PrintStr]);
 DataForm.SendMsgToSecurityCameraPort(PrintStr);
 DataForm.CloseSecurityCameraPort;
end;

procedure TPhoneOrderForm.FormShow(Sender: TObject);
begin
 //MenuCount := (PhoneOrderMenuLine - 1) * 4 + 2;
 //CategoryCount := (PhoneOrderCategoryLine - 1) * 4 + 2;
 Menucount := 50;
 CategoryCount := 11;
 MenuGroupCode := Format('%2.2d', [FVar.DefaultPhoneOrderMenuGroupCode]);
 if Not ShowTaxOnsalesSection and PriceIncludesGST then
    begin
     GSTLabel.Caption := 'Total price includes GST';
     GSTEdit.Visible := False;
    end;
 InitForm;
 InitMenuPanel;
 InitCategoryPanel;
 InitControlButtons;
 InitFixedButtons;
 SetTotalPanelLabelPosition;
 Langurage := True;
 OpenCategory;
 AssignCategoryKeyBoard;
 ProcessCategoryButtonTouch(1);
 AssignMenuKeyBoard;
 Top := 0;
 Left := 0;
 Height := Screen.Height;
 Width := Screen.Width;
 BackPanel.Height := 768;
 BackPanel.Width := 1024;
 BackPanel.Left := (Screen.Width - BackPanel.Width) div 2;
 BackPanel.Top := (Screen.Height - BackPanel.Height) div 2;
 ServiceChargeLabel.Caption := Uppercase(SurchargeName);
 OtherChargeLabel.Caption := Uppercase(OtherChargeName);
 if sOrderNo <> '' then
    begin
     if OpenHeadQuery(sOrderNo) then
        begin
         ReadHeadData;
         Changed := False;
         if OpenItemQuery(sOrderNo) then ReadItemData;
         StatusFlag := sEditStatus;
        end;
    end
   else
    if sBookingNo <> '' then
       begin
        StatusFlag := sNewStatus;
        CurrentPriceIncludesGST := PriceIncludesGST;
        CurrentGSTRate := DefaultGSTRate;
        Changed := False;
        OrderDateEdit.Caption := FormatDateTime('dd/mm/yyyy', Date);
        OrderDate := Date + Time;
        ServiceEdit.Caption := sUserName;
        InvoiceNo := '';
        Credit := False;
        if AutoSurcharge then
           CurrentServiceChargeRate := GetSurchargeRate
          else
           CurrentServiceChargeRate := 0;
        CurrentOtherChargeRate := GetOtherChargeRate;
        ReadReservationDetailPro(sBookingNo);
       end
      else
       begin
        StatusFlag := sNewStatus;
        CurrentPriceIncludesGST := PriceIncludesGST;
        CurrentGSTRate := DefaultGSTRate;
        Changed := False;
        OrderDateEdit.Caption := FormatDateTime('dd/mm/yyyy', Date);
        OrderDate := Date + Time;
        ServiceEdit.Caption := sUserName;
        VIPNoEdit.Caption := Format('%8.8d', [sVIPNo]);
        InvoiceNo := '';
        Credit := False;
        if AutoSurcharge then
           CurrentServiceChargeRate := GetSurchargeRate
          else
           CurrentServiceChargeRate := 0;
        CurrentOtherChargeRate := GetOtherChargeRate;
       end;
 DisplayBillKind;
 DisplayVIPNamePro(sVIPNo);
 CalcAmount;
 if FVar.SecondDisplay = 1 then SecondDisplayForm.SetSalesStatus;
end;

function TPhoneOrderForm.PhoneOrderPro(VIPNo, OrderType: integer; OrderNo, CustomerName, BookingNo: string): boolean;
begin
 Application.CreateForm(TPhoneOrderForm, PhoneOrderForm);
 PhoneOrderForm.sVIPNo := VIPNo;
 PhoneOrderForm.OrderType := OrderType;
 PhoneOrderForm.sOrderNo := OrderNo;
 PhoneOrderForm.sCustomerName := CustomerName;
 PhoneOrderForm.sBookingNo := BookingNo;
 PhoneOrderForm.ShowModal;
 Result := PhoneOrderForm.ReturnFlag;
 PhoneOrderForm.Free;
end;

end.

