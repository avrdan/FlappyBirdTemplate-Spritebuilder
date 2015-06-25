#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
    // your code here
    character = (Character *)[CCBReader load:@"Character"];
    [physicsNode addChild:character];
    
    // add first obstacle
    [self addObstacle];
    timeSinceObstacle = 0.0f;
}

-(void)update:(CCTime)delta
{
    // increment the time since the last obstacle was added
    timeSinceObstacle += delta; // depends on frame rate (1/60 max)
    
    // check to see if two seconds have passed
    if (timeSinceObstacle > 2.0f)
    {
        // add another obstacle
        [self addObstacle];
        // reset timer
        timeSinceObstacle = 0;
    }
}

// put new methods here
- (void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event
{
    // this will get called every time the player touches the screen
    [character flap];
}

@end
