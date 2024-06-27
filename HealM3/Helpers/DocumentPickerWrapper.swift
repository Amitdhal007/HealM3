//
//  DocumentPickerWrapper.swift
//  HealM3
//
//  Created by Amit Kumar Dhal on 26/06/24.
//


import SwiftUI
import UniformTypeIdentifiers
import UIKit

struct DocumentPickerWrapper: UIViewControllerRepresentable {
    var didPickDocuments: ([URL]) -> Void
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(didPickDocuments: didPickDocuments)
    }
    
    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        let controller = UIDocumentPickerViewController(forOpeningContentTypes: [UTType.audio])
        controller.allowsMultipleSelection = false
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {
        // No update necessary
    }
    
    class Coordinator: NSObject, UIDocumentPickerDelegate {
        var didPickDocuments: ([URL]) -> Void
        
        init(didPickDocuments: @escaping ([URL]) -> Void) {
            self.didPickDocuments = didPickDocuments
        }
        
        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            guard let url = urls.first else {
                didPickDocuments([])
                return
            }
            // Start accessing the security-scoped resource
            _ = url.startAccessingSecurityScopedResource()
            didPickDocuments(urls)
            // Stop accessing the security-scoped resource when done
            url.stopAccessingSecurityScopedResource()
        }
        
        func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
            didPickDocuments([])
        }
    }
}
