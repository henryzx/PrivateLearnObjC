//
//  ViewController.m
//  LearnMatchismo
//
//  Created by zhengxiao on 10/30/14.
//  Copyright (c) 2014 zhengxiao. All rights reserved.
//

#import "ViewController.h"
#import "Ship.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) Ship *ship;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.ship = [[Ship alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onPressButton:(id)sender {
    
    UIButton *button = (UIButton *) sender;
    if ([button.titleLabel.text rangeOfString:@"Make"].location != NSNotFound){
        [self onPressButtonWork: button];
        return;
    }
    
    NSString *name = [self.ship shoot];
    SEL moveSelector = @selector(move:withName:);
    if ([self.ship respondsToSelector:moveSelector]) {
        [self.ship performSelector: moveSelector withObject:@100 withObject:@"something"];
    }else{
        NSLog(@"nothing respond to selector ");
    }
    if (name == nil) {
        name = @"nothing happend";
    }
    [self.label setText:name];
}

- (void) onPressButtonWork: (UIButton *)sender{
    NSAttributedString *aText = sender.titleLabel.attributedText;
    NSRange outRange = NSMakeRange(0, 0);
    NSDictionary *attributes = [aText attributesAtIndex:0 effectiveRange: &outRange];
    
    NSLog(@"attributes of label: %@, in range (%lu, %lu)",attributes, (unsigned long)outRange.location, (unsigned long)outRange.length);
    
}

@end
