//
//  ViewController.m
//  CdyAnalysisHtml
//
//  Created by 毛织网 on 2018/7/19.
//  Copyright © 2018年 Cdy. All rights reserved.
//

#import "ViewController.h"
#import "CdyAnalysisHtml.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //首先获取到html的内容  将它装成字符串  然后实现CdyAnalysisHtml中的AnalysisHtml方法即可 
    NSString *htmlstr = @"<img src=\"\/data\/attached\/goods\/2018\/0716\/1531710470444561.jpg\" title=\"1531710470444561.jpg\" alt=\"1417766800851857.jpg\"\/><img src=\"\/data\/attached\/goods\/2018\/0716\/1531710473127305.jpg\" title=\"1531710473127305.jpg\" alt=\"1417766800703010.jpg\"\/><\/p><p><br\/><\/p>";
    NSLog(@"%@",[CdyAnalysisHtml AnalysisHtml:htmlstr ]);
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
