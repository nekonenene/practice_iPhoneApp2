//
//  CameraAvFoundation.m
//  CameraTest2
//
//  Created by Yokoe on 10/28/15.
//  Copyright © 2015 Hatonekoe. All rights reserved.
//

#import "CameraAvFoundation.h"

@implementation CameraAvFoundation

@synthesize videoInput ;
@synthesize stillImageOutput ;
@synthesize session ;
@synthesize previewView ;
@synthesize availableMetadataObjectTypes ;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 撮影ボタンを配置したツールバーを生成
    /*
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
    
    UIBarButtonItem *takePhotoButton = [[UIBarButtonItem alloc] initWithTitle:@"撮影"
                                                                        style:UIBarButtonItemStylePlain
                                                                       target:self
                                                                       action:@selector(takePhoto:)];
    toolbar.items = @[takePhotoButton];
    [self.view addSubview:toolbar];
     */
    
    // プレビュー用のビューを生成
    self.previewView = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                                /*toolbar.frame.size.height*/ 0,
                                                                self.view.bounds.size.width,
                                                                self.view.bounds.size.height /* - toolbar.frame.size.height */ )] ;
    [self.view addSubview:self.previewView] ;
    
    // 撮影開始
    [self setupAVCapture] ;
}


- (void)setupAVCapture
{
    NSError *error = nil ;
    
    /* 参考にしたページ
     http://dev.classmethod.jp/smartphone/ios-camera-intro/
     http://tomoyaonishi.hatenablog.jp/entry/2014/06/29/024010
     http://d.hatena.ne.jp/wwwcfe/20130924/ios7_sdk_qr_ean13
     */
    // AVCaptureSession による入力と出力の管理を開始
    self.session = [[AVCaptureSession alloc] init] ;
    // 背面カメラを取得する
    AVCaptureDevice *camera = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo] ;
    
    // カメラからの入力を作成し、セッションに追加
    self.videoInput = [[AVCaptureDeviceInput alloc] initWithDevice:camera error:&error] ;
    [self.session addInput:self.videoInput] ;
    
    // 画像への出力を作成し、セッションに追加
    self.stillImageOutput = [[AVCaptureStillImageOutput alloc] init] ;
    [self.session addOutput:self.stillImageOutput] ;
    
    
    // キャプチャーセッションから入力のプレビュー表示を作成
    AVCaptureVideoPreviewLayer *captureVideoPreviewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:self.session] ;
    captureVideoPreviewLayer.frame = self.view.bounds ;
    captureVideoPreviewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill ;
    
    // レイヤーをViewに設定
    CALayer *previewLayer = self.previewView.layer ;
    previewLayer.masksToBounds = YES ;
    [previewLayer addSublayer:captureVideoPreviewLayer] ;
    
    /* 以下、QR コードの読み取り処理 */
    // 毎フレームの metaOutput を dispatch（送信） する
    AVCaptureMetadataOutput *metaOutput = [[AVCaptureMetadataOutput alloc] init];
    [ metaOutput setMetadataObjectsDelegate:self queue:dispatch_get_main_queue() ] ;
    [self.session addOutput:metaOutput] ;
    
    metaOutput.metadataObjectTypes = [metaOutput availableMetadataObjectTypes] ; // 右辺が metaOutput.availableMetadataObjectTypes だと、何も返さないので注意
    
    NSLog(@"%@", metaOutput.availableMetadataObjectTypes ) ;
    // セッション開始
    [self.session startRunning] ;
}

/* QR データを認識した時に処理する内容 */
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    for(AVMetadataObject *metadata in metadataObjects)
    {
        if([metadata.type isEqualToString:AVMetadataObjectTypeQRCode])
        {
            NSLog(@"☆ QR を認識しました") ;
            // 複数の QR があっても 1度で読み取れている
            NSString *qrcode = [(AVMetadataMachineReadableCodeObject *)metadata stringValue] ;
            NSLog(@"中身 : %@", qrcode) ;
        }
        /*
        else if ([metadata.type isEqualToString:AVMetadataObjectTypeEAN13Code]) {
            NSString *ean13 = [(AVMetadataMachineReadableCodeObject *)metadata stringValue];
            NSLog(@"中身 : %@", ean13);
        }
         */
        else
        {
            NSLog(@"QR 以外のコードを認識しました") ;
            continue ;
            /*
             // 自分の連絡先のQRを読み取ろうとしたら、謎に落ちたので一旦やめる
            NSString *barcode = [(AVMetadataMachineReadableCodeObject *)metadata stringValue] ;
            NSLog(@"中身 : %@", barcode) ;
             */
        }
    }
}

/* 「撮影」を押した時、カメラに入ってくる映像を takePhoto 実行時に1フレーム取得し、処理する
- (void)takePhoto:(id)sender
{
    // ビデオ入力のAVCaptureConnectionを取得
    AVCaptureConnection *videoConnection = [self.stillImageOutput connectionWithMediaType:AVMediaTypeVideo];
    
    if (videoConnection == nil) {
        return;
    }
    
    // ビデオ入力から画像を非同期で取得。ブロックで定義されている処理が呼び出され、画像データを引数から取得する
    [self.stillImageOutput
     captureStillImageAsynchronouslyFromConnection:videoConnection
     completionHandler:^(CMSampleBufferRef imageDataSampleBuffer, NSError *error) {
         if (imageDataSampleBuffer == NULL) {
             return;
         }
         
         // 入力された画像データからJPEGフォーマットとしてデータを取得
         NSData *imageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
         
         // JPEGデータからUIImageを作成
         UIImage *image = [[UIImage alloc] initWithData:imageData];
         
         // アルバムに画像を保存
         UIImageWriteToSavedPhotosAlbum(image, self, nil, nil);
     }] ;
}
*/
 
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
