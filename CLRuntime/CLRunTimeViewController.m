//
//  CLRunTimeViewController.m
//  CLRuntime
//
//  Created by apple on 16/6/1.
//  Copyright © 2016年 刘朝龙. All rights reserved.
//

#import "CLRunTimeViewController.h"

#import "RunTimeModel.h"

@interface CLRunTimeViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ModelInfoLabel;
@property (nonatomic, strong) RunTimeModel *runtimeModel;

@end

@implementation CLRunTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    RunTimeModel *runtimeModel = [[RunTimeModel alloc] init];
    
    runtimeModel.name = @"Demo";
    runtimeModel.sex = @"male";
    runtimeModel.age = 18;
    runtimeModel.birthday = [NSDate date];
    runtimeModel.nickname = @"Demo";
    runtimeModel.password = @"123456";
    
    runtimeModel.fff = 12343.342;
    runtimeModel.ddd = 9832456789.987654;
    runtimeModel.array = @[@132,@132,@1324,@345,@56];
    runtimeModel.indexPath = [NSIndexPath indexPathForItem:8 inSection:3];
    runtimeModel.point = CGPointMake(0, 1);
    runtimeModel.rect  = CGRectMake(0, 0, 320, 188);
    
    self.runtimeModel = runtimeModel;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)GetModelInfo:(id)sender {
    
    [self.runtimeModel getDictionary];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
