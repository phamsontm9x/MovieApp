//
//  PhimSqlite.m
//  MovieApp
//
//  Created by ThanhSon on 12/28/15.
//  Copyright © 2015 ThanhSon. All rights reserved.
//

#import "PhimSqlite.h"
#import <sqlite3.h>
@implementation PhimSqlite

sqlite3 *DB;


-(id)initWithId:(int)ID tcuaPhim:(NSString*)tencuaPhim tTheloai:(NSString*)tenTheloai thinhTableThumbnail:(NSString*)tenHinhTableThumbnail tDaodien:(NSString*)tenDaodien tThoiluong:(NSString*)tenThoiluong tNgaychieu:(NSString*)tenNgaychieu tTomtat:(NSString*)tenTomtat tDiemdanhgia:(NSString*)tenDiemdanhgia tGiavethuong:(NSString*)tenGiavethuong tGiavevip:(NSString*)tenGiavevip tMucphim:(NSString*)tenMucphim tSoghedadat:(NSString*)tenSoghedadat thot:(NSString*)tenHot tHinhbanner:(NSString*)tenHinhbanner thinhDetailthumbnail:(NSString*)tenHinhdetailthumbnail tvideourl:(NSString*)tenvideourl
{
    self.sid = ID;
    self.tenPhim = tencuaPhim;
    self.daoDien = tenDaodien;
    self.thoiLuong = tenThoiluong;
    self.theLoai = tenTheloai;
    self.ngayChieu = tenNgaychieu;
    self.tomTat = tenTomtat;
    self.diemDanhGia = tenDiemdanhgia;
    self.giaveThuong = tenGiavethuong;
    self.giaveVip = tenGiavevip;
    self.mucPhim = tenMucphim;
    self.soGheDaDat = tenSoghedadat;
    self.hot = tenHot;
    self.hinhBanner = tenHinhbanner;
    self.hinhTableThumbnail = tenHinhTableThumbnail;
    self.hinhDetailThumbnail = tenHinhdetailthumbnail;
    self.videoUrl = tenvideourl;
    
    return self;
}


// get data from documents
+(NSString*)getDataPath
{
    NSString *docDir;
    docDir = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *Path = [docDir stringByAppendingPathComponent:@"DataFilms.plist"];
    NSLog(@"%@",docDir);
    NSFileManager *fileMan = [NSFileManager defaultManager];
    if([fileMan fileExistsAtPath:Path] == NO)
    {
        NSString *pathFromBundle = [[NSBundle mainBundle]pathForResource:@"DataFilms" ofType:@"sqlite"];
        // coppy file sql tu bundle qua document
        
        [fileMan copyItemAtPath:pathFromBundle toPath:Path error:nil];
    }
    return Path;
}
+(int)layGiaveThuongTheoId:(int)PhimId
{
    int giaveInt;
    NSString *giaveStr;
    const char *dbPath = [[PhimSqlite getDataPath] UTF8String];
    if (sqlite3_open(dbPath, &DB)== SQLITE_OK)
    {
        sqlite3_stmt *statement;
        NSString *query=[NSString stringWithFormat:@"SELECT GIAVETHUONG FROM PHIM WHERE ID=%d",PhimId];
        
        const char* query_stmt = [query UTF8String];
        if (sqlite3_prepare_v2(DB, query_stmt, -1, &statement, nil)==SQLITE_OK)
        {
            if (sqlite3_step(statement)==SQLITE_ROW)
            {
                char *giave;
                giave = (char*)sqlite3_column_text(statement, 0);
                giaveStr = giave == NULL ? nil :[[NSString alloc]initWithUTF8String:giave];
            }
            
            sqlite3_finalize(statement);
        }
        sqlite3_close(DB);
    }
    if (giaveStr.length >0)
    {
        giaveInt = [giaveStr intValue];
    }
    else
    {
        giaveInt = 0;
    }
    return giaveInt;
}

+(int)layGiaveVipTheoId:(int)PhimId
{
    int giaveInt;
    NSString *giaveStr;
    const char *dbPath = [[PhimSqlite getDataPath] UTF8String];
    if (sqlite3_open(dbPath, &DB)== SQLITE_OK)
    {
        sqlite3_stmt *statement;
        NSString *query=[NSString stringWithFormat:@"SELECT GIAVEVIP FROM PHIM WHERE ID=%d",PhimId];
        
        const char* query_stmt = [query UTF8String];
        if (sqlite3_prepare_v2(DB, query_stmt, -1, &statement, nil)==SQLITE_OK)
        {
            if (sqlite3_step(statement)==SQLITE_ROW)
            {
                char *giave;
                giave = (char*)sqlite3_column_text(statement, 0);
                giaveStr = giave == NULL ? nil :[[NSString alloc]initWithUTF8String:giave];
            }
            
            sqlite3_finalize(statement);
        }
        sqlite3_close(DB);
    }
    if (giaveStr.length >0)
    {
        giaveInt = [giaveStr intValue];
    }
    else
    {
        giaveInt = 0;
    }
    return giaveInt;
}


+(NSMutableArray*)dsHinhBanner
{
    NSMutableArray *bannerImg = [[NSMutableArray alloc]init];
    const char *dbPath = [[PhimSqlite getDataPath] UTF8String];
    if (sqlite3_open(dbPath, &DB)== SQLITE_OK)
    {
        sqlite3_stmt *statement;
        NSString *query=@"SELECT HINHBANNER FROM PHIM ORDER BY DIEMDANHGIA DESC";
        
        const char* query_stmt = [query UTF8String];
        if (sqlite3_prepare_v2(DB, query_stmt, -1, &statement, nil)==SQLITE_OK)
        {
            while (sqlite3_step(statement)==SQLITE_ROW)
            {
                char *hinhBanner;
                hinhBanner = (char*)sqlite3_column_text(statement, 0);
                NSString *hinhbannerStr = hinhBanner == NULL ? nil :[[NSString alloc]initWithUTF8String:hinhBanner];
                [bannerImg addObject:hinhbannerStr];
            }
            
            sqlite3_finalize(statement);
        }
        sqlite3_close(DB);
    }
    
    
    return bannerImg;
}



// Danhs ach phim dang chieu
+(NSMutableArray*)dsPhim
{
    NSMutableArray *content = [[NSMutableArray alloc]init];
    const char *dbPath = [[PhimSqlite getDataPath] UTF8String];
    if (sqlite3_open(dbPath, &DB)== SQLITE_OK)
    {
        sqlite3_stmt *statement;
        NSString *query=@"SELECT * FROM PHIM WHERE MUCPHIM = 0";
        
        const char* query_stmt = [query UTF8String];
        if (sqlite3_prepare_v2(DB, query_stmt, -1, &statement, nil)==SQLITE_OK)
        {
            while (sqlite3_step(statement)==SQLITE_ROW)
            {
                char *tenPhim,*theLoai,*daoDien,*thoiLuong,*ngaychieu,*tomtat,*diemDanhgia,*giaveThuong,*giaveVip,*mucPhim,*sogheDadat,*hot,*hinhBanner,*hinhTableThumbnail,*hinhDetailThumbnail,*vurl;
                int uid;
                uid = sqlite3_column_int(statement, 0);
                tenPhim = (char*)sqlite3_column_text(statement, 1);
                daoDien = (char*)sqlite3_column_text(statement, 2);
                thoiLuong = (char*)sqlite3_column_text(statement, 3);
                theLoai = (char*)sqlite3_column_text(statement, 4);
                ngaychieu = (char*)sqlite3_column_text(statement, 5);
                tomtat = (char*)sqlite3_column_text(statement, 6);
                diemDanhgia = (char*)sqlite3_column_text(statement, 7);
                giaveThuong = (char*)sqlite3_column_text(statement, 8);
                giaveVip = (char*)sqlite3_column_text(statement, 9);
                mucPhim = (char*)sqlite3_column_text(statement, 10);
                sogheDadat = (char*)sqlite3_column_text(statement, 11);
                hot = (char*)sqlite3_column_text(statement, 12);
                hinhBanner = (char*)sqlite3_column_text(statement, 13);
                hinhTableThumbnail = (char*)sqlite3_column_text(statement, 14);
                hinhDetailThumbnail = (char*)sqlite3_column_text(statement, 15);
                vurl = (char*)sqlite3_column_text(statement, 17);
                
                NSString * tenPhimStr = [[NSString alloc]initWithUTF8String:tenPhim];
                NSString * daoDienStr = [[NSString alloc]initWithUTF8String:daoDien];
                NSString * thoiLuongStr = [[NSString alloc]initWithUTF8String:thoiLuong];
                NSString * theLoaiStr = [[NSString alloc]initWithUTF8String:theLoai];
                NSString * ngaychieuStr = [[NSString alloc]initWithUTF8String:ngaychieu];
                NSString * tomtatStr = [[NSString alloc]initWithUTF8String:tomtat];
                NSString * diemdanhgiaStr = [[NSString alloc]initWithUTF8String:diemDanhgia];
                NSString * giavethuongStr = [[NSString alloc]initWithUTF8String:giaveThuong];
                NSString * giavevipStr = [[NSString alloc]initWithUTF8String:giaveVip];
                NSString * mucphimStr = [[NSString alloc]initWithUTF8String:mucPhim];
                NSString * soghedadatStr = [[NSString alloc]initWithUTF8String:sogheDadat];
                NSString * hotStr = [[NSString alloc]initWithUTF8String:hot];
                NSString * hinhbannerStr = [[NSString alloc]initWithUTF8String:hinhBanner];
                NSString * hinhTableThumnailStr = [[NSString alloc]initWithUTF8String:hinhTableThumbnail];
                NSString * hinhdetailthumbnailStr = [[NSString alloc]initWithUTF8String:hinhDetailThumbnail];
                NSString * vurlStr = [[NSString alloc]initWithUTF8String:vurl];


                
                PhimSqlite *myPhim = [[PhimSqlite alloc]initWithId:uid tcuaPhim:tenPhimStr tTheloai:theLoaiStr thinhTableThumbnail:hinhTableThumnailStr tDaodien:daoDienStr tThoiluong:thoiLuongStr tNgaychieu:ngaychieuStr tTomtat:tomtatStr tDiemdanhgia:diemdanhgiaStr tGiavethuong:giavethuongStr tGiavevip:giavevipStr tMucphim:mucphimStr tSoghedadat:soghedadatStr thot:hotStr tHinhbanner:hinhbannerStr thinhDetailthumbnail:hinhdetailthumbnailStr tvideourl:vurlStr];
                [content addObject:myPhim];
            }
            
            sqlite3_finalize(statement);
        }
        sqlite3_close(DB);
    }
    
    
    return content;

}

//Danh sach phim sap chieu
+(NSMutableArray*)dsPhimSapChieu
{
    NSMutableArray *content = [[NSMutableArray alloc]init];
    const char *dbPath = [[PhimSqlite getDataPath] UTF8String];
    if (sqlite3_open(dbPath, &DB)== SQLITE_OK)
    {
        sqlite3_stmt *statement;
        NSString *query=@"SELECT * FROM PHIM WHERE MUCPHIM = 1";
        
        const char* query_stmt = [query UTF8String];
        if (sqlite3_prepare_v2(DB, query_stmt, -1, &statement, nil)==SQLITE_OK)
        {
            while (sqlite3_step(statement)==SQLITE_ROW)
            {
                char *tenPhim,*theLoai,*daoDien,*thoiLuong,*ngaychieu,*tomtat,*diemDanhgia,*giaveThuong,*giaveVip,*mucPhim,*sogheDadat,*hot,*hinhBanner,*hinhTableThumbnail,*hinhDetailThumbnail,*vurl;
                int uid;
                uid = sqlite3_column_int(statement, 0);
                tenPhim = (char*)sqlite3_column_text(statement, 1);
                daoDien = (char*)sqlite3_column_text(statement, 2);
                thoiLuong = (char*)sqlite3_column_text(statement, 3);
                theLoai = (char*)sqlite3_column_text(statement, 4);
                ngaychieu = (char*)sqlite3_column_text(statement, 5);
                tomtat = (char*)sqlite3_column_text(statement, 6);
                diemDanhgia = (char*)sqlite3_column_text(statement, 7);
                giaveThuong = (char*)sqlite3_column_text(statement, 8);
                giaveVip = (char*)sqlite3_column_text(statement, 9);
                mucPhim = (char*)sqlite3_column_text(statement, 10);
                sogheDadat = (char*)sqlite3_column_text(statement, 11);
                hot = (char*)sqlite3_column_text(statement, 12);
                hinhBanner = (char*)sqlite3_column_text(statement, 13);
                hinhTableThumbnail = (char*)sqlite3_column_text(statement, 14);
                hinhDetailThumbnail = (char*)sqlite3_column_text(statement, 15);
                vurl = (char*)sqlite3_column_text(statement, 17);
                
                
                NSString * tenPhimStr = [[NSString alloc]initWithUTF8String:tenPhim];
                NSString * daoDienStr = [[NSString alloc]initWithUTF8String:daoDien];
                NSString * thoiLuongStr = [[NSString alloc]initWithUTF8String:thoiLuong];
                NSString * theLoaiStr = [[NSString alloc]initWithUTF8String:theLoai];
                NSString * ngaychieuStr = [[NSString alloc]initWithUTF8String:ngaychieu];
                NSString * tomtatStr = [[NSString alloc]initWithUTF8String:tomtat];
                NSString * diemdanhgiaStr = [[NSString alloc]initWithUTF8String:diemDanhgia];
                NSString * giavethuongStr = [[NSString alloc]initWithUTF8String:giaveThuong];
                NSString * giavevipStr = [[NSString alloc]initWithUTF8String:giaveVip];
                NSString * mucphimStr = [[NSString alloc]initWithUTF8String:mucPhim];
                NSString * soghedadatStr = [[NSString alloc]initWithUTF8String:sogheDadat];
                NSString * hotStr = [[NSString alloc]initWithUTF8String:hot];
                NSString * hinhbannerStr = [[NSString alloc]initWithUTF8String:hinhBanner];
                NSString * hinhTableThumnailStr = [[NSString alloc]initWithUTF8String:hinhTableThumbnail];
                NSString * hinhdetailthumbnailStr = [[NSString alloc]initWithUTF8String:hinhDetailThumbnail];
                NSString * vurlStr = [[NSString alloc]initWithUTF8String:vurl];
                

                PhimSqlite *myPhim = [[PhimSqlite alloc]initWithId:uid tcuaPhim:tenPhimStr tTheloai:theLoaiStr thinhTableThumbnail:hinhTableThumnailStr tDaodien:daoDienStr tThoiluong:thoiLuongStr tNgaychieu:ngaychieuStr tTomtat:tomtatStr tDiemdanhgia:diemdanhgiaStr tGiavethuong:giavethuongStr tGiavevip:giavevipStr tMucphim:mucphimStr tSoghedadat:soghedadatStr thot:hotStr tHinhbanner:hinhbannerStr thinhDetailthumbnail:hinhdetailthumbnailStr tvideourl:vurlStr];
                [content addObject:myPhim];
            }
            
            sqlite3_finalize(statement);
        }
        sqlite3_close(DB);
    }
    
    
    return content;
    
}

// lay va cap nhat so ghe


+(NSString*)laySoGheDaDatTheoId:(int)PhimId withTime:(NSString*)time
{
    NSString *gheStr;
    
    const char *dbPath = [[PhimSqlite getDataPath] UTF8String];
    if (sqlite3_open(dbPath, &DB)== SQLITE_OK)
    {
        sqlite3_stmt *statement;
        NSString *query=[NSString stringWithFormat:@"SELECT %@ FROM PHIM WHERE ID=%d",time,PhimId];
        //NSLog(@"%@",query);
        const char* query_stmt = [query UTF8String];
        if (sqlite3_prepare_v2(DB, query_stmt, -1, &statement, nil)==SQLITE_OK)
        {
            if (sqlite3_step(statement)==SQLITE_ROW)
            {
                char *sogheDadat;
                
                sogheDadat = (char*)sqlite3_column_text(statement, 0);
                
                
                gheStr = sogheDadat == NULL ? nil :[[NSString alloc]initWithUTF8String:sogheDadat];
                
                
            }
            
            sqlite3_finalize(statement);
        }
        sqlite3_close(DB);
    }
    return gheStr;
}



+(void)capNhatGheDaDat:(int)pid soGheDat:(NSString*)soGhe withTime:(NSString*)time
{
    const char *dbPath = [[PhimSqlite getDataPath] UTF8String];
    if (sqlite3_open(dbPath, &DB)== SQLITE_OK)
    {
        sqlite3_stmt *statement;
        NSString *query= [NSString stringWithFormat:@"UPDATE PHIM SET SOGHEDADAT%@='%@' WHERE ID=%d",time,soGhe,pid];
        //NSLog(@"%@",query);
        const char* query_stmt = [query UTF8String];
        if (sqlite3_prepare_v2(DB, query_stmt, -1, &statement, nil)==SQLITE_OK)
        {
            if (sqlite3_step(statement)==SQLITE_OK)
            {
                
            }
            
            sqlite3_finalize(statement);
        }
        sqlite3_close(DB);
    }
}
@end
