unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,ShellApi, Vcl.ComCtrls, Vcl.StdCtrls,
  VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.Series, Vcl.ExtCtrls,
  VCLTee.TeeProcs, VCLTee.Chart, Vcl.Imaging.pngimage, StrUtils,jpeg,
  Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, HTMLStatusBar;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Chart1: TChart;
    Button1: TButton;
    Panel1: TPanel;
    Image1: TImage;
    Button2: TButton;
    Panel2: TPanel;
    TrackBar1: TTrackBar;
    CheckBox1: TCheckBox;
    Panel3: TPanel;
    TrackBar2: TTrackBar;
    TrackBar3: TTrackBar;
    Series1: TBarSeries;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Memo2: TMemo;
    Label5: TLabel;
    Label6: TLabel;
    ComboBox1: TComboBox;
    Label7: TLabel;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    HTMLStatusBar1: THTMLStatusBar;
    RadioButton2: TRadioButton;
    RadioButton1: TRadioButton;
    Button3: TButton;
    Button9: TButton;
    ComboBox2: TComboBox;
    Label8: TLabel;
    Series2: TLineSeries;
    CheckBox2: TCheckBox;
    Label9: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure TrackBar3Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);

  private
    { Private declarations }
  public
  procedure AcceptFiles( var msg : TMessage );
      message WM_DROPFILES;
    { Public declarations }
 protected

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Unit2, Unit3;

procedure Split(Delimiter: Char; Str: string; ListOfStrings: TStrings) ;
begin
   ListOfStrings.Clear;
   ListOfStrings.Delimiter       := Delimiter;
   ListOfStrings.StrictDelimiter := True; // Requires D2006 or newer.
   ListOfStrings.DelimitedText   := Str;
end;


procedure TForm1.AcceptFiles( var msg : TMessage );
const
  cnMaxFileNameLen = 255;
var
  i,
  nCount     : integer;
  acFileName : array [0..cnMaxFileNameLen] of char;
begin
  // find out how many files we're accepting
  nCount := DragQueryFile( msg.WParam,
                           $FFFFFFFF,
                           acFileName,
                           cnMaxFileNameLen );

  // query Windows one at a time for the file name
  for i := 0 to nCount-1 do
  begin
    DragQueryFile( msg.WParam, i,
                   acFileName, cnMaxFileNameLen );

    // do your thing with the acFileName
   // MessageBox( Handle, acFileName, '', MB_OK );
    memo1.Lines.LoadFromFile(acFileName);
  end;

  // let Windows know that you're done
  DragFinish( msg.WParam );
  button1.Click;
end;


function Occurrences(const Substring, Text: string): integer;
var
  offset: integer;
begin
  result := 0;
  offset := PosEx(Substring, Text, 1);
  while offset <> 0 do
  begin
    inc(result);
    offset := PosEx(Substring, Text, offset + length(Substring));
  end;
end;


procedure countdates();
var
i:integer;
regel,datum:string;
begin
form1.Memo2.Clear;
form1.combobox1.clear;
form3.ComboBox1.Clear;
;
for I := 1 to form1.memo1.lines.count-1 do
  begin

   regel := form1.memo1.lines[i];
   delete(regel,11,14);

   if (Occurrences(regel,form1.Memo2.Text) = 0 )  then
   begin
      form1.memo2.lines.add(regel);
      form1.ComboBox1.Items.Add(regel);

      form3.ComboBox1.Items.Add(regel);
   end;


  end;


form1.Label6.Caption := IntToStr(form1.memo2.lines.count);
end;



procedure TForm1.Button1Click(Sender: TObject);
var
i,j:integer;
timestamp,value:string;
 sl: tstringlist;
 OutPutList: TStringList;
 datapoints:Integer;
 totaal:extended;
 ml:extended;
 newvalue,oldvalue,lastvalue:extended;
 t46,t45,t44,t43,t42,t41,t40,t39,t38,t37,t36,t35,t34,t33,t32,t31,t30,t29,
 t28,t27,t26,t25,t24,t23,t22,t21,t20,t19,t18,t17,t16,t15,
 t14,t13,t12,t11,t10,t9,t8,t7,t6,t5,t4,t3,t2,t1:extended;
begin
  for j:=0 to Chart1.SeriesCount-1 do
begin
  Chart1.Series[j].Clear;
end;

totaal:= 0;
OutPutList := TStringList.Create;
datapoints:= 0;
oldvalue:= 0;
lastvalue:= 0;

t46 :=0; //45
t45 :=0; //44
t44 :=0; //43
t43 :=0; //42
t42 :=0; //41
t41 :=0; //40
t40 :=0; //39
t39 :=0; //38
t38 :=0; //37
t37 :=0; //36
t36 :=0; //35
t35 :=0; //34
t34 :=0; //33
t33 :=0; //32
t32 :=0; //31
t31 :=0; //30
t30 :=0; //29
t29 :=0; //28
t28 :=0; //27
t27 :=0; //26
t26 :=0; //25
t25 :=0; //24
t24 :=0; //23
t23 :=0; //22
t22 :=0; //21
t21 :=0; //20
t20 :=0; //19
t19 :=0; //18
t18 :=0; //17
t17 :=0; //16
t16 :=0; //15
t15 :=0; //14
t14 :=0; //13
t13 :=0; //12
t12 :=0; //11
t11 :=0; //10
t10 :=0; //9
t9  :=0; //8
t8  :=0; //7
t7  :=0; //6
t6  :=0; //5
t5  :=0; //4
t4  :=0; //3
t3  :=0; //2
t2  :=0; //1
t1  :=0;


for i := 1 to memo1.Lines.Count-1 do
  begin
    Split(';', memo1.Lines[i], OutPutList) ;

      newvalue := StrToFloat(OutPutList[1]); ///regel in llijst
      ///
      ///
     if (combobox2.Text = '1') then
     begin
      t1:= t2;
     end;

    if (combobox2.Text = '2') then
     begin
      t1:= (((T2 + T3)/2));
     end;

     if (combobox2.Text = '3') then
     begin
      t1:= (((T2 + T3 + T4)/3));
     end;

     if (combobox2.Text = '4') then
     begin
      t1:= (((T2 + T3 + T4 +T5)/4));
     end;

     if (combobox2.Text = '5') then
     begin
      t1:= (((T2 + T3 + T4 + T5 + T6)/5));
     end;


     if (combobox2.Text = '10') then
     begin
      t1:= (((T2 + T3 + T4 + T5 + T6 + T7 + T8+ T9 + T10 + T11)/10));
     end;


     if (combobox2.Text = '15') then
     begin
      t1:= (((T2 + T3 + T4 + T5 + T6 + T7 + T8+ T9 + T10 + T11 + T12 + T13 + T14 + T15 + T16)/15));
     end;


     if (combobox2.Text = '20') then
     begin
      t1:= (((T2 + T3 + T4 + T5 + T6 + T7 + T8+ T9 + T10 + T11 + T12 + T13 + T14 + T15 + T16 +T17+ T18 + T19 + T20 + T21)/20));
     end;

     if (combobox2.Text = '25') then
     begin
      t1:= (((T2 + T3 + T4 + T5 + T6 + T7 + T8+ T9 + T10 + T11 + T12 + T13 + T14 + T15 + T16 +T17+ T18 + T19 + T20 + T21 + T22 + T23 + T24 + T25 + T26)/25));
     end;

     if (combobox2.Text = '30') then
     begin
      t1:= (((T2 + T3 + T4 + T5 + T6 + T7 + T8+ T9 + T10 + T11 + T12 + T13 + T14 + T15 + T16 +T17+ T18 + T19 + T20 + T21 + T22 + T23 + T24 + T25 + T26 +T27 + T28 + T29 + T30 + T31)/30));
     end;

    if (combobox2.Text = '35') then
     begin
      t1:= (((T2 + T3 + T4 + T5 + T6 + T7 + T8+ T9 + T10 + T11 + T12 + T13 + T14 + T15 + T16 +T17+ T18 + T19 + T20 + T21 + T22 + T23 + T24 + T25 + T26 +T27 + T28 + T29 + T30 + T31 + T32 + T33 + T34 + T35 + T36)/35));
     end;


     if (combobox2.Text = '40') then
     begin
      t1:= (((T2 + T3 + T4 + T5 + T6 + T7 + T8+ T9 + T10 + T11 + T12 + T13 + T14 + T15 + T16 +T17+ T18 + T19 + T20 + T21 + T22 + T23 + T24 + T25 + T26 +T27 + T28 + T29 + T30 + T31 + T32 + T33 + T34 + T35 + T36 +T37 + T38 + T39 + T40 + T41 )/40));
     end;

     if (combobox2.Text = '45') then
     begin
      t1:= (((T2 + T3 + T4 + T5 + T6 + T7 + T8+ T9 + T10 + T11 + T12 + T13 + T14 + T15 + T16 +T17+ T18 + T19 + T20 + T21 + T22 + T23 + T24 + T25 + T26 +T27 + T28 + T29 + T30 + T31 + T32 + T33 + T34 + T35 + T36 +T37 + T38 + T39 + T40 + T41 +T42 +T43 +T44 +T45 + T46 )/45));
     end;



      if (radiobutton2.Checked = true) then
        begin

          if (newvalue  > t1) OR (newvalue = t1)  then
            begin
              Series1.Add(t1,OutPutList[0],clred);
              //Series2.Add(t1,OutPutList[0],clred);

            end else
            begin
              Series1.Add(-abs(t1),OutPutList[0],clblue);
             // Series2.Add(abs(t1),OutPutList[0],clblue);
            end;

        end else
         begin
          //Series1.Add(0,OutPutList[0]);
          Series1.Add(newvalue,OutPutList[0]);

      end;

      lastvalue:= oldvalue;
      oldvalue:= newvalue;

      t46 := t45;
      t45 := t44;
      t44 := t43;
      t43 := t42;
      t42 := t41;
      t41 := t40;
      t40 := t39;
      t39 := t38;
      t38 := t37;
      t37 := t36;
      t36 := t35;
      t35 := t34;
      t34 := t33;
      t33 := t32;
      t32 := t31;
      t31 := t30;
      t30 := t29;
      t29 := t28;
      t28 := t27;
      t27 := t26;
      t26 := t25;
      t25 := t24;
      t24 := t23;
      t23 := t22;
      t22 := t21;
      t21:=  t20;
      t20 := T19;
      t19 := T18;
      t18 := t17;
      t17 := t16;
      t16 := t15;
      t15 := t14;
      t14 := t13;
      t13 := t12;
      t12 := t11;
      t11 := t10;
      t10 := t9;
      t9  := t8;
      t8  := t7;
      t7  := t6;
      t6  := t5;
      t5  := t4;
      t4  := t3;
      t3  := t2;
      t2  := newvalue;

      datapoints:= datapoints+1;

    totaal := totaal+ StrToInt(OutPutList[1]);

  end;
 OutPutList.Free;
 label4.Caption:= IntToStr(datapoints);
 countdates();
//  label8.Caption:= FloatToStr(totaal * 0.0026);
end;


procedure TForm1.Button2Click(Sender: TObject);
begin
form2.show;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
i,j:integer;
timestamp,value:string;
 sl: tstringlist;
 OutPutList: TStringList;
 datapoints:Integer;
 totaal:extended;
 ml:extended;
 newvalue,oldvalue:extended;
begin
  for j:=0 to Chart1.SeriesCount-1 do
begin
  Chart1.Series[j].Clear;
end;

totaal:= 0;
OutPutList := TStringList.Create;
datapoints:= 0;
oldvalue:= 0;

for i := 1 to memo1.Lines.Count-1 do
  begin
    Split(';', memo1.Lines[i], OutPutList) ;
    ml:=  StrToInt(OutPutList[1])*0.0026;

      newvalue := StrToFloat(OutPutList[1]); ///regel in llijst

      if (radiobutton2.Checked = true) then
        begin

          if (newvalue > oldvalue) OR (newvalue = oldvalue) then
            begin
              Series1.Add(newvalue,OutPutList[0]);
            end else
            begin          //-abs(newvalue)
              Series1.Add(-abs(newvalue),OutPutList[0]);
            end;

        end else
         begin
          //Series1.Add(0,OutPutList[0]);
          //-abs(newvalue)
          Series1.Add(newvalue,OutPutList[0]);
      end;

      oldvalue:= newvalue;
      datapoints:= datapoints+1;

    totaal := totaal+ StrToInt(OutPutList[1]);

  end;
 OutPutList.Free;
 label4.Caption:= IntToStr(datapoints);
 countdates();
//  label8.Caption:= FloatToStr(totaal * 0.0026);
end;

procedure TForm1.Button4Click(Sender: TObject);

var
i,j:integer;
timestamp,value:string;
 sl: tstringlist;
 OutPutList: TStringList;
 datapoints:Integer;
 totaal:extended;
 ml:extended;
 newvalue,oldvalue:extended;
  t46,t45,t44,t43,t42,t41,t40,t39,t38,t37,t36,t35,t34,t33,t32,t31,t30,t29,
 t28,t27,t26,t25,t24,t23,t22,t21,t20,t19,t18,t17,t16,t15,
 t14,t13,t12,t11,t10,t9,t8,t7,t6,t5,t4,t3,t2,t1:extended;
begin
combobox1.ItemIndex:=combobox1.ItemIndex+1;
button8.Click;


end;


procedure TForm1.Button5Click(Sender: TObject);
var
i,j:integer;
timestamp,value:string;
 sl: tstringlist;
 OutPutList: TStringList;
 datapoints:Integer;
 totaal:extended;
 ml:extended;
 oldvalue,newvalue:extended;
begin
combobox1.ItemIndex:=combobox1.ItemIndex-1;

button8.Click;
end;

procedure TForm1.Button6Click(Sender: TObject);
var
date:string;
bmp : TImage;
jpg : TJpegImage;
begin

  date := combobox1.Text;
  date := stringreplace(date, '/', '_',[rfReplaceAll, rfIgnoreCase]);

  chart1.SaveToBitmapFile('images/temp.bmp');

  bmp := TImage.Create(nil);
  jpg := TJpegImage.Create;
  bmp.picture.bitmap.LoadFromFile('images/temp.bmp');
  jpg.Assign( bmp.picture.bitmap );


  deletefile('images/temp.bmp');

  if (date = '') then
  begin
    date := label6.caption+'_days';
  end;


  jpg.SaveToFile('images/'+date+'.jpg');
  jpg.Free;
  bmp.Free;

end;



procedure TForm1.Button7Click(Sender: TObject);
begin
form3.ComboBox1.Text:= combobox1.Text;
form3.show;
form3.Button2.Click;
end;

procedure TForm1.Button8Click(Sender: TObject);
var
i,j:integer;
timestamp,value:string;
 sl: tstringlist;
 OutPutList: TStringList;
 datapoints:Integer;
 totaal:extended;
 ml:extended;
 eenheid, newvalue, oldvalue, lastvalue : extended;
  t46,t45,t44,t43,t42,t41,t40,t39,t38,t37,t36,t35,t34,t33,t32,t31,t30,t29,
 t28,t27,t26,t25,t24,t23,t22,t21,t20,t19,t18,t17,t16,t15,
 t14,t13,t12,t11,t10,t9,t8,t7,t6,t5,t4,t3,t2,t1:extended;
begin
  for j:=0 to Chart1.SeriesCount-1 do
begin
  Chart1.Series[j].Clear;
end;

OutPutList := TStringList.Create;
datapoints:= 0;
totaal:= 0;

t46 :=0; //45
t45 :=0; //44
t44 :=0; //43
t43 :=0; //42
t42 :=0; //41
t41 :=0; //40
t40 :=0; //39
t39 :=0; //38
t38 :=0; //37
t37 :=0; //36
t36 :=0; //35
t35 :=0; //34
t34 :=0; //33
t33 :=0; //32
t32 :=0; //31
t31 :=0; //30
t30 :=0; //29
t29 :=0; //28
t28 :=0; //27
t27 :=0; //26
t26 :=0; //25
t25 :=0; //24
t24 :=0; //23
t23 :=0; //22
t22 :=0; //21
t21 :=0; //20
t20 :=0; //19
t19 :=0; //18
t18 :=0; //17
t17 :=0; //16
t16 :=0; //15
t15 :=0; //14
t14 :=0; //13
t13 :=0; //12
t12 :=0; //11
t11 :=0; //10
t10 :=0; //9
t9  :=0; //8
t8  :=0; //7
t7  :=0; //6
t6  :=0; //5
t5  :=0; //4
t4  :=0; //3
t3  :=0; //2
t2  :=0; //1
t1  :=0;



for i := 1 to memo1.Lines.Count-1 do
  begin

  if (Occurrences(form1.ComboBox1.Text,memo1.Lines[i]) > 0 ) OR (form1.ComboBox1.Text ='') then
    begin

    Split(';', memo1.Lines[i], OutPutList);

      newvalue := StrToFloat(OutPutList[1]); ///regel in llijst
      ///
      ///
     if (combobox2.Text = '1') then
     begin
      t1:= t2;
     end;

    if (combobox2.Text = '2') then
     begin
      t1:= (((T2 + T3)/2));
     end;

     if (combobox2.Text = '3') then
     begin
      t1:= (((T2 + T3 + T4)/3));
     end;

     if (combobox2.Text = '4') then
     begin
      t1:= (((T2 + T3 + T4 +T5)/4));
     end;

     if (combobox2.Text = '5') then
     begin
      t1:= (((T2 + T3 + T4 + T5 + T6)/5));
     end;


     if (combobox2.Text = '10') then
     begin
      t1:= (((T2 + T3 + T4 + T5 + T6 + T7 + T8+ T9 + T10 + T11)/10));
     end;


     if (combobox2.Text = '15') then
     begin
      t1:= (((T2 + T3 + T4 + T5 + T6 + T7 + T8+ T9 + T10 + T11 + T12 + T13 + T14 + T15 + T16)/15));
     end;


     if (combobox2.Text = '20') then
     begin
      t1:= (((T2 + T3 + T4 + T5 + T6 + T7 + T8+ T9 + T10 + T11 + T12 + T13 + T14 + T15 + T16 +T17+ T18 + T19 + T20 + T21)/20));
     end;

     if (combobox2.Text = '25') then
     begin
      t1:= (((T2 + T3 + T4 + T5 + T6 + T7 + T8+ T9 + T10 + T11 + T12 + T13 + T14 + T15 + T16 +T17+ T18 + T19 + T20 + T21 + T22 + T23 + T24 + T25 + T26)/25));
     end;

     if (combobox2.Text = '30') then
     begin
      t1:= (((T2 + T3 + T4 + T5 + T6 + T7 + T8+ T9 + T10 + T11 + T12 + T13 + T14 + T15 + T16 +T17+ T18 + T19 + T20 + T21 + T22 + T23 + T24 + T25 + T26 +T27 + T28 + T29 + T30 + T31)/30));
     end;

    if (combobox2.Text = '35') then
     begin
      t1:= (((T2 + T3 + T4 + T5 + T6 + T7 + T8+ T9 + T10 + T11 + T12 + T13 + T14 + T15 + T16 +T17+ T18 + T19 + T20 + T21 + T22 + T23 + T24 + T25 + T26 +T27 + T28 + T29 + T30 + T31 + T32 + T33 + T34 + T35 + T36)/35));
     end;


     if (combobox2.Text = '40') then
     begin
      t1:= (((T2 + T3 + T4 + T5 + T6 + T7 + T8+ T9 + T10 + T11 + T12 + T13 + T14 + T15 + T16 +T17+ T18 + T19 + T20 + T21 + T22 + T23 + T24 + T25 + T26 +T27 + T28 + T29 + T30 + T31 + T32 + T33 + T34 + T35 + T36 +T37 + T38 + T39 + T40 + T41 )/40));
     end;

     if (combobox2.Text = '45') then
     begin
      t1:= (((T2 + T3 + T4 + T5 + T6 + T7 + T8+ T9 + T10 + T11 + T12 + T13 + T14 + T15 + T16 +T17+ T18 + T19 + T20 + T21 + T22 + T23 + T24 + T25 + T26 +T27 + T28 + T29 + T30 + T31 + T32 + T33 + T34 + T35 + T36 +T37 + T38 + T39 + T40 + T41 +T42 +T43 +T44 +T45 + T46 )/45));
     end;



      if (radiobutton2.Checked = true) then
        begin

          if (newvalue  > t1) OR (newvalue = t1)  then
            begin
              Series1.Add(t1,OutPutList[0],clred);
              //Series2.Add(t1,OutPutList[0],clred);

            end else
            begin
              if (checkbox2.Checked = true) then
                begin
                  Series1.Add(-abs(t1),OutPutList[0],clblue);

                  //Series2.Add(abs(t1),OutPutList[0],clblue);
                end else
                  begin
                  Series1.Add(abs(t1),OutPutList[0],clblue);
                end;

            //  Series2.Add(abs(t1),OutPutList[0],clblue);
            end;

        end else
         begin
          //Series1.Add(0,OutPutList[0]);
          Series1.Add(newvalue,OutPutList[0]);

      end;

      lastvalue:= oldvalue;
      oldvalue:= newvalue;

      t46 := t45;
      t45 := t44;
      t44 := t43;
      t43 := t42;
      t42 := t41;
      t41 := t40;
      t40 := t39;
      t39 := t38;
      t38 := t37;
      t37 := t36;
      t36 := t35;
      t35 := t34;
      t34 := t33;
      t33 := t32;
      t32 := t31;
      t31 := t30;
      t30 := t29;
      t29 := t28;
      t28 := t27;
      t27 := t26;
      t26 := t25;
      t25 := t24;
      t24 := t23;
      t23 := t22;
      t22 := t21;
      t21:=  t20;
      t20 := T19;
      t19 := T18;
      t18 := t17;
      t17 := t16;
      t16 := t15;
      t15 := t14;
      t14 := t13;
      t13 := t12;
      t12 := t11;
      t11 := t10;
      t10 := t9;
      t9  := t8;
      t8  := t7;
      t7  := t6;
      t6  := t5;
      t5  := t4;
      t4  := t3;
      t3  := t2;
      t2  := newvalue;

      datapoints:= datapoints+1;

    totaal := totaal+ StrToInt(OutPutList[1]);
  end;
  end;
 OutPutList.Free;
 label4.Caption:= IntToStr(datapoints);
 //countdates();

 //label8.Caption:= FloatToStr(totaal*0.0026);
end;


procedure TForm1.Button9Click(Sender: TObject);
var
i,j:integer;
timestamp,value:string;
 sl: tstringlist;
 OutPutList: TStringList;
 datapoints:Integer;
 totaal:extended;
 ml:extended;
 newvalue,oldvalue,lastvalue:extended;
 t46,t45,t44,t43,t42,t41,t40,t39,t38,t37,t36,t35,t34,t33,t32,t31,t30,t29,
 t28,t27,t26,t25,t24,t23,t22,t21,t20,t19,t18,t17,t16,t15,
 t14,t13,t12,t11,t10,t9,t8,t7,t6,t5,t4,t3,t2,t1:extended;
begin
  for j:=0 to Chart1.SeriesCount-1 do
begin
  Chart1.Series[j].Clear;
end;

totaal:= 0;
OutPutList := TStringList.Create;
datapoints:= 0;
oldvalue:= 0;
lastvalue:= 0;

t46 :=0; //45
t45 :=0; //44
t44 :=0; //43
t43 :=0; //42
t42 :=0; //41
t41 :=0; //40
t40 :=0; //39
t39 :=0; //38
t38 :=0; //37
t37 :=0; //36
t36 :=0; //35
t35 :=0; //34
t34 :=0; //33
t33 :=0; //32
t32 :=0; //31
t31 :=0; //30
t30 :=0; //29
t29 :=0; //28
t28 :=0; //27
t27 :=0; //26
t26 :=0; //25
t25 :=0; //24
t24 :=0; //23
t23 :=0; //22
t22 :=0; //21
t21 :=0; //20
t20 :=0; //19
t19 :=0; //18
t18 :=0; //17
t17 :=0; //16
t16 :=0; //15
t15 :=0; //14
t14 :=0; //13
t13 :=0; //12
t12 :=0; //11
t11 :=0; //10
t10 :=0; //9
t9  :=0; //8
t8  :=0; //7
t7  :=0; //6
t6  :=0; //5
t5  :=0; //4
t4  :=0; //3
t3  :=0; //2
t2  :=0; //1
t1  :=0;


for i := 1 to memo1.Lines.Count-1 do
  begin
    Split(';', memo1.Lines[i], OutPutList) ;

      newvalue := StrToFloat(OutPutList[1]); ///regel in llijst
      ///
      ///
     if (combobox2.Text = '1') then
     begin
      t1:= t2;
     end;

    if (combobox2.Text = '2') then
     begin
      t1:= (((T2 + T3)/2));
     end;

     if (combobox2.Text = '3') then
     begin
      t1:= (((T2 + T3 + T4)/3));
     end;

     if (combobox2.Text = '4') then
     begin
      t1:= (((T2 + T3 + T4 +T5)/4));
     end;

     if (combobox2.Text = '5') then
     begin
      t1:= (((T2 + T3 + T4 + T5 + T6)/5));
     end;


     if (combobox2.Text = '10') then
     begin
      t1:= (((T2 + T3 + T4 + T5 + T6 + T7 + T8+ T9 + T10 + T11)/10));
     end;


     if (combobox2.Text = '15') then
     begin
      t1:= (((T2 + T3 + T4 + T5 + T6 + T7 + T8+ T9 + T10 + T11 + T12 + T13 + T14 + T15 + T16)/15));
     end;


     if (combobox2.Text = '20') then
     begin
      t1:= (((T2 + T3 + T4 + T5 + T6 + T7 + T8+ T9 + T10 + T11 + T12 + T13 + T14 + T15 + T16 +T17+ T18 + T19 + T20 + T21)/20));
     end;

     if (combobox2.Text = '25') then
     begin
      t1:= (((T2 + T3 + T4 + T5 + T6 + T7 + T8+ T9 + T10 + T11 + T12 + T13 + T14 + T15 + T16 +T17+ T18 + T19 + T20 + T21 + T22 + T23 + T24 + T25 + T26)/25));
     end;

     if (combobox2.Text = '30') then
     begin
      t1:= (((T2 + T3 + T4 + T5 + T6 + T7 + T8+ T9 + T10 + T11 + T12 + T13 + T14 + T15 + T16 +T17+ T18 + T19 + T20 + T21 + T22 + T23 + T24 + T25 + T26 +T27 + T28 + T29 + T30 + T31)/30));
     end;

    if (combobox2.Text = '35') then
     begin
      t1:= (((T2 + T3 + T4 + T5 + T6 + T7 + T8+ T9 + T10 + T11 + T12 + T13 + T14 + T15 + T16 +T17+ T18 + T19 + T20 + T21 + T22 + T23 + T24 + T25 + T26 +T27 + T28 + T29 + T30 + T31 + T32 + T33 + T34 + T35 + T36)/35));
     end;


     if (combobox2.Text = '40') then
     begin
      t1:= (((T2 + T3 + T4 + T5 + T6 + T7 + T8+ T9 + T10 + T11 + T12 + T13 + T14 + T15 + T16 +T17+ T18 + T19 + T20 + T21 + T22 + T23 + T24 + T25 + T26 +T27 + T28 + T29 + T30 + T31 + T32 + T33 + T34 + T35 + T36 +T37 + T38 + T39 + T40 + T41 )/40));
     end;

     if (combobox2.Text = '45') then
     begin
      t1:= (((T2 + T3 + T4 + T5 + T6 + T7 + T8+ T9 + T10 + T11 + T12 + T13 + T14 + T15 + T16 +T17+ T18 + T19 + T20 + T21 + T22 + T23 + T24 + T25 + T26 +T27 + T28 + T29 + T30 + T31 + T32 + T33 + T34 + T35 + T36 +T37 + T38 + T39 + T40 + T41 +T42 +T43 +T44 +T45 + T46 )/45));
     end;



      if (radiobutton2.Checked = true) then
        begin

          if (newvalue  > t1) OR (newvalue = t1)  then
            begin
              Series1.Add(t1,OutPutList[0],clred);
              //Series2.Add(t1,OutPutList[0],clred);

            end else
            begin
              Series1.Add(-abs(t1),OutPutList[0],clblue);
             // Series2.Add(abs(t1),OutPutList[0],clblue);
            end;

        end else
         begin
          //Series1.Add(0,OutPutList[0]);
          Series1.Add(newvalue,OutPutList[0]);

      end;

      lastvalue:= oldvalue;
      oldvalue:= newvalue;

      t46 := t45;
      t45 := t44;
      t44 := t43;
      t43 := t42;
      t42 := t41;
      t41 := t40;
      t40 := t39;
      t39 := t38;
      t38 := t37;
      t37 := t36;
      t36 := t35;
      t35 := t34;
      t34 := t33;
      t33 := t32;
      t32 := t31;
      t31 := t30;
      t30 := t29;
      t29 := t28;
      t28 := t27;
      t27 := t26;
      t26 := t25;
      t25 := t24;
      t24 := t23;
      t23 := t22;
      t22 := t21;
      t21:=  t20;
      t20 := T19;
      t19 := T18;
      t18 := t17;
      t17 := t16;
      t16 := t15;
      t15 := t14;
      t14 := t13;
      t13 := t12;
      t12 := t11;
      t11 := t10;
      t10 := t9;
      t9  := t8;
      t8  := t7;
      t7  := t6;
      t6  := t5;
      t5  := t4;
      t4  := t3;
      t3  := t2;
      t2  := newvalue;

      datapoints:= datapoints+1;

    totaal := totaal+ StrToInt(OutPutList[1]);

  end;
 OutPutList.Free;
 label4.Caption:= IntToStr(datapoints);
 countdates();
//  label8.Caption:= FloatToStr(totaal * 0.0026);
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  if (checkbox1.Checked = false) then
    begin
      Chart1.View3D := False;
    end else
    begin
       Chart1.View3D := True;
    end;

end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
button8.Click;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);

begin
 button8.Click;
end;

procedure TForm1.ComboBox2Change(Sender: TObject);
begin
//button9.Click;
button8.Click;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
     DragAcceptFiles( Handle, True );
end;




procedure TForm1.Image1Click(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', PChar('https://www.q-strip.com?utm_source=qstrip_analyzer'), nil, nil, SW_NORMAL);
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
button8.Click;
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
button8.Click;
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
 chart1.View3DOptions.Rotation:= trackbar1.position;
end;

procedure TForm1.TrackBar2Change(Sender: TObject);
begin
 chart1.View3DOptions.Elevation:= trackbar2.position;
end;

procedure TForm1.TrackBar3Change(Sender: TObject);
begin
 chart1.View3DOptions.Perspective:= TrackBar3.Position;
end;

end.
