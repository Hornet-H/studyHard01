//
//  HFCubeViewController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/11/24.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFCubeViewController.h"
#import <GLKit/GLKit.h>
#import <QuartzCore/QuartzCore.h>

#define LIGHT_DIRECTION 0, 1, -0.5
#define AMBIENT_LIGHT 0.5

@interface HFCubeViewController ()
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *faces;
@property (weak, nonatomic) IBOutlet UIView *containView;

@end

@implementation HFCubeViewController

/*
 
  @end
 
 
 
 */

 - (void)viewDidLoad {
     [super viewDidLoad];
     [self loadXIB];
     //set up the container sublayer transform
     CATransform3D perspective = CATransform3DIdentity;
     perspective.m34 = -1.0 / 500.0;
     perspective = CATransform3DRotate(perspective, -M_PI_4, 1, 0, 0);
     perspective = CATransform3DRotate(perspective, -M_PI_4, 0, 1, 0);
     self.containView.layer.sublayerTransform = perspective;
     
     //add cube face 1
     CATransform3D transform = CATransform3DMakeTranslation(0, 0, 100);
     [self addFace:0 withTransform:transform];
     //add cube face 2
     transform = CATransform3DMakeTranslation(100, 0, 0);
     transform = CATransform3DRotate(transform, M_PI_2, 0, 1, 0);
     [self addFace:1 withTransform:transform];
     //add cube face 3
     transform = CATransform3DMakeTranslation(0, -100, 0);
     transform = CATransform3DRotate(transform, M_PI_2, 1, 0, 0);
     [self addFace:2 withTransform:transform];
     //add cube face 4
     transform = CATransform3DMakeTranslation(0, 100, 0);
     transform = CATransform3DRotate(transform, -M_PI_2, 1, 0, 0);
     [self addFace:3 withTransform:transform];
     //add cube face 5
     transform = CATransform3DMakeTranslation(-100, 0, 0);
     transform = CATransform3DRotate(transform, -M_PI_2, 0, 1, 0);
     [self addFace:4 withTransform:transform];
     //add cube face 6
     transform = CATransform3DMakeTranslation(0, 0, -100);
     transform = CATransform3DRotate(transform, M_PI, 0, 1, 0);
     [self addFace:5 withTransform:transform];
 }

- (void)addFace:(NSInteger)index withTransform:(CATransform3D)transform {
    //get the face view and add it to the container
    UIView *face = self.faces[index];
    [self.containView addSubview:face];
    //center the face view within the container
    CGSize containerSize = self.containView.bounds.size;
    face.center = CGPointMake(containerSize.width / 2.0, containerSize.height / 2.0);
    // apply the transform
    face.layer.transform = transform;
    //apply lighting
    [self applyLightingToFace:face.layer];
}


- (void)applyLightingToFace:(CALayer *)face {
    //add lighting layer
    CALayer *layer = [CALayer layer];
    layer.frame = face.bounds;
    [face addSublayer:layer];
    //convert the face transform to matrix
    //(GLKMatrix4 has the same structure as CATransform3D)
    //译者注：GLKMatrix4和CATransform3D内存结构一致，但坐标类型有长度区别，所以理论上应该做一次float到CGFloat的转换，感谢[@zihuyishi](https://github.com/zihuyishi)同学~
    CATransform3D transform = face.transform;
    GLKMatrix4 matrix4 = *(GLKMatrix4 *)&transform;
    GLKMatrix3 matrix3 = GLKMatrix4GetMatrix3(matrix4);
    //get face normal
    GLKVector3 normal = GLKVector3Make(0, 0, 1);
    normal = GLKMatrix3MultiplyVector3(matrix3, normal);
    normal = GLKVector3Normalize(normal);
    //get dot product with light direction
    GLKVector3 light = GLKVector3Normalize(GLKVector3Make(LIGHT_DIRECTION));
    float dotProduct = GLKVector3DotProduct(light, normal);
    //set lighting layer opacity
    CGFloat shadow = 1 + dotProduct - AMBIENT_LIGHT;
    UIColor *color = [UIColor colorWithWhite:0 alpha:shadow];
    layer.backgroundColor = color.CGColor;
}






/*
 
 - (void)addface:(NSInteger)index withTransform:(CATransform3D)tranform{
 //    UIView *face = self.faces[index];
 //    [self.containView addSubview:face];
 //    CGSize containerSize = self.containView.bounds.size;
 //    face.center = CGPointMake(containerSize.width/2.0, containerSize.height/2.0);
 //    face.layer.transform = tranform;
 
 
 //    UIView *face = self.faces[index];
 //    face.layer.borderWidth = 1.0;
 //    face.layer.borderColor = [UIColor blackColor].CGColor;
 //    [self.containView addSubview:face];
 //    //center the face view within the container
 //    CGSize containerSize = self.containView.bounds.size;
 //    face.center = CGPointMake(containerSize.width / 2.0, containerSize.height / 2.0);
 //    // apply the transform
 //    face.layer.transform = tranform;
 //    [self applyLightingToFace:face.layer];
 
 
 
 UIView *face = self.faces[index];
 [self.containView addSubview:face];
 //center the face view within the container
 CGSize containerSize = self.containView.bounds.size;
 face.center = CGPointMake(containerSize.width / 2.0, containerSize.height / 2.0);
 // apply the transform
 face.layer.transform = tranform;
 //apply lighting
 [self applyLightingToFace:face.layer];
 
 
 
 }

 
- (void)viewDidLoad{
    [super viewDidLoad];
    [self loadXIB];
//    CATransform3D perspective = CATransform3DIdentity;
//    perspective.m34 = -1.0 / 500.0;
//    perspective = CATransform3DRotate(perspective, -M_PI_4, 1, 0, 0);
//    perspective = CATransform3DRotate(perspective, -M_PI_4, 0, 1, 0);
//    
//    self.containView.layer.sublayerTransform = perspective;
//    
//    
//    
//    CATransform3D transform3D = CATransform3DMakeTranslation(0, 0, 100);
//    [self addface:0 withTransform:transform3D];
//
//    transform3D = CATransform3DMakeTranslation(100, 0, 0);
//    transform3D = CATransform3DMakeRotation(M_PI_2, 0, 1, 0);
//    [self addface:1 withTransform:transform3D];
//    transform3D = CATransform3DMakeTranslation(0, -100, 0);
//    transform3D = CATransform3DRotate(transform3D, M_PI_2, 1, 0, 0);
//    [self addface:2 withTransform:transform3D];
//    transform3D = CATransform3DMakeTranslation(0, 100, 0);
//    transform3D = CATransform3DRotate(transform3D, -M_PI_2, 1, 0, 0);
//    [self addface:3 withTransform:transform3D];
//    transform3D = CATransform3DMakeTranslation(-100, 0, 0);
//    transform3D = CATransform3DRotate(transform3D, -M_PI_2, 0, 1, 0);
//    [self addface:4 withTransform:transform3D];
//    transform3D = CATransform3DMakeTranslation(0, 0, -100);
//    transform3D = CATransform3DRotate(transform3D, M_PI, 0, 1, 0);
//    [self addface:5 withTransform:transform3D];
    
//    [self loadXIB];
    
//    CATransform3D perspective = CATransform3DIdentity;
////    perspective = CATransform3DRotate(perspective, M_PI_4, 0, 0, 1);
//    perspective = CATransform3DRotate(perspective, -M_PI_4, 1, 0, 0);
//    perspective = CATransform3DRotate(perspective, -M_PI_4, 0, 1, 0);
//    perspective.m34 = - 1.0 / 500.0;
//    self.containView.layer.sublayerTransform = perspective;
//    
//    
//    CATransform3D transform = CATransform3DMakeTranslation(0, 0, 100);
//    [self addface:0 withTransform:transform];
//    //add cube face 2
//    transform = CATransform3DMakeTranslation(100, 0, 0);
//    transform = CATransform3DRotate(transform, M_PI_2, 0, 1, 0);
//    [self addface:1 withTransform:transform];
//    transform = CATransform3DMakeTranslation(0, -100, 0);
//    transform = CATransform3DRotate(transform, M_PI_2, 1, 0, 0);
//    [self addface:2 withTransform:transform];
//    //add cube face 4
//    transform = CATransform3DMakeTranslation(0, 100, 0);
//    transform = CATransform3DRotate(transform, -M_PI_2, 1, 0, 0);
//    [self addface:3 withTransform:transform];
//    //add cube face 5
//    transform = CATransform3DMakeTranslation(-100, 0, 0);
//    transform = CATransform3DRotate(transform, -M_PI_2, 0, 1, 0);
//    [self addface:4 withTransform:transform];
//    //add cube face 6
//    transform = CATransform3DMakeTranslation(0, 0, -100);
//    transform = CATransform3DRotate(transform, M_PI, 0, 1, 0);
//    [self addface:5 withTransform:transform];
    
    
    
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = -1.0 / 500.0;
    perspective = CATransform3DRotate(perspective, -M_PI_4, 1, 0, 0);
    perspective = CATransform3DRotate(perspective, -M_PI_4, 0, 1, 0);
    self.containView.layer.sublayerTransform = perspective;
    CATransform3D transform = CATransform3DMakeTranslation(0, 0, 100);
    [self addface:0 withTransform:transform];
    //add cube face 2
    transform = CATransform3DMakeTranslation(100, 0, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 0, 1, 0);
    [self addface:1 withTransform:transform];
    
    transform = CATransform3DMakeTranslation(0, -100, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 1, 0, 0);
    [self addface:2 withTransform:transform];
    //add cube face 4
    transform = CATransform3DMakeTranslation(0, 100, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 1, 0, 0);
    
    [self addface:3 withTransform:transform];
    //add cube face 5
    transform = CATransform3DMakeTranslation(-100, 0, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 0, 1, 0);
    [self addface:4 withTransform:transform];
    //add cube face 6
    transform = CATransform3DMakeTranslation(0, 0, -100);
    transform = CATransform3DRotate(transform, M_PI, 0, 1, 0);
    [self addface:5 withTransform:transform];
    
    
    
}
    

- (void)applyLightingToFace:(CALayer *)face{
//    CALayer *layer = [CALayer layer];
//    layer.frame = face.bounds;
//    [face addSublayer:layer];
//    CATransform3D transform = face.transform;
//    GLKMatrix4 matrix4 = *(GLKMatrix4 *) &transform;
//    GLKMatrix3 matrix3 = GLKMatrix4GetMatrix3(matrix4);
//    GLKVector3 normal = GLKVector3Make(0, 0, 1);
//    normal = GLKMatrix3MultiplyVector3(matrix3, normal);
//    normal = GLKVector3Normalize(normal);
//    GLKVector3 light = GLKVector3Normalize(GLKVector3Make(LIGHT_DIRECTION));
//    
//    float dotProduct = GLKVector3DotProduct(light, normal);
//    //set lighting layer opacity
//    CGFloat shadow = 1 + dotProduct - AMBIENT_LIGHT;
//    UIColor *color = [UIColor colorWithWhite:0 alpha:shadow];
//    layer.backgroundColor = color.CGColor;
    
    CALayer *layer = [CALayer layer];
    layer.frame = face.bounds;
    [face addSublayer:layer];
    CATransform3D transform = face.transform;
    GLKMatrix4 matrix4 = *(GLKMatrix4 *)&transform;
    GLKMatrix3 matrix3 = GLKMatrix4GetMatrix3(matrix4);
    //get face normal
    GLKVector3 normal = GLKVector3Make(0, 0, 1);
    normal = GLKMatrix3MultiplyVector3(matrix3, normal);
    normal = GLKVector3Normalize(normal);
    //get dot product with light direction
    GLKVector3 light = GLKVector3Normalize(GLKVector3Make(LIGHT_DIRECTION));
    float dotProduct = GLKVector3DotProduct(light, normal);
    //set lighting layer opacity
    CGFloat shadow = 1 + dotProduct - AMBIENT_LIGHT;
    UIColor *color = [UIColor colorWithWhite:0 alpha:shadow];
    layer.backgroundColor = color.CGColor;
    

}
*/


- (void)loadXIB{
    [[NSBundle mainBundle]loadNibNamed:@"cubeface1" owner:self options:nil];


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
    
}
@end
