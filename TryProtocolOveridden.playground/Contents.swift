import UIKit

protocol AppLifeCycleProtocol {
    func appDidStart()
//    func didBecameActive()
//    func willEnterForeground()
//    func applicationWillTerminate()
}

// Optional methods
extension AppLifeCycleProtocol {
    func didBecameActive() {
        print("\(type(of: self)) \(#function)")
    }
    func willEnterForeground() {
        print("\(type(of: self)) \(#function)")
    }
    func applicationWillTerminate() {
        print("\(type(of: self)) \(#function)")
    }
}


class AppUIConfig: AppLifeCycleProtocol {
    func appDidStart() {
        print("App did start for App UI Config")
    }

    func didBecameActive() {
        print("Active special for ui config")
    }
}

class AppAnalyticsConfig: AppLifeCycleProtocol {
    func appDidStart() {
        print("App did start for App Analytics")
    }
}


let entities: [AppLifeCycleProtocol] = [AppUIConfig(), AppAnalyticsConfig()]
entities.forEach { (e) in
    e.didBecameActive()
}


