object DisplayMessageForm: TDisplayMessageForm
  Left = 533
  Top = 532
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 83
  ClientWidth = 279
  Color = 16744448
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object BackPanel: TbsSkinPanel
    Left = 0
    Top = 0
    Width = 279
    Height = 83
    TabOrder = 0
    SkinData = AdministrationForm.bsSkinData
    SkinDataName = 'panel'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = 14
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultWidth = 0
    DefaultHeight = 0
    UseSkinFont = True
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
    Caption = 'BackPanel'
    Align = alClient
    object MessageLabel: TLabel
      Left = 12
      Top = 25
      Width = 252
      Height = 29
      Alignment = taCenter
      AutoSize = False
      Caption = 'MessageLabel'
      Color = 15389375
      ParentColor = False
      Layout = tlCenter
      WordWrap = True
    end
  end
end
