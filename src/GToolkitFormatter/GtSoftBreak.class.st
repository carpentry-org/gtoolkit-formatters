Class {
	#name : #GtSoftBreak,
	#superclass : #GtLineBreak,
	#category : #'GToolkitFormatter-Model'
}

{ #category : #accessing }
GtSoftBreak >> addToFormatter: aFormatter withNextSize: aNumber [
	aFormatter column + aNumber > aFormatter maxWidth
		ifTrue: [ aFormatter addLineBreak ]
		ifFalse: [ aFormatter
				addCode: self asSpace;
				incrementColumn: 1 ]
]

{ #category : #accessing }
GtSoftBreak >> printToken [
	^ '<softBreak>'
]
