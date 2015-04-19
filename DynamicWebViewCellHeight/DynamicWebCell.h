//
//  DynamicWebCell.h
//  DynamicWebViewCellHeight
//
//  Created by TashiroYusuke on 2015/04/20.
//  Copyright (c) 2015年 TashiroYusuke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DynamicWebCell : UITableViewCell<UIWebViewDelegate>

-(void)setTitle:(NSString *)title withUrl:(NSString *)url;

@end
