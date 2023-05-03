Class {
	#name : #GtDedentation,
	#superclass : #GtFormatterToken,
	#category : #'GToolkitFormatter-Model'
}

{ #category : #accessing }
GtDedentation >> addToFormatter: aFormatter withNextSize: aNumber [
	aFormatter dedent
]

{ #category : #accessing }
GtDedentation >> printToken [
	^ '<dedent>'
]

{ #category : #accessing }
GtDedentation >> size [
	^ 0
]
