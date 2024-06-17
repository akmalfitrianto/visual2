unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    e1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    e2: TEdit;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button3Click(Sender: TObject);
    procedure posisiawal;
    procedure bersih;
    procedure Button4Click(Sender: TObject);
    procedure e2Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  a : string;

implementation

uses
  Unit4;

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
  if e1.Text='' then
  begin
    ShowMessage('Nama Kategori Tidak Boleh Kosong!');
  end else
  if DataModule4.Zkategori.Locate('name',e1.Text,[])then
  begin
    ShowMessage('Nama Kategori '+e1.Text+'Sudah Ada Didalam Sistem!');
  end else
  begin // simpan
    with DataModule4.Zkategori do
    begin
    SQL.Clear;
    SQL.Add('insert into kategori values(null,"'+e1.Text+'")');
    ExecSQL;
    SQL.Clear;
    SQL.Add('select * from kategori');
    Open;
  end;
  ShowMessage('Data Berhasil Disimpan!');
posisiawal;
end;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
 if e1.Text=''then
 begin
    ShowMessage('Nama Kategori Tidak Boleh Kosong!');
 end else
 if e1.Text = DataModule4.Zkategori.Fields[1].AsString then
 begin
    ShowMessage('Nama Kategori'+e1.Text+'Tidak ada perubahan');
 end else
 begin //kode update
    with DataModule4.Zkategori do
    begin
      SQL.Clear;
      SQL.Add('update kategori set name="'+e1.Text+'"where id="'+a+'"');
      ExecSQL;

      SQL.Clear;
      SQL.Add('select * from kategori');
      Open;
    end;
    ShowMessage('Data berhasil diubah');
    posisiawal;
 end;
end;

procedure TForm3.DBGrid1CellClick(Column: TColumn);
begin
e1.Text:= DataModule4.Zkategori.Fields[1].AsString;
a:= DataModule4.Zkategori.Fields[0].AsString;

e1.Enabled:=True;
Button2.Enabled:=True;
Button3.Enabled:=True;
Button5.Enabled:=True;
Button6.Enabled:=False;
Button1.Enabled:=False;
end;

procedure TForm3.Button3Click(Sender: TObject);
begin //kode delete
if MessageDlg('Apakah Anda Yakin Menghapus Data ini?',mtWarning,[mbYes,mbNo],0)=mryes then
  begin
    with DataModule4.Zkategori do
    begin
    SQL.Clear;
    SQL.Add('delete from kategori where id="'+a+'"');
    ExecSQL;

    SQL.Clear;
    SQL.Add('select * from kategori');
    Open;
    end;
    ShowMessage('Data berhasil dihapus!');
  end else
  begin
    ShowMessage('Data batal dihapus!');
  end;
posisiawal;
end;

procedure TForm3.posisiawal;
begin
   bersih;
   Button6.Enabled:=True;
   Button1.Enabled:=False;
   Button2.Enabled:=False;
   Button3.Enabled:=False;
   Button5.Enabled:=False;
   e1.clear;
   e1.Enabled:=False;
end;

procedure TForm3.bersih;
begin
   e1.Clear;
end;

procedure TForm3.Button4Click(Sender: TObject);
begin
    with DataModule4.Zkategori do
    begin
      SQL.Clear;
      SQL.Add('select * from kategori where name = "'+e1.Text+'"');
      Open;
    end;
end;

procedure TForm3.e2Change(Sender: TObject);
begin
  with DataModule4.Zkategori do
  begin
      SQL.Clear;
      SQL.Add('select * from kategori where name like "%'+e2.Text+'%"');
      Open;
  end;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
  posisiawal;
end;

procedure TForm3.Button6Click(Sender: TObject);
begin
  bersih;
  e1.Enabled:=True;
  Button1.Enabled:=True;
  Button2.Enabled:=False;
  Button3.Enabled:=False;
  Button5.Enabled:=True;
  Button6.Enabled:=False;

end;

procedure TForm3.Button5Click(Sender: TObject);
begin
bersih;
posisiawal;
end;

end.
