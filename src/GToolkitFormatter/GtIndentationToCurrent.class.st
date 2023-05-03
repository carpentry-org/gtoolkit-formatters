Class {
	#name : #GtIndentationToCurrent,
	#superclass : #GtIndentation,
	#category : #'GToolkitFormatter-Model'
}

{ #category : #accessing }
GtIndentationToCurrent >> addToFormatter: aFormatter withNextSize: aNumber [
	aFormatter indentToCurrent
]

{ #category : #accessing }
GtIndentationToCurrent >> printToken [
	^ '<indentToCurrent>'
]
