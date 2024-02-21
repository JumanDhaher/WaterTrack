//
//  WatchToIosConnector.swift
//  Hydrate Watch App
//
//  Created by Juman Dhaher on 11/08/1445 AH.
//

import Foundation
import WatchConnectivity

class WatchToIOSConnecter: NSObject, WCSessionDelegate, ObservableObject{
    var session: WCSession
    init(session: WCSession = .default) {
        self.session = session
        super.init()
        session.delegate = self
        session.activate()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sendCountWaterToIOS(litters: Double){
        if(session.isReachable){
            let data: [String: Any] = ["litters": litters]
            session.sendMessage(data, replyHandler: nil)

        }else{
            print("Error")
        }
    }
    
}
