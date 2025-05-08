//
//  LocalAuthenticator.swift
//  NSAlchemy
//
//  Created by Joshua Root on 5/7/25.
//

import Foundation
import LocalAuthentication

/// An object for easily prompting the user to authenticate with TouchID, Apple Watch proximity or password as a fallback.
@available(macOS 10.15, *)
public struct LocalAuthenticator {
	/// A method to authenticate the user locally with Touch ID, Apple Watch proximity, or password authentication
	/// - Parameter touchIDUseReason: The reason why your app needs to use Touch ID
	/// - Returns: True if the authentication was successful, and false if it wasn't successful
	func authenticate(touchIDUseReason: String) async throws -> Bool {
		let context = LAContext()

		var error: NSError?

		if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
			return try await context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: touchIDUseReason)
		}
		
		if let error = error {
			throw error
		}
		
		return false
	}
	
	/// A method to authenticate the user locally with Touch ID, Apple Watch proximity, or password authentication
	/// - Parameters:
	///   - touchIDUseReason: The reason your app needs to use Touch ID
	///   - completionHandler: An escaping, Sendable closure that gets run when the authentication succeeds or fails.
	func authenticate(touchIDUseReason: String, completionHandler: @escaping @Sendable ((Bool, Error?) -> Void)) throws {
		let context = LAContext()
		
		var error: NSError?
		
		if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
			context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: touchIDUseReason, reply: completionHandler)
		} else {
			if let error = error {
				throw error
			}
		}
	}
	
	/// A method to allow the user to authenticate with Touch ID
	/// - Parameters:
	///   - usageReason: The reason your app requires Touch ID
	/// - Returns: True if the authentication was successful, or false if it fails
	func authenticateWithTouchID(usageReason: String) async throws -> Bool {
		let context = LAContext()
		
		var error: NSError?
		
		if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
			return try await context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: usageReason)
		}
		
		if let error = error {
			throw error
		}
		
		return false
	}
	
	/// A method to allow the user to authenticate with Touch ID
	/// - Parameters:
	///   - usageReason: The reason your app requires Touch ID
	///   - completionHandler: An escaping, Sendable closure that will run when the authentication succeeds or fails
	func authenticateWithTouchID(usageReason: String, completionHandler: @escaping @Sendable ((Bool, Error?) -> Void)) throws {
		let context = LAContext()
		
		var error: NSError?
		
		if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
			context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: usageReason, reply: completionHandler)
		}
		
		if let error = error {
			throw error
		}
	}
}
