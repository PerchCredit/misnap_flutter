import Flutter
import UIKit
import MiSnap
import MiSnapUX

public class SwiftMisnapFlutterPlugin: NSObject, FlutterPlugin {
    
    private var result: FlutterResult?
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "misnap_flutter", binaryMessenger: registrar.messenger())
        let instance = SwiftMisnapFlutterPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
        
        MiSnapLicenseManager.shared().setLicenseKey("your-license-key-here")
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        
        self.result = result
        switch call.method {
        case "check_back":
            let configuration = MiSnapConfiguration(for: .checkBack)
            let misnapVC = MiSnapViewController(with: configuration, delegate: self)
            self.presentMiSnap(misnapVC)
            break
        case "check_front":
            let configuration = MiSnapConfiguration(for: .checkFront)
            let misnapVC = MiSnapViewController(with: configuration, delegate: self)
            self.presentMiSnap(misnapVC)
            break
        case "id_card_back":
            let configuration = MiSnapConfiguration(for: .idBack)
            let misnapVC = MiSnapViewController(with: configuration, delegate: self)
            self.presentMiSnap(misnapVC)
            break
        case "id_card_front":
            let configuration = MiSnapConfiguration(for: .idFront)
            let misnapVC = MiSnapViewController(with: configuration, delegate: self)
            self.presentMiSnap(misnapVC)
            break
        case "passport":
            let configuration = MiSnapConfiguration(for: .passport)
            let misnapVC = MiSnapViewController(with: configuration, delegate: self)
            self.presentMiSnap(misnapVC)
            break
        default:
            let configuration = MiSnapConfiguration(for: .generic)
            let misnapVC = MiSnapViewController(with: configuration, delegate: self)
            self.presentMiSnap(misnapVC)
            break
        }
    }
        
    private func presentMiSnap(_ misnap: MiSnapViewController?) {
        guard let misnap = misnap else { return }
        
        misnap.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        misnap.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        
        let viewController = UIApplication.shared.windows.last?.rootViewController
        
        // Check diskspace
        let minDiskSpace: Int = 20
        if freeDiskSpaceInBytes < minDiskSpace {
            self.presentAlert(withTitle: "Not Enough Space", message: "Please, delete old/unused files to have at least \(minDiskSpace) MB of free space", viewController: viewController)
            return
        }
        
        // Check camera permission
        let cameraAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: .video)
        switch cameraAuthorizationStatus {
            case .notDetermined:
                AVCaptureDevice.requestAccess(for: .video, completionHandler: {accessGranted in
                    guard accessGranted == true else { return }
                    DispatchQueue.main.async {
                        viewController?.present(misnap, animated: true)
                    }
                })
                break
            case .authorized:
                viewController?.present(misnap, animated: true)
                break
            case .restricted, .denied:
                alertCameraAccessNeeded(viewController: viewController)
                break
            default:
                break
        }
    }
    
    //MARK: Get Disk Space
    
    /*
     Total available capacity in bytes for "Important" resources, including space expected to be cleared by purging non-essential and cached resources. "Important" means something that the user or application clearly expects to be present on the local system, but is ultimately replaceable. This would include items that the user has explicitly requested via the UI, and resources that an application requires in order to provide functionality.
     Examples: A video that the user has explicitly requested to watch but has not yet finished watching or an audio file that the user has requested to download.
     This value should not be used in determining if there is room for an irreplaceable resource. In the case of irreplaceable resources, always attempt to save the resource regardless of available capacity and handle failure as gracefully as possible.
     */
    var freeDiskSpaceInBytes:Int64 {
        if #available(iOS 11.0, *) {
            if let space = try? URL(fileURLWithPath: NSHomeDirectory() as String).resourceValues(forKeys: [URLResourceKey.volumeAvailableCapacityForImportantUsageKey]).volumeAvailableCapacityForImportantUsage {
                return space
            } else {
                return 0
            }
        } else {
            if let systemAttributes = try? FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory() as String),
            let freeSpace = (systemAttributes[FileAttributeKey.systemFreeSize] as? NSNumber)?.int64Value {
                return freeSpace
            } else {
                return 0
            }
        }
    }
    
    private func alertCameraAccessNeeded(viewController: UIViewController?) {
        let message = "Camera permission is required to capture your documents."
        self.presentPermissionAlert(withTitle: "Camera Permission Denied", message: message, viewController: viewController)
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
//        if status != .valid {
//            self.result?(nil)
//        }
    }
    
    public func miSnapSuccess(_ result: MiSnapResult) {
        // Handle successful session results here
        self.result?(result.image?.jpegData(compressionQuality:0.8))
    }
    
    public func miSnapCancelled(_ result: MiSnapResult) {
        // Handle cancelled session results here
        self.result?(nil)
    }
    
    public func miSnapException(_ exception: NSException) {
        // Handle exception that was caught by the SDK here
        self.result?(nil)
    }
    
}
