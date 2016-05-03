//
//  main.m
//  Word Effects
//
//  Created by Zach Smoroden on 2016-05-02.
//  Copyright © 2016 Zach Smoroden. All rights reserved.
//

#import <Foundation/Foundation.h>
// Standard NSSTRING
void makeLouder(NSString *inputString);
void makeQuieter(NSString *inputString);
void numberize(NSString *inputString);
void canadianize(NSString *inputString);
void respond(NSString *inputString);
void despace(NSString *inputString);
void removePunctuation(NSString *inputString);
void wordCount(NSString *inputString);

// MUTABLE: Haven't actually implememnted all of them.
void wordCountMutable(NSMutableString *inputString);
void makeLouderMutable(NSMutableString *inputString);
void makeQuieterMutable(NSMutableString *inputString);
void numberizeMutable(NSMutableString *inputString);
void canadianizeMutable(NSMutableString *inputString);
void respondMutable(NSMutableString *inputString);
void despaceMutable(NSMutableString *inputString);
void removePunctuationMuteable(NSMutableString *inputString);


int main(int argc, const char * argv[]) {
    @autoreleasepool {

        char inputChars[255];
        char command[255];
        BOOL quit = NO;
        
        // Loop until the user decides to quit
        while (!quit) {
            // The welcome message and list of availible commands.
            printf("\nWelcome to Word Effects!\n");
            printf("Please enter the number of the following command you would like to run:\n");
            printf("1: MAKE LOUDER\n");
            printf("2: make quieter\n");
            printf("3: Numberize\n");
            printf("4: Canadianize\n");
            printf("5: Respond\n");
            printf("6: De-Space-It\n");
            printf("7: Un-Punctuate\n");
            printf("8: Word Count\n");
            printf("9: Quit\n");

            // We really only need two bytes but not a big deal.
            fgets(command, 255, stdin);
            
            // Quickly check to see if they wish to quit.
            if (command[0] == '9') {
                quit = YES;
                continue;
            }
            
            // Get the string to modify
            printf("Please enter a string:\n");
            fgets(inputChars, 255, stdin);
            
            // Convert C style string to Obj-C
            NSString *inputString = [NSString stringWithUTF8String:inputChars];
            NSMutableString *mutableString = [inputString mutableCopy];

            
            // Do what needs to be done
            // The problem with this way of doing it is that we are limited to 10 options
            // Could change it to if-else statements or convert it to integers.
            switch (command[0]) {
                case '1':
                    makeLouder(inputString);
                    makeLouderMutable(mutableString);
                    break;
                case '2':
                    makeQuieter(inputString);
                    makeQuieterMutable(mutableString);
                    break;
                case '3':
                    // The newline that fgets includes trips up the conversion so we get rid of it
                    numberize([inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]);
                    break;
                case '4':
                    // Again we don't want a newline
                    canadianize([inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]);
                    break;
                case '5':
                    // Once more the newline must go!
                    respond([inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]);
                    break;
                case '6':
                    despace(inputString);
                    break;
                case '7':
                    removePunctuation(inputString);
                    break;
                case '8':
                    wordCount(inputString);
                    break;
                default:
                    printf("Invalid command.\n");
                    break;
            }
        }
    }
    return 0;
}

// Counts the number of words seperated by ' ' (spaces)
void wordCount(NSString *inputString) {
    NSLog(@"The number of words is: %lu", (unsigned long)[inputString componentsSeparatedByString:@" "].count);
}

// Keeps only characters
void removePunctuation(NSString *inputString) {
    
    NSString *finalString = [[inputString componentsSeparatedByCharactersInSet:[[NSCharacterSet letterCharacterSet] invertedSet]] componentsJoinedByString:@""];
    NSLog(@"No more punctuation:\n%@", finalString);
}

// replaces ' ' with '-'
void despace(NSString *inputString) {
    NSLog(@"All of the spaces have been changed:\n%@", [inputString stringByReplacingOccurrencesOfString:@" " withString:@"-"]);
}

// gets the last character in the string and if it matches respond properly
void respond(NSString *inputString) {
    char lastChar = [inputString characterAtIndex:inputString.length - 1];
    if ( lastChar == '?') {
        NSLog(@"I don't know.");
    } else if (lastChar == '!') {
        NSLog(@"Woah, calm down!");
    }
}

// makes it canadian, eh?
void canadianize(NSString *inputString) {
    NSString *eh = @", eh?";
    
    NSLog(@"Canadianized string: %@", [inputString stringByAppendingString:eh]);
    
}

// converts the string to a number if valid
void numberize(NSString *inputString) {
    // We use the formatter to convert the string to a number
    NSNumberFormatter *format = [[NSNumberFormatter alloc] init];
    format.numberStyle = NSNumberFormatterDecimalStyle;
    
    // Getting the actual number
    NSNumber *number = [format numberFromString:inputString];
    
    // The other way of doing it would be [inputString intValue]
    // but the formatter can be more customizable.
    
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

void makeLouderMutable(NSMutableString *inputString) {
    // To demonstrate that it is mutable we change it in place
    
    NSLog(@"Made Louder (Mutable)!: %@\n", inputString);
    
}

void makeQuieterMutable(NSMutableString *inputString) {
    // To demonstrate that it is mutable we change it in place
    [inputString lowercaseString];
    NSLog(@"Made Quieter! (Mutable): %@\n", inputString);
    
}


