import Flutter
import UIKit
import MiSnap
import MiSnapUX

public class SwiftMisnapFlutterPlugin: NSObject, FlutterPlugin {
    
  private var misnapVC: MiSnapViewController?

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "misnap_flutter", binaryMessenger: registrar.messenger())
    let instance = SwiftMisnapFlutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "check-back":
        
        let configuration = MiSnapConfiguration(for: .checkBack)
        self.setupMiSnapVC(configuration: configuration)
        result("checkBack")
        
    case "check-front":

        let configuration = MiSnapConfiguration(for: .checkFront)
        self.setupMiSnapVC(configuration: configuration)
        result("checkFront")
        
    case "id-card-back":
        
        let configuration = MiSnapConfiguration(for: .idBack)
        self.setupMiSnapVC(configuration: configuration)
        result("idCardBack")
        
    case "id-card-front":
        
        let configuration = MiSnapConfiguration(for: .idFront)
        self.setupMiSnapVC(configuration: configuration)
        result("idCardFront")

    case "getPlatformVersion":
        
        result("iOS " + UIDevice.current.systemVersion)

    default:
        result(nil)
    }
  }
    
    private func setupMiSnapVC(configuration :MiSnapConfiguration) {
        let misnapVC = MiSnapViewController(with: configuration, delegate: self)
        misnapVC.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        misnapVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen

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
    
    // Note, it will only be sent if `MiSnapLicenseStatus` is anything but `.valid`
    public func miSnapLicenseStatus(_ status: MiSnapLicenseStatus) {
        // Handle a license status here
    }

    public func miSnapSuccess(_ result: MiSnapResult) {
        // Handle successful session results here
    }

    public func miSnapCancelled(_ result: MiSnapResult) {
        // Handle cancelled session results here
    }

    public func miSnapException(_ exception: NSException) {
        // Handle exception that was caught by the SDK here
    }

}
