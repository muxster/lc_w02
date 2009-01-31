#import <Foundation/Foundation.h>

// interface for YourClass
@interface YourClass : NSObject
{
	
}

- (void) goodbye;

@end



// interface for MyClass - example class covered in week 2
@interface MyClass : NSObject
{
	float myFloat;
	
	// pointer to an instance of YourClass
	YourClass *friend;
}

- (void) hello;
- (void) setFriend:(YourClass*)val;
- (YourClass*) friend;

@end





@implementation YourClass

- (id) init
{
	self = [super init];
	return self;
}

- (void) goodbye
{
	NSLog(@"Goodbye, nice seeing you!");
}

- (void) dealloc
{
	[super dealloc];
}

@end



@implementation MyClass

- (id) init
{
	self = [super init];
	if(self != nil)
	{
		myFloat = 5.0;
	}
	return self;
}

- (void) hello
{
	NSLog(@"Hello, I'm your first Objective-C program!");
}

- (void) setMyFloat:(float)val
{
	myFloat = val;
}

- (float)myFloat
{
	return myFloat;
}

- (void) setFriend:(YourClass*)val
{
	[friend release];
	friend = val;
}

- (YourClass*) friend
{
	return friend;
}



- (void) dealloc
{
	// release any retained objects here.
	[super dealloc];
}

@end





int main(int argc, char**argv)
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	// allocate an instance
	MyClass *instance = [[MyClass alloc] init];
	[instance hello];
	
	[instance setMyFloat: 10.0f];
	NSLog(@"new value is %f", [instance myFloat]);
	
	// allocate an instance of YourClass
	YourClass *ycinstance = [[YourClass alloc] init];
	[ycinstance goodbye];	
	
	[pool release];
	
	return 0;
}