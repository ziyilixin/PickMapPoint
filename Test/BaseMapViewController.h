//
//  BaseMapViewController.h
//  Test
//
//  Created by zzqtkj on 2021/6/1.
//

#import <UIKit/UIKit.h>
#import <QMapKit/QMapKit.h>
#import <QMapKit/QMSSearchKit.h>
#import <QMapSDKUtils/QMUMapUtils.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseMapViewController : UIViewController<QMapViewDelegate>
@property (nonatomic, strong, readonly) QMapView *mapView;

#pragma mark - Override

- (void)handleTestAction;

- (NSString *)testTitle;
@end

NS_ASSUME_NONNULL_END
