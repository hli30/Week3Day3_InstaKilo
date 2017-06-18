//
//  Photo.m
//  InstaKilo
//
//  Created by Harry Li on 2017-06-14.
//  Copyright © 2017 Harry. All rights reserved.
//

#import "Photo.h"

@implementation Photo

- (instancetype)initWithImage:(UIImage *)photo andSubject:(NSString *)subject andLocation:(NSString *)location
{
    self = [super init];
    if (self) {
        _photo = photo;
        _photoSubject = subject;
        _photoLocation = location;
    }
    return self;
}

@end
