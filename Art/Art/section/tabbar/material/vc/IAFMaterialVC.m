//
//  IAFMaterialVC.m
//  Beautifal
//
//  Created by ZhiQiang wei on 2020/3/27.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import "IAFMaterialVC.h"

#import "IAFSearchVC.h"

#import "IAFTabView.h"
#import "IAFHomeVC.h"
#import "IAFPhotoVC.h"
#import "IAFWorksVC.h"
#import "IAFTeachVC.h"
#import "IAFExamVC.h"
#import "IAFLibraryVC.h"
#import "IAFVideoVC.h"
#import "IAFLiveVC.h"


@interface IAFMaterialVC ()

@property (nonatomic, strong) IAFTabView    *tabView;

@property (nonatomic, strong) IAFHomeVC     *homeVC;
@property (nonatomic, strong) IAFPhotoVC    *photoVC;
@property (nonatomic, strong) IAFWorksVC    *worksVC;
@property (nonatomic, strong) IAFTeachVC    *teachVC;
@property (nonatomic, strong) IAFExamVC     *examVC;
@property (nonatomic, strong) IAFLibraryVC  *libraryVC;
@property (nonatomic, strong) IAFVideoVC    *videoVC;
@property (nonatomic, strong) IAFLiveVC     *liveVC;


@end

@implementation IAFMaterialVC

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
    IAFSearchVC *vc = [[IAFSearchVC alloc] init];
    [self.navigationController pushViewController:vc animated:true];
}

- (IAFTabView*)tabView {
    if(_tabView == nil) {
        NSArray  *tabItems = @[self.homeVC, self.videoVC, self.photoVC, self.worksVC, self.teachVC, self.examVC, self.libraryVC, self.liveVC];
        _tabView = [[IAFTabView alloc] initWithTabItems:tabItems tabHeaderHeight:60];
    }
    return _tabView;
}

- (IAFHomeVC*)homeVC {
    if(_homeVC == nil) {
        _homeVC = [[IAFHomeVC alloc] init];
        Weak(weakSelf)
        _homeVC.upScrollBlock = ^{
            [UIView animateWithDuration:0.1 animations:^{
                [weakSelf.tabView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.top.offset(K_STATUS_BAR_OFFSET);
                }];
                [super.navigationController setNavigationBarHidden:YES animated:TRUE];
            }];
        };
        _homeVC.downScrollBlock = ^{
            [UIView animateWithDuration:0.1 animations:^{
                [weakSelf.tabView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.top.offset(K_NAVIGATION_BAR_OFFSET);
                }];
                [super.navigationController setNavigationBarHidden:NO animated:TRUE];

            }];
        };
        
        [self addChildViewController:_homeVC]; //如果不添加， IAFHomeVC 他要是调用 self.navigationController 就是空的
    }
    return _homeVC;
}

- (IAFPhotoVC*)photoVC {
    if(_photoVC == nil) {
        _photoVC = [[IAFPhotoVC alloc] init];
        [self addChildViewController:_photoVC];
    }
    return _photoVC;
}

- (IAFWorksVC*)worksVC {
    if(_worksVC == nil) {
        _worksVC = [[IAFWorksVC alloc] init];
        [self addChildViewController:_worksVC];
    }
    return _worksVC;
}

- (IAFTeachVC*)teachVC {
    if(_teachVC == nil) {
        _teachVC = [[IAFTeachVC alloc] init];
        [self addChildViewController:_teachVC];
    }
    return _teachVC;
}

- (IAFExamVC*)examVC {
    if(_examVC == nil) {
        _examVC = [[IAFExamVC alloc] init];
        [self addChildViewController:_examVC];
    }
    return _examVC;
}

- (IAFLibraryVC*)libraryVC {
    if(_libraryVC == nil) {
        _libraryVC = [[IAFLibraryVC alloc] init];
        [self addChildViewController:_libraryVC];
    }
    return _libraryVC;
}


- (IAFVideoVC*)videoVC {
    if(_videoVC == nil) {
        _videoVC = [[IAFVideoVC alloc] init];
        [self addChildViewController:_videoVC];
    }
    return _videoVC;
}

- (IAFLiveVC*)liveVC {
    if(_liveVC == nil) {
        _liveVC = [[IAFLiveVC alloc] init];
        [self addChildViewController:_liveVC];
    }
    return _liveVC;
}

@end
