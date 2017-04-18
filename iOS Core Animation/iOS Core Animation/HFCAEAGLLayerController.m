//
//  HFCAEAGLLayerController.m
//  iOS Core Animation
//
//  Created by 黄来峰 on 2016/12/1.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFCAEAGLLayerController.h"
#import <GLKit/GLKit.h>
#include <OpenGLES/ES2/gl.h>
#include <OpenGLES/ES2/glext.h>

@interface HFCAEAGLLayerController ()
@property (weak, nonatomic) IBOutlet UIView *glView;
@property (strong, nonatomic) EAGLContext *glContext;
@property (strong, nonatomic) CAEAGLLayer *glLayer;
@property (assign, nonatomic) GLuint frameBuffer;
@property (assign, nonatomic) GLuint colorRenderBuffer;
@property (assign, nonatomic) GLint frameBufferWidth;
@property (assign, nonatomic) GLint frameBufferHeight;
@property (strong, nonatomic) GLKBaseEffect *effect;



@end

@implementation HFCAEAGLLayerController

///代码执行结果有问题对OpenGL不熟悉，暂时将这一块搁置

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.glContext = [[EAGLContext alloc]initWithAPI:kEAGLRenderingAPIOpenGLES2];
    [EAGLContext setCurrentContext:self.glContext];
    
    //设置Layer
    self.glLayer = [CAEAGLLayer layer];
    self.glLayer.frame = self.glView.bounds;
    [self.glView.layer addSublayer:self.glLayer];
    self.glLayer.drawableProperties = @{
                                        kEAGLDrawablePropertyRetainedBacking:@NO,
                                        kEAGLDrawablePropertyColorFormat: kEAGLColorFormatRGBA8
                                        };
    self.effect = [[GLKBaseEffect alloc]init];
    //设置缓存区
    [self setUpBuffers];
    [self drawFrame];
    
    
}


- (void)setUpBuffers{
    
    //设置布局缓冲
    glGenFramebuffers(1, &_frameBuffer);
    glBindFramebuffer(GL_FRAMEBUFFER, _frameBuffer);
    
    //设置颜色渲染缓冲
    glGenRenderbuffers(1, &_colorRenderBuffer);
    glBindRenderbuffer(GL_RENDERBUFFER, _colorRenderBuffer);

    glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_RENDERBUFFER, _colorRenderBuffer);
    [self.glContext renderbufferStorage:GL_RENDERBUFFER fromDrawable:self.glLayer];
    
    glGetRenderbufferParameteriv(GL_RENDERBUFFER, GL_RENDERBUFFER_WIDTH, &_frameBufferWidth);
    glGetRenderbufferParameteriv(GL_RENDERBUFFER, GL_RENDERBUFFER_HEIGHT, &_frameBufferHeight);
    
    if (glCheckFramebufferStatus(GL_FRAMEBUFFER != GL_FRAMEBUFFER_COMPLETE)) {
        NSLog(@"Failed to make complete framebuffer object: %i", glCheckFramebufferStatus(GL_FRAMEBUFFER));
    }


}

- (void)tearDownBuffers{
    if (_frameBuffer) {
        glDeleteFramebuffers(1, &_frameBuffer);
        _frameBuffer = 0;
    }
    if (_colorRenderBuffer) {
        //清空渲染缓存区
        glDeleteRenderbuffers(1, &_colorRenderBuffer);
        _colorRenderBuffer = 0 ;
    }
}
- (void)drawFrame{
    //结合帧缓存 设置视图端口
    glBindFramebuffer(GL_FRAMEBUFFER, _frameBuffer);
    glViewport(0, 0, _frameBufferWidth, _frameBufferHeight);
    [self.effect prepareToDraw];
    
    //清除屏幕
    glClear(GL_COLOR_BUFFER_BIT);
    glClearColor(0.0, 0.0, 0.0, 1.0);
    
    //设置顶点点
    CGFloat vertices[] = {
        -0.5f, -0.5f, -1.0f, 0.0f, 0.5f, -1.0f, 0.5f, -0.5f, -1.0f,
    };
    //设置颜色
    CGFloat colors[] = {
        0.0f, 0.0f, 1.0f, 1.0f, 0.0f, 1.0f, 0.0f, 1.0f, 1.0f, 0.0f, 0.0f, 1.0f,
        
    };
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glEnableVertexAttribArray(GLKVertexAttribColor);
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, 0, vertices);
    
    glVertexAttribPointer(GLKVertexAttribColor,4, GL_FLOAT, GL_FALSE, 0, colors);
    glDrawArrays(GL_TRIANGLES, 0, 3);
    
    //展示渲染的缓冲区
    glBindRenderbuffer(GL_RENDERBUFFER, _colorRenderBuffer);
    [self.glContext presentRenderbuffer:GL_RENDERBUFFER];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    [self tearDownBuffers];
}
- (void)dealloc{
    [self tearDownBuffers];
    [EAGLContext setCurrentContext:nil];
}


@end
