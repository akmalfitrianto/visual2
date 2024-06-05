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
    Edit2: TEdit;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button3Click(Sender: TObject);
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
DataModule4.Zkategori.SQL.Clear;
DataModule4.Zkategori.SQL.Add('insert into kategori values (null, "'+e1.Text+'")');
DataModule4.Zkategori.ExecSQL;

DataModule4.Zkategori.SQL.Clear;
DataModule4.Zkategori.SQL.Add('select * from kategori');
DataModule4.Zkategori.Open;
ShowMessage('Data berhasil disimpan');
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
 with DataModule4.Zkategori do
 begin
   SQL.Clear;
   SQL.Add('update kategori set name="'+e1.text+'" where id ="'+a+'"');
   ExecSQL;

   SQL.Clear;
   SQL.Add('select * from kategori');
   Open;
 end;
ShowMessage('Data berhasil diupdate');
end;

procedure TForm3.DBGrid1CellClick(Column: TColumn);
begin
e1.Text:= DataModule4.Zkategori.Fields[1].AsString;
a:= DataModule4.Zkategori.Fields[0].AsString;
end;

procedure TForm3.Button3Click(Sender: TObject);
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
ShowMessage('Data berhasil dihapus');
end;

end.
