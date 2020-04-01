//
//  ViewController.m
//  GPAlertController
//
//  Created by chen on 2020/4/1.
//  Copyright © 2020 gorpeln. All rights reserved.
//

#import "ViewController.h"
#import "GPAlertController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView         *tableView;
@property(nonatomic,strong) NSArray             *listArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _listArray = @[@"样式一",@"样式二",@"样式三",@"样式四"];

    [self loadTableView];
    
    
}

#pragma mark -
#pragma mark -- TableViewDelegate
-(void)loadTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 49 + 20, self.view.frame.size.width, self.view.frame.size.height - 49 - 20) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.scrollEnabled = YES;
    _tableView.userInteractionEnabled = YES;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.estimatedRowHeight = 0;
    _tableView.estimatedSectionHeaderHeight = 0;
    _tableView.estimatedSectionFooterHeight = 0;
    [self.view addSubview:_tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIndertifier=@"cellIndertifier";
    UITableViewCell *tableViewCell=[tableView dequeueReusableCellWithIdentifier:cellIndertifier];
    if (!tableViewCell) {
        tableViewCell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndertifier];
        tableViewCell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    tableViewCell.textLabel.text = _listArray[indexPath.row];
    tableViewCell.textLabel.textAlignment = NSTextAlignmentCenter;

    return tableViewCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"您点击了第 %ld 个单元格",(long)indexPath.row);
    switch (indexPath.row) {
        case 0:
            [self loadStyle01];
            break;
        case 1:
            [self loadStyle02];
            break;
        case 2:
            [self loadStyle03];
            break;
        case 3:
            [self loadStyle04];
            break;
            
        default:
            break;
    }
}

-(void)loadStyle01{
     [GPAlertController showAlertWithTitle:nil message:nil appearanceProcess:^(GPAlertController *alertMaker) {

         alertMaker.addAttributedAction(@"星期一",UIColor.blackColor);
         alertMaker.addAttributedAction(@"星期二",UIColor.blackColor);
         alertMaker.addAttributedAction(@"星期三",UIColor.blackColor);
         alertMaker.addAttributedAction(@"星期四",UIColor.blackColor);
         alertMaker.addAttributedAction(@"星期五",UIColor.blackColor);
         alertMaker.addAttributedAction(@"星期六",UIColor.purpleColor);
         alertMaker.addAttributedAction(@"星期日",UIColor.redColor);


     } actionsBlock:^(NSInteger buttonIndex, UIAlertAction *action, GPAlertController *alertSelf) {
         NSLog(@"%li--------%@",(long)buttonIndex,action.title);
     }];
}

-(void)loadStyle02{
     [GPAlertController showAlertWithTitle:@"标题" message:@"简单的描述信息" appearanceProcess:^(GPAlertController *alertMaker) {
         alertMaker.titleColor = [UIColor purpleColor];
         alertMaker.messageColor = [UIColor lightGrayColor];
         
         alertMaker.titleFont= [UIFont boldSystemFontOfSize:26];
         alertMaker.messageFont = [UIFont systemFontOfSize:10];
         
         alertMaker.addDestructiveAction(@"取消");
         alertMaker.addDefaultAction(@"确定");
         
         [alertMaker addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
             textField.placeholder = @"输入框-请输入";
         }];


     } actionsBlock:^(NSInteger buttonIndex, UIAlertAction *action, GPAlertController *alertSelf) {
         NSLog(@"%li--------%@",(long)buttonIndex,action.title);
     }];
}

-(void)loadStyle03{
     [GPAlertController showAlertWithTitle:@"标题" message:@"\n趁年轻，做自己想做的！\nThere is no best, only better!\n" appearanceProcess:^(GPAlertController *alertMaker) {
         alertMaker.titleColor = [UIColor purpleColor];
         alertMaker.messageColor = [UIColor darkGrayColor];
         
         alertMaker.titleFont= [UIFont boldSystemFontOfSize:20];
         alertMaker.messageFont = [UIFont systemFontOfSize:14];
         
         alertMaker.addAttributedAction(@"取消",UIColor.lightGrayColor);
         alertMaker.addAttributedAction(@"确定",UIColor.blueColor);



     } actionsBlock:^(NSInteger buttonIndex, UIAlertAction *action, GPAlertController *alertSelf) {
         NSLog(@"%li--------%@",(long)buttonIndex,action.title);
     }];
}

-(void)loadStyle04{
    [GPAlertController showActionSheetWithTitle:@"标题" message:@"描述信息" appearanceProcess:^(GPAlertController * _Nonnull alertMaker) {
            alertMaker.titleColor = [UIColor purpleColor];
            alertMaker.messageColor = [UIColor darkGrayColor];
          
            alertMaker.titleFont= [UIFont boldSystemFontOfSize:20];
            alertMaker.messageFont = [UIFont systemFontOfSize:14];
          
            alertMaker.addAttributedAction(@"取消",UIColor.lightGrayColor);
            alertMaker.addAttributedAction(@"确定",UIColor.blueColor);

        
    } actionsBlock:^(NSInteger buttonIndex, UIAlertAction * _Nonnull action, GPAlertController * _Nonnull alertSelf) {
        NSLog(@"%li--------%@",(long)buttonIndex,action.title);
    }];
}
@end
