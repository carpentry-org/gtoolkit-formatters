Class {
	#name : #GtIndentation,
	#superclass : #Object,
	#category : #'GToolkitFormatter-Formatting'
}

{ #category : #accessing }
GtIndentation >> addToFormatter: aFormatter withNextSize: aNumber [
	aFormatter indent
]

{ #category : #accessing }
GtIndentation >> size [
	^ 0
]
