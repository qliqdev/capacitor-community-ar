import Foundation
import Capacitor
import ARKit

@objc public class AR: NSObject {
    private let bridge: CAPBridgeProtocol
    private var arView: ARSCNView?

    init(bridge: CAPBridgeProtocol) {
        self.bridge = bridge
    }
    
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
    
    @objc public func start(_ call: CAPPluginCall) -> Bool {
        guard ARWorldTrackingConfiguration.isSupported else {
            return false
        }

        if let sceneData = call.getString("sceneData")?.data(using: .utf8),
           let decodedSceneData = Data(base64Encoded: sceneData),
           let sceneUrl = saveSceneDataToTemporaryFile(decodedSceneData) {
            
            DispatchQueue.main.async {
                self.arView = ARSCNView(frame: self.bridge.viewController?.view.bounds ?? .zero)
                self.bridge.viewController?.view.addSubview(self.arView!)
                let config = ARWorldTrackingConfiguration()
                self.arView?.session.run(config)
                self.placeObject(sceneUrl: sceneUrl)
            }
            
            return true
        } else {
            return false
        }
    }

    func saveSceneDataToTemporaryFile(_ data: Data) -> URL? {
        do {
            let tempDir = URL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true)
            let tempFile = tempDir.appendingPathComponent(UUID().uuidString).appendingPathExtension("scn")
            try data.write(to: tempFile)
            return tempFile
        } catch {
            print("Error saving scene data to temporary file: \(error.localizedDescription)")
            return nil
        }
    }

    func placeObject(sceneUrl: URL) {
        guard let arView = arView else { return }
        
        // Create a new scene
        let scene = try! SCNScene(url: sceneUrl, options: nil)

        // Create a new node
        let node = SCNNode()

        // Add the scene to the node
        for child in scene.rootNode.childNodes {
            node.addChildNode(child)
        }

        if let camera = arView.pointOfView {
            let position = SCNVector3(x: 0, y: 0, z: -0.5)
            node.position = camera.convertPosition(position, to: nil)
            node.eulerAngles = camera.eulerAngles
            arView.scene.rootNode.addChildNode(node)
        }
    }

}
