//
//  AppState.swift
//  ReduxSample
//
//  Created by Abdorahman Youssef on 6/2/19.
//  Copyright © 2019 abdelrahman. All rights reserved.
//

import Foundation

let store = Store.init(reducer: counterReducer, state: nil)

struct AppState: State{
    var counter: Int = 0
}

struct IncreaseAction: Action{
    let increaseBy: Int
}

struct DecreaseAction: Action{
    let decreaseBy: Int
}


func counterReducer(_ action: Action, _ state: State?) -> State{
    var newState = state as? AppState ?? AppState()
    
    switch action {
    case let action as IncreaseAction:
        newState.counter += action.increaseBy
    case let action as DecreaseAction:
        newState.counter -= action.decreaseBy
    default:
        break
    }
    
    return newState
}
