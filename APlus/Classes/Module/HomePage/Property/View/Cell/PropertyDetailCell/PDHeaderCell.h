//
//  PDHeaderCell.h
//  APlus
//
//  Created by 李慧娟 on 2017/11/22.
//  Copyright © 2017年 CentaLine. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 房源详情标题cell
@interface PDHeaderCell : UITableViewCell

// 标题内容
@property (nonatomic, copy) NSString *titleStr;

// 最近的更新／维护时间
@property (weak, nonatomic) IBOutlet UILabel *lastState;

@end
