//
//  Results.swift
//  DubizzlesClassifieds
//
//  Created Shahzaib Iqbal Bhatti onon 8/3/2021.
//

import Foundation

public struct Results<T> {
    
    public let successResponse: T?
    public let failureResponse: Error?

    init(success: T) {
        successResponse = success
        failureResponse = nil
    }

    init(failure: Error) {
        successResponse = nil
        failureResponse = failure
    }
}
