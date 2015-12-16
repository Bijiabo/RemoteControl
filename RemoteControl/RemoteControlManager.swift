//
//  RemoteControlManager.swift
//  RemoteControl
//
//  Created by huchunbo on 15/12/16.
//  Copyright © 2015年 Bijiabo. All rights reserved.
//

import Foundation
import MediaPlayer

infix operator ~~ {}
func ~~ (left: Bool, right: String) {
    if !left {return}
    NSLog(right)
}

public class RemoteControlManager {
    init() {
    }
    
    public var debug: Bool = true
    
    public class var sharedManager : RemoteControlManager {
        struct Static {
            static let sharedInstance : RemoteControlManager = RemoteControlManager()
        }
        
        return Static.sharedInstance
    }
    
    public class masterButtonClass {
        public var click: ()->() = {}
        
        // double
        public var doubleClick: ()->() = {}
        
        public var doubleClickAndKeepBegin: ()->() = {}
        
        public var doubleClickAndKeepEnd: ()->() = {}
        
        // triple
        public var tripleClick: ()->() = {}
        
        public var tripleClickAndKeepBegin: ()->() = {}
        
        public var tripleClickAndKeepEnd: ()->() = {}
    }
    
    public var masterButton: masterButtonClass = masterButtonClass()
    
    public struct playButton {
        static var click: ()->() = {}
    }
    
    public struct pauseButton {
        static var click: ()->() = {}
    }
    
    public struct stopButton {
        static var click: ()->() = {}
    }
    
    public var remoteControlReveivedWithEventHandler = {}
    
    public func remoteControlReceivedWithEvent(event: UIEvent?) {
        guard let event = event else {return}
        if event.type != UIEventType.RemoteControl {return}
        
        switch event.subtype {
        case .RemoteControlPlay:
            debug ~~ "RemoteControlPlay"
            playButton.click()
            
        case .RemoteControlStop:
            debug ~~ "RemoteControlStop"
            stopButton.click()
            
        case .RemoteControlPause:
            debug ~~ "RemoteControlPause"
            pauseButton.click()
        
        case .RemoteControlTogglePlayPause:
            debug ~~ "masterButton click"
            masterButton.click()
            
        // double
        case .RemoteControlNextTrack:
            debug ~~ "double click"
            masterButton.doubleClick()
            
        case .RemoteControlBeginSeekingForward:
            debug ~~ "double click and begin keep"
            masterButton.doubleClickAndKeepBegin()
            
        case .RemoteControlEndSeekingForward:
            debug ~~ "double click and end keep"
            masterButton.doubleClickAndKeepEnd()
            
        // triple
        case .RemoteControlPreviousTrack:
            debug ~~ "triple click"
            masterButton.tripleClick()
            
        case .RemoteControlBeginSeekingBackward:
            debug ~~ "triple click and begin keep"
            masterButton.tripleClickAndKeepBegin()
            
        case .RemoteControlEndSeekingBackward:
            debug ~~ "triple click and end keep"
            masterButton.tripleClickAndKeepEnd()
            
        default:
            debug ~~ "other UIEventSubtype"
        }
        
        debug ~~ "run remoteControlReveivedWithEventHandler"
        remoteControlReveivedWithEventHandler()
    }
}