//
//  main.m
//  Word Effects
//
//  Created by Zach Smoroden on 2016-05-02.
//  Copyright © 2016 Zach Smoroden. All rights reserved.
//

#import <Foundation/Foundation.h>

void makeLouder(NSString *inputString);
void makeQuieter(NSString *inputString);
void numberize(NSString *inputString);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        char inputChars[255];
        char command[255];
        BOOL quit = NO;
        
        while (!quit) {
            printf("Welcome to Word Effects!\n");
            printf("Please enter the number of the following command you would like to run:\n");
            printf("1: MAKE LOUDER\n");
            printf("2: make quieter\n");
            printf("3: Numberize\n");
            printf("4: Canadianize\n");
            printf("5: Respond\n");
            printf("6: De-Space-It\n");
            printf("9: Quit\n");

            fgets(command, 255, stdin);
            
            if (command[0] == '9') {
                quit = YES;
                continue;
            }
            
            printf("Please enter a string:\n");
            
            fgets(inputChars, 255, stdin);
            
            NSString *inputString = [NSString stringWithUTF8String:inputChars];

            
            switch (command[0]) {
                case '1':
                    makeLouder(inputString);
                    break;
                case '2':
                    makeQuieter(inputString);
                    break;
                case '3':
                    numberize([inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]);
                    break;
                default:
                    break;
            }
            
        }
        
        
    }
    return 0;
}

void numberize(NSString *inputString) {
    
    NSNumberFormatter *format = [[NSNumberFormatter alloc] init];
    format.numberStyle = NSNumberFormatterDecimalStyle;
    
    NSNumber *number = [format numberFromString:inputString];
    
    if (number != nil) {
        NSLog(@"The number entered is: %@\n", number);
    } else {
        NSLog(@"No valid number entered.\n");
    }
}

void makeQuieter(NSString *inputString) {
    NSLog(@"Made Quieter!: %@\n", [inputString lowercaseString]);
    
}

void makeLouder(NSString *inputString) {
    
    NSLog(@"Made Louder!: %@\n", [inputString uppercaseString]);
    
}
