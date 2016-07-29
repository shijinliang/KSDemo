#import <UIKit/UIKit.h>
@class PieView;
@protocol PieViewDelegate <NSObject>

- (CGFloat)centerCircleRadius;

@end

@protocol PieViewDataSource <NSObject>

@required
- (int)numberOfSlicesInPieChartView:(PieView *)pieChartView;
- (double)pieChartView:(PieView *)pieChartView valueForSliceAtIndex:(NSUInteger)index;
- (UIColor *)pieChartView:(PieView *)pieChartView colorForSliceAtIndex:(NSUInteger)index;

@optional
- (NSString*)pieChartView:(PieView *)pieChartView titleForSliceAtIndex:(NSUInteger)index;

@end

@interface PieView : UIView

@property (nonatomic, assign) id <PieViewDataSource> datasource;
@property (nonatomic, assign) id <PieViewDelegate> delegate;

@end