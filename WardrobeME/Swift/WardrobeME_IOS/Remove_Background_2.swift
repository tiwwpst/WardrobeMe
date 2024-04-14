//
//  Remove_Background_2.swift
//  WardrobeME
//
//  Created by Maxim Sukhoparov on 20.10.2021.
//

private func getDeepLabV3Model() -> DeepLabV3? {
    do {
        let config = MLModelConfiguration()
        return try DeepLabV3(configuration: config)
    } catch {
        print("Error loading model: \(error)")
        return nil
    }
}
