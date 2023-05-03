Class {
	#name : #GtHardBreak,
	#superclass : #GtLineBreak,
	#category : #'GToolkitFormatter-Model'
}

{ #category : #accessing }
GtHardBreak >> addToFormatter: aFormatter withNextSize: aNumber [
	aFormatter addLineBreak
]

{ #category : #accessing }
GtHardBreak >> asSpace [
	^ self asLineBreak
]

{ #category : #accessing }
GtHardBreak >> printToken [
	^ '<hardBreak>'
]
