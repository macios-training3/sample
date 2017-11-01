//
//  ViewController.swift
//  neko
//
//  Created by user on 2017/07/02.
//  Copyright © 2017年 Swift-Study. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  //ネコ
  let cat1Path = Bundle.main.bundleURL.appendingPathComponent("cat-cry1.mp3")
  let cat2Path = Bundle.main.bundleURL.appendingPathComponent("cat-cry2.mp3")
  let cat3Path = Bundle.main.bundleURL.appendingPathComponent("cat-cry3.mp3")
  let cat4Path = Bundle.main.bundleURL.appendingPathComponent("cat-threat1.mp3")
  var catCry  = AVAudioPlayer()
    
    
    
  var catCount:UInt32 = 1
  //ヒヨコ
  let piyoPath = Bundle.main.bundleURL.appendingPathComponent("chick-cry1.mp3")
  var piyoCry = AVAudioPlayer()

  @IBAction func cat(_ sender: Any) {
    if catCount > 7 {
      animalPlayer(&catCry, path: cat4Path, count: 0)
    } else if catCount % 5 == 0 {
      animalPlayer(&catCry, path: cat3Path, count: 0)
    } else if catCount % 3 == 0 {
      animalPlayer(&catCry, path: cat2Path, count: 0)
    } else {
      animalPlayer(&catCry, path: cat1Path, count: 0)
    }
    catCount = catCount + 1
  }
  @IBAction func piyo(_ sender: Any) {
    animalPlayer(&piyoCry, path: piyoPath, count: 0)
    catCount = 1
  }
  
  fileprivate func animalPlayer(_ player:inout AVAudioPlayer, path: URL, count: Int) {
    do {
      player = try AVAudioPlayer(contentsOf: path, fileTypeHint: nil)
      player.numberOfLoops = count
      player.play()
    } catch {
      print("エラーが発生しました")
    }
  }
}

