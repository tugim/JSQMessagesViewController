//
//  JSQInfoMessage.m
//  JSQMessages
//
//  Created by Dylan Bourgeois on 29/11/14.
//  Copyright (c) 2014 Hexed Bits. All rights reserved.
//

#import "JSQInfoMessage.h"

@implementation JSQInfoMessage

- (instancetype)initWithType:(JSQInfoMessageType)messageType
                    senderId:(NSString *)senderId
           senderDisplayName:(NSString *)senderDisplayName
                        date:(NSDate *)date
{
    //@discussion: NSParameterAssert() ?
    
    self = [super initWithSenderId:senderId senderDisplayName:senderDisplayName date:date];
    
    if (self) {
        _infoMessageType = messageType;
    }
    
    return self;
}

-(NSString*)text
{
    switch (self.infoMessageType) {
        case InfoMessageTypeSessionDidEnd:
            return [NSString stringWithFormat:@"Session with %@ ended.", self.senderDisplayName];
            break;
            
        default:
            return nil;
            break;
    }
}

-(NSUInteger)hash
{
    return self.senderId.hash ^ self.date.hash;
}

-(NSString*)description
{
    return [NSString stringWithFormat:@"<%@: senderId=%@, senderDisplayName=%@, date=%@, type=%ld>",
            [self class], self.senderId, self.senderDisplayName, self.date, self.infoMessageType];
}

@end
