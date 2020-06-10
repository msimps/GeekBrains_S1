//
//  GameViewController.swift
//  8l_MoruginSergei
//
//  Created by Matthew on 09.06.2020.
//  Copyright © 2020 Ostagram Inc. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createScene()
    }
    
    func createScene(){
        // создаем экземпляр сцены
        let scene = GameScene(size: view.bounds.size, gameEventsDelegate: self)
        // получаем главную область экрана
        let skView = view as! SKView
        // включаем отображение fps (количество кадров в секунду)
        skView.showsFPS = true
        // показывать количество объектов на экране
        skView.showsNodeCount = true
        // включаем произвольный порядок рендеринга объектов в узле
        skView.ignoresSiblingOrder = true
        // режим отображения сцены, растягивается на все доступное пространство
        scene.scaleMode = .resizeFill
        // добавляем сцену на экран
        skView.presentScene(scene)
    }
    

    
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}

extension GameViewController: GameEvents{
    func endGame() {
        let alert = UIAlertController(title: ":(", message: "You lost this WAR.", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Oky", style: .default) {(alert) in
            self.createScene()
        })

        self.present(alert, animated: true)
        
    }
}
