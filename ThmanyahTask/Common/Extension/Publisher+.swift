//
//  File.swift
//  ThmanyahTask
//
//  Created by Ahmed Naguib  on 23/08/2025.
//

import Combine

extension Publisher {
    func sinkFailureOrValue(
        receiveFailure: @escaping (Self.Failure) -> Void,
        receiveValue: @escaping (Self.Output) -> Void
    ) -> AnyCancellable {
        sink(
            receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    receiveFailure(error)
                }
            },
            receiveValue: receiveValue
        )
    }
}
