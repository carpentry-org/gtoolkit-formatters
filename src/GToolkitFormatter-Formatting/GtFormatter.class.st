Class {
	#name : #GtFormatter,
	#superclass : #Object,
	#traits : 'TGtUniqueInstance',
	#classTraits : 'TGtUniqueInstance classTrait',
	#instVars : [
		'maxColumns',
		'codeStream',
		'column',
		'indentBy',
		'indentation'
	],
	#category : #'GToolkitFormatter-Formatting'
}

{ #category : #accessing }
GtFormatter >> addCode: aString [
	codeStream nextPutAll: aString
]

{ #category : #accessing }
GtFormatter >> addToColumn: aNumber [
	column := column + aNumber
]

{ #category : #accessing }
GtFormatter >> column [
	^ column
]

{ #category : #accessing }
GtFormatter >> dedent [
	indentation removeLast
]

{ #category : #accessing }
GtFormatter >> defaultIndentBy [
	^ self defaultIndentBy
]

{ #category : #accessing }
GtFormatter >> defaultMaxWidth [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtFormatter >> format: anAst [
	| parts |
	parts := self visit: anAst.
	^ self joinParts: parts
]

{ #category : #accessing }
GtFormatter >> incrementColumn: aNumber [
	column := column + aNumber
]

{ #category : #accessing }
GtFormatter >> indent [
	indentation add: self indentBy
]

{ #category : #accessing }
GtFormatter >> indentBy [
	^ indentBy ifNil: [ indentBy := self defaultIndentBy ]
]

{ #category : #accessing }
GtFormatter >> indentBy: aNumber [
	indentBy := aNumber
]

{ #category : #accessing }
GtFormatter >> indentToCurrent [
	indentation add: column - indentation sum + 1
]

{ #category : #accessing }
GtFormatter >> indentation [
	^ indentation
		ifEmpty: [ {} ]
		ifNotEmpty: [ indentation sum timesCollect: [ :_ | Character space ] ]
]

{ #category : #accessing }
GtFormatter >> initialize [
	codeStream := WriteStream on: (String new: 256).
	column := 0.
	indentation := OrderedCollection new
]

{ #category : #accessing }
GtFormatter >> joinParts: aCollectionOfParts [
	column := 0.
	codeStream resetToStart.
	indentation := OrderedCollection new.
	aCollectionOfParts
		doWithIndex: [ :part :index | 
			| currentIdx nextSize |
			"compute size of next non-zero element (0 only if at end or all next ones are 0)"
			currentIdx := index + 1.
			nextSize := 0.
			[ aCollectionOfParts size > currentIdx and: [ nextSize = 0 ] ]
				whileTrue: [ nextSize := (aCollectionOfParts at: currentIdx) size.
					currentIdx := currentIdx + 1 ].
			part addToFormatter: self withNextSize: nextSize ].
	^ codeStream contents trimBoth
]

{ #category : #accessing }
GtFormatter >> maxWidth [
	^ maxColumns ifNil: [ maxColumns := self defaultMaxWidth ]
]

{ #category : #accessing }
GtFormatter >> maxWidth: aNumber [
	maxColumns := aNumber
]

{ #category : #accessing }
GtFormatter >> setColumn: aNumber [
	column := aNumber
]

{ #category : #accessing }
GtFormatter >> visit: anAst [
	^ anAst acceptVisitor: self
]
