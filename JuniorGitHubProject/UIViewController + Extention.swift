//
//  UIViewController + Extention.swift
//  JuniorGitHubProject
//
//  Created by Роман on 04.11.2023.
//

import SwiftUI

extension UIViewController {
    
    private struct  Preview : UIViewControllerRepresentable {
        let viewController: UIViewController
        
        func makeUIViewController(context: Context) -> some UIViewController {
            viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
    
    func showPreview() -> some View {
        Preview(viewController: self).edgesIgnoringSafeArea(.all)
    }
    
}
