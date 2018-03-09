//
//  Section.swift
//  Generic
//
//  Created by Arkadiusz Pituła on 09.03.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

public class Section<T> {
    var rows: [T]

    public init(rows: [T]) {
        self.rows = rows
    }
}
