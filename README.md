# ItunesShareFile
Share File Through iTunes. 

Documents（NSDocumentDirectory）　　//用于写入应用相关数据文件的目录，在ios中写入这里的文件能够与iTunes共享并访问，存储在这里的文件会自动备份到云端
如需要共享需要在Info.plist 中加入“Application supports iTunes file sharing” ＝ YES 的设置。
