//
//  MarvelRequest.swift
//  HathwayAssignment
//
//  Created by Vidya Sravani on 7/15/21.
//

import Foundation
import Alamofire

enum MarvelRequest: Request {
    case characterList(_ offset: Int)
    case comics(_ characterId: Int)

    var path: String {
        switch self {
        case .characterList:
            return "/v1/public/characters"
        case .comics(let characterId):
            return "/v1/public/characters/\(characterId)/comics"
        }
    }

    var parameters: Parameters {
        var parameter: Parameters = [:]

        let timestamp = Date().timestamp
        parameter["ts"] = timestamp
        parameter["apikey"] = MarvelAPIConstants.publicKey
        parameter["hash"] = (timestamp + MarvelAPIConstants.privateKey + MarvelAPIConstants.publicKey).md5

        switch self {
        case let .characterList(offset):
            parameter["orderBy"] = "name"
            parameter["limit"] = MarvelAPIConstants.responseLimit
            parameter["offset"] = offset
        default:
            parameter["limit"] = MarvelAPIConstants.maxResponseLimit
        }

        return parameter
    }

    var method: HTTPMethod {
        switch self {
        case .characterList, .comics:
            return .get
        }
    }

    var encoding: ParameterEncoding {
        switch self {
        case .characterList, .comics:
            return URLEncoding.default
        }
    }

    
}

