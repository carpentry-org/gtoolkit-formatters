Class {
	#name : #GtIndentationToCurrent,
	#superclass : #GtIndentation,
	#category : #'GToolkitFormatter-Formatting'
}

{ #category : #accessing }
GtIndentationToCurrent >> addToFormatter: aFormatter withNextSize: aNumber [
	aFormatter indentToCurrent
]
