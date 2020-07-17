//
//  ViewController.swift
//  Drawing
//
//  Created by Danish Khan on 17/07/20.
//  Copyright © 2020 Danish Khan. All rights reserved.
//

import UIKit
import PencilKit

class ViewController: UIViewController {

    @IBOutlet weak var canvasView: PKCanvasView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupCanvasView()
        
    }
    
    private func setupCanvasView() {
        if let window = view.window, let toolPicker = PKToolPicker.shared(for: window) {
            toolPicker.setVisible(true, forFirstResponder: canvasView)
            toolPicker.addObserver(canvasView)
            canvasView.becomeFirstResponder()
        }
    }
    

    @IBAction func clearButtonTapped(_ sender: UIBarButtonItem) {
        canvasView.drawing = PKDrawing()
        
    }
    
    @IBAction func imageButtonTapped(_ sender: UIBarButtonItem) {
        
        let imageVC = self.storyboard?.instantiateViewController(withIdentifier: "ImageViewController") as? ImageViewController
        
        let imgs = UIGraphicsImageRenderer(bounds: canvasView.bounds).image { _ in
            view.drawHierarchy(in: canvasView.bounds, afterScreenUpdates: true)
        }
        imageVC?.img = imgs
        self.navigationController?.pushViewController(imageVC!, animated: true)
        
    }
    
    
    
    
}

