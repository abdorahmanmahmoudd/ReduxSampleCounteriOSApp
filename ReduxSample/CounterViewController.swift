//
//  ViewController.swift
//  ReduxSample
//
//  Created by Abdorahman Youssef on 6/2/19.
//  Copyright © 2019 abdelrahman. All rights reserved.
//

import UIKit

class CounterViewController: UIViewController, StoreSubscriber {
    
    @IBOutlet var counterLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        store.subscribe(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        store.subscribers.removeAll()
    }

    @IBAction func decreaseButtonClicked(_ sender: UIButton) {
        let decreaseAction = DecreaseAction.init(decreaseBy: 1)
        store.dispath(action: decreaseAction)
    }
    
    @IBAction func increaseButtonClicked(_ sender: UIButton) {
        let increaseAction = IncreaseAction.init(increaseBy: 1)
        store.dispath(action: increaseAction)
    }
    
    func newState(state: State) {
        counterLabel.text = "\((state as? AppState)?.counter ?? 0)"
    }
    
}

