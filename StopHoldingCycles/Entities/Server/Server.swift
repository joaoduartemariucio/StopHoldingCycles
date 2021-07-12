//
//  Server.swift
//  StopHoldingCycles
//
//  Created by MesaMobileThinking on 12/07/21.
//

import Foundation

class Server {
  var name: String
  var clients: [Client]
  
  init(name: String) {
    self.name = name
    self.clients = [Client]()
  }
  
  deinit {
    debugPrint("DEINIT: \(self)")
  }
  
  func add(client: Client) {
    self.clients.append(client)
  }
}

class Client {
  var server: Server
  
  init (server: Server) {
    self.server = server
    
    self.server.add(client: self)
  }
  
  deinit {
    debugPrint("DEINIT: \(self)")
  }
}
