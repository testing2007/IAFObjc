//
//  IAFMaterialVC.m
//  Beautifal
//
//  Created by ZhiQiang wei on 2020/3/27.
//  Copyright © 2020 ZhiQiang wei. All rights reserved.
//

#import "IAFMaterialVC.h"

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
    [self.view addSubview:self.tabView];
    [self.tabView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(K_NAVIGATION_BAR_OFFSET);
        make.left.right.offset(0);
        make.bottom.offset( -(K_BOTTOM_SAFE_OFFSET+K_BOTTOM_TAB_BAR_HEIGHT) );
    }];
}

- (IAFTabView*)tabView {
    if(_tabView == nil) {
        NSArray  *tabItems = @[self.homeVC, self.photoVC, self.worksVC, self.teachVC, self.examVC, self.libraryVC, self.videoVC, self.liveVC];
        _tabView = [[IAFTabView alloc] initWithTabItems:tabItems tabHeaderHeight:60];
    }
    return _tabView;
}

- (IAFHomeVC*)homeVC {
    if(_homeVC == nil) {
        _homeVC = [[IAFHomeVC alloc] init];
    }
    return _homeVC;
}

- (IAFPhotoVC*)photoVC {
    if(_photoVC == nil) {
        _photoVC = [[IAFPhotoVC alloc] init];
    }
    return _photoVC;
}

- (IAFWorksVC*)worksVC {
    if(_worksVC == nil) {
        _worksVC = [[IAFWorksVC alloc] init];
    }
    return _worksVC;
}

- (IAFTeachVC*)teachVC {
    if(_teachVC == nil) {
        _teachVC = [[IAFTeachVC alloc] init];
    }
    return _teachVC;
}

- (IAFExamVC*)examVC {
    if(_examVC == nil) {
        _examVC = [[IAFExamVC alloc] init];
    }
    return _examVC;
}

- (IAFLibraryVC*)libraryVC {
    if(_libraryVC == nil) {
        _libraryVC = [[IAFLibraryVC alloc] init];
    }
    return _libraryVC;
}


- (IAFVideoVC*)videoVC {
    if(_videoVC == nil) {
        _videoVC = [[IAFVideoVC alloc] init];
    }
    return _videoVC;
}

- (IAFLiveVC*)liveVC {
    if(_liveVC == nil) {
        _liveVC = [[IAFLiveVC alloc] init];
    }
    return _liveVC;
}

@end
