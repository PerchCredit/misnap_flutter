import Flutter
import UIKit
import MiSnapSDK
import MiSnapSDKMibiData

public class SwiftMisnapFlutterPlugin: NSObject, FlutterPlugin {
    
    private var misnapVC: MiSnapSDKViewController?

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "misnap_flutter", binaryMessenger: registrar.messenger())
    let instance = SwiftMisnapFlutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "checkBack":
        
        let parameters = NSMutableDictionary.init(dictionary: MiSnapSDKViewController.defaultParametersForCheckBack())
        self.setupMiSnapVC(misnapParams: parameters)
        result("checkBack")
        
    case "checkFront":

        let parameters = NSMutableDictionary.init(dictionary: MiSnapSDKViewController.defaultParametersForCheckFront())
        self.setupMiSnapVC(misnapParams: parameters)
        result("checkFront")
        
    case "idCardBack":
        
        let parameters = NSMutableDictionary.init(dictionary: MiSnapSDKViewController.defaultParametersForIdCardBack())
        self.setupMiSnapVC(misnapParams: parameters)
        result("idCardBack")
        
    case "idCardFront":
        
        let parameters = NSMutableDictionary.init(dictionary: MiSnapSDKViewController.defaultParametersForIdCardFront())
        self.setupMiSnapVC(misnapParams: parameters)
        result("idCardFront")

    default:
        result(nil)
    }
  }
    
    private func setupMiSnapVC(misnapParams :NSDictionary) {
        let misnapVC = MiSnapSDKViewController()
        misnapVC.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        misnapVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        misnapVC.setupMiSnap(withParams: misnapParams as? [AnyHashable : Any])

        let viewController: UIViewController =
            (UIApplication.shared.delegate?.window??.rootViewController)!;

        misnapVC.checkCameraPermission { granted in
            if !granted {
                let message = "Camera permission is required to capture your documents."
                self.presentPermissionAlert(withTitle: "Camera Permission Denied", message: message, viewController: viewController)
                return
            }
            
            DispatchQueue.main.async {
                viewController.present(misnapVC, animated: true)
            }
        }
        
        let minDiskSpace: Int = 20
        if !misnapVC.hasMinDiskSpace(minDiskSpace) {
            self.presentAlert(withTitle: "Not Enough Space", message: "Please, delete old/unused files to have at least \(minDiskSpace) MB of free space", viewController: viewController)
            return
        }
        
        misnapVC.delegate = self
        
        self.misnapVC = misnapVC
    }
    
    private func presentAlert(withTitle title: String?, message: String? = nil, viewController: UIViewController?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(ok)
        
        viewController?.present(alert, animated: true, completion: nil)
    }
    
    private func presentPermissionAlert(withTitle title: String?, message: String?, viewController: UIViewController?) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            let openSettings = UIAlertAction(title: "Open Settings", style: .cancel) { (action) in
                if let url = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }
            alert.addAction(cancel)
            alert.addAction(openSettings)
            
            viewController?.present(alert, animated: true, completion: nil)
        }
    }

}

// MARK: MiSnap Delegate methods
extension SwiftMisnapFlutterPlugin: MiSnapViewControllerDelegate {
    
    public func miSnapFinishedReturningEncodedImage(_ encodedImage: String!, originalImage: UIImage!, andResults results: [AnyHashable : Any]!) {
        
    }
    
    public func miSnapCancelled(withResults results: [AnyHashable : Any]!) {
        self.misnapVC?.dismiss(animated: true)
    }
}
