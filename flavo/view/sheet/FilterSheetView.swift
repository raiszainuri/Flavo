//
//  FilterSheetView.swift
//  myFirstApp
//
//  Created by ais on 08/04/25.
//

import SwiftUI

struct FilterSheetView: View {
    let viewModel: BoothViewModel
    var onDone: () -> Void

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        let allTags = viewModel.getAllTags()

        NavigationView {
            List {
                ForEach(allTags, id: \.self) { tag in
                    TagToggleRow(
                        title: tag,
                        includeTags: Binding(
                            get: { viewModel.selectedIncludeTags },
                            set: { viewModel.selectedIncludeTags = $0 }
                        ),
                        excludeTags: Binding(
                            get: { viewModel.selectedExcludeTags },
                            set: { viewModel.selectedExcludeTags = $0 }
                        )
                    )
                }
            }
            .navigationTitle("Filter Tags")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        onDone()
                        dismiss()
                    }
                }
            }
        }
    }
}

struct TagToggleRow: View {
    let title: String
    @Binding var includeTags: Set<String>
    @Binding var excludeTags: Set<String>
    
    private var tagStatus: TagStatus {
        if includeTags.contains(title) {
            return .included
        } else if excludeTags.contains(title) {
            return .excluded
        } else {
            return .none
        }
    }
    
    var body: some View {
        HStack {
            Text(title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(10)
        }
        .background(tagStatus.color)
        .cornerRadius(8)
        .contentShape(Rectangle()) // agar bisa tap seluruh baris
        .onTapGesture {
            cycleTagStatus()
        }
    }
    
    private func cycleTagStatus() {
        switch tagStatus {
        case .none:
            includeTags.insert(title)
        case .included:
            includeTags.remove(title)
            excludeTags.insert(title)
        case .excluded:
            excludeTags.remove(title)
        }
    }
}

enum TagStatus {
    case included
    case excluded
    case none

    var color: Color {
        switch self {
        case .included:
            return Color.green.opacity(0.2)
        case .excluded:
            return Color.red.opacity(0.2)
        case .none:
            return Color.clear
        }
    }
}
