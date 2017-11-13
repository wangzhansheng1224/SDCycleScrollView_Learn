//
//  ViewController.m
//  轮播视图
//
//  Created by 王战胜 on 2017/11/13.
//  Copyright © 2017年 gocomtech. All rights reserved.
//

#import "ViewController.h"
#import <SDCycleScrollView.h>
#define IMScreenWidth [UIScreen mainScreen].bounds.size.width
#define IMScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<SDCycleScrollViewDelegate>
@property (nonatomic, strong) NSArray *imagesURLStrings;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"轮播Demo";
    self.view.backgroundColor = [UIColor whiteColor];
    // 情景二：采用网络图片实现
    NSArray *imagesURLStrings = @[
                                  @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                  @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                  @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                                  ];
    _imagesURLStrings = imagesURLStrings;
    
    // 情景三：图片配文字
    NSArray *titles = @[@"新建交流QQ群：185534916 ",
                        @"disableScrollGesture可以设置禁止拖动",
                        @"感谢您的支持，如果下载的",
                        @"如果代码在使用过程中出现问题",
                        @"您可以发邮件到gsdios@126.com"
                        ];
    
    // 网络加载 --- 创建带标题的图片轮播器
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 100, IMScreenWidth, 180) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    //分页空间居中
    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    //底部标题
//    cycleScrollView.titlesGroup = titles;
#if 0
   //当前分页控件小圆标颜色
    cycleScrollView.currentPageDotColor = [UIColor whiteColor];
    //其他分页控件小圆标颜色
    cycleScrollView.pageDotColor = [UIColor colorWithWhite:0.9 alpha:0.5];
#endif
#if 0
    //当前分页控件小圆标图片
    cycleScrollView.currentPageDotImage = [UIImage imageNamed:@"pageControlCurrentDot"];
    //其他分页控件小圆标图片
    cycleScrollView.pageDotImage = [UIImage imageNamed:@"pageControlDot"];
#endif
    // 动画效果pagecontrol
    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    
    //自动滚动间隔时间,默认2s
    cycleScrollView.autoScrollTimeInterval = 4.0;
    
    cycleScrollView.imageURLStringsGroup = imagesURLStrings;
    [self.view addSubview:cycleScrollView];
    
    
    
    //         --- 模拟加载延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
    });
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
