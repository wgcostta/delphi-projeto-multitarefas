inherited Tarefa2: TTarefa2
  Caption = 'MDIChild2'
  ClientHeight = 484
  ClientWidth = 674
  WindowState = wsMaximized
  ExplicitWidth = 690
  ExplicitHeight = 523
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 11
    Width = 89
    Height = 13
    Caption = 'N'#250'mero de Thered'
  end
  object Label2: TLabel [1]
    Left = 8
    Top = 43
    Width = 127
    Height = 13
    Caption = 'Tempo m'#225'x. milissegundos'
  end
  inherited Memo1: TMemo
    Top = 131
    Width = 674
    Height = 353
    Align = alBottom
    TabOrder = 4
    ExplicitTop = 131
    ExplicitWidth = 674
    ExplicitHeight = 353
  end
  object edtTempo: TEdit
    Left = 144
    Top = 40
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 1
    OnKeyDown = edtTempoKeyDown
  end
  object edtContadorThread: TEdit
    Left = 144
    Top = 8
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 0
    OnKeyDown = edtContadorThreadKeyDown
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 69
    Width = 658
    Height = 49
    TabOrder = 3
  end
  object btnIniciar: TButton
    Left = 552
    Top = 8
    Width = 114
    Height = 55
    Action = ACT_INICIAR
    TabOrder = 2
  end
  object ActionList1: TActionList
    Left = 472
    Top = 8
    object ACT_INICIAR: TAction
      Caption = 'Iniciar'
      OnExecute = ACT_INICIARExecute
    end
  end
end
