inherited Tarefa3: TTarefa3
  Caption = 'MDIChild2'
  ClientHeight = 561
  ClientWidth = 674
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitWidth = 690
  ExplicitHeight = 600
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 545
    Top = 420
    Width = 44
    Height = 13
    Caption = 'Total R$:'
  end
  object Label2: TLabel [1]
    Left = 545
    Top = 475
    Width = 86
    Height = 13
    Caption = 'Total Divis'#245'es R$:'
  end
  inherited Memo1: TMemo
    Top = 520
    Width = 674
    Height = 41
    Align = alBottom
    TabOrder = 5
    Visible = False
    ExplicitTop = 520
    ExplicitWidth = 674
    ExplicitHeight = 41
  end
  object edtTotalDivisoes: TEdit
    Left = 545
    Top = 494
    Width = 121
    Height = 21
    NumbersOnly = True
    ReadOnly = True
    TabOrder = 4
  end
  object edtTotal: TEdit
    Left = 545
    Top = 439
    Width = 121
    Height = 21
    NumbersOnly = True
    ReadOnly = True
    TabOrder = 2
  end
  object btnObterTotal: TButton
    Left = 418
    Top = 439
    Width = 121
    Height = 25
    Action = ACT_OBTERTOTAL
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 16
    Width = 674
    Height = 369
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'IDPROJETO'
        Title.Caption = 'idProjeto'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMEPROJETO'
        Title.Caption = 'NomeProjeto'
        Width = 400
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Caption = 'Valor'
        Width = 80
        Visible = True
      end>
  end
  object btnObterDivisoes: TButton
    Left = 418
    Top = 490
    Width = 121
    Height = 25
    Action = ACT_OBTERDIVISOES
    TabOrder = 3
  end
  object ActionList1: TActionList
    Left = 40
    Top = 416
    object ACT_OBTERTOTAL: TAction
      Caption = 'Obter Total'
      OnExecute = ACT_OBTERTOTALExecute
    end
    object ACT_CARREGARREGISTROS: TAction
      Caption = 'ACT_CARREGARREGISTROS'
      OnExecute = ACT_CARREGARREGISTROSExecute
    end
    object ACT_OBTERDIVISOES: TAction
      Caption = 'Obter Divis'#245'es'
      OnExecute = ACT_OBTERDIVISOESExecute
    end
  end
end
