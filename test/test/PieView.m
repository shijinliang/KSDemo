#import "PieView.h"

@implementation PieView

@synthesize delegate;
@synthesize datasource;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.layer.shadowColor = [[UIColor blackColor] CGColor];
        self.layer.shadowOffset = CGSizeMake(0.0f, 2.5f);
        self.layer.shadowRadius = 1.9f;
        self.layer.shadowOpacity = 0.9f;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat theHalf = rect.size.width/2;
    CGFloat lineWidth = theHalf;
    lineWidth -= [self.delegate centerCircleRadius];
    CGFloat radius = theHalf-lineWidth/2;
    
    /*圆心坐标*/
    CGPoint center = CGPointMake(theHalf, rect.size.height/2);
    
    float startAngle = - M_PI_2;
    float endAngle = 0.0f;
    
    double sum = 0.0f;
    /*饼状图中切片个数*/
    int slicesCount = [self.datasource numberOfSlicesInPieChartView:self];
    
    //No.1
    //开始写代码，完成饼状图的绘制，从-M_PI_2位置开始顺时针以radius为半径绘制。
    for (int i = 0; i < slicesCount; i ++) {
        CGFloat currentAngle = startAngle;
        endAngle += 1/3.0f* 2 * M_PI;
        
        CGContextMoveToPoint(context, center.x, center.y);
        CGContextAddArc(context, center.x, center.y, radius, startAngle, endAngle, 0);
        UIColor *color = [self.datasource pieChartView:self colorForSliceAtIndex:i+1];
        CGContextSetFillColorWithColor(context, color.CGColor);
        CGContextFillPath(context);
        
        startAngle = endAngle;
    }
    
    //end_code
}

@end