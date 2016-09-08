//
//  DetailViewController.swift
//  MusicPlayer
//
//  Created by Eliseo Fuentes on 9/3/16.
//  Copyright © 2016 Eliseo Fuentes. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var del = UIApplication.sharedApplication().delegate as! AppDelegate
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet weak var detailImage: UIImageView!

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                print("Title")
                print(detail.valueForKey("title")!.description  )
                label.text = detail.valueForKey("title")!.description
            }
            if let image = self.detailImage {
                image.image = UIImage(named: detail.valueForKey("title")!.description+".jpeg")
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let playButton = UIBarButtonItem(barButtonSystemItem: .Play, target: self, action: #selector(play(_:)))

        let pauseButton = UIBarButtonItem(barButtonSystemItem: .Pause, target: self, action: #selector(pause(_:)))
        
        let stopButton = UIBarButtonItem(barButtonSystemItem: .Stop, target: self, action: #selector(stop(_:)))
        self.navigationItem.rightBarButtonItems = [stopButton,pauseButton,playButton]
        self.configureView()
    }
    
    func play(_: NSObject){
        
        if  !del.player.playing{
            del.player.play()
        }
    }
    
    func pause(_: NSObject){
        
        if  del.player.playing{
            del.player.pause()
        }
    }
    
    func stop(_: NSObject){
        if  del.player!.playing{
            del.player.stop()
            del.player.currentTime = 0
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

