//
//  SecretsTests.swift
//  SPMTests
//
//  Created by Ellen Shapiro on 4/9/19.
//

import Files
import XCTest
@testable import Core

class SecretsTests: XCTestCase {
    
    private let garbageValue = "SCRIPT_ME"
    
    private lazy var testSourceRoot: Folder = {
        let env = ProcessInfo.processInfo.environment
        guard let testRoot = env["TEST_ROOT"] else {
            fatalError("No test root provided! Please add this to the environment variables for the scheme you are using.")
        }
        
        guard let folder = try? Folder(path: testRoot) else {
            fatalError("Could not make folder from path \(testRoot)")
        }
        
        return folder
    }()
    
    private func tearDownEnvironmentAndValidate() {
        do {
            try EnvironmentUpdater.reset(sourceRoot: self.testSourceRoot)
            let file = try EnvironmentUpdater.outputFile(in: self.testSourceRoot)
            let dict = try PlistUpdater.loadAsDictionary(file: file)
            EnvironmentUpdater.EnvironmentKey.allCases.forEach { key in
                XCTAssertEqual(dict[key.plistKey], self.garbageValue)
            }
        } catch {
            XCTFail("Unexpected error resetting environment: \(error)")
        }
    }
    
    private func tearDownFirebaseAndValidate() {
        do {
            try FirebaseUpdater.reset(sourceRoot: self.testSourceRoot)
            let file = try FirebaseUpdater.outputFile(in: self.testSourceRoot)
            let dict = try PlistUpdater.loadAsDictionary(file: file)
            FirebaseUpdater.FirebaseKey.allCases.forEach { key in
                XCTAssertEqual(dict[key.plistKey], self.garbageValue)
            }
        } catch {
            XCTFail("Unexpected error resetting Firebase plist: \(error)")
        }
    }
    
    override func tearDown() {
        self.tearDownFirebaseAndValidate()
        self.tearDownEnvironmentAndValidate()
        
        super.tearDown()
    }
    
    func testFirebaseNotIncludingAllKeysFails() {
        var secrets = [String: String]()
        for (index, key) in FirebaseUpdater.FirebaseKey.allCases.enumerated() {
            secrets[key.jsonKey] = "Test\(index)"
        }
        
        let minusLast = Dictionary(uniqueKeysWithValues: secrets.dropLast())
        
        do {
            try FirebaseUpdater.run(secrets: minusLast, sourceRoot: self.testSourceRoot)
        } catch Secrets.Error.missingSecrets(let keyNames) {
            XCTAssertEqual(keyNames.count, 1)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
    
    func testFirebaseIncludingAllKeysSucceeds() {
        var secrets = [String: String]()
        for (index, key) in FirebaseUpdater.FirebaseKey.allCases.enumerated() {
            secrets[key.jsonKey] = "Test\(index)"
        }
        
        XCTAssertNoThrow(try FirebaseUpdater.run(secrets: secrets, sourceRoot: self.testSourceRoot))
        
        let dict: [String: AnyHashable]
        do {
            let file = try FirebaseUpdater.outputFile(in: self.testSourceRoot)
            dict = try PlistUpdater.loadAsDictionary(file: file)
        } catch {
            XCTFail("Error loading firebase plist: \(error)")
            return
        }
        
        for (index, key) in FirebaseUpdater.FirebaseKey.allCases.enumerated() {
            guard let storedValue = dict[key.plistKey] else {
                XCTFail("Couldn't access updated value for plist key \(key.plistKey)")
                return
            }
            
            let expected = "Test\(index)"
            XCTAssertEqual(storedValue,
                           expected,
                           "Incorrect value for \(key.plistKey) - expected \(expected), got \(storedValue)")
        }
    }
    
    func testEnvironmentNotIncludingAllKeysFails() {
        var secrets = [String: String]()
        for (index, key) in EnvironmentUpdater.EnvironmentKey.allCases.enumerated() {
            secrets[key.jsonKey] = "Test\(index)"
        }
        
        let minusLast = Dictionary(uniqueKeysWithValues: secrets.dropLast())
        
        do {
            try EnvironmentUpdater.run(secrets: minusLast, sourceRoot: self.testSourceRoot)
        } catch Secrets.Error.missingSecrets(let keyNames) {
            XCTAssertEqual(keyNames.count, 1)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
    
    func testEnvironmentIncludingAllKeysSucceeds() {
        var secrets = [String: String]()
        for (index, key) in EnvironmentUpdater.EnvironmentKey.allCases.enumerated() {
            secrets[key.jsonKey] = "Test\(index)"
        }
        
        XCTAssertNoThrow(try EnvironmentUpdater.run(secrets: secrets, sourceRoot: self.testSourceRoot))
        
        let dict: [String: AnyHashable]
        do {
            let file = try EnvironmentUpdater.outputFile(in: self.testSourceRoot)
            dict = try PlistUpdater.loadAsDictionary(file: file)
        } catch {
            XCTFail("Error loading environment plist: \(error)")
            return
        }
        
        for (index, key) in EnvironmentUpdater.EnvironmentKey.allCases.enumerated() {
            guard let storedValue = dict[key.plistKey] else {
                XCTFail("Couldn't access updated value for plist key \(key.plistKey)")
                return
            }
            
            let expected = "Test\(index)"
            XCTAssertEqual(storedValue,
                           expected,
                           "Incorrect value for \(key.plistKey) - expected \(expected), got \(storedValue)")
        }
    }

}
