//
//  ViewController.swift
//  vision-app-dev
//
//  Created by Xavier Maximin on 06/08/2017.
//  Copyright © 2017 Xavier Maximin. All rights reserved.
//

import UIKit
import AVFoundation

class CameraVC: UIViewController {

    // ui elements
    @IBOutlet weak var identificationLbl: UILabel!
    @IBOutlet weak var confidenceLbl: UILabel!
    @IBOutlet weak var captureImageView: UIImageView!
    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var flashOffButton: UIButton!
    
    
    // camera
    var captureSession: AVCaptureSession!
    var cameraOutput: AVCapturePhotoOutput!
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // so the preview layer fit inside the cameraView
        previewLayer.frame = cameraView.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        captureSession = AVCaptureSession()
        captureSession.sessionPreset = AVCaptureSession.Preset.hd1920x1080
        
        // create a constant that will be the back camera the default camera
        let backCamera = AVCaptureDevice.default(for: AVMediaType.video)
    
        
        do {
            
            let input = try AVCaptureDeviceInput(device: backCamera!)
            if captureSession.canAddInput(input) == true {
                captureSession.addInput(input)
            }
            
            cameraOutput = AVCapturePhotoOutput()
            
            if captureSession.canAddOutput(cameraOutput) == true {
                captureSession.canAddOutput(cameraOutput!)
                
                
                previewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
                previewLayer.videoGravity = AVLayerVideoGravity.resizeAspect
                previewLayer.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
            
                
                cameraView.layer.addSublayer(previewLayer)
                
                captureSession.startRunning()
            }
            
            
            
        } catch {
            debugPrint(error)
        }
        
        
        
        
    }

    
    
    
    

}

