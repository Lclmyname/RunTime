//
//  RunTimeModel.m
//  CLRuntime
//
//  Created by apple on 16/6/1.
//  Copyright © 2016年 刘朝龙. All rights reserved.
//

#import "RunTimeModel.h"
#import <objc/runtime.h>
#import <objc/message.h>
@implementation RunTimeModel

- (void)getDictionary
{
    unsigned int outCount;
    
    objc_property_t *t = class_copyPropertyList(self.class, &outCount);
    
    NSLog(@"------%@ property------", NSStringFromClass(self.class));
    NSLog(@"------key:value-----------------");
    for (int i = 0 ; i < outCount; i ++) {
        
        NSString * propertyName = [NSString stringWithUTF8String:property_getName(t[i])];
        
        const char * attribute = property_getAttributes(t[i]);
        
        id value = [self getValueWithKey:propertyName primaryKey:attribute[1] extKey:[NSString stringWithUTF8String:attribute]];
    
        NSLog(@"------%@:%@-----------------", propertyName, value);
        
    }
    
    free(t);
    
}

- (id)getValueWithKey:(NSString *)key primaryKey:(char)primaryKey extKey:(NSString *)extKey
{
    SEL name = NULL;
    unsigned int outCount;
    Method *methods = class_copyMethodList(self.class, &outCount);
    
    for (int i = 0; i < outCount; i ++) {
        
        SEL method_name = method_getName(methods[i]);
        NSString *sel_name = [NSString stringWithUTF8String:sel_getName(method_name)];
        if ([sel_name isEqualToString:key]) {
            name = method_name;
        }
        
    }
    
    free(methods);
    
    NSMethodSignature *ms = [self methodSignatureForSelector:name];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:ms];
    invocation.target = self;
    invocation.selector = name;
    [invocation invoke];
    if ([ms methodReturnLength]) {
        
        if (primaryKey == '@') {
            
            NSData *value;
            [invocation getReturnValue:&value];
            return value;

        } else if (primaryKey == 'q'){
            
            long long value;
            [invocation getReturnValue:&value];
            return @(value);
            
        } else if (primaryKey == 'f'){
            
            float value;
            [invocation getReturnValue:&value];
            return @(value);
            
        }else if (primaryKey == 'd'){
            
            double value;
            [invocation getReturnValue:&value];
            return @(value);
            
        }else if (primaryKey == 'B'){
            
            BOOL value;
            [invocation getReturnValue:&value];
            return @(value);
            
        }else if (primaryKey == 'c'){
            
            char value;
            [invocation getReturnValue:&value];
            return @(value);
            
        }else if (primaryKey == 's'){
            
            short value;
            [invocation getReturnValue:&value];
            return @(value);
            
        }else if (primaryKey == 'l'){
            
            long value;
            [invocation getReturnValue:&value];
            return @(value);
            
        }else if (primaryKey == '{'){
            
            if ([extKey containsString:@"CGRect"]){
                
                CGRect value;
                [invocation getReturnValue:&value];
                return [NSValue valueWithCGRect:value];
                
            } else if ([extKey containsString:@"CGPoint"]) {
                
                CGPoint value;
                [invocation getReturnValue:&value];
                return [NSValue valueWithCGPoint:value];
                
            } else if ([extKey containsString:@"CGSize"]){
                
                CGSize value;
                [invocation getReturnValue:&value];
                return [NSValue valueWithCGSize:value];
                
            } else if ([extKey containsString:@"CGVector"]){
                
                CGVector value;
                [invocation getReturnValue:&value];
                return [NSValue valueWithCGVector:value];
                
            } else if ([extKey containsString:@"CGAffineTransform"]){
                
                CGAffineTransform value;
                [invocation getReturnValue:&value];
                return [NSValue valueWithCGAffineTransform:value];
                
            } else if ([extKey containsString:@"UIEdgeInsets"]){
                
                UIEdgeInsets value;
                [invocation getReturnValue:&value];
                return [NSValue valueWithUIEdgeInsets:value];
                
            } else if ([extKey containsString:@"UIOffset"]){
                
                UIOffset value;
                [invocation getReturnValue:&value];
                return [NSValue valueWithUIOffset:value];
                
            } else {
                
                return nil;
            }
            
        }else if (primaryKey == '^'){
            
            BOOL value;
            [invocation getReturnValue:&value];
            return @(value);
            
        } else {
            
            return nil;
        }
        
    }
    
    return nil;
    
}

@end
