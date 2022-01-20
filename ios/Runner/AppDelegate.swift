import UIKit
import Flutter

// TODO: Import google_mobile_ads
import google_mobile_ads

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    // TODO: Register ListTileNativeAdFactory
    let listTileFactory = ListTileNativeAdFactory()
    FLTGoogleMobileAdsPlugin.registerNativeAdFactory(
        self, factoryId: "adFactoryExample", nativeAdFactory: listTileFactory)

      GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = [ "380e74826d4abe7c0e0a397e30e528cf" ]

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
