//
//  PlistSectionDataManager.swift
//  Generic
//
//  Created by Arkadiusz Pituła on 15.03.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

import Foundation

open class PlistSectionDataManager<T>: StandardDataManager<T> where T: DictionaryDecoder {

    private let fileName: String
    private let dictKey: String

    enum PlistSectionError: Error {
        case fileNotExist
        case cannotOpenFile
    }

    public init(name: String, key: String) {
        self.fileName = name
        self.dictKey = key

        super.init()

        tryAddObjectToManager()
    }

    private func tryAddObjectToManager() {
        do {
            let sections = try setup()
            super.append(newSections: sections)
        } catch {
            print(error)
        }
    }

    private func setup() throws -> [Section<T>] {
        let pArray = try openPlistFile()
        let section = parseSections(arrays: pArray)
        return section
    }

    private func openPlistFile() throws -> [NSArray] {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "plist") else {
            throw PlistSectionError.fileNotExist
        }
        guard let rootDictinary = NSDictionary(contentsOfFile: path), let sections = rootDictinary[dictKey] as? [NSArray] else {
            throw PlistSectionError.cannotOpenFile
        }
        return sections
    }

    private func parseSections(arrays: [NSArray]) -> [Section<T>] {
        var sections = [Section<T>]()
        for object in arrays {
            let sec = Section<T>(name: " ", rows: parseNSArray(array: object))
            sections.append(sec)
        }

        return sections
    }

    private func parseNSArray(array: NSArray) -> [T] {
        var arr = [T]()
        for object in array where object is NSDictionary {
            arr.append(T(dictinary: object as! NSDictionary))
        }
        return arr
    }

}
