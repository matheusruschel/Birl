//
//  ViewController.swift
//  Birl
//
//  Created by Matheus Ruschel on 7/17/16.
//  Copyright © 2016 Matheus Ruschel. All rights reserved.
//

import UIKit
import AVFoundation

let audioCellReuseId = "AudioCell"
class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var documentIteration: UIDocumentInteractionController?
    let audioPlayer = AudioPlayer.sharedInstance
    
    let audioFiles = ["birl","show","que-num-vai-da-pai","bambam","porra_10","13-memo","trapezio-descendente_1","37-anos","iiiiiiuuuuuuuu-bmabma","bambam-enlouquecendo-no-treino-com-felipe-franco-2","trapezio-descendente-e-o-nome","quero-mais-quero-mais", "bam_bam", "eita-porra_1","bambam-_aqui-e-bodybuilding-porra_-360p","bambam-aqui-e-bodybuilding-porra-mp3cut"]
    let audioNames = ["Birl","Hora do show","Que não vai da","Saí de casa, comi pra...","Super sayajin","É 13 po","Trapézio descendente","É 37 anos","Iiiiiiuuuuuuuu","Ta saindo da jaula","Trapézio descendente 2","Quero mais quero mais", "Sai fdp", "Eita porra","Aqui é bodybuilder (Completo)","Aqui é bodybuilder"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func shareFile(name: String) {

        let savePath = NSBundle.mainBundle().pathForResource(name, ofType: "mp3")
        documentIteration = UIDocumentInteractionController(URL: NSURL(fileURLWithPath: savePath!))
        documentIteration?.delegate = self
        documentIteration!.presentOpenInMenuFromRect(self.view.frame, inView: self.view, animated: true)
        
        
    }

}

extension ViewController : UIDocumentInteractionControllerDelegate {
    
}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        audioPlayer.playSound(withName: audioFiles[indexPath.row])
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
         var cell = tableView.dequeueReusableCellWithIdentifier(audioCellReuseId) as? AudioTableViewCell
        
        if cell == nil {
            cell = AudioTableViewCell()
        }
        
        cell!.buttonDelegate = self
        cell!.configure(audioNames[indexPath.row],forRow: indexPath.row)
        
        return cell!
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return audioFiles.count
    }
    
}

extension ViewController : ButtonDelegate {
    
    func shareButtonClicked(forIndex index: Int?, cell: UITableViewCell, sender: UIButton) {
        
        if let index = index {
            shareFile(audioFiles[index])
        }
    }
    
}


