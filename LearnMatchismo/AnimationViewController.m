//
//  AnimationViewController.m
//  LearnMatchismo
//
//  Created by zhengxiao on 11/2/14.
//  Copyright (c) 2014 zhengxiao. All rights reserved.
//

#import "AnimationViewController.h"
#import "Photo.h"
#import "Entity.h"
#import "Photo+Creater.h"


@interface AnimationViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UISegmentedControl *progressor;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *progressBar;
@property NSMutableArray *animations;
@property (weak, nonatomic) IBOutlet UILabel *dataLabel;
@property (weak, nonatomic) UIManagedDocument *document;

@end

@implementation AnimationViewController

- (NSMutableArray *) getAnimations{
    if (!_animations){
        _animations = [[NSMutableArray alloc]init];
    }
    return _animations;
}

sharedCompletion mySharedCompletion;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    mySharedCompletion = ^(BOOL fin){
        __weak AnimationViewController *weakSelf = self;
        if(fin)weakSelf.button.alpha = 1.0;
    };
    
    [self.animations insertObject: mySharedCompletion atIndex: 0];
    sharedCompletion complete = (sharedCompletion)[self.animations objectAtIndex: 0];
    mySharedCompletion(YES);
//    complete(YES); // TODO 为什么不能用这个？
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)queryPhotos:(id)sender {
    if (self.document) {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Photo"];
        request.fetchBatchSize = 20;
        request.fetchLimit = 100;
        request.predicate = [NSPredicate predicateWithFormat:@"any photo.name contains %@", @"ba"];
        
        NSError *error;
        NSArray *photographers = [self.document.managedObjectContext executeFetchRequest:request error: &error];
        
        NSString *output = @"";
        for (Photo *item in photographers) {
            output = [output stringByAppendingString: [NSString stringWithFormat:@"%@",item]];
        }
        
        self.dataLabel.text = output;
    }

    
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)loadPhoto:(id)sender {
    NSFileManager *fileManager =[NSFileManager defaultManager];
    NSURL *documentsDirectory = [[fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    NSString *documentName = @"MyDocument";
    NSURL *url = [documentsDirectory URLByAppendingPathComponent:documentName];
    UIManagedDocument *document = [[UIManagedDocument alloc] initWithFileURL:url];
    
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:[url path]];
    
    if(!fileExists){
        [document saveToURL:url forSaveOperation:UIDocumentSaveForCreating completionHandler:^(BOOL success){
            if (success){
                NSLog(@"Document File is Created");
                [self didLoadData: document];
            }else
                NSLog(@"Document File Create Failed");
        }];
    }else{
        [document openWithCompletionHandler:^(BOOL success){
            if (success){
                NSLog(@"Document File is Opened");
                [self didLoadData: document];
            }else
                NSLog(@"Document File Open Failed");
        }];
    }
}

- (void) didLoadData: (UIManagedDocument *) document{
    self.document = document;
    if (document && document.documentState == UIDocumentStateNormal){
        // document is ready
        
        NSManagedObjectContext *context = document.managedObjectContext;
        
        Photo *photo = [Photo photoWithData:@{@"name":@"hello"} inManagedObjectContext:context];
        self.dataLabel.text = photo.description;
    }
}


- (IBAction)didClickButton:(id)sender {
    // UIView Animation
    [UIView animateWithDuration:3.0
                          delay: 0.0
                        options: UIViewAnimationOptionTransitionFlipFromLeft
                     animations:^{
                         self.button.alpha = 0.0;
                     }
                     completion: mySharedCompletion];
    
    // UIView Animation
    [UIView transitionFromView:self.button
                        toView:self.progressor
                      duration:3.0
                       options:UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL finishd){}];
    
    // UIView Dynamic Animator
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView: self.progressBar];
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] init];
    [animator addBehavior:gravity];
    
}

@end
