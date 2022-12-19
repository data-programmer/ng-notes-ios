//
// UserModel.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation

public struct UserModel: Codable, Identifiable, Equatable {

    public var id: Int?
    public var username: String?
    public var password: String?
    public var firstName: String?
    public var lastName: String?

    public init(id: Int? = nil, username: String? = nil, password: String? = nil, firstName: String? = nil, lastName: String? = nil) {
        self.id = id
        self.username = username
        self.password = password
        self.firstName = firstName
        self.lastName = lastName
    }

    public enum CodingKeys: String, CodingKey { 
        case id = "id"
        case username
        case password
        case firstName
        case lastName
    }

}