//  Created by Phillipus on 20/09/2013.
//  Copyright (c) 2013 Dada Beatnik. All rights reserved.
//

#import "CustomUnwindSegue.h"

@implementation CustomUnwindSegue

- (void)perform {
    UIViewController *source = self.sourceViewController;
    UIViewController *destination = self.destinationViewController;
    
    // Add view to super view temporarily
    [source.view.superview insertSubview:destination.view atIndex:0];
    
    CGRect sourceFrame = source.view.frame;
    sourceFrame.origin.x = sourceFrame.size.width;
    
    CGRect destFrame = destination.view.frame;
    destFrame.origin.x = 0;
    destination.view.frame = destFrame;
    
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         // Shrink!
                         source.view.frame = sourceFrame;
                         destination.view.frame = destFrame;
                     }
                     completion:^(BOOL finished){
                         [destination.view removeFromSuperview]; // remove from temp super view
                         [source dismissViewControllerAnimated:NO completion:NULL]; // dismiss VC
                     }];
}

@end
