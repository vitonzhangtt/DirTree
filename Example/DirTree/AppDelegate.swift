//
//  AppDelegate.swift
//  DirTree
//
//  Created by vitonzhangtt on 09/14/2021.
//  Copyright (c) 2021 vitonzhangtt. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
/*
        NSString *libraryPath = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0];
        NSString *targetPath = [NSString stringWithFormat:@"%@/%@", libraryPath, @"Caches"];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        for (NSUInteger index = 0; index < 2000; index++) {
            NSString *filePath = [NSString stringWithFormat:@"%@/%@.txt", targetPath, @(index)];
            [fileManager createFileAtPath:filePath contents:nil attributes:nil];
        }
 */
        /// Create the tmp files for testing.
        let libraryPath: [String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.libraryDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        
        if libraryPath.count > 0 {
            let firstLibraryPath = libraryPath[0]
            let cachesPath: String = firstLibraryPath + "/Caches"
            if FileManager.default.fileExists(atPath: cachesPath) {
                print("Caches already exists!")
            } else {
                try? FileManager.default.createDirectory(atPath: cachesPath,
                                                    withIntermediateDirectories: true,
                                                    attributes: nil)
                print("Caches directory be created!")
            }
            
            for index in 0...2000 {
                let fileName: String = "\(index).txt"
                let filePath: String = "\(cachesPath)/\(fileName)"
                
//                print("filePath: \(filePath)")
                FileManager.default.createFile(atPath: filePath, contents: nil, attributes: nil)
            }
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

