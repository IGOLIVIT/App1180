//
//  TrackerViewModel.swift
//  App1180
//
//  Created by IGOR on 06/12/2024.
//

import SwiftUI

final class TrackerViewModel: ObservableObject {

    @Published var days: [String] = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    @Published var curDay: String = ""
    @Published var dayForAdd: String = ""

    @Published var speed: String = String(format: "%.f", Double(.random(in: 1...100)))
    @Published var flex: String = String(format: "%.f", Double(.random(in: 1...100)))

    @Published var stren: String = String(format: "%.f", Double(.random(in: 1...100)))

    @Published var pos: String = String(format: "%.f", Double(.random(in: 1...100)))

    @Published var win: String = String(format: "%.f", Double(.random(in: 1...100)))

    @Published var def: String = String(format: "%.f", Double(.random(in: 1...100)))

    @Published var draw: String = String(format: "%.f", Double(.random(in: 1...100)))

}
