//
//  EntryViewController.m
//  Test
//
//  Created by zzqtkj on 2021/6/1.
//

#import "EntryViewController.h"
#import "EntryData.h"
#import "BaseMapViewController.h"

@interface EntryViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) EntryData *entry;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation EntryViewController

#pragma mark - Life Cycle

- (instancetype)init {
    if (self = [super init]) {
        // 构建 tableView 对应的数据结构.
        self.entry = [EntryData constructDefaultEntryData];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = self.entry.title;
    
    [self setupTableView];
}

#pragma mark - Setup

- (void)setupTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.tableView.delegate   = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.entry.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    Section *sectionData = self.entry.sections[section];
    
    return sectionData.cells.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    Section *sectionData = self.entry.sections[indexPath.section];
    Cell *cellData = sectionData.cells[indexPath.row];
    
    NSString *title                 = nil;
    UIColor *normalColor            = nil;
    UIColor *highlightedTextColor   = nil;
    UITableViewCellSelectionStyle   type;
    
    // 有效态.
    if (!cellData.disabled)
    {
        title                   = cellData.title;
        normalColor             = [UIColor blackColor];
        highlightedTextColor    = [UIColor whiteColor];
        type                    = UITableViewCellSelectionStyleBlue;
    }
    // 禁用态.
    else
    {
        title                   = [cellData.title stringByAppendingString:@" (Not Supported)"];
        normalColor             = [UIColor grayColor];
        highlightedTextColor    = [UIColor grayColor];
        type                    = UITableViewCellSelectionStyleNone;
    }
    
    // TextLabel.
    cell.textLabel.text                 = title;
    cell.textLabel.textColor            = normalColor;
    cell.textLabel.highlightedTextColor = highlightedTextColor;
    
    // DetailLabel.
    cell.detailTextLabel.text                 = cellData.controllerClassName;
    cell.detailTextLabel.textColor            = normalColor;
    cell.detailTextLabel.highlightedTextColor = highlightedTextColor;
    
    cell.selectionStyle = type;
    
    return cell;
}

#pragma mark - UITableViewDataDelegate

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    Section *sectionData = self.entry.sections[section];
    
    return sectionData.title;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

// Cell 点击回调.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    Section *sectionData = self.entry.sections[indexPath.section];
    Cell *cellData = sectionData.cells[indexPath.row];

    // 该 Demo 暂不支持.
    if (cellData.disabled) return;

    BaseMapViewController *controller = [[NSClassFromString(cellData.controllerClassName) alloc] init];

    controller.title = cellData.title;

    [self.navigationController pushViewController:controller animated:YES];
}

@end
