//
//  UIFont+CFFontType.m
//  CustomizedFonts
//
//  Created by Hussain  on 10/4/16.
//  Copyright © 2016 OnWardGroup. All rights reserved.
//

#import "UIFont+CFFontType.h"
@import CoreText;

@implementation UIFont (CFFontType)

+(UIFont *)createFontWithFamily:(NSString*)familyName
                       fontSize:(CGFloat)size
                      fontTrait:(NSString*)trait
{
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:familyName,(NSString*)kCTFontFamilyNameAttribute, trait,(NSString*)kCTFontStyleNameAttribute,[NSNumber numberWithFloat:size],kCTFontSizeAttribute, nil];
    CTFontDescriptorRef descriptor = CTFontDescriptorCreateWithAttributes((CFDictionaryRef) attributes);
    CTFontRef font = CTFontCreateWithFontDescriptor(descriptor, 0.0, NULL);
    CFRelease(descriptor);
    return (__bridge UIFont*)font;
}

@end
