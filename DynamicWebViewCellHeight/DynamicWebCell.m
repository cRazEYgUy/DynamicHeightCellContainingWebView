//
//  DynamicWebCell.m
//  DynamicWebViewCellHeight
//
//  Created by TashiroYusuke on 2015/04/20.
//  Copyright (c) 2015年 TashiroYusuke. All rights reserved.
//

#import "DynamicWebCell.h"

@interface DynamicWebCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *webViewHeightConstraint;
@property (nonatomic) CGFloat expectdHeight;

@end

@implementation DynamicWebCell

- (void)awakeFromNib {
    [super awakeFromNib];

    _webView.delegate = self;
}

- (void)setTitle:(NSString *)title withUrl:(NSString *)url
{
    [_titleLabel setText:title];

    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];

    NSString *heightStr = [_webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.scrollHeight"];
    NSLog(@"load:%@",heightStr);

    _webViewHeightConstraint.constant = _expectdHeight;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    if(!webView.loading){
        NSLog(@"webViewDidFinishLoad");
        NSLog(@"%@",NSStringFromCGRect(_webView.frame));

        if (_expectdHeight == 0){
            NSString *heightStr = [_webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.scrollHeight"];
            NSLog(@"loadFinish:%@",heightStr);


            CGFloat height = [heightStr floatValue];
            _webViewHeightConstraint.constant = height;
            _expectdHeight = height;

            [[NSNotificationCenter defaultCenter] postNotificationName:@"a" object:nil];
        }else{
            [_webView setFrame:CGRectMake(_webView.frame.origin.x,
                                          _webView.frame.origin.y - _expectdHeight,
                                          _webView.frame.size.width,
                                          _expectdHeight)];
        }
    }
}

@end
