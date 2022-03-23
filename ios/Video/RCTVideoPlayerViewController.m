#import "RCTVideoPlayerViewController.h"

@interface RCTVideoPlayerViewController ()

@end

@implementation RCTVideoPlayerViewController

- (BOOL)shouldAutorotate {

  if (self.autorotate || self.preferredOrientation.lowercaseString == nil || [self.preferredOrientation.lowercaseString isEqualToString:@"all"])
    return YES;
  
  return NO;
}

- (void)viewWillDisappear:(BOOL)animated
{
  [super viewWillDisappear:animated];
  [_rctDelegate videoPlayerViewControllerWillDismiss:self];
}
- (void)viewDidDisappear:(BOOL)animated
{
  [super viewDidDisappear:animated];
  [_rctDelegate videoPlayerViewControllerDidDismiss:self];
}

#if !TARGET_OS_TV
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
  return UIInterfaceOrientationMaskAll;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
  if ([self.preferredOrientation.lowercaseString isEqualToString:@"landscape"]) {
    return UIInterfaceOrientationLandscapeRight;
  }
  else if ([self.preferredOrientation.lowercaseString isEqualToString:@"portrait"]) {
    return UIInterfaceOrientationPortrait;
  }
  else { // default case
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    return orientation;
  }
}
#endif

@end
