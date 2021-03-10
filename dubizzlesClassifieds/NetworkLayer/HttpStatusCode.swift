//
//  HttpStatusCode.swift
//  DubizzlesClassifieds
//
//  Created Shahzaib Iqbal Bhatti onon 8/3/2021.
//

import Foundation

enum HttpStatusCode {
    case success, unauthorized, forbidden, validation, failure, serverError, unknown
}

extension Int {
    var status: HttpStatusCode {
        switch self {
        case 200:
            return .success
        case 401:
            return .unauthorized
        case 403:
            return .forbidden
        case 422:
            return .validation
        case 400...499:
            return .failure
        case 500...599:
            return .serverError
        default:
            return .unknown
        }
    }
}
