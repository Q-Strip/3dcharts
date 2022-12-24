object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Arduino IoT Cloud REST API '
  ClientHeight = 478
  ClientWidth = 867
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    867
    478)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 26
    Top = 15
    Width = 41
    Height = 13
    Caption = 'Client ID'
  end
  object Label2: TLabel
    Left = 8
    Top = 37
    Width = 61
    Height = 13
    Caption = 'Client Secret'
  end
  object Label5: TLabel
    Left = 748
    Top = 18
    Width = 46
    Height = 13
    Caption = 'Device ID'
    Visible = False
  end
  object Label6: TLabel
    Left = 748
    Top = 40
    Width = 94
    Height = 13
    Caption = 'Device property  ID'
    Visible = False
  end
  object Label7: TLabel
    Left = 310
    Top = -1
    Width = 37
    Height = 13
    Caption = 'Devices'
  end
  object Label3: TLabel
    Left = 500
    Top = -1
    Width = 79
    Height = 13
    Caption = 'Start Sleep Date'
  end
  object Label4: TLabel
    Left = 509
    Top = 458
    Width = 220
    Height = 11
    Anchors = [akLeft, akBottom]
    Caption = 'Q-Strip Fundamental Research Nocturnal Perspiration'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitTop = 460
  end
  object Label8: TLabel
    Left = 496
    Top = 39
    Width = 38
    Height = 13
    Caption = 'Interval'
  end
  object Label9: TLabel
    Left = 698
    Top = 346
    Width = 31
    Height = 13
    Caption = 'Label9'
  end
  object Label10: TLabel
    Left = 620
    Top = 11
    Width = 24
    Height = 13
    Caption = 'Days'
  end
  object Edit1: TEdit
    Left = 75
    Top = 12
    Width = 169
    Height = 21
    TabOrder = 0
    Text = 'gOMrZAfW1byqBzvqBEGJpAN2mC2TWSkj'
  end
  object Edit2: TEdit
    Left = 75
    Top = 30
    Width = 169
    Height = 21
    PasswordChar = '#'
    TabOrder = 1
    Text = 'zkxPC31zCa0QSwt2SRxKIb5onw9n5GmmNWenepSAcA0sQmTLUh1bZagHHODqBBd6'
  end
  object Memo2: TMemo
    Left = 748
    Top = 247
    Width = 466
    Height = 90
    TabOrder = 2
    Visible = False
  end
  object Button2: TButton
    Left = 600
    Top = 34
    Width = 89
    Height = 21
    Caption = 'Plot Sweat Rate'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 29
    Top = 368
    Width = 278
    Height = 273
    TabOrder = 4
    Visible = False
    WordWrap = False
  end
  object Memo3: TMemo
    Left = 748
    Top = 343
    Width = 505
    Height = 102
    TabOrder = 5
    Visible = False
  end
  object Button3: TButton
    Left = 250
    Top = 9
    Width = 57
    Height = 43
    Caption = 'Connect'
    TabOrder = 6
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 667
    Top = 411
    Width = 75
    Height = 25
    Caption = 'Get Data'
    TabOrder = 7
    Visible = False
    OnClick = Button4Click
  end
  object Memo4: TMemo
    Left = 748
    Top = 124
    Width = 466
    Height = 117
    TabOrder = 8
    Visible = False
  end
  object Edit5: TEdit
    Left = 848
    Top = 13
    Width = 329
    Height = 21
    TabOrder = 9
    Text = '0b6894e0-480f-4a54-9c8f-1affb4ed7762'
    Visible = False
  end
  object Edit6: TEdit
    Left = 848
    Top = 35
    Width = 329
    Height = 21
    TabOrder = 10
    Text = '8e7b2151-bd30-47a5-8122-7183560bcb1f'
    Visible = False
  end
  object Button5: TButton
    Left = 517
    Top = 380
    Width = 145
    Height = 25
    Caption = 'Get Devices'
    TabOrder = 11
    Visible = False
    OnClick = Button5Click
  end
  object ComboBox1: TComboBox
    Left = 748
    Top = 89
    Width = 145
    Height = 21
    TabOrder = 12
    Text = 'ComboBox1'
    Visible = False
  end
  object Button1: TButton
    Left = 832
    Top = 64
    Width = 99
    Height = 25
    Caption = 'Get property ID'
    TabOrder = 13
    Visible = False
    OnClick = Button1Click
  end
  object ListBox1: TListBox
    Left = 310
    Top = 12
    Width = 180
    Height = 43
    ItemHeight = 13
    TabOrder = 14
    OnClick = ListBox1Click
  end
  object StringGrid1: TStringGrid
    Left = 403
    Top = 679
    Width = 166
    Height = 76
    RowCount = 1
    FixedRows = 0
    TabOrder = 15
    Visible = False
  end
  object Chart1: TChart
    Left = 8
    Top = 57
    Width = 816
    Height = 392
    BackImage.Inside = True
    BackWall.Emboss.Color = -1
    BackWall.Emboss.Visible = True
    BackWall.Shadow.Visible = True
    BottomWall.Visible = False
    LeftWall.Visible = False
    Legend.CheckBoxes = True
    Legend.DrawBehind = True
    Legend.GlobalTransparency = 15
    Legend.ResizeChart = False
    Legend.Transparent = True
    Title.Text.Strings = (
      'Nocturnal Perspiration')
    Chart3DPercent = 29
    ClipPoints = False
    LeftAxis.LogarithmicBase = 2.718281828459050000
    Panning.MouseWheel = pmwNone
    View3D = False
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 100
    View3DOptions.Rotation = 360
    View3DWalls = False
    ZoomWheel = pmwNormal
    TabOrder = 16
    Anchors = [akLeft, akTop, akRight, akBottom]
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object Series1: TLineSeries
      Marks.Callout.Length = 20
      Title = 'Night 1'
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      Data = {0000000000}
    end
    object Series2: TLineSeries
      SeriesColor = 15106114
      Title = 'Night 2'
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      Data = {0000000000}
    end
    object Series3: TLineSeries
      SeriesColor = 15106114
      Title = 'Night 3'
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      Data = {0000000000}
    end
    object Series4: TLineSeries
      SeriesColor = 15106114
      Title = 'Night 4'
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      Data = {0000000000}
    end
    object Series5: TLineSeries
      SeriesColor = 15106114
      Title = 'Night 5'
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      Data = {0000000000}
    end
    object Series6: TLineSeries
      SeriesColor = 15106114
      Title = 'Night 6'
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      Data = {0000000000}
    end
    object Series7: TLineSeries
      SeriesColor = 16743976
      Title = 'Night 7'
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      Data = {00010000000000000000000000}
      Detail = {0000000000}
    end
  end
  object DateTimePicker1: TDateTimePicker
    Left = 496
    Top = 12
    Width = 98
    Height = 21
    Date = 44800.000000000000000000
    Format = 'yyyy-MM-dd'
    Time = 0.770471238429308900
    TabOrder = 17
  end
  object Memo5: TMemo
    Left = 565
    Top = 66
    Width = 131
    Height = 34
    Lines.Strings = (
      'gOMrZAfW1byqBzvqBEGJpAN2mC2TWSkj'
      'zkxPC31zCa0QSwt2SRxKIb5onw9n5GmmNWenepSAcA0sQmTLUh1bZagHHODqBBd6'
      '')
    TabOrder = 18
    Visible = False
    WordWrap = False
  end
  object Edit3: TEdit
    Left = 552
    Top = 34
    Width = 42
    Height = 21
    TabOrder = 19
    Text = '1000'
  end
  object Button6: TButton
    Left = 687
    Top = 526
    Width = 75
    Height = 25
    Caption = 'Test date'
    TabOrder = 20
    Visible = False
    OnClick = Button6Click
  end
  object Memo6: TMemo
    Left = 370
    Top = 480
    Width = 311
    Height = 89
    TabOrder = 21
    Visible = False
  end
  object TrackBar1: TTrackBar
    Left = 8
    Top = 452
    Width = 273
    Height = 25
    Anchors = [akLeft, akBottom]
    Max = 360
    TabOrder = 22
    TickStyle = tsNone
    OnChange = TrackBar1Change
  end
  object TrackBar2: TTrackBar
    Left = 838
    Top = 58
    Width = 47
    Height = 95
    Anchors = [akTop, akRight]
    Max = 360
    Orientation = trVertical
    TabOrder = 23
    TickStyle = tsNone
    OnChange = TrackBar2Change
  end
  object CheckBox1: TCheckBox
    Left = 335
    Top = 457
    Width = 42
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = '3D'
    TabOrder = 24
    OnClick = CheckBox1Click
  end
  object ComboBox2: TComboBox
    Left = 655
    Top = 8
    Width = 34
    Height = 21
    TabOrder = 25
    Text = '1'
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7')
  end
  object TrackBar3: TTrackBar
    Left = 838
    Top = 187
    Width = 45
    Height = 150
    Anchors = [akTop, akRight]
    Max = 360
    Orientation = trVertical
    TabOrder = 26
    TickStyle = tsNone
    OnChange = TrackBar3Change
  end
  object CheckBox2: TCheckBox
    Left = 383
    Top = 457
    Width = 66
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Log base'
    TabOrder = 27
    OnClick = CheckBox2Click
  end
  object Edit4: TEdit
    Left = 451
    Top = 455
    Width = 25
    Height = 21
    Anchors = [akLeft, akBottom]
    TabOrder = 28
    Text = '1,5'
    OnChange = Edit4Change
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'https://api2.arduino.cc/iot/v1/clients/token'
    ContentType = 'application/x-www-form-urlencoded'
    Params = <>
    Left = 173
    Top = 448
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Method = rmPOST
    Params = <
      item
        Name = 'client_id'
        Options = [poDoNotEncode]
        Value = 'gOMrZAfW1byqBzvqBEGJpAN2mC2TWSkj'
      end
      item
        Name = 'client_secret'
        Options = [poDoNotEncode]
        Value = 'zkxPC31zCa0QSwt2SRxKIb5onw9n5GmmNWenepSAcA0sQmTLUh1bZagHHODqBBd6'
      end
      item
        Name = 'audience'
        Options = [poDoNotEncode]
        Value = 'https://api2.arduino.cc/iot'
      end
      item
        Name = 'grant_type'
        Options = [poDoNotEncode]
        Value = 'client_credentials'
      end>
    Response = RESTResponse1
    Left = 117
    Top = 454
  end
  object RESTResponse1: TRESTResponse
    Left = 301
    Top = 486
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Dataset = ClientDataSet1
    FieldDefs = <>
    Response = RESTResponse1
    Left = 589
    Top = 406
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 229
    Top = 446
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = ClientDataSet1
    ScopeMappings = <>
    Left = 45
    Top = 454
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 249
    Top = 443
    object LinkControlToField1: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = RESTResponse2
      FieldName = 'JSONValue'
      Control = Memo3
      Track = False
    end
    object LinkControlToField2: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = RESTResponse3
      FieldName = 'JSONText'
      Control = Memo4
      Track = False
    end
  end
  object RESTClient2: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'https://api2.arduino.cc/iot/v1/clients/token'
    ContentType = 'application/x-www-form-urlencoded'
    Params = <>
    Left = 56
    Top = 384
  end
  object RESTRequest2: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient2
    Method = rmPOST
    Params = <>
    Response = RESTResponse2
    Left = 136
    Top = 384
  end
  object RESTResponse2: TRESTResponse
    ContentType = 'application/vnd.arduino.token+json'
    RootElement = 'access_token'
    Left = 248
    Top = 384
  end
  object RESTClient3: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 
      'https://api2.arduino.cc/iot/v2/things/0b6894e0-480f-4a54-9c8f-1a' +
      'ffb4ed7762/properties/8e7b2151-bd30-47a5-8122-7183560bcb1f/times' +
      'eries?limit=100'
    ContentType = 'application/x-www-form-urlencoded'
    Params = <>
    Left = 520
    Top = 392
  end
  object RESTRequest3: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient3
    Params = <
      item
        Kind = pkHTTPHEADER
        Name = 'Authorization'
        Options = [poDoNotEncode]
        Value = 
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJodHRwczov' +
          'L2FwaTIuYXJkdWluby5jYy9pb3QiLCJhenAiOiJnT01yWkFmVzFieXFCenZxQkVH' +
          'SnBBTjJtQzJUV1NraiIsImV4cCI6MTY2MTcxNzQxNCwiZ3R5IjoiY2xpZW50LWNy' +
          'ZWRlbnRpYWxzIiwiaHR0cDovL2FyZHVpbm8uY2MvY2xpZW50X2lkIjoiZGVscGhp' +
          'IiwiaHR0cDovL2FyZHVpbm8uY2MvaWQiOiI0NDIzMzY2NS1jYTMwLTQwODctOGM0' +
          'ZS04MzI5YWU0YzRlNWEiLCJodHRwOi8vYXJkdWluby5jYy9yYXRlbGltaXQiOjEs' +
          'Imh0dHA6Ly9hcmR1aW5vLmNjL3VzZXJuYW1lIjoiZGFhbnZhbmRlcndlcmYiLCJp' +
          'YXQiOjE2NjE3MTcxMTQsInN1YiI6ImdPTXJaQWZXMWJ5cUJ6dnFCRUdKcEFOMm1D' +
          'MlRXU2tqQGNsaWVudHMifQ.7JlAe1hNErcTMPP16IFr-5eQYqfBzPl5lTeerDokS' +
          'Zo'
      end>
    Response = RESTResponse3
    Left = 352
    Top = 384
  end
  object RESTResponse3: TRESTResponse
    ContentType = 'text/plain'
    Left = 448
    Top = 384
  end
end
