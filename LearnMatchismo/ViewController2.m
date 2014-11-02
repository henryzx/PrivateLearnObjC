//
//  ViewController2.m
//  LearnMatchismo
//
//  Created by zhengxiao on 11/1/14.
//  Copyright (c) 2014 zhengxiao. All rights reserved.
//

#import "ViewController2.h"
#import "ViewController.h"
#import "MyView.h"

@interface ViewController2 ()

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet MyView *myView;

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self textView].text = [NSString stringWithFormat:@"%@ %@",@"something ", [self data]];
    
    // Add a gesture recognizer to MyView
    UIPanGestureRecognizer *pangr = [[UIPanGestureRecognizer alloc]initWithTarget:self.myView action:@selector(pan:)];
    [self.myView addGestureRecognizer:pangr];
    
    [self.myView registerPannable:self];
}

- (BOOL) shouldPanInRect:(CGRect)rect{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)pushViewController:(id)sender {
    ViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier: @"ViewController"];
    
    [self.navigationController pushViewController:vc animated:NO];
}


@end
