Class {
	#name : #SmalltalkFormatter,
	#superclass : #GtFormatter,
	#traits : 'TGtPharoProgramNodeVisitor',
	#classTraits : 'TGtPharoProgramNodeVisitor classTrait',
	#category : #'GToolkitFormatter-Formatting'
}

{ #category : #generated }
SmalltalkFormatter >> visitArray: anArray [
	| res |
	res := OrderedCollection
			withAll: {GtIndentationToCurrent new.
					'{'}.
	anArray values
		ifEmpty: [ res add: '}' ]
		ifNotEmpty: [ res addAll: (self visit: anArray values first).
			anArray values
				allButFirstDo: [ :expression | 
					res
						add: GtSoftBreak new;
						add: '.';
						add: GtSoftBreak new;
						addAll: (self visit: expression) ].
			res add: '}' ].
	res add: GtDedentation new.
	^ res
]

{ #category : #generated }
SmalltalkFormatter >> visitMethod: aMethod [
	| res |
	res := OrderedCollection new.
	res add: aMethod selector.
	res add: GtHardBreak new.
	res add: GtIndentation new.
	res add: (self visit: aMethod body).
	^ res
]

{ #category : #generated }
SmalltalkFormatter >> visitSequence: aSequence [
	| res |
	res := OrderedCollection new.
	aSequence statements
		do: [ :aStatement | 
			res
				addAll: (self visit: aStatement);
				add: '.';
				add: GtHardBreak new ].
	^ res
]

{ #category : #generated }
SmalltalkFormatter >> visitValue: aValue [
	^ {aValue source}
]
