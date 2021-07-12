//
//  ClientAndServerTests.swift
//  StopHoldingCyclesTests
//
//  Created by MesaMobileThinking on 12/07/21.
//

import XCTest
@testable import StopHoldingCycles

final class ClientAndServerTests: XCTestCase {
  
  func testContentLeak() {
    
    let server: Server = Server(name: "ClientAndServerTests")
    let client: Client = Client(server: server)
    
    XCTAssertEqual(client.server.name, "ClientAndServerTests")
    
    addTeardownBlock { [weak server, weak client] in
      XCTAssertNil(server, "`server` should have been deallocated. Potential memory leak!")
      XCTAssertNil(client, "`client` should have been deallocated. Potential memory leak!")
    }
  }
}
