#include <dlfcn.h>

#ifdef __OBJC__
#import <Foundation/Foundation.h>
#endif

%ctor 
{
    // NSDictionary *prefs = [NSDictionary dictionaryWithContentsOfFile:@"/var/jb/var/mobile/Library/Preferences/com.rheard.RHRevealLoader.plist"];
    NSString *libraryPath = @"/var/jb/Library/Frameworks/RevealServer.framework/RevealServer";

    NSArray *enabledApps = [NSArray arrayWithObjects:@"com.apple.springboard",nil];
    if ([enabledApps containsObject:[[NSBundle mainBundle] bundleIdentifier]])
    {
        if ([[NSFileManager defaultManager] fileExistsAtPath:libraryPath]) 
        {
            // ????cannot open
            void *addr = dlopen([libraryPath UTF8String], RTLD_NOW);
            if (addr) 
            {
                [[NSNotificationCenter defaultCenter] postNotificationName:@"IBARevealRequestStart" object:nil];
                NSLog(@"[RevealLoader]: loaded %@ successful, address %p", libraryPath, addr);
            }
            else 
            {
                NSLog(@"[RevealLoader]: loaded %@ failed, address %p", libraryPath,addr);
            }
        }
    }
}
 
