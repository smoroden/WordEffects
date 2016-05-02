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
void canadianize(NSString *inputString);
void respond(NSString *inputString);
void despace(NSString *inputString);
void removePunctuation(NSString *inputString);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        char inputChars[255];
        char command[255];
        BOOL quit = NO;
        
        while (!quit) {
            printf("\nWelcome to Word Effects!\n");
            printf("Please enter the number of the following command you would like to run:\n");
            printf("1: MAKE LOUDER\n");
            printf("2: make quieter\n");
            printf("3: Numberize\n");
            printf("4: Canadianize\n");
            printf("5: Respond\n");
            printf("6: De-Space-It\n");
            printf("7: Un-Punctuate\n");
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
                case '4':
                    canadianize([inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]);
                    break;
                case '5':
                    respond([inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]);
                    break;
                case '6':
                    despace(inputString);
                    break;
                case '7':
                    removePunctuation(inputString);
                    break;
                default:
                    printf("Invalid command.\n");
                    break;
            }
            
        }
        
        
    }
    return 0;
}

void removePunctuation(NSString *inputString) {
    
    NSString *finalString = [[inputString componentsSeparatedByCharactersInSet:[[NSCharacterSet letterCharacterSet] invertedSet]] componentsJoinedByString:@""];
    NSLog(@"No more punctuation:\n%@", finalString);
}

void despace(NSString *inputString) {
    NSLog(@"All of the spaces have been changed:\n%@", [inputString stringByReplacingOccurrencesOfString:@" " withString:@"-"]);
}

void respond(NSString *inputString) {
    char lastChar = [inputString characterAtIndex:inputString.length - 1];
    if ( lastChar == '?') {
        NSLog(@"I don't know.");
    } else if (lastChar == '!') {
        NSLog(@"Woah, calm down!");
    }
}

void canadianize(NSString *inputString) {
    NSString *eh = @", eh?";
    
    NSLog(@"Canadianized string: %@", [inputString stringByAppendingString:eh]);
    
}

void numberize(NSString *inputString) {
    // We use the formatter to convert the string to a number
    NSNumberFormatter *format = [[NSNumberFormatter alloc] init];
    format.numberStyle = NSNumberFormatterDecimalStyle;
    
    // Getting the actual number
    NSNumber *number = [format numberFromString:inputString];
    
    // If the number is nil the conversion didn't work
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
