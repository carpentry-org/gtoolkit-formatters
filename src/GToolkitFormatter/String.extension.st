Extension { #name : #String }

{ #category : #'*GToolkitFormatter' }
String >> addToFormatter: aFormatter withNextSize: aNumber [
	| idx |
	idx := self lastIndexOf: Character lf.
	aFormatter addCode: self.
	idx > 0
		ifTrue: [ aFormatter setColumn: self size - idx ]
		ifFalse: [ aFormatter addToColumn: self size ]
]
