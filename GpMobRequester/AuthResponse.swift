//
//  AuthResponse.swift
//  GpMobRequester
//
//  Created by Anderson Fernandes on 18/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation
import Retrofire
import SwiftyJSON

struct AuthResponse: Retrofire.Mappable {
    private let idToken: String?

    func getIdToken() -> String? {
        return idToken
    }

    public static func instanceBy<M>(json: JSON) -> M {
        let idToken = json.dictionary?[APIField.idToken]?.stringValue

        return AuthResponse(idToken: idToken) as! M
    }

    private struct APIField {
        static let idToken   = "id_token"
    }

}
