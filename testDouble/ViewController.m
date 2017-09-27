//
//  ViewController.m
//  testDouble
//
//  Created by Wanlei on 2017/9/26.
//  Copyright © 2017年 WL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self test];
    [self testD];
//    [self test1];
//    [self test2];
//    [self test3];
    
    
    
}

- (void)test1
{
    //部分创建方法
    [[NSDecimalNumber alloc]initWithFloat:2.2];
    [[NSDecimalNumber alloc]initWithInt:2];
    [[NSDecimalNumber alloc]initWithInteger:2];
    [[NSDecimalNumber alloc]initWithBool:0];
    NSDecimalNumber *zeroDN = [NSDecimalNumber zero];
    NSDecimalNumber *oneDN = [NSDecimalNumber one];
    
    NSDecimalNumber *aDN = [NSDecimalNumber decimalNumberWithString:@"1.00001"];
    NSDecimalNumber *bDN = [NSDecimalNumber decimalNumberWithString:@"0.99999"];
    NSDecimalNumber *cDN = [aDN decimalNumberByAdding:bDN];//a + b
    NSDecimalNumber *dDN = [cDN decimalNumberBySubtracting:aDN];//b
    NSDecimalNumber *eDN = [dDN decimalNumberByMultiplyingBy:aDN];//b * a
    NSDecimalNumber *fDN = [eDN decimalNumberByDividingBy:bDN];//除数为0会 crash        a
    
    NSLog(@"%@--%@--%@--%@--%@--%@--%@--%@",zeroDN,oneDN,aDN,bDN,cDN,dDN,eDN,fDN);

}

- (void)test2
{
    NSDecimalNumberHandler *roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain
                                                                                                      scale:2
                                                                                           raiseOnExactness:NO
                                                                                            raiseOnOverflow:NO
                                                                                           raiseOnUnderflow:NO
                                                                                        raiseOnDivideByZero:NO];
    
    NSDecimalNumber *aDN = [[NSDecimalNumber alloc] initWithFloat:0.125532];
    NSDecimalNumber *resultDN = [aDN decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
    NSLog(@"%@", resultDN);
}

- (void)test3
{
    double a = round(12.345);
    double b = round(1234.5678 * 100) / 100;
    NSLog(@"%lf---%lf",a,b);
}

- (void)test
{
    //    double d = 31.123456789012305;
    //    NSString *str = [NSString stringWithFormat:@"%f", d];
    //    NSLog(@"str = %@", str);
    //
    //    double d2 =  d * 1000000000;

    
    double money = 31.123456789012305;//89.99;
    
    NSNumber *moneyNum = [NSNumber numberWithDouble:money];
    
    NSLog(@"%@",moneyNum); //此时输出89.9899999999999；
    
    　　//使用NSDecimalNumber
    
    NSString *str = [NSString stringWithFormat:@"%f",money];
    NSLog(@"str = %@", str);
    
    moneyNum = [NSDecimalNumber decimalNumberWithString:str];
    
    NSLog(@"%@, %@",moneyNum, moneyNum.stringValue);  //此时输出89.99
    
    
}

- (void)testD
{
    //    double d = 31.123456789012305;
    //    NSString *str = [NSString stringWithFormat:@"%f", d];
    //    NSLog(@"str = %@", str);
    //
    //    double d2 =  d * 1000000000;
    
    
//    double money = 31.123456789012305;//89.99;
    double money = 89.99;
    
    NSNumber *moneyNum = [NSNumber numberWithDouble:money];
    
    NSLog(@"%@",moneyNum); //此时输出89.9899999999999；
    
    　　//使用NSDecimalNumber
    moneyNum = [[NSDecimalNumber alloc] initWithDouble:money];
    
    NSLog(@"%@, %@",moneyNum, moneyNum.stringValue);  //此时输出89.99
    
    
}


@end
