object DataModule4: TDataModule4
  OldCreateOrder = False
  Left = 641
  Top = 130
  Height = 167
  Width = 269
  object ZConnection1: TZConnection
    ControlsCodePage = cGET_ACP
    AutoEncodeStrings = False
    Connected = True
    HostName = 'localhost'
    Port = 3306
    Database = 'db_penjualan'
    User = 'root'
    Protocol = 'mysql'
    LibraryLocation = 'D:\Semester 4\Pemrograman Visual 2\libmysql.dll'
    Left = 24
    Top = 16
  end
  object Zkategori: TZQuery
    Connection = ZConnection1
    Active = True
    SQL.Strings = (
      'select * from kategori')
    Params = <>
    Left = 96
    Top = 16
  end
  object dskategori: TDataSource
    DataSet = Zkategori
    Left = 96
    Top = 72
  end
end
