//
//  BaseMapViewController.m
//  Test
//
//  Created by zzqtkj on 2021/6/1.
//

#import "BaseMapViewController.h"

@interface BaseMapViewController ()
@property (nonatomic, strong, readwrite) QMapView *mapView;
@end

@implementation BaseMapViewController

#pragma mark - Override

- (void)handleTestAction
{
    
}

- (NSString *)testTitle
{
    return @"Test";
}

#pragma mark - Setup

- (void)setupNavigationBar
{
    self.navigationController.navigationBar.translucent = NO;
    
    UIBarButtonItem *testItem = [[UIBarButtonItem alloc] initWithTitle:[self testTitle]
                                                                 style:UIBarButtonItemStylePlain
                                                                target:self
                                                                action:@selector(handleTestAction)];
    self.navigationItem.rightBarButtonItem = testItem;
}

- (void)setupMapView
{
    self.mapView = [[QMapView alloc]
                    initWithFrame:CGRectMake(0,
                                             0,
                                             CGRectGetWidth(self.view.frame),
                                             CGRectGetHeight(self.view.frame) - CGRectGetMaxY(self.navigationController.navigationBar.frame))];
    self.mapView.delegate = self;
    
    self.mapView.centerCoordinate = CLLocationCoordinate2DMake(34.78534071180555,113.6757039388021);
    self.mapView.zoomLevel        = 11;
    
    [self.view addSubview:self.mapView];
}

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupNavigationBar];
    
    [self setupMapView];
    
    [self.mapView setForeignLanguage:QMapLanguage_zh];
}

- (void)mapViewInitComplete:(QMapView *)mapView {
    NSLog(@"mapViewInitComplete");
}

@end
