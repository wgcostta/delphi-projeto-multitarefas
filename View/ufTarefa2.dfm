inherited Tarefa2: TTarefa2
  Caption = 'MDIChild2'
  ClientHeight = 561
  ClientWidth = 674
  WindowState = wsMaximized
  ExplicitWidth = 690
  ExplicitHeight = 600
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 57
    Top = 67
    Width = 89
    Height = 13
    Caption = 'N'#250'mero de Thered'
  end
  object Label2: TLabel [1]
    Left = 30
    Top = 99
    Width = 116
    Height = 13
    Caption = 'Tempo m'#225'x. Milisegunds'
  end
  inherited Memo1: TMemo
    Top = 208
    Width = 674
    Height = 353
    Align = alBottom
    TabOrder = 4
    ExplicitTop = 208
    ExplicitWidth = 674
    ExplicitHeight = 353
  end
  object edtTempo: TEdit
    Left = 152
    Top = 96
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 1
  end
  object edtContadorThread: TEdit
    Left = 152
    Top = 64
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 0
  end
  object ProgressBar1: TProgressBar
    Left = 144
    Top = 144
    Width = 393
    Height = 49
    TabOrder = 3
  end
  object Button1: TButton
    Left = 536
    Top = 56
    Width = 105
    Height = 25
    Caption = 'Button1'
    TabOrder = 2
    OnClick = Button1Click
  end
end
