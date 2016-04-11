//
//  CFModel.h
//  CustomizedFonts
//
//  Created by Hussain  on 10/4/16.
//  Copyright © 2016 OnWardGroup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CFModel : NSObject

@property (nonatomic,strong) NSArray *fontFamilies;
@property (nonatomic,strong) NSArray *fontTraits;
@property (nonatomic,strong) NSArray *colors;
@property (nonatomic,assign) NSString *hexColor;
@property (nonatomic,strong) NSString *currentFamilyName;
@property (nonatomic,strong) NSString *currentTrait;
@property (nonatomic,strong) NSIndexPath *currentIndexPath;
@property (nonatomic,assign) NSInteger fontSize;
@property (nonatomic,assign) BOOL fontFamilyPicker;
@property (nonatomic,assign) BOOL fontTraitsPicker;


-(void)initModelItems:(NSArray*)fontFamilies fontColor:(NSArray*)colors fontTraits:(NSArray*)traits hexValue:(NSString*)hexColor familyName:(NSString*)currentFamilyName trait:(NSString*)currentTrait size:(NSInteger)fontSize hideFontFamilyPicker:(BOOL)fontFamilyPicker hideFontTraitsPicker:(BOOL)fontTraitsPicker;


-(void)showFontFamilyPicker:(BOOL)fontFamilyPicker showFontTraitsPicker:(BOOL)fontTraitsPicker;

-(void)updateIndexPath:(NSIndexPath*)currentIndexPath;
@end
