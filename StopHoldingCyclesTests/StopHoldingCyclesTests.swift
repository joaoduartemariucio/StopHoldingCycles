//
//  StopHoldingCyclesTests.swift
//  StopHoldingCyclesTests
//
//  Created by MesaMobileThinking on 10/07/21.
//

import XCTest
@testable import StopHoldingCycles

final class ClientAndServerTrackTests: XCTestCase {
  
  func testClientNameCorrect() {
    
    let (client, _) = makeSUT()
    
    XCTAssertEqual(client.server.name, "ClientAndServerTrackTests")
  }
  
  private func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> (Client, Server) {
    let server: Server = Server(name: "ClientAndServerTrackTests")
    let client: Client = Client(server: server)
    
    trackForMemoryLeaks(server, file: file, line: line)
    trackForMemoryLeaks(client, file: file, line: line)
    return (client, server)
  }
}

extension XCTestCase {
  func trackForMemoryLeaks(_ instance: AnyObject, file: StaticString = #filePath, line: UInt = #line) {
    addTeardownBlock { [weak instance] in
      XCTAssertNil(instance, "Instance should have been deallocated. Potential memory leak!", file: file, line: line)
    }
  }
}
