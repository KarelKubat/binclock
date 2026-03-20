import SwiftUI

struct BinClockView: View {
    @StateObject private var viewModel = BinaryClockViewModel()

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        VStack(spacing: 12) {
            // Header row: 32, 16, 8, 4, 2, 1
            HStack(spacing: 12) {
                HStack(spacing: 8) {
                    ForEach([32, 16, 8, 4, 2, 1], id: \.self) { unit in
                        Text("\(unit)")
                            .font(.system(size: 14, weight: .bold, design: .monospaced))
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.secondary)
                    }
                }
                // Spacer to align with the decimal column (width 30)
                Color.clear.frame(width: 30)
            }

            Divider()

            // Time Rows
            VStack(spacing: 8) {
                HStack(spacing: 12) {
                    BitRow(bits: viewModel.hoursBits, color: .blue)
                    Text(String(format: "%02d", viewModel.hours))
                        .font(.system(size: 18, weight: .bold, design: .monospaced))
                        .foregroundColor(.blue)
                        .frame(width: 30, alignment: .trailing)
                }
                
                HStack(spacing: 12) {
                    BitRow(bits: viewModel.minutesBits, color: .green)
                    Text(String(format: "%02d", viewModel.minutes))
                        .font(.system(size: 18, weight: .bold, design: .monospaced))
                        .foregroundColor(.green)
                        .frame(width: 30, alignment: .trailing)
                }

                HStack(spacing: 12) {
                    BitRow(bits: viewModel.secondsBits, color: .orange)
                    Text(String(format: "%02d", viewModel.seconds))
                        .font(.system(size: 18, weight: .bold, design: .monospaced))
                        .foregroundColor(.orange)
                        .frame(width: 30, alignment: .trailing)
                }
            }
        }
        .padding()
    }
}

struct BitRow: View {
    let bits: [Bool]
    let color: Color

    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<bits.count, id: \.self) { index in
                BitCell(isOn: bits[index], color: color)
            }
        }
    }
}

struct BitCell: View {
    let isOn: Bool
    let color: Color

    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(isOn ? color : Color.gray.opacity(0.15))
            .frame(height: 40)
            .overlay(
                Text(isOn ? "1" : "")
                    .font(.system(size: 16, weight: .bold, design: .monospaced))
                    .foregroundColor(.white)
            )
            .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value: isOn)
            .frame(maxWidth: .infinity)
    }
}
