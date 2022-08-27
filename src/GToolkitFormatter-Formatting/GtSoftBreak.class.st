Class {
	#name : #GtSoftBreak,
	#superclass : #GtLineBreak,
	#category : #'GToolkitFormatter-Formatting'
}

{ #category : #accessing }
GtSoftBreak >> addToFormatter: aFormatter withNextSize: aNumber [
	aFormatter column + aNumber > aFormatter maxWidth
		ifTrue: [ aFormatter
				addCode: (self asLineBreakWith: aFormatter indentation);
				setColumn: aFormatter indentation size ]
		ifFalse: [ aFormatter
				addCode: self asSpace;
				incrementColumn: 1 ]
]
