#import <Foundation/Foundation.h>

// interface for YourClass
@interface YourClass : NSObject
{
	// define an instance variable that will hold a message to be returned by the goodbye function
	NSString* myString;
}

- (NSString*) goodbye;

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

- (NSString*) goodbye
{
	//NSLog(@"Goodbye, nice seeing you!");
	myString = @"Goodbye, nice seeing you!";
	
	return (myString);
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
	
	// set this new instance as the friend of the MyClass instance
	[instance setFriend: ycinstance];
	
	// now refer to our friend (within the MyClass instance) and have him introduce himself	
	NSLog(@"This is my friend %@ and he says '%@'", [instance friend], [[instance friend] goodbye]);
	
	[pool release];
	
	return 0;
}