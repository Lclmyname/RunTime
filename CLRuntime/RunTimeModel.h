//
//  RunTimeModel.h
//  CLRuntime
//
//  Created by apple on 16/6/1.
//  Copyright © 2016年 刘朝龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface RunTimeModel : NSObject{
    BOOL isOk;
}

@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *sex;
@property (nonatomic, assign)NSInteger age;
@property (nonatomic, strong)NSDate *birthday;
@property (nonatomic, copy)NSString *nickname;
@property (nonatomic, copy)NSString *password;
@property (nonatomic, copy)NSArray  *array;
@property (nonatomic, assign)float fff;
@property (nonatomic, assign)double ddd;
@property (nonatomic, strong)NSIndexPath *indexPath;
@property (nonatomic, assign)CGPoint point;
@property (nonatomic, assign)CGRect rect;

- (void)getDictionary;

@end
