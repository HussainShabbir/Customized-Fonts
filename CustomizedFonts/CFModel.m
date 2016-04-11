//
//  CFModel.m
//  CustomizedFonts
//
//  Created by Hussain  on 10/4/16.
//  Copyright © 2016 OnWardGroup. All rights reserved.
//

#import "CFModel.h"

@implementation CFModel
-(void)initModelItems:(NSArray*)fontFamilies
            fontColor:(NSArray*)colors
           fontTraits:(NSArray*)traits
             hexValue:(NSString*)hexColor
           familyName:(NSString*)currentFamilyName
                trait:(NSString*)currentTrait
                 size:(NSInteger)fontSize
           hideFontFamilyPicker:(BOOL)fontFamilyPicker
 hideFontTraitsPicker:(BOOL)fontTraitsPicker
{
    self.fontFamilies = fontFamilies;
    self.colors = colors;
    self.fontTraits = traits;
    self.hexColor = hexColor;
    self.currentFamilyName = currentFamilyName;
    self.currentTrait = currentTrait;
    self.fontSize = fontSize;
    self.fontFamilyPicker = fontFamilyPicker;
    self.fontTraitsPicker = fontTraitsPicker;
}


-(void)showFontFamilyPicker:(BOOL)fontFamilyPicker showFontTraitsPicker:(BOOL)fontTraitsPicker;
{
    self.fontFamilyPicker = fontFamilyPicker;
    self.fontTraitsPicker = fontTraitsPicker;
}

-(void)updateIndexPath:(NSIndexPath*)currentIndexPath
{
    self.currentIndexPath = currentIndexPath;
}

@end
