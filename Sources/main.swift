//
//  main.swift
//  swiftbot
//
//  Created by いちもつ青田 on 2017/06/17.
//
//

// "xoxb-190268453026-2jRqr3syyNHM2ujbE7Jdudr3"

import Foundation
import SlackKit

let piyoRepository = "https://github.com/s10284tk"
let ichimotsRepository = "https://github.com/ichimots"

extension String {
    
    static var xoxb: String {
        return "xoxb"
    }
    
    var _190268453026: String {
        return self + "-190268453026"
    }
    
    var _YyHuRrmKXYNBqbRgliRUnBob: String {
        return self + "-YyHuRrmKXYNBqbRgliRUnBob"
    }
    
}

class SwiftBot {
    
    let bot: SlackKit
    
    init(token: String) {
        bot = SlackKit()
        bot.addRTMBotWithAPIToken(token)
        
        bot.notificationForEvent(.message) { event, client in
            
            guard let text = event.message?.text else {
                return
            }
            
            let separated = text.components(separatedBy: " ")
            
            if !separated.isEmpty, separated[0] == "git" {
                let message: String
                if separated.count > 1 {
                    switch separated[1] {
                    case "piyo":
                        message = piyoRepository
                    case "ichimots":
                        message = ichimotsRepository
                    default:
                        message = "ねぇよ"
                    }
                } else {
                    message = "\(piyoRepository)\n\(ichimotsRepository)"
                }
                
                try? self.bot.rtm?.sendMessage(message, channelID: event.channel?.id ?? "")
                
            }
        }
    }
}

// TODO: 直書きをやめて別管理する
let bot = SwiftBot(token: String.xoxb._190268453026._YyHuRrmKXYNBqbRgliRUnBob)
RunLoop.main.run()
