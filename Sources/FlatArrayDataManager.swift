//
//  FlatArrayDataManager.swift
//  FountainKit
//
//  Created by Cesar Tardaguila on 5/3/2016.
//

/**
 *   Implementation of the DataManager protocol, that manages a single section data structure, backed up by an array
 */

public final class FlatArrayDataManager<T>: DataManager {
    private var data: [T]
    
    public init(data: [T]) {
        self.data = data
    }
    
    public convenience init() {
        self.init(data: [T]())
    }
    
    public func itemCount() -> Int {
        return data.count
    }
    
    public func itemCount(section: Int) -> Int? {
        guard section < 1 else {
            return nil
        }
        
        return itemCount()
    }
    
    public func item(indexPath: NSIndexPath) -> T {
        return data[indexPath.row]
    }
    
    public func append(newData: [T], toSection: Int) {
        data.appendContentsOf(newData)
    }
    
    public func update(item: T, indexPath: NSIndexPath) {
        let index = indexPath.row
        guard index < data.count else {
            return
        }
        
        data[index] = item
    }
    
    public func clear() {
        data.removeAll(keepCapacity: false)
    }
    
    public func clear(section: Int) {
        clear()
    }
    
    public func sectionCount() -> Int {
        return 1
    }
}