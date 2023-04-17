//
//  EntryData.h
//  Test
//
//  Created by zzqtkj on 2021/6/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Cell : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *controllerClassName;

@property (nonatomic, assign) BOOL disabled;

@end

@interface Section : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSMutableArray<Cell *> *cells;

@end

@interface EntryData : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSMutableArray<Section *> *sections;

+ (instancetype)constructDefaultEntryData;

@end

NS_ASSUME_NONNULL_END
