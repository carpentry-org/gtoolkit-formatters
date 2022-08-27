Class {
	#name : #GtDedentation,
	#superclass : #Object,
	#category : #'GToolkitFormatter-Formatting'
}

{ #category : #accessing }
GtDedentation >> addToFormatter: aFormatter withNextSize: aNumber [
	aFormatter dedent
]

{ #category : #accessing }
GtDedentation >> size [
	^ 0
]
