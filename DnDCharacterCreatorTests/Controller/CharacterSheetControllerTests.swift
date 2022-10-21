//
//  CharacterSheetControllerTests.swift
//  D&D-CharacterCreatorTests
//
//  Created by Cicero Nascimento on 21/10/22.
//

import XCTest
import UIKit

@testable import DnDCharacterCreator

final class CharacterSheetControllerTests: XCTestCase {

    var sut: CharacterSheetController!

    override func setUp() {
        sut = CharacterSheetController()
    }

    override func tearDown() {
        sut = nil
    }

    func test_init_shouldBeNotNil() {
        XCTAssertNotNil(sut)
    }

    func test_viewDidLoad_shouldSetTableViewDataSource() {
        sut.viewDidLoad()

        let tableView = sut.tableView

        let capuredNumberOfRows = tableView.dataSource?.tableView(tableView, numberOfRowsInSection: 0)
        let expectedNumberORows = 2

        XCTAssertEqual(capuredNumberOfRows, expectedNumberORows)
    }

    func test_saveCoreData_shouldSaveCoreData() {
        sut.saveCoreData()

        
    }
}
