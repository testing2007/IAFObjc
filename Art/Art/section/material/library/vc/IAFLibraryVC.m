//
//  IAFLibraryVC.m
//  Beautifal
//
//  Created by ZhiQiang wei on 2020/3/27.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import "IAFLibraryVC.h"
#import "IAFTabViewDelegate.h"

@interface IAFLibraryVC ()<IAFTabViewDelegate>

@end

@implementation IAFLibraryVC

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor randomColor];
    
    [self installUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%@--viewWillAppear", NSStringFromClass(self.class));
}

- (void)installUI {

}

#pragma mark -- IAFTabViewDelegate
-(NSString*)titleForIAFTabView:(IAFTabView*)tabView tabViewCell:(IAFTabHeaderCCell*)tabCell {
    return @"图书";
}

-(UIView*)contentViewForIAFTabView:(IAFTabView*)tabView {
    return self.view;
}



@end
