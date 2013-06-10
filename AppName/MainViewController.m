//
//  MainViewController.m
//  AppName
//
//  Created by Luis Enrique Espinoza Severino on 12-05-13.
//  Copyright (c) 2013 LuisEspinoza. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController

- (void)controlTextDidChange:(NSNotification *)obj
{
    textLabelIphone.stringValue = textField.stringValue;
    textLabelIpad.stringValue = textField.stringValue;
}

- (void)awakeFromNib
{
    [self configureInputTextField];
    
    [self configureiPhoneOutputTextField];
    
    [self configureiPadOutputTextField];
    
    //[textLabelIphone sizeToFit];
    //[[textLabelIphone cell] setAlignment:NSJustifiedTextAlignment];
    //[[textLabelIphone cell] setPreferredMaxLayoutWidth:78];
    //[[textLabelIphone cell] setMinWidth:12];
    //[textLabelIphone setPreferredMaxLayoutWidth:78.0];
    
    //[self configureFeedbackButton];
}

- (void)loadView
{

}

- (void)configureInputTextField
{
    if (textField) {
        textField.toolTip = NSLocalizedString(@"APP_NAMER_HELP_TAG_INPUT_TEXT_FIELD", @"");
    }
}

- (void)configureiPhoneOutputTextField
{
    if (textLabelIphone) {
        textLabelIphone.toolTip = NSLocalizedString(@"APP_NAMER_HELP_TAG_IOS56_IPHONE_OUTPUT", @"");
        [[textLabelIphone cell] setBackgroundStyle:NSBackgroundStyleRaised];
    }
}

- (void)configureiPadOutputTextField
{
    if (textLabelIpad) {
        textLabelIpad.toolTip = NSLocalizedString(@"APP_NAMER_HELP_TAG_IOS56_IPAD_OUTPUT", @"");
        [[textLabelIpad cell] setBackgroundStyle:NSBackgroundStyleRaised];
    }
}

//- (void)configureFeedbackButton
//{
//    if (buttonFeedback) {
//        buttonFeedback.toolTip = NSLocalizedString(@"APP_NAMER_HELP_TAG_FEEDBACK_BUTTON", @"");
//    }
//}

- (void)sendFeedbackAction:(id)sender
{
    NSString *subject = NSLocalizedString(@"APP_NAMER_FEEDBACK_SUBJECT",@"");
    NSString *to = NSLocalizedString(@"APP_NAMER_FEEDBACK_ADDRESS",@"");
    NSString *body = @"";
    
    NSString *encodedSubject = [NSString stringWithFormat:@"SUBJECT=%@", [subject stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSString *encodedBody = [NSString stringWithFormat:@"BODY=%@", [body stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSString *encodedTo = [to stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *encodedURLString = [NSString stringWithFormat:@"mailto:%@?%@&%@", encodedTo, encodedSubject, encodedBody];
    NSURL *mailtoURL = [NSURL URLWithString:encodedURLString];
    [[NSWorkspace sharedWorkspace] openURL:mailtoURL];
}

@end
