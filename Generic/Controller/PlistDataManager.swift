//
//  PlistDataManager.swift
//  Generic
//
//  Created by Arkadiusz Pituła on 14.03.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

import Foundation

open class PlistDataManager<T>: StandardDataManager<T> where T: DictionaryDecoder {

    enum PlistError: Error {
        case fileNotExist
        case cannotOpenFile
    }

    private let fileName: String
    private let dictKey: String

    public init(fileName: String, dictKey: String) {
        self.fileName = fileName
        self.dictKey = dictKey

        super.init()

        tryAddObjectToManager()
    }

    private func tryAddObjectToManager() {
        do {
            let parseObjects = try setup()
            let section = Section<T>(rows: parseObjects)
            super.append(newSection: section)
        } catch {
            print(error)
        }
    }

    private func setup() throws -> [T] {
        let pArray = try openPlistFile()
        let parseObject = parseNSArray(array: pArray)
        return parseObject
    }

    private func openPlistFile() throws -> NSArray {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "plist") else {
            throw PlistError.fileNotExist
        }
        guard let rootDictinary = NSDictionary(contentsOfFile: path), let array = rootDictinary[dictKey] as? NSArray  else {
            throw PlistError.cannotOpenFile
        }
        return array
    }

    private func parseNSArray(array: NSArray) -> [T] {
        var arr = [T]()
        for object in array where object is NSDictionary {
            arr.append(T(dictinary: object as! NSDictionary))
        }
        return arr
    }
}
