//
//  LYRConstants.h
//  LayerKit
//
//  Created by Blake Watters on 7/13/2014
//  Copyright (c) 2014 Layer. All rights reserved.
//

/**
 @abstract The `LYRDeletionMode` enumeration defines the available modes for deleting content.
 */
typedef NS_ENUM(NSUInteger, LYRDeletionMode) {
    /**
     @abstract Content is deleted from the current device only. This is an unsynchronized delete and content
     will be synchronized to other devices and will be resynchronized if the client is deauthenticated.
     */
    LYRDeletionModeLocal            = 0,
    
    /**
     @abstract Content is deleted from all devices of all participants. This is a synchronized, permanent delete
     that results in content being deleted from the devices of existing users who have previously synchronized and
     makes the content unavailable for synchronization to new participants or devices.
     **/
    LYRDeletionModeAllParticipants  = 2
};

///---------------------
/// @name Object Changes
///---------------------

typedef NS_ENUM(NSInteger, LYRObjectChangeType) {
	LYRObjectChangeTypeCreate,
	LYRObjectChangeTypeUpdate,
	LYRObjectChangeTypeDelete
};

/**
 @abstract A key into a change dictionary describing the change type. @see `LYRObjectChangeType` for possible types.
 */
extern NSString *const LYRObjectChangeTypeKey; // Expect values defined in the enum `LYRObjectChangeType` as `NSNumber` integer values.

/**
 @abstract A key into a change dictionary for the object that was created, updated, or deleted.
 */
extern NSString *const LYRObjectChangeObjectKey; // The `LYRConversation` or `LYRMessage` that changed.

// Only applicable to `LYRObjectChangeTypeUpdate`
extern NSString *const LYRObjectChangePropertyKey; // i.e. participants, metadata, userInfo, index
extern NSString *const LYRObjectChangeOldValueKey; // The value before synchronization
extern NSString *const LYRObjectChangeNewValueKey; // The value after synchronization

///-----------------------
/// @name Typing Indicator
///-----------------------

/**
 @abstract The `LYRTypingIndicator` enumeration describes the states of a typing status of a participant in a conversation.
 */
typedef NS_ENUM(NSUInteger, LYRTypingIndicator) {
    LYRTypingDidBegin   = 0,
    LYRTypingDidPause   = 1,
    LYRTypingDidFinish  = 2
};

///-----------------------
/// @name Content Transfer
///-----------------------

/**
 @abstract The `LYRContentTransferType` values describe the type of a transfer. Used when LYRClient calls to the delegate via `layerClient:willBeginContentTransfer:ofObject:withProgress` and `layerClient:didFinishContentTransfer:ofObject:` methods.
 */
typedef NS_ENUM(NSInteger, LYRContentTransferType) {
    LYRContentTransferTypeDownload              = 0,
    LYRContentTransferTypeUpload                = 1
};
