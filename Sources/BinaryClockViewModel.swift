import Foundation
import Combine

class BinaryClockViewModel: ObservableObject {
    @Published var time: Date = Date()
    private var timer: AnyCancellable?

    init() {
        self.timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] date in
                self?.time = date
            }
    }

    var hours: Int {
        Calendar.current.component(.hour, from: time)
    }

    var minutes: Int {
        Calendar.current.component(.minute, from: time)
    }

    var seconds: Int {
        Calendar.current.component(.second, from: time)
    }

    var hoursBits: [Bool] {
        intToBits(hours)
    }

    var minutesBits: [Bool] {
        intToBits(minutes)
    }

    var secondsBits: [Bool] {
        intToBits(seconds)
    }

    private func intToBits(_ value: Int) -> [Bool] {
        let bits = [32, 16, 8, 4, 2, 1]
        return bits.map { (value & $0) != 0 }
    }
}
