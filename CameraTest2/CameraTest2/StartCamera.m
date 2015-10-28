//
//  StartCamera.m
//  CameraTest2
//
//  Created by Yokoe on 10/28/15.
//  Copyright © 2015 Hatonekoe. All rights reserved.
//

#import "StartCamera.h"

@implementation StartCamera

@synthesize imagePicker ;
@synthesize mainCameraView ;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self takePicture] ;
}

#pragma mark Camera

/* カメラを起動 */
- (BOOL)takePicture
{
    @autoreleasepool
    {
        /* カメラを利用できるかどうかチェックする */
        if( [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] )
        {
            // UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init] ;
            // imagePickerController.delegate = self ;
            imagePicker.delegate = self ; // UIImagePickerControllerDelegate のデリゲートになる
            imagePicker.allowsEditing = NO ; // 撮影後に写真の編集を行わない
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera ; // カメラから画像を取り込む設定にする
            
            [self presentViewController:imagePicker animated:YES completion:nil] ; // カメラから画像を選ぶ
            NSLog(@"カメラが起動されました") ;
            return true ;
        }
        else
        {
            /*
             dispatch_async(
             dispatch_get_main_queue(),
             ^{
             [ [ [UIAlertView alloc] initWithTitle:@"シミュレータではカメラは起動できません"
             message:@"撮影できません"
             delegate:nil
             cancelButtonTitle:@"OK"
             otherButtonTitles:nil ] show ] ;
             }
             ) ;
             */
            UIAlertView *alert = [ [UIAlertView alloc] initWithTitle:@"エラー"
                                                             message:@"カメラを起動できません"
                                                            delegate:nil
                                                   cancelButtonTitle:@"OK"
                                                   otherButtonTitles:nil ] ;
            [alert show] ;
            NSLog(@"カメラは起動されませんでした") ;
            return false ;
        }
    }
}

/*「キャンセル」された場合のデリゲートメソッド */
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil] ;
}

/*「写真を使用」の場合のデリゲートメソッド */
- (void)imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)image
                  editingInfo:(NSDictionary *)editingInfo
{
    // 「写真を使用」が選択された場合の処理を記述
    // image --> 撮影された画像, editingInfo --> 編集内容
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
