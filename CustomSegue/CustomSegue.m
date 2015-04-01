//  Created by Phillipus on 19/09/2013.
//  Copyright (c) 2013 Dada Beatnik. All rights reserved.
//

#import "CustomSegue.h"

@implementation CustomSegue

- (void)perform {
    UIViewController *source = self.sourceViewController;
    UIViewController *destination = self.destinationViewController;
    
    // Add the destination view as a subview, temporarily
    [source.view addSubview:destination.view];
    
    CGRect sourceFrame = source.view.frame;
    sourceFrame.origin.x = -sourceFrame.size.width;
    
    CGRect destFrame = destination.view.frame;
    destFrame.origin.x = destination.view.frame.size.width;
    destination.view.frame = destFrame;
    
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         source.view.frame = sourceFrame;
                         destination.view.frame = destFrame;
                     }
                     completion:^(BOOL finished){
                         [destination.view removeFromSuperview]; // remove from temp super view
                         [source presentViewController:destination animated:NO completion:NULL]; // present VC
                     }];
}

@end
