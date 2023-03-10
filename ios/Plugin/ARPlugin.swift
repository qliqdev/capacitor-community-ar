import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(ARPlugin)
public class ARPlugin: CAPPlugin {
    private var implementation: AR? = nil
    
    override public func load() {
        self.implementation = AR(bridge: self.bridge!)
    }

    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": implementation!.echo(value)
        ])
    }
    
    @objc func start(_ call: CAPPluginCall) {
        call.resolve([
            "started": implementation!.start(call)
        ])
    }
}
