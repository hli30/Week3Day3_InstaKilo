//
//  Photo.h
//  InstaKilo
//
//  Created by Harry Li on 2017-06-14.
//  Copyright © 2017 Harry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Photo : NSObject

@property (nonatomic) NSString *photoLocation;
@property (nonatomic) NSString *photoSubject;
@property (nonatomic) UIImage *photo;

- (instancetype)initWithImage:(UIImage *)photo andSubject:(NSString *)subject andLocation:(NSString *)location;

@end
