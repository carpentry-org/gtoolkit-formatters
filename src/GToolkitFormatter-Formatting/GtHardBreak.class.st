Class {
	#name : #GtHardBreak,
	#superclass : #GtLineBreak,
	#category : #'GToolkitFormatter-Formatting'
}

{ #category : #accessing }
GtHardBreak >> addToFormatter: aFormatter withNextSize: aNumber [
	aFormatter
		addCode: (self asLineBreakWith: aFormatter indentation);
		setColumn: aFormatter indentation size
]

{ #category : #accessing }
GtHardBreak >> asSpace [
	^ self asLineBreak
]
