inherited Tarefa1: TTarefa1
  Left = 195
  Top = 110
  Caption = 'MDIChild1'
  ClientHeight = 375
  ClientWidth = 683
  Position = poDesigned
  WindowState = wsMaximized
  ExplicitWidth = 699
  ExplicitHeight = 414
  PixelsPerInch = 96
  TextHeight = 13
  object lblColunas: TLabel [0]
    Left = 8
    Top = 0
    Width = 42
    Height = 13
    Caption = 'Colunas:'
  end
  object lblTabelas: TLabel [1]
    Left = 184
    Top = 0
    Width = 41
    Height = 13
    Caption = 'Tabelas:'
  end
  object lblCondicoes: TLabel [2]
    Left = 363
    Top = 0
    Width = 53
    Height = 13
    Caption = 'Condi'#231#245'es:'
  end
  object lblGerarSQL: TLabel [3]
    Left = 8
    Top = 201
    Width = 61
    Height = 13
    Caption = 'SQL Gerado:'
  end
  inherited Memo1: TMemo
    Top = 219
    Width = 683
    Height = 156
    Align = alNone
    TabOrder = 4
    ExplicitTop = 219
    ExplicitWidth = 683
    ExplicitHeight = 156
  end
  object memoColunas: TMemo
    Left = 8
    Top = 19
    Width = 161
    Height = 169
    TabOrder = 0
  end
  object memoTabelas: TMemo
    Left = 184
    Top = 19
    Width = 161
    Height = 169
    TabOrder = 1
  end
  object memoCondicoes: TMemo
    Left = 363
    Top = 19
    Width = 161
    Height = 169
    TabOrder = 2
  end
  object btnGerarSQL: TButton
    Left = 530
    Top = 83
    Width = 145
    Height = 30
    Caption = 'Gerar SQL'
    TabOrder = 3
    OnClick = btnGerarSQLClick
  end
  object spQuery1: TspQuery
    Left = 560
    Top = 32
  end
end
