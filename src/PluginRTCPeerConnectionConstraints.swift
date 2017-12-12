import Foundation


class PluginRTCPeerConnectionConstraints {
	fileprivate var constraints: RTCMediaConstraints


	init(pcConstraints: NSDictionary?) {
		NSLog("PluginRTCPeerConnectionConstraints#init()")

		if pcConstraints == nil {
			self.constraints = RTCMediaConstraints()
			return
		}

		var	offerToReceiveAudio = pcConstraints?.object(forKey: "offerToReceiveAudio") as? Bool
		var	offerToReceiveVideo = pcConstraints?.object(forKey: "offerToReceiveVideo") as? Bool

		if offerToReceiveAudio == nil && offerToReceiveVideo == nil {
			self.constraints = RTCMediaConstraints()
			return
		}

		if optionalConstraints != nil {
 			for (key, value) in optionalConstraints! {
 				var finalValue: String;
 				if value is Bool {
 					finalValue = value as! Bool ? "true" : "false"
 				} else {
 					finalValue = value as! String
 				}
 				optionalPairArray.append(RTCPair(key: key as! String, value: finalValue))
 			}
		}

		self.constraints = RTCMediaConstraints(
			mandatoryConstraints: mandatoryPairArray,
 			optionalConstraints: optionalPairArray
		)
	}


	deinit {
		NSLog("PluginRTCPeerConnectionConstraints#deinit()")
	}


	func getConstraints() -> RTCMediaConstraints {
		NSLog("PluginRTCPeerConnectionConstraints#getConstraints()")

		return self.constraints
	}
}
