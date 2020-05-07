//
//  AppDelegate.swift
//  atajos
//
//  Created by Hugo Ruscitti on 07/05/2020.
//  Copyright © 2020 Hugo Ruscitti. All rights reserved.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var statusBarItem: NSStatusItem!
    var window: NSWindow!
    var popover: NSPopover!

    func applicationDidFinishLaunching(_ aNotification: Notification) {

        let contentView = ContentView()
        
        self.statusBarItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.variableLength))
        
        if let button = self.statusBarItem.button {
             button.image = NSImage(named: "Icon")
        }
        
        constructMenu()
    }
    
    @objc func hoy(_ sender: Any?) {
        let pasteboard = NSPasteboard.general
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy/MM/dd"
        
        pasteboard.declareTypes([NSPasteboard.PasteboardType.string], owner: nil)
        pasteboard.setString("#journal/" + formatter.string(from: Date()), forType: NSPasteboard.PasteboardType.string)
    }
    
    func constructMenu() {
      let menu = NSMenu()

      menu.addItem(NSMenuItem(title: "Hoy", action: #selector(AppDelegate.hoy(_:)), keyEquivalent: "H"))
      menu.addItem(NSMenuItem.separator())
      menu.addItem(NSMenuItem(title: "Cerrar", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))

      statusBarItem.menu = menu
    }


}

