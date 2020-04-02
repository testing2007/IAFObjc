//
//  ARTMaterialVC.m
//  ART
//
//  Created by ZhiQiang wei on 2020/3/27.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import "ARTMaterialVC.h"

#import "ARTSearchVC.h"

#import "IAFTabView.h"
#import "ARTHomeVC.h"
#import "ARTPhotoVC.h"
#import "ARTWorksVC.h"
#import "ARTTeachVC.h"
#import "ARTExamVC.h"
#import "ARTLibraryVC.h"
#import "ARTVideoVC.h"
#import "ARTLiveVC.h"


@interface ARTMaterialVC ()

@property (nonatomic, strong) IAFTabView    *tabView;

@property (nonatomic, strong) ARTHomeVC     *homeVC;
@property (nonatomic, strong) ARTPhotoVC    *photoVC;
@property (nonatomic, strong) ARTWorksVC    *worksVC;
@property (nonatomic, strong) ARTTeachVC    *teachVC;
@property (nonatomic, strong) ARTExamVC     *examVC;
@property (nonatomic, strong) ARTLibraryVC  *libraryVC;
@property (nonatomic, strong) ARTVideoVC    *videoVC;
@property (nonatomic, strong) ARTLiveVC     *liveVC;


@end

@implementation ARTMaterialVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self installUI];
}

- (void)installUI {
    
    [self installNavigator];
    
    [self.view addSubview:self.tabView];
    [self.tabView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(K_NAVIGATION_BAR_OFFSET);
        make.left.right.offset(0);
        make.bottom.offset( -(K_BOTTOM_SAFE_OFFSET+K_BOTTOM_TAB_BAR_HEIGHT) );
    }];
}

- (void)installNavigator {
    UIButton *navigatorBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [navigatorBtn setTitle:@"跳转至搜索页面" forState:UIControlStateNormal];
    navigatorBtn.titleLabel.font = [UIFont bxg_fontRegularWithSize:14];
    [navigatorBtn addTarget:self action:@selector(onGotoSearchPage:) forControlEvents:UIControlEventTouchUpInside];
    
//    UIBarButtonItem *bar = [[UIBarButtonItem alloc] initWithCustomView:navigatorBtn];
    self.navigationItem.titleView = navigatorBtn;
}

- (void)onGotoSearchPage:(NSObject*)sender {
    ARTSearchVC *vc = [[ARTSearchVC alloc] init];
    [self.navigationController pushViewController:vc animated:true];
}

- (IAFTabView*)tabView {
    if(_tabView == nil) {
        NSArray  *tabItems = @[self.homeVC, self.videoVC, self.photoVC, self.worksVC, self.teachVC, self.examVC, self.libraryVC, self.liveVC];
        _tabView = [[IAFTabView alloc] initWithTabItems:tabItems tabHeaderHeight:60];
    }
    return _tabView;
}

- (ARTHomeVC*)homeVC {
    if(_homeVC == nil) {
        _homeVC = [[ARTHomeVC alloc] init];
        Weak(weakSelf)
        _homeVC.upScrollBlock = ^{
            [super.navigationController setNavigationBarHidden:YES animated:false];
            [UIView animateWithDuration:0.2 animations:^{
                [weakSelf.tabView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.top.offset(K_STATUS_BAR_OFFSET);
                }];
            }];
        };
        _homeVC.downScrollBlock = ^{
            [super.navigationController setNavigationBarHidden:NO animated:false];
            [UIView animateWithDuration:0.2 animations:^{
                [weakSelf.tabView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.top.offset(K_NAVIGATION_BAR_OFFSET);
                }];

            }];
        };
        
        [self addChildViewController:_homeVC]; //如果不添加， ARTHomeVC 他要是调用 self.navigationController 就是空的
    }
    return _homeVC;
}

- (ARTPhotoVC*)photoVC {
    if(_photoVC == nil) {
        _photoVC = [[ARTPhotoVC alloc] init];
        [self addChildViewController:_photoVC];
    }
    return _photoVC;
}

- (ARTWorksVC*)worksVC {
    if(_worksVC == nil) {
        _worksVC = [[ARTWorksVC alloc] init];
        [self addChildViewController:_worksVC];
    }
    return _worksVC;
}

- (ARTTeachVC*)teachVC {
    if(_teachVC == nil) {
        _teachVC = [[ARTTeachVC alloc] init];
        [self addChildViewController:_teachVC];
    }
    return _teachVC;
}

- (ARTExamVC*)examVC {
    if(_examVC == nil) {
        _examVC = [[ARTExamVC alloc] init];
        [self addChildViewController:_examVC];
    }
    return _examVC;
}

- (ARTLibraryVC*)libraryVC {
    if(_libraryVC == nil) {
        _libraryVC = [[ARTLibraryVC alloc] init];
        [self addChildViewController:_libraryVC];
    }
    return _libraryVC;
}


- (ARTVideoVC*)videoVC {
    if(_videoVC == nil) {
        _videoVC = [[ARTVideoVC alloc] init];
        [self addChildViewController:_videoVC];
    }
    return _videoVC;
}

- (ARTLiveVC*)liveVC {
    if(_liveVC == nil) {
        _liveVC = [[ARTLiveVC alloc] init];
        [self addChildViewController:_liveVC];
    }
    return _liveVC;
}

@end
