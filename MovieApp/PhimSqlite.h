//
//  PhimSqlite.h
//  MovieApp
//
//  Created by ThanhSon on 12/28/15.
//  Copyright © 2015 ThanhSon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
@interface PhimSqlite : NSObject


@property (nonatomic,assign)int sid;
@property (nonatomic,copy) NSString *tenPhim;
@property (nonatomic,copy) NSString *daoDien;
@property (nonatomic,copy) NSString *thoiLuong;
@property (nonatomic,copy) NSString *theLoai;
@property (nonatomic,copy) NSString *ngayChieu;
@property (nonatomic,copy) NSString *tomTat;
@property (nonatomic,copy) NSString *diemDanhGia;
@property (nonatomic,copy) NSString *giaveThuong;
@property (nonatomic,copy) NSString *giaveVip;
@property (nonatomic,copy) NSString *mucPhim;
@property (nonatomic,copy) NSString *soGheDaDat;
@property (nonatomic,copy) NSString *hot;
@property (nonatomic,copy) NSString *hinhBanner;
@property (nonatomic,copy) NSString *hinhTableThumbnail;
@property (nonatomic,copy) NSString *hinhDetailThumbnail;
@property (nonatomic,copy) NSString *videoUrl;

@property (strong, nonatomic)NSFileManager *quanlyTaptin;

-(id)initWithId:(int)ID tcuaPhim:(NSString*)tencuaPhim tTheloai:(NSString*)tenTheloai thinhTableThumbnail:(NSString*)tenHinhTableThumbnail tDaodien:(NSString*)tenDaodien tThoiluong:(NSString*)tenThoiluong tNgaychieu:(NSString*)tenNgaychieu tTomtat:(NSString*)tenTomtat tDiemdanhgia:(NSString*)tenDiemdanhgia tGiavethuong:(NSString*)tenGiavethuong tGiavevip:(NSString*)tenGiavevip tMucphim:(NSString*)tenMucphim tSoghedadat:(NSString*)tenSoghedadat thot:(NSString*)tenHot tHinhbanner:(NSString*)tenHinhbanner thinhDetailthumbnail:(NSString*)tenHinhdetailthumbnail tvideourl:(NSString*)tenvideourl;

+(NSString*)getDataPath;
+(NSMutableArray*)dsPhim;
+(NSMutableArray*)dsPhimSapChieu;
+(NSMutableArray*)dsHinhBanner;
+(NSString*)laySoGheDaDatTheoId:(int)PhimId withTime:(NSString *)time;
+(int)layGiaveThuongTheoId:(int)PhimId;
+(int)layGiaveVipTheoId:(int)PhimId;
+(void)capNhatGheDaDat:(int)pid soGheDat:(NSString*)soGhe withTime:(NSString*)time;


@end
