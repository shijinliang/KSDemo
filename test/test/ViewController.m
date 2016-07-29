#import "ViewController.h"
#import "PieView.h"

@interface ViewController ()<PieViewDelegate,PieViewDataSource>

@end

@implementation ViewController

-(BOOL)canBecomeFirstResponder{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor redColor];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(10, 100, self.view.bounds.size.width, 40)];
    label.text=@"长按屏幕看效果";
    [self.view addSubview:label];
    UILongPressGestureRecognizer *longPressGesture=[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressAction:)];
    [self.view addGestureRecognizer:longPressGesture];
    
    PieView *pie = [[PieView alloc] initWithFrame:CGRectMake(10, 200, 200, 200)];
    pie.delegate = self;
    pie.datasource = self;
    [self.view addSubview:pie];
}
//No.1
//开始写代码，写出长按手势的响应事件，实现弹出式菜单（类似长按出现的复制粘贴）,点击调用@selector(alert:)
-(void)longPressAction:(UILongPressGestureRecognizer *)longPress
{
    UIMenuItem *item = [[UIMenuItem alloc]initWithTitle:@"复制" action:@selector(alert:)];
    [[UIMenuController sharedMenuController] setMenuItems:@[item]];
    [[UIMenuController sharedMenuController] setTargetRect:CGRectMake(10, 100, self.view.bounds.size.width, 40) inView:self.view];
    [[UIMenuController sharedMenuController] setMenuVisible:YES animated:YES];
}

//end_code

- (void)alert:(NSString *)title{
    [[[UIAlertView alloc] initWithTitle:nil message:title  delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (CGFloat)centerCircleRadius
{
    return 20;
}

- (UIColor *)pieChartView:(PieView *)pieChartView colorForSliceAtIndex:(NSUInteger)index
{
    if (index == 1) {
        return [UIColor redColor];
    } else if (index == 2) {
        return [UIColor greenColor];
    } else if (index == 3) {
        return [UIColor yellowColor];
    } else {
        return [UIColor blueColor];
    }
}

- (int)numberOfSlicesInPieChartView:(PieView *)pieChartView
{
    return 3;
}

@end