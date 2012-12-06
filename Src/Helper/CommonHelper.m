//
//  CommonHelper.m
//  iChanceSample
//
//  Created by Fox on 12-12-6.
//
//

#import "CommonHelper.h"

@implementation CommonHelper

+ (NSString *)userRegisterWithUserName:(NSString *)userName
                              password:(NSString *)password
                                mobile:(NSString *)mobile
{
    NSMutableString *requestMessage = [NSMutableString stringWithFormat:
                                    @"<?xml version='1.0' encoding='UTF-8'?><SatInterface><Indentity>"];
    
    [requestMessage appendFormat:@"<User>%@</User>",userName];
    [requestMessage appendFormat:@"<Password>%@<Password>",password];
    [requestMessage appendString:@"</Indentity>"];
    [requestMessage appendFormat:@"<CheckMemberRegister><Mobile>%@</Mobile><\nCheckMemberRegister>",mobile];
    [requestMessage appendString:@"</SatInterface>"];
    
    return [NSString stringWithFormat:@"%@",requestMessage];

}


@end
