//
//  NSObject+Extension.h
//  APlus
//
//  Created by 李慧娟 on 17/7/6.
//  Copyright © 2017年 中原集团. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSObject (Extension)

/// 判断类／字符串是否为空
- (BOOL)isNil;

/// 从实体转化为字典
- (NSDictionary *)dictionaryFromModel;

@end
