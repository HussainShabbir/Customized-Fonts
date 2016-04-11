//
//  UIFont+CFFontType.h
//  CustomizedFonts
//
//  Created by Hussain  on 10/4/16.
//  Copyright © 2016 OnWardGroup. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIFont (CFFontType)

+(UIFont *)createFontWithFamily:(NSString*)familyName fontSize:(CGFloat)size fontTrait:(NSString*)trait;

@end
