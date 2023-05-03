Class {
	#name : #SmalltalkFormatter,
	#superclass : #GtFormatter,
	#traits : 'TGtPharoProgramNodeVisitor',
	#classTraits : 'TGtPharoProgramNodeVisitor classTrait',
	#category : #'GToolkitFormatter-Formatters'
}

{ #category : #accessing }
SmalltalkFormatter >> defaultCollapseIndents [
	^ true
]

{ #category : #accessing }
SmalltalkFormatter >> defaultIndentBy [
	^ 4
]

{ #category : #accessing }
SmalltalkFormatter >> defaultMaxWidth [
	^ 80
]

{ #category : #generated }
SmalltalkFormatter >> visitArray: anArray [
	| res |
	res := GtFormatterTokenCollection
			withAll: {GtIndentationToCurrent new.
					GtFormatterStringToken new string: '{'}.
	anArray values
		ifEmpty: [ res add: (GtFormatterStringToken new string: '}') ]
		ifNotEmpty: [ res addAll: (self visit: anArray values first).
			anArray values
				allButFirstDo: [ :expression | 
					res
						add: GtSoftBreak new;
						add: (GtFormatterStringToken new string: '.');
						add: GtSoftBreak new;
						addAll: (self visit: expression) ].
			res add: (GtFormatterStringToken new string: '}') ].
	res add: GtDedentation new.
	^ res
]

{ #category : #generated }
SmalltalkFormatter >> visitAssignment: anAssignment [
	| res |
	res := GtFormatterTokenCollection new.
	res addAll: (self visit: anAssignment variable).
	res add: GtSoftBreak new.
	res add: (GtFormatterStringToken new string: ':=').
	res add: GtSoftBreak new.
	res addAll: (self visit: anAssignment value).
	^ res
]

{ #category : #generated }
SmalltalkFormatter >> visitBlock: aBlock [
	| res |
	res := GtFormatterTokenCollection
			withAll: {GtIndentationToCurrent new.
					GtFormatterStringToken new string: '['}.
	aBlock body statements
		ifEmpty: [ res add: (GtFormatterStringToken new string: ']') ]
		ifNotEmpty: [ res addAll: (self visit: aBlock body statements first).
			aBlock body statements
				allButFirstDo: [ :expression | 
					res
						add: GtSoftBreak new;
						add: (GtFormatterStringToken new string: '.');
						add: GtSoftBreak new;
						addAll: (self visit: expression) ].
			res add: (GtFormatterStringToken new string: ']') ].
	res add: GtDedentation new.
	^ res
]

{ #category : #generated }
SmalltalkFormatter >> visitCascade: aCascade [
	| res |
	res := GtFormatterTokenCollection new.
	res addAll: (self visit: aCascade receiver).
	res add: GtIndentation new.
	res add: GtHardBreak new.
	aCascade messages allButLast
		do: [ :aMessage | 
			res addAll: (self visit: aMessage).
			res add: (GtFormatterStringToken new string: ';').
			res add: GtHardBreak new ].

	res addAll: (self visit: aCascade messages last).
	res add: GtDedentation new.
	^ res
]

{ #category : #generated }
SmalltalkFormatter >> visitMessage: aMessage [
	| res |
	aMessage isUnary
		ifTrue: [ ^ {GtFormatterStringToken new string: aMessage selector asString} ].

	res := GtFormatterTokenCollection new.
	1
		to: aMessage selectorParts size
		do: [ :anIndex | 
			| argument |
			res
				add: (GtFormatterStringToken new string: (aMessage selectorParts at: anIndex) value).
			res add: GtSoftBreak new.
			argument := aMessage arguments at: anIndex.

			argument needsParenthesisForKeyword
				ifTrue: [ res add: (GtFormatterStringToken new string: '(') ].
			res addAll: (self visit: argument).
			argument needsParenthesisForKeyword
				ifTrue: [ res add: (GtFormatterStringToken new string: ')') ]
				ifFalse: [ res add: GtSoftBreak new ] ].

	(res last isKindOf: GtSoftBreak) ifTrue: [ res removeLast ].

	^ res
]

{ #category : #generated }
SmalltalkFormatter >> visitMessageSend: aMessageSend [
	| res |
	res := GtFormatterTokenCollection new.
	res addAll: (self visit: aMessageSend receiver).


	aMessageSend arguments size = 0
		ifTrue: [ res add: GtSoftBreak new.
			res add: (GtFormatterStringToken new string: aMessageSend selector asString).
			^ res ].

	res add: GtSoftBreak new.
	res add: GtIndentation new.
	1
		to: aMessageSend selectorParts size
		do: [ :anIndex | 
			| argument |
			res
				add: (GtFormatterStringToken new
						string: (aMessageSend selectorParts at: anIndex) value).
			res add: GtSoftBreak new.
			argument := aMessageSend arguments at: anIndex.

			argument needsParenthesisForKeyword
				ifTrue: [ res add: (GtFormatterStringToken new string: '(') ].
			res addAll: (self visit: argument).
			argument needsParenthesisForKeyword
				ifTrue: [ res add: (GtFormatterStringToken new string: ')') ]
				ifFalse: [ res add: GtSoftBreak new ] ].

	res add: GtDedentation new.
	^ res
]

{ #category : #generated }
SmalltalkFormatter >> visitMethod: aMethod [
	| res |
	res := GtFormatterTokenCollection new.
	res add: (GtFormatterStringToken new string: aMethod selector).
	res add: GtIndentation new.
	res add: GtHardBreak new.
	res addAll: (self visit: aMethod body).
	^ res
]

{ #category : #generated }
SmalltalkFormatter >> visitReturn: aReturn [
	| res |
	res := GtFormatterTokenCollection new.
	res add: (GtFormatterStringToken new string: '^ ').
	res addAll: (self visit: aReturn value).
	^ res
]

{ #category : #generated }
SmalltalkFormatter >> visitSequence: aSequence [
	| res |
	res := GtFormatterTokenCollection new.
	aSequence statements allButLast
		do: [ :aStatement | 
			res
				addAll: (self visit: aStatement);
				add: (GtFormatterStringToken new string: '.');
				add: GtHardBreak new ].
	res addAll: (self visit: aSequence statements last).
	^ res
]

{ #category : #generated }
SmalltalkFormatter >> visitValue: aValue [
	^ {GtFormatterStringToken new string: aValue source}
]
