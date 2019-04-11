//
//  PoolModel.swift
//  Passepartout
//
//  Created by Davide De Rosa on 4/11/19.
//  Copyright (c) 2019 Davide De Rosa. All rights reserved.
//
//  https://github.com/passepartoutvpn
//
//  This file is part of Passepartout.
//
//  Passepartout is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  Passepartout is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with Passepartout.  If not, see <http://www.gnu.org/licenses/>.
//

import Foundation

public class PoolModel {
    public let isFree: Bool
    
    public var poolsByGroup: [PoolGroup: [Pool]]
    
    public private(set) var sortedGroups: [PoolGroup]
    
    public init(isFree: Bool) {
        self.isFree = isFree
        poolsByGroup = [:]
        sortedGroups = []
    }
    
    public var isEmpty: Bool {
        return sortedGroups.isEmpty
    }
    
    public func addPool(_ p: Pool) {
        let group = p.group()
        if var existingPools = poolsByGroup[group] {
            existingPools.append(p)
            poolsByGroup[group] = existingPools
        } else {
            poolsByGroup[group] = [p]
        }
    }
    
    public func sort() {
        sortedGroups = poolsByGroup.keys.sorted()
    }
}
