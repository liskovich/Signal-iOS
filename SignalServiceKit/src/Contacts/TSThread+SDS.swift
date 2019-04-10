//
//  Copyright (c) 2019 Open Whisper Systems. All rights reserved.
//

import Foundation
import GRDBCipher
import SignalCoreKit

// NOTE: This file is generated by /Users/matthew/code/workspace/ows/Signal-iOS-2/Scripts/sds_codegen/sds_generate.py.
// Do not manually edit it, instead run `sds_codegen.sh`.

// MARK: - Table Metadata

extension TSThread {

    // This defines all of the columns used in the table
    // where this model (and any subclasses) are persisted.
    static let recordTypeColumn = SDSColumnMetadata(columnName: "recordType", columnType: .int, columnIndex: 0)
    static let uniqueIdColumn = SDSColumnMetadata(columnName: "uniqueId", columnType: .unicodeString, columnIndex: 1)
    static let archivalDateColumn = SDSColumnMetadata(columnName: "archivalDate", columnType: .int64, isOptional: true, columnIndex: 2)
    static let archivedAsOfMessageSortIdColumn = SDSColumnMetadata(columnName: "archivedAsOfMessageSortId", columnType: .int, isOptional: true, columnIndex: 3)
    static let conversationColorNameColumn = SDSColumnMetadata(columnName: "conversationColorName", columnType: .unicodeString, columnIndex: 4)
    static let creationDateColumn = SDSColumnMetadata(columnName: "creationDate", columnType: .int64, columnIndex: 5)
    static let isArchivedByLegacyTimestampForSortingColumn = SDSColumnMetadata(columnName: "isArchivedByLegacyTimestampForSorting", columnType: .int, columnIndex: 6)
    static let lastMessageDateColumn = SDSColumnMetadata(columnName: "lastMessageDate", columnType: .int64, isOptional: true, columnIndex: 7)
    static let messageDraftColumn = SDSColumnMetadata(columnName: "messageDraft", columnType: .unicodeString, isOptional: true, columnIndex: 8)
    static let mutedUntilDateColumn = SDSColumnMetadata(columnName: "mutedUntilDate", columnType: .int64, isOptional: true, columnIndex: 9)
    static let shouldThreadBeVisibleColumn = SDSColumnMetadata(columnName: "shouldThreadBeVisible", columnType: .int, columnIndex: 10)
    static let groupModelColumn = SDSColumnMetadata(columnName: "groupModel", columnType: .blob, isOptional: true, columnIndex: 11)
    static let hasDismissedOffersColumn = SDSColumnMetadata(columnName: "hasDismissedOffers", columnType: .int, isOptional: true, columnIndex: 12)

    // TODO: We should decide on a naming convention for
    //       tables that store models.
    static let table = SDSTableMetadata(tableName: "model_TSThread", columns: [
        recordTypeColumn,
        uniqueIdColumn,
        archivalDateColumn,
        archivedAsOfMessageSortIdColumn,
        conversationColorNameColumn,
        creationDateColumn,
        isArchivedByLegacyTimestampForSortingColumn,
        lastMessageDateColumn,
        messageDraftColumn,
        mutedUntilDateColumn,
        shouldThreadBeVisibleColumn,
        groupModelColumn,
        hasDismissedOffersColumn
        ])

}

// MARK: - Deserialization

extension TSThread {
    // This method defines how to deserialize a model, given a
    // database row.  The recordType column is used to determine
    // the corresponding model class.
    class func sdsDeserialize(statement: SelectStatement) throws -> TSThread {

        if OWSIsDebugBuild() {
            guard statement.columnNames == table.selectColumnNames else {
                owsFailDebug("Unexpected columns: \(statement.columnNames) != \(table.selectColumnNames)")
                throw SDSError.invalidResult
            }
        }

        // SDSDeserializer is used to convert column values into Swift values.
        let deserializer = SDSDeserializer(sqliteStatement: statement.sqliteStatement)
        let recordTypeValue = try deserializer.int(at: 0)
        guard let recordType = SDSRecordType(rawValue: UInt(recordTypeValue)) else {
            throw SDSError.invalidResult
        }
        switch recordType {
        case .groupThread:
            let uniqueId = try deserializer.optionalString(at: uniqueIdColumn.columnIndex)
            let archivalDate = try deserializer.optionalDate(at: archivalDateColumn.columnIndex)
            let archivedAsOfMessageSortId = try deserializer.optionalBoolAsNSNumber(at: archivedAsOfMessageSortIdColumn.columnIndex)
            let conversationColorName = try deserializer.string(at: conversationColorNameColumn.columnIndex)
            let creationDate = try deserializer.date(at: creationDateColumn.columnIndex)
            let isArchivedByLegacyTimestampForSorting = try deserializer.bool(at: isArchivedByLegacyTimestampForSortingColumn.columnIndex)
            let lastMessageDate = try deserializer.optionalDate(at: lastMessageDateColumn.columnIndex)
            let messageDraft = try deserializer.optionalString(at: messageDraftColumn.columnIndex)
            let mutedUntilDate = try deserializer.optionalDate(at: mutedUntilDateColumn.columnIndex)
            let shouldThreadBeVisible = try deserializer.bool(at: shouldThreadBeVisibleColumn.columnIndex)
            let groupModelSerialized: Data = try deserializer.blob(at: groupModelColumn.columnIndex)
            let groupModel: TSGroupModel = try SDSDeserializer.unarchive(groupModelSerialized)

            return TSGroupThread(uniqueId: uniqueId, archivalDate: archivalDate, archivedAsOfMessageSortId: archivedAsOfMessageSortId, conversationColorName: conversationColorName, creationDate: creationDate, isArchivedByLegacyTimestampForSorting: isArchivedByLegacyTimestampForSorting, lastMessageDate: lastMessageDate, messageDraft: messageDraft, mutedUntilDate: mutedUntilDate, shouldThreadBeVisible: shouldThreadBeVisible, groupModel: groupModel)
        case .contactThread:
            let uniqueId = try deserializer.optionalString(at: uniqueIdColumn.columnIndex)
            let archivalDate = try deserializer.optionalDate(at: archivalDateColumn.columnIndex)
            let archivedAsOfMessageSortId = try deserializer.optionalBoolAsNSNumber(at: archivedAsOfMessageSortIdColumn.columnIndex)
            let conversationColorName = try deserializer.string(at: conversationColorNameColumn.columnIndex)
            let creationDate = try deserializer.date(at: creationDateColumn.columnIndex)
            let isArchivedByLegacyTimestampForSorting = try deserializer.bool(at: isArchivedByLegacyTimestampForSortingColumn.columnIndex)
            let lastMessageDate = try deserializer.optionalDate(at: lastMessageDateColumn.columnIndex)
            let messageDraft = try deserializer.optionalString(at: messageDraftColumn.columnIndex)
            let mutedUntilDate = try deserializer.optionalDate(at: mutedUntilDateColumn.columnIndex)
            let shouldThreadBeVisible = try deserializer.bool(at: shouldThreadBeVisibleColumn.columnIndex)
            let hasDismissedOffers = try deserializer.bool(at: hasDismissedOffersColumn.columnIndex)

            return TSContactThread(uniqueId: uniqueId, archivalDate: archivalDate, archivedAsOfMessageSortId: archivedAsOfMessageSortId, conversationColorName: conversationColorName, creationDate: creationDate, isArchivedByLegacyTimestampForSorting: isArchivedByLegacyTimestampForSorting, lastMessageDate: lastMessageDate, messageDraft: messageDraft, mutedUntilDate: mutedUntilDate, shouldThreadBeVisible: shouldThreadBeVisible, hasDismissedOffers: hasDismissedOffers)
        case .thread:
            let uniqueId = try deserializer.optionalString(at: uniqueIdColumn.columnIndex)
            let archivalDate = try deserializer.optionalDate(at: archivalDateColumn.columnIndex)
            let archivedAsOfMessageSortId = try deserializer.optionalBoolAsNSNumber(at: archivedAsOfMessageSortIdColumn.columnIndex)
            let conversationColorName = try deserializer.string(at: conversationColorNameColumn.columnIndex)
            let creationDate = try deserializer.date(at: creationDateColumn.columnIndex)
            let isArchivedByLegacyTimestampForSorting = try deserializer.bool(at: isArchivedByLegacyTimestampForSortingColumn.columnIndex)
            let lastMessageDate = try deserializer.optionalDate(at: lastMessageDateColumn.columnIndex)
            let messageDraft = try deserializer.optionalString(at: messageDraftColumn.columnIndex)
            let mutedUntilDate = try deserializer.optionalDate(at: mutedUntilDateColumn.columnIndex)
            let shouldThreadBeVisible = try deserializer.bool(at: shouldThreadBeVisibleColumn.columnIndex)

            return TSThread(uniqueId: uniqueId, archivalDate: archivalDate, archivedAsOfMessageSortId: archivedAsOfMessageSortId, conversationColorName: conversationColorName, creationDate: creationDate, isArchivedByLegacyTimestampForSorting: isArchivedByLegacyTimestampForSorting, lastMessageDate: lastMessageDate, messageDraft: messageDraft, mutedUntilDate: mutedUntilDate, shouldThreadBeVisible: shouldThreadBeVisible)
        default:
            owsFail("Invalid record type \(recordType)")
        }
    }
}

// MARK: - Fetch

// This category defines various fetch methods.
//
// TODO: We may eventually want to define some combination of:
//
// * fetchCursor, fetchOne, fetchAll, etc. (ala GRDB)
// * Optional "where clause" parameters for filtering.
// * Async flavors with completions.
//
// TODO: I've defined flavors that take a read transation or SDSDatabaseStorage.
//       We might want only the former.  Or we might take a "connection" if we
//       end up having that class.
@objc
extension TSThread {
    @objc
    public class func fetchAll(databaseStorage: SDSDatabaseStorage) -> [TSThread] {
        var result = [TSThread]()
        databaseStorage.readSwallowingErrors { (transaction) in
            guard let database = transaction.transitional_grdbReadTransaction else {
                owsFail("Invalid transaction")
            }
            result += SDSSerialization.fetchAll(tableMetadata: TSThread.table,
                                                uniqueIdColumnName: TSThread.uniqueIdColumn.columnName,
                                                database: database,
                                                deserialize: { (statement) in
                                                    return try sdsDeserialize(statement: statement)
            })
        }
        return result
    }

    @objc
    public class func fetchAll(transaction: SDSAnyReadTransaction) -> [TSThread] {
        guard let database = transaction.transitional_grdbReadTransaction else {
            owsFail("Invalid transaction")
        }
        return SDSSerialization.fetchAll(tableMetadata: TSThread.table,
                                         uniqueIdColumnName: TSThread.uniqueIdColumn.columnName,
                                         database: database,
                                         deserialize: { (statement) in
                                            return try sdsDeserialize(statement: statement)
        })
    }
}

// TODO: Add remove/delete method.

// MARK: - Observation

// TODO: Add Observation.
/*
@objc
extension TSThread {
    @objc
    public class func observe(databaseStorage: SDSDatabaseStorage,
                              callback: @escaping () -> Void) -> SDSObserver {
        return SDSObserver.observe(tableMetadata: TSThread.table, dataStore: dataStore, callback: callback)
    }
}
*/

// MARK: - SDSSerializable

// The SDSSerializable protocol specifies how to insert and update the
// row that corresponds to this model.
@objc
extension TSThread: SDSSerializable {

    public func serializableColumnTableMetadata() -> SDSTableMetadata {
        return TSThread.table
    }

    public func insertColumnNames() -> [String] {
        // When we insert a new row, we include the following columns:
        //
        // * "record type"
        // * "unique id"
        // * ...all columns that we set when updating.
        return [
            TSThread.recordTypeColumn.columnName,
            uniqueIdColumnName()
            ] + updateColumnNames()

    }

    // In practice, these values should all be DatabaseValueConvertible,
    // but that protocol is not @objc.
    public func insertColumnValues() -> [Any] {
        let result: [Any] = [
            SDSRecordType.thread.rawValue
            ] + [uniqueIdColumnValue()] + updateColumnValues()
        if OWSIsDebugBuild() {
            if result.count != insertColumnNames().count {
                owsFailDebug("Update mismatch: \(result.count) != \(insertColumnNames().count)")
            }
        }
        return result
    }

    public func updateColumnNames() -> [String] {
        return [
            TSThread.archivalDateColumn,
            TSThread.archivedAsOfMessageSortIdColumn,
            TSThread.conversationColorNameColumn,
            TSThread.creationDateColumn,
            TSThread.isArchivedByLegacyTimestampForSortingColumn,
            TSThread.lastMessageDateColumn,
            TSThread.messageDraftColumn,
            TSThread.mutedUntilDateColumn,
            TSThread.shouldThreadBeVisibleColumn
            ].map { $0.columnName }
    }

    // In practice, these values should all be DatabaseValueConvertible,
    // but that protocol is not @objc.
    public func updateColumnValues() -> [Any] {
        let result: [Any] = [
            self.archivalDate ?? DatabaseValue.null,
            self.archivedAsOfMessageSortId ?? DatabaseValue.null,
            self.conversationColorName,
            self.creationDate,
            self.isArchivedByLegacyTimestampForSorting,
            self.lastMessageDate ?? DatabaseValue.null,
            self.messageDraft ?? DatabaseValue.null,
            self.mutedUntilDate ?? DatabaseValue.null,
            self.shouldThreadBeVisible

        ]
        if OWSIsDebugBuild() {
            if result.count != updateColumnNames().count {
                owsFailDebug("Update mismatch: \(result.count) != \(updateColumnNames().count)")
            }
        }
        return result
    }

    public func uniqueIdColumnName() -> String {
        return TSThread.uniqueIdColumn.columnName
    }

    // In practice, these values should all be DatabaseValueConvertible,
    // but that protocol is not @objc.
    //
    // TODO: uniqueId is currently an optional on our models.
    //       We should probably make the return type here String?
    public func uniqueIdColumnValue() -> Any {
        return uniqueId
    }
}
