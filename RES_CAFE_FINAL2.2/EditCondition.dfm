object EditConditionForm: TEditConditionForm
  Left = 328
  Top = 142
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Edit Invoice Condition'
  ClientHeight = 457
  ClientWidth = 735
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000000000000000000088
    88888888888888888888888888000444444444444444444444444444480004FF
    FFFFFFFFFFFFFFFFFFFFFFFF480004F000000FFFFFFFFFFFFFFFFFFF480004F0
    CCCC08000000FFFFFFFFFFFF480004F0CCCC0F09990FFFFFFFFFFFFF480004F0
    CCC00009990FFF00000000FF480004F0CC0BBB0890FFFFFFFFFFFFFF480004F0
    08BBBBB090FFF000000000FF480004FFF0BBBBB80FFFFFFFFFFFFFFF480004FF
    F0BBBBB0FFF00000000000FF480004FFFF0BBB0FFFFFFFFFFFFFFFFF480004FF
    FFF000FFF00000F0000000FF480004FFFFFFFFFFFFFFFFFFFFFFFFFF480004F0
    0000F000000000000F0000FF480004FFFFFFFFFFFFFFFFFFFFFFFFFF480004F0
    000000000F000000000000FF480004FFFFFFFFFFFFFFFFFFFFFFFFFF480004FF
    FFFFFFFFFFFFFFFFFFFFFFFF480004F007FF700F000000FFF000007F480004F7
    00FF700F0087700F0008700F480004FF0000000F008F700F008FFFFF480004FF
    700F007F7087700F007FFFFF480004FFF00700FFF00000FF008FFFFF480004FF
    FF0000FFF007700F7007FFFF480004FFFF0000FFF007700FF000880F480004FF
    FFF007FFF700000FFF00000F480004FFFFFFFFFFFFFFFFFFFFFFFFFF40000444
    444444444444444444444444400000000000000000000000000000000000FFFF
    FFFFFFFFFFFFC000000380000003800000038000000380000003800000038000
    0003800000038000000380000003800000038000000380000003800000038000
    0003800000038000000380000003800000038000000380000003800000038000
    0003800000038000000380000003800000038000000780000007FFFFFFFF}
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Editor: TMemo
    Left = 0
    Top = 39
    Width = 735
    Height = 418
    Align = alClient
    Lines.Strings = (
      '')
    TabOrder = 0
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 735
    Height = 39
    Bands = <>
    Color = clBtnFace
    ParentColor = False
    object SaveButton: TSpeedButton
      Left = 8
      Top = 6
      Width = 25
      Height = 25
      Hint = 'Save [F8]'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
        00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
        00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
        00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
        0003737FFFFFFFFF7F7330099999999900333777777777777733}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = SaveButtonClick
    end
    object CutButton: TSpeedButton
      Left = 64
      Top = 6
      Width = 25
      Height = 25
      Hint = 'Cut'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333FF3333333333333003333333333333377F33333333333307
        733333FFF333337773333C003333307733333777FF333777FFFFC0CC03330770
        000077777FF377777777C033C03077FFFFF077FF77F777FFFFF7CC00000F7777
        777077777777777777773CCCCC00000000003777777777777777333330030FFF
        FFF03333F77F7F3FF3F7333C0C030F00F0F03337777F7F77373733C03C030FFF
        FFF03377F77F7F3F333733C03C030F0FFFF03377F7737F733FF733C000330FFF
        0000337777F37F3F7777333CCC330F0F0FF0333777337F737F37333333330FFF
        0F03333333337FFF7F7333333333000000333333333377777733}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = CutButtonClick
    end
    object UnDoButton: TSpeedButton
      Left = 36
      Top = 6
      Width = 25
      Height = 25
      Hint = 'Undo'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        3333333777333777FF3333993333339993333377FF3333377FF3399993333339
        993337777FF3333377F3393999333333993337F777FF333337FF993399933333
        399377F3777FF333377F993339993333399377F33777FF33377F993333999333
        399377F333777FF3377F993333399933399377F3333777FF377F993333339993
        399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
        99333773FF3333777733339993333339933333773FFFFFF77333333999999999
        3333333777333777333333333999993333333333377777333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = UndoButtonClick
    end
    object CopyButton: TSpeedButton
      Left = 92
      Top = 6
      Width = 25
      Height = 25
      Hint = 'Copy'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
        007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
        7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
        99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = CopyButtonClick
    end
    object PasteButton: TSpeedButton
      Left = 120
      Top = 6
      Width = 25
      Height = 25
      Hint = 'Paste'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000000
        000055555F77777777775555000FFFFFFFF0555F777F5FFFF55755000F0F0000
        FFF05F777F7F77775557000F0F0FFFFFFFF0777F7F7F5FFFFFF70F0F0F0F0000
        00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFFFFF70F0F0F0F0000
        00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFF55570F0F0F0F000F
        FFF07F7F7F7F77755FF70F0F0F0FFFFF00007F7F7F7F5FF577770F0F0F0F00FF
        0F057F7F7F7F77557F750F0F0F0FFFFF00557F7F7F7FFFFF77550F0F0F000000
        05557F7F7F77777775550F0F0000000555557F7F7777777555550F0000000555
        55557F7777777555555500000005555555557777777555555555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = PasteButtonClick
    end
  end
  object bsBusinessSkinForm1: TbsBusinessSkinForm
    UseFormCursorInNCArea = False
    MaxMenuItemsInWindow = 0
    ClientWidth = 0
    ClientHeight = 0
    HideCaptionButtons = False
    AlwaysShowInTray = False
    LogoBitMapTransparent = False
    AlwaysMinimizeToTray = False
    UseSkinFontInMenu = False
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
    Left = 152
    Top = 6
  end
end