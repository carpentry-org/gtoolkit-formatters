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
		'indentation',
		'collapseIndents',
		'currentLineIndented'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'GToolkitFormatter-Formatters'
}

{ #category : #accessing }
GtFormatter >> addCode: aString [
	codeStream nextPutAll: aString
]

{ #category : #accessing }
GtFormatter >> addLineBreak [
	currentLineIndented := false.
	codeStream nextPutAll: '
', self indentation.
	self setColumn: self indentation size
]

{ #category : #accessing }
GtFormatter >> addToColumn: aNumber [
	column := column + aNumber
]

{ #category : #accessing }
GtFormatter >> collapseIndents [
	collapseIndents := true
]

{ #category : #accessing }
GtFormatter >> collapsesIndents [
	^ collapseIndents ifNil: [ collapseIndents := self defaultCollapseIndents ]
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
GtFormatter >> defaultCollapseIndents [
	^ false
]

{ #category : #accessing }
GtFormatter >> defaultIndentBy [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtFormatter >> defaultMaxWidth [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtFormatter >> doNotCollapseIndents [
	collapseIndents := false
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
	<todo: 'indentation collapse'>
	"(self collapsesIndents and: [ currentLineIndented ]) ifTrue: [ ^ self ]."

	currentLineIndented := true.
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
	<todo: 'indentation collapse'>
	"(self collapsesIndents and: [ currentLineIndented ]) ifTrue: [ ^ self ]."

	currentLineIndented := true.
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
	indentation := OrderedCollection new.
	currentLineIndented := false
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
	currentLineIndented := false.
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
