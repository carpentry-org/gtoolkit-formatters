Class {
	#name : #GtFormatterStringToken,
	#superclass : #GtFormatterToken,
	#instVars : [
		'string'
	],
	#category : #'GToolkitFormatter-Model'
}

{ #category : #accessing }
GtFormatterStringToken >> addToFormatter: aFormatter withNextSize: aNumber [
	| idx |
	idx := self string lastIndexOf: Character lf.
	aFormatter addCode: self string.
	idx > 0
		ifTrue: [ aFormatter setColumn: self string size - idx ]
		ifFalse: [ aFormatter addToColumn: self string size ]
]

{ #category : #accessing }
GtFormatterStringToken >> printToken [
	^ self string
]

{ #category : #accessing }
GtFormatterStringToken >> size [
	^ self string size
]

{ #category : #accessing }
GtFormatterStringToken >> string [
	^ string
]

{ #category : #accessing }
GtFormatterStringToken >> string: aString [
	string := aString
]
