//
//  CdyAnalysisHtml.m
//  CdyAnalysisHtml
//
//  Created by 毛织网 on 2018/7/19.
//  Copyright © 2018年 Cdy. All rights reserved.
//

#import "CdyAnalysisHtml.h"

@implementation CdyAnalysisHtml
+(NSMutableArray*)AnalysisHtml:(NSString *)html{
    NSMutableArray *htmlarr =[[NSMutableArray alloc]init];
    /*img不是固定的  这里就要看数据开头是什么  这个只是说在一串数据里面 找到这个<img这里面的数据
     例如:<img src=\"\/data\/attached\/goods\/2018\/0716\/1531710470444561.jpg\" title=\"1531710470444561.jpg\" alt=\"1417766800851857.jpg\"\/><img src=\"\/data\/attached\/goods\/2018\/0716\/1531710473127305.jpg\" title=\"1531710473127305.jpg\" alt=\"1417766800703010.jpg\"\/><\/p><p><br\/><\/p>"   那就是img
     如果是:<title src=\"\/data\/attached\/goods\/2018\/0716\/1531710470444561.jpg\" title=\"1531710470444561.jpg\" alt=\"1417766800851857.jpg\"\/><img src=\"\/data\/attached\/goods\/2018\/0716\/1531710473127305.jpg\" title=\"1531710473127305.jpg\" alt=\"1417766800703010.jpg\"\/><\/p><p><br\/><\/p>"   那下面的img就要改成title
        其实整个解析也很容易理解  就跟请求到数据 用参数来获取指定的参数里面的数据 for循环西面的src是获取src里面的数据  
     
     */
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"<img\\s[^>]*/>" options:NSRegularExpressionAllowCommentsAndWhitespace error:nil];
    NSArray *result = [regex matchesInString:html options:NSMatchingReportCompletion range:NSMakeRange(0, html.length)];
    
    
    
    for (NSTextCheckingResult *item in result) {
        NSString *imgHtml = [html substringWithRange:[item rangeAtIndex:0]];
        
        NSArray *tmpArray = nil;
        if ([imgHtml rangeOfString:@"src=\""].location != NSNotFound) {
            tmpArray = [imgHtml componentsSeparatedByString:@"src=\""];
        } else if ([imgHtml rangeOfString:@"src="].location != NSNotFound) {
            tmpArray = [imgHtml componentsSeparatedByString:@"src="];
        }
        
        if (tmpArray.count >= 2) {
            NSString *src = tmpArray[1];
            
            NSUInteger loc = [src rangeOfString:@"\""].location;
            if (loc != NSNotFound) {
                src = [src substringToIndex:loc];
                
                NSLog(@"正确解析出来的SRC为：%@", src);
                [htmlarr addObject:src];
                
            }
        }
    }
    return htmlarr;
}
@end
