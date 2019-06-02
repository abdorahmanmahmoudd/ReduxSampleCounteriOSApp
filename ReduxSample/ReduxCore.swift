//
//  SimpleRedux.swift
//  ReduxSample
//
//  Created by Abdorahman Youssef on 6/2/19.
//  Copyright © 2019 abdelrahman. All rights reserved.
//

import Foundation

protocol Action {}

protocol State {}

typealias Reducer = (_ action: Action, _ state: State?) -> State

protocol StoreSubscriber {
    func newState(state: State)
}

class Store {
    let reducer: Reducer
    var state: State?
    var subscribers: [StoreSubscriber] = []
    
    init(reducer: @escaping Reducer, state: State?) {
        self.reducer = reducer
        self.state = state
    }
    
    func dispath(action: Action){
        state = reducer(action, state)
        subscribers.forEach({
            $0.newState(state: state!)
        })
    }
    
    func subscribe(_ newSubscriber: StoreSubscriber){
        subscribers.append(newSubscriber)
    }
}
