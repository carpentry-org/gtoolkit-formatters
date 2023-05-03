Class {
	#name : #GtIndentation,
	#superclass : #GtFormatterToken,
	#category : #'GToolkitFormatter-Model'
}

{ #category : #accessing }
GtIndentation >> addToFormatter: aFormatter withNextSize: aNumber [
	aFormatter indent
]

{ #category : #accessing }
GtIndentation >> printToken [
	^ '<indent>'
]

{ #category : #accessing }
GtIndentation >> size [
	^ 0
]
