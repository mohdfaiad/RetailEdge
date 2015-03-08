object SalesHistoryListForm: TSalesHistoryListForm
  Left = 489
  Top = 184
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Sales History List'
  ClientHeight = 626
  ClientWidth = 867
  Color = 15389375
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object CalcPanel: TbsSkinPanel
    Left = 6
    Top = 462
    Width = 850
    Height = 55
    HintImageIndex = 0
    TabOrder = 1
    SkinData = MainForm.bsSkinData
    SkinDataName = 'panel'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = 14
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultWidth = 0
    DefaultHeight = 0
    UseSkinFont = True
    RibbonStyle = False
    ImagePosition = bsipDefault
    TransparentMode = False
    CaptionImageIndex = -1
    RealHeight = -1
    AutoEnabledControls = True
    CheckedMode = False
    Checked = False
    DefaultAlignment = taLeftJustify
    DefaultCaptionHeight = 22
    BorderStyle = bvFrame
    CaptionMode = False
    RollUpMode = False
    RollUpState = False
    NumGlyphs = 1
    Spacing = 2
    Caption = 'CalcPanel'
    object Label1: TLabel
      Left = 13
      Top = 10
      Width = 36
      Height = 13
      Caption = 'Amount'
    end
    object Label2: TLabel
      Left = 247
      Top = 10
      Width = 31
      Height = 13
      Caption = 'G.S.T.'
    end
    object Label3: TLabel
      Left = 325
      Top = 10
      Width = 53
      Height = 13
      Caption = 'Total Sales'
    end
    object Label5: TLabel
      Left = 559
      Top = 10
      Width = 60
      Height = 13
      Caption = 'Paid Amount'
    end
    object Label6: TLabel
      Left = 637
      Top = 10
      Width = 39
      Height = 13
      Caption = 'Balance'
    end
    object Label7: TLabel
      Left = 715
      Top = 10
      Width = 33
      Height = 13
      Caption = 'People'
    end
    object Label8: TLabel
      Left = 793
      Top = 10
      Width = 31
      Height = 13
      Caption = 'P.P.H.'
    end
    object Label9: TLabel
      Left = 403
      Top = 10
      Width = 20
      Height = 13
      Caption = 'Tips'
    end
    object SurchargeLabel: TLabel
      Left = 91
      Top = 10
      Width = 49
      Height = 13
      Caption = 'Surcharge'
    end
    object Label11: TLabel
      Left = 481
      Top = 10
      Width = 62
      Height = 13
      Caption = 'Bank Charge'
    end
    object OtherChargeLabel: TLabel
      Left = 169
      Top = 10
      Width = 63
      Height = 13
      Caption = 'Other Charge'
    end
    object AmountEdit: TStaticText
      Left = 11
      Top = 28
      Width = 72
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BorderStyle = sbsSingle
      Color = clWhite
      ParentColor = False
      TabOrder = 0
    end
    object GSTEdit: TStaticText
      Left = 245
      Top = 28
      Width = 72
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BorderStyle = sbsSingle
      Color = clWhite
      ParentColor = False
      TabOrder = 1
    end
    object TotalEdit: TStaticText
      Left = 323
      Top = 28
      Width = 72
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BorderStyle = sbsSingle
      Color = clWhite
      ParentColor = False
      TabOrder = 2
    end
    object PaidEdit: TStaticText
      Left = 557
      Top = 28
      Width = 72
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BorderStyle = sbsSingle
      Color = clWhite
      ParentColor = False
      TabOrder = 3
    end
    object BalanceEdit: TStaticText
      Left = 635
      Top = 28
      Width = 72
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BorderStyle = sbsSingle
      Color = clWhite
      ParentColor = False
      TabOrder = 4
    end
    object TotalPersonsEdit: TStaticText
      Left = 713
      Top = 28
      Width = 72
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BorderStyle = sbsSingle
      Color = clWhite
      ParentColor = False
      TabOrder = 5
    end
    object ConsumeEdit: TStaticText
      Left = 791
      Top = 28
      Width = 48
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BorderStyle = sbsSingle
      Color = clWhite
      ParentColor = False
      TabOrder = 6
    end
    object TipsEdit: TStaticText
      Left = 401
      Top = 28
      Width = 72
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BorderStyle = sbsSingle
      Color = clWhite
      ParentColor = False
      TabOrder = 7
    end
    object ServiceChargeEdit: TStaticText
      Left = 89
      Top = 28
      Width = 72
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BorderStyle = sbsSingle
      Color = clWhite
      ParentColor = False
      TabOrder = 8
    end
    object SurchargeEdit: TStaticText
      Left = 479
      Top = 28
      Width = 72
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BorderStyle = sbsSingle
      Color = clWhite
      ParentColor = False
      TabOrder = 9
    end
    object OtherChargeEdit: TStaticText
      Left = 167
      Top = 28
      Width = 72
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BorderStyle = sbsSingle
      Color = clWhite
      ParentColor = False
      TabOrder = 10
    end
  end
  object DBGridPanel: TbsSkinPanel
    Left = 6
    Top = 4
    Width = 850
    Height = 457
    HintImageIndex = 0
    TabOrder = 0
    SkinData = MainForm.bsSkinData
    SkinDataName = 'panel'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = 14
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultWidth = 0
    DefaultHeight = 0
    UseSkinFont = True
    RibbonStyle = False
    ImagePosition = bsipDefault
    TransparentMode = False
    CaptionImageIndex = -1
    RealHeight = -1
    AutoEnabledControls = True
    CheckedMode = False
    Checked = False
    DefaultAlignment = taLeftJustify
    DefaultCaptionHeight = 22
    BorderStyle = bvFrame
    CaptionMode = False
    RollUpMode = False
    RollUpState = False
    NumGlyphs = 1
    Spacing = 2
    Caption = 'DBGridPanel'
    object DBGrid: TDBGrid
      Left = 1
      Top = 1
      Width = 848
      Height = 455
      Align = alClient
      BorderStyle = bsNone
      DataSource = DataSource
      FixedColor = 15389375
      Options = [dgTitles, dgIndicator, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGridDblClick
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'OrderNo'
          Title.Alignment = taCenter
          Title.Caption = 'Order No'
          Width = 75
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'OrderDate'
          Title.Alignment = taCenter
          Title.Caption = 'Date'
          Width = 110
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Persons'
          Title.Alignment = taCenter
          Title.Caption = 'People'
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Amount'
          Title.Alignment = taCenter
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ServiceCharge'
          Title.Alignment = taCenter
          Title.Caption = 'Surcharge'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OtherCharge'
          Title.Alignment = taCenter
          Title.Caption = 'Other Charge'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GST'
          Title.Alignment = taCenter
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NetSales'
          Title.Alignment = taCenter
          Title.Caption = 'Total Sales'
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Tips'
          Title.Alignment = taCenter
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Surcharge'
          Title.Alignment = taCenter
          Title.Caption = 'Bank Charge'
          Width = 73
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PaidAmount'
          Title.Alignment = taCenter
          Title.Caption = 'Paid Amt.'
          Width = 69
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Balance'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'TableNo'
          Title.Alignment = taCenter
          Title.Caption = 'Table No'
          Width = 104
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'InvoiceNo'
          Title.Alignment = taCenter
          Title.Caption = 'Invoice No'
          Width = 82
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ServicePerson'
          Title.Alignment = taCenter
          Title.Caption = 'Service Person'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OpName'
          Title.Alignment = taCenter
          Title.Caption = 'Operator'
          Width = 120
          Visible = True
        end>
    end
  end
  object ControlPanel: TbsSkinPanel
    Left = 6
    Top = 517
    Width = 850
    Height = 41
    HintImageIndex = 0
    TabOrder = 2
    SkinData = MainForm.bsSkinData
    SkinDataName = 'panel'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = 14
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultWidth = 0
    DefaultHeight = 0
    UseSkinFont = True
    RibbonStyle = False
    ImagePosition = bsipDefault
    TransparentMode = False
    CaptionImageIndex = -1
    RealHeight = -1
    AutoEnabledControls = True
    CheckedMode = False
    Checked = False
    DefaultAlignment = taLeftJustify
    DefaultCaptionHeight = 22
    BorderStyle = bvFrame
    CaptionMode = False
    RollUpMode = False
    RollUpState = False
    NumGlyphs = 1
    Spacing = 2
    Caption = 'ControlPanel'
    object Label4: TLabel
      Left = 153
      Top = 14
      Width = 13
      Height = 13
      Caption = 'To'
    end
    object Label10: TLabel
      Left = 16
      Top = 14
      Width = 23
      Height = 13
      Caption = 'Date'
    end
    object DateEdit1: TMaskEdit
      Left = 45
      Top = 10
      Width = 65
      Height = 19
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
      OnChange = DateEdit1Change
      OnClick = DateEditClick
      OnExit = DateEdit1Exit
      OnKeyDown = DateEdit1KeyDown
    end
    object TimeEdit1: TMaskEdit
      Left = 114
      Top = 10
      Width = 33
      Height = 19
      EditMask = '!90:00;1;_'
      MaxLength = 5
      TabOrder = 1
      Text = '  :  '
      OnClick = TimeEditClick
      OnKeyDown = TimeEdit1KeyDown
    end
    object DateEdit2: TMaskEdit
      Left = 172
      Top = 10
      Width = 65
      Height = 19
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 2
      Text = '  /  /    '
      OnClick = DateEditClick
      OnExit = DateEdit2Exit
      OnKeyDown = DateEdit2KeyDown
    end
    object TimeEdit2: TMaskEdit
      Left = 240
      Top = 10
      Width = 33
      Height = 19
      EditMask = '!90:00;1;_'
      MaxLength = 5
      TabOrder = 3
      Text = '  :  '
      OnClick = TimeEditClick
      OnKeyDown = TimeEdit2KeyDown
    end
    object ListComboBox: TComboBox
      Left = 282
      Top = 10
      Width = 130
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 1
      TabOrder = 4
      Text = 'Only list not invoiced'
      Items.Strings = (
        'List all'
        'Only list not invoiced'
        'Only list invoiced')
    end
    object SalesComboBox: TComboBox
      Left = 419
      Top = 10
      Width = 98
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 1
      TabOrder = 5
      Text = 'Table Service'
      Items.Strings = (
        'List All'
        'Table Service'
        'Quick Service'
        'Phone Order')
    end
    object PaymentComboBox: TComboBox
      Left = 524
      Top = 10
      Width = 134
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 1
      TabOrder = 6
      Text = 'Only list un-paid sales'
      Items.Strings = (
        'List all'
        'Only list un-paid sales'
        'Only list paid sales')
    end
    object PaymentMethodComboBox: TComboBox
      Left = 663
      Top = 9
      Width = 173
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 7
    end
  end
  object SearchButton: TXiButton
    Left = 18
    Top = 566
    Width = 100
    Height = 40
    ColorFace = 15987699
    ColorGrad = 12369084
    ColorDark = 10987431
    ColorLight = 16250871
    ColorBorder = 6447714
    ColorText = clBlack
    OverColorFace = 15790320
    OverColorGrad = 10921638
    OverColorDark = 10658466
    OverColorLight = 15658734
    OverColorBorder = 7697781
    OverColorText = clBlack
    DownColorFace = 13290186
    DownColorGrad = 14342874
    DownColorDark = 15329769
    DownColorLight = 8158332
    DownColorBorder = 5131854
    DownColorText = clBlack
    DisabledColorFace = 15658734
    DisabledColorGrad = clWhite
    DisabledColorDark = 13816530
    DisabledColorLight = clWhite
    DisabledColorBorder = clGray
    DisabledColorText = clGray
    ColorFocusRect = 11382189
    ColorScheme = csNeoSilver
    Ctl3D = True
    Layout = blGlyphLeft
    Spacing = 4
    TransparentGlyph = True
    Gradient = True
    HotTrack = True
    Caption = 'Search'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = SearchButtonClick
  end
  object DetailButton: TXiButton
    Left = 122
    Top = 566
    Width = 100
    Height = 40
    ColorFace = 15987699
    ColorGrad = 12369084
    ColorDark = 10987431
    ColorLight = 16250871
    ColorBorder = 6447714
    ColorText = clBlack
    OverColorFace = 15790320
    OverColorGrad = 10921638
    OverColorDark = 10658466
    OverColorLight = 15658734
    OverColorBorder = 7697781
    OverColorText = clBlack
    DownColorFace = 13290186
    DownColorGrad = 14342874
    DownColorDark = 15329769
    DownColorLight = 8158332
    DownColorBorder = 5131854
    DownColorText = clBlack
    DisabledColorFace = 15658734
    DisabledColorGrad = clWhite
    DisabledColorDark = 13816530
    DisabledColorLight = clWhite
    DisabledColorBorder = clGray
    DisabledColorText = clGray
    ColorFocusRect = 11382189
    ColorScheme = csNeoSilver
    Ctl3D = True
    Layout = blGlyphLeft
    Spacing = 4
    TransparentGlyph = True
    Gradient = True
    HotTrack = True
    Caption = 'Detail'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = DetailButtonClick
  end
  object PaymentButton: TXiButton
    Left = 330
    Top = 566
    Width = 100
    Height = 40
    ColorFace = 15987699
    ColorGrad = 12369084
    ColorDark = 10987431
    ColorLight = 16250871
    ColorBorder = 6447714
    ColorText = clBlack
    OverColorFace = 15790320
    OverColorGrad = 10921638
    OverColorDark = 10658466
    OverColorLight = 15658734
    OverColorBorder = 7697781
    OverColorText = clBlack
    DownColorFace = 13290186
    DownColorGrad = 14342874
    DownColorDark = 15329769
    DownColorLight = 8158332
    DownColorBorder = 5131854
    DownColorText = clBlack
    DisabledColorFace = 15658734
    DisabledColorGrad = clWhite
    DisabledColorDark = 13816530
    DisabledColorLight = clWhite
    DisabledColorBorder = clGray
    DisabledColorText = clGray
    ColorFocusRect = 11382189
    ColorScheme = csNeoSilver
    Ctl3D = True
    Layout = blGlyphLeft
    Spacing = 4
    TransparentGlyph = True
    Gradient = True
    HotTrack = True
    Caption = 'Payment'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = PaymentButtonClick
  end
  object PrintReportButton: TXiButton
    Left = 434
    Top = 566
    Width = 100
    Height = 40
    ColorFace = 15987699
    ColorGrad = 12369084
    ColorDark = 10987431
    ColorLight = 16250871
    ColorBorder = 6447714
    ColorText = clBlack
    OverColorFace = 15790320
    OverColorGrad = 10921638
    OverColorDark = 10658466
    OverColorLight = 15658734
    OverColorBorder = 7697781
    OverColorText = clBlack
    DownColorFace = 13290186
    DownColorGrad = 14342874
    DownColorDark = 15329769
    DownColorLight = 8158332
    DownColorBorder = 5131854
    DownColorText = clBlack
    DisabledColorFace = 15658734
    DisabledColorGrad = clWhite
    DisabledColorDark = 13816530
    DisabledColorLight = clWhite
    DisabledColorBorder = clGray
    DisabledColorText = clGray
    ColorFocusRect = 11382189
    ColorScheme = csNeoSilver
    Ctl3D = True
    Layout = blGlyphLeft
    Spacing = 4
    TransparentGlyph = True
    Gradient = True
    HotTrack = True
    Caption = 'Print List'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = PrintReportButtonClick
  end
  object ExitButton: TXiButton
    Left = 746
    Top = 566
    Width = 100
    Height = 40
    ColorFace = 15987699
    ColorGrad = 12369084
    ColorDark = 10987431
    ColorLight = 16250871
    ColorBorder = 6447714
    ColorText = clBlack
    OverColorFace = 15790320
    OverColorGrad = 10921638
    OverColorDark = 10658466
    OverColorLight = 15658734
    OverColorBorder = 7697781
    OverColorText = clBlack
    DownColorFace = 13290186
    DownColorGrad = 14342874
    DownColorDark = 15329769
    DownColorLight = 8158332
    DownColorBorder = 5131854
    DownColorText = clBlack
    DisabledColorFace = 15658734
    DisabledColorGrad = clWhite
    DisabledColorDark = 13816530
    DisabledColorLight = clWhite
    DisabledColorBorder = clGray
    DisabledColorText = clGray
    ColorFocusRect = 11382189
    ColorScheme = csNeoSilver
    Ctl3D = True
    Layout = blGlyphLeft
    Spacing = 4
    TransparentGlyph = True
    Gradient = True
    HotTrack = True
    Caption = 'Exit'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    OnClick = ExitButtonClick
  end
  object ElapseTimeButton: TXiButton
    Left = 226
    Top = 566
    Width = 100
    Height = 40
    ColorFace = 15987699
    ColorGrad = 12369084
    ColorDark = 10987431
    ColorLight = 16250871
    ColorBorder = 6447714
    ColorText = clBlack
    OverColorFace = 15790320
    OverColorGrad = 10921638
    OverColorDark = 10658466
    OverColorLight = 15658734
    OverColorBorder = 7697781
    OverColorText = clBlack
    DownColorFace = 13290186
    DownColorGrad = 14342874
    DownColorDark = 15329769
    DownColorLight = 8158332
    DownColorBorder = 5131854
    DownColorText = clBlack
    DisabledColorFace = 15658734
    DisabledColorGrad = clWhite
    DisabledColorDark = 13816530
    DisabledColorLight = clWhite
    DisabledColorBorder = clGray
    DisabledColorText = clGray
    ColorFocusRect = 11382189
    ColorScheme = csNeoSilver
    Ctl3D = True
    Layout = blGlyphLeft
    Spacing = 4
    TransparentGlyph = True
    Gradient = True
    HotTrack = True
    Caption = 'Elapse Time'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = ElapseTimeButtonClick
  end
  object PrintInvoiceButton: TXiButton
    Left = 538
    Top = 566
    Width = 100
    Height = 40
    ColorFace = 15987699
    ColorGrad = 12369084
    ColorDark = 10987431
    ColorLight = 16250871
    ColorBorder = 6447714
    ColorText = clBlack
    OverColorFace = 15790320
    OverColorGrad = 10921638
    OverColorDark = 10658466
    OverColorLight = 15658734
    OverColorBorder = 7697781
    OverColorText = clBlack
    DownColorFace = 13290186
    DownColorGrad = 14342874
    DownColorDark = 15329769
    DownColorLight = 8158332
    DownColorBorder = 5131854
    DownColorText = clBlack
    DisabledColorFace = 15658734
    DisabledColorGrad = clWhite
    DisabledColorDark = 13816530
    DisabledColorLight = clWhite
    DisabledColorBorder = clGray
    DisabledColorText = clGray
    ColorFocusRect = 11382189
    ColorScheme = csNeoSilver
    Ctl3D = True
    Layout = blGlyphLeft
    Spacing = 4
    TransparentGlyph = True
    Gradient = True
    HotTrack = True
    Caption = 'Print Invoice'
    TabOrder = 8
    OnClick = PrintInvoiceButtonClick
  end
  object PrintBillButton: TXiButton
    Left = 642
    Top = 566
    Width = 100
    Height = 40
    ColorFace = 15987699
    ColorGrad = 12369084
    ColorDark = 10987431
    ColorLight = 16250871
    ColorBorder = 6447714
    ColorText = clBlack
    OverColorFace = 15790320
    OverColorGrad = 10921638
    OverColorDark = 10658466
    OverColorLight = 15658734
    OverColorBorder = 7697781
    OverColorText = clBlack
    DownColorFace = 13290186
    DownColorGrad = 14342874
    DownColorDark = 15329769
    DownColorLight = 8158332
    DownColorBorder = 5131854
    DownColorText = clBlack
    DisabledColorFace = 15658734
    DisabledColorGrad = clWhite
    DisabledColorDark = 13816530
    DisabledColorLight = clWhite
    DisabledColorBorder = clGray
    DisabledColorText = clGray
    ColorFocusRect = 11382189
    ColorScheme = csNeoSilver
    Ctl3D = True
    Layout = blGlyphLeft
    Spacing = 4
    TransparentGlyph = True
    Gradient = True
    HotTrack = True
    Caption = 'Print Bill'
    TabOrder = 9
    OnClick = PrintBillButtonClick
  end
  object DataSource: TDataSource
    DataSet = Query
    Left = 10
    Top = 88
  end
  object Query: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=Hospitality;Data Source=LAPTOP'
    CursorType = ctStatic
    LockType = ltReadOnly
    OnCalcFields = QueryCalcFields
    CommandTimeout = 300
    Parameters = <>
    SQL.Strings = (
      'Select * From OrderH'
      'Order By OrderNo'
      '')
    Left = 42
    Top = 88
    object QueryOrderNo: TStringField
      FieldName = 'OrderNo'
      Size = 10
    end
    object QueryOrderDate: TDateTimeField
      FieldName = 'OrderDate'
      DisplayFormat = 'dd/mm/yyyy hh:mm'
    end
    object QueryPersons: TIntegerField
      FieldName = 'Persons'
    end
    object QueryAmount: TFloatField
      FieldName = 'Amount'
    end
    object QueryGST: TFloatField
      FieldName = 'GST'
    end
    object QueryNetSales: TFloatField
      FieldKind = fkCalculated
      FieldName = 'NetSales'
      Calculated = True
    end
    object QueryInvoiceNo: TStringField
      FieldName = 'InvoiceNo'
      Size = 11
    end
    object QueryPaidAmount: TFloatField
      FieldName = 'PaidAmount'
    end
    object QueryBalance: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Balance'
      Calculated = True
    end
    object QueryServicePerson: TStringField
      FieldName = 'ServicePerson'
      Size = 15
    end
    object QueryTableNo: TStringField
      FieldName = 'TableNo'
      Size = 10
    end
    object QueryTips: TFloatField
      FieldName = 'Tips'
    end
    object QueryServiceCharge: TFloatField
      FieldName = 'ServiceCharge'
    end
    object QuerySurcharge: TFloatField
      FieldName = 'Surcharge'
    end
    object QueryOtherCharge: TFloatField
      FieldName = 'OtherCharge'
    end
    object QueryPriceIncludesGST: TBooleanField
      FieldName = 'PriceIncludesGST'
    end
    object QueryOpName: TStringField
      FieldName = 'OpName'
      Size = 15
    end
  end
  object bsBusinessSkinForm1: TbsBusinessSkinForm
    ShowMDIScrollBars = True
    WindowState = wsNormal
    QuickButtons = <>
    QuickButtonsShowHint = False
    QuickButtonsShowDivider = True
    ClientInActiveEffect = False
    ClientInActiveEffectType = bsieSemiTransparent
    DisableSystemMenu = False
    AlwaysResize = False
    PositionInMonitor = bspDefault
    UseFormCursorInNCArea = False
    MaxMenuItemsInWindow = 0
    ClientWidth = 0
    ClientHeight = 0
    HideCaptionButtons = False
    AlwaysShowInTray = False
    LogoBitMapTransparent = False
    AlwaysMinimizeToTray = False
    UseSkinFontInMenu = False
    UseSkinFontInCaption = True
    UseSkinSizeInMenu = True
    ShowIcon = False
    MaximizeOnFullScreen = False
    AlphaBlend = False
    AlphaBlendAnimation = False
    AlphaBlendValue = 200
    ShowObjectHint = False
    UseDefaultObjectHint = False
    MenusAlphaBlend = False
    MenusAlphaBlendAnimation = False
    MenusAlphaBlendValue = 200
    DefCaptionFont.Charset = DEFAULT_CHARSET
    DefCaptionFont.Color = clBtnText
    DefCaptionFont.Height = 14
    DefCaptionFont.Name = 'Arial'
    DefCaptionFont.Style = [fsBold]
    DefInActiveCaptionFont.Charset = DEFAULT_CHARSET
    DefInActiveCaptionFont.Color = clBtnShadow
    DefInActiveCaptionFont.Height = 14
    DefInActiveCaptionFont.Name = 'Arial'
    DefInActiveCaptionFont.Style = [fsBold]
    DefMenuItemHeight = 20
    DefMenuItemFont.Charset = DEFAULT_CHARSET
    DefMenuItemFont.Color = clWindowText
    DefMenuItemFont.Height = 14
    DefMenuItemFont.Name = 'Arial'
    DefMenuItemFont.Style = []
    UseDefaultSysMenu = False
    SkinData = MainForm.bsSkinData
    MinHeight = 0
    MinWidth = 0
    MaxHeight = 0
    MaxWidth = 0
    Magnetic = False
    MagneticSize = 5
    BorderIcons = []
    Left = 72
    Top = 88
  end
  object PaymentMethodQuery: TADOQuery
    Parameters = <>
    Left = 104
    Top = 88
  end
end
