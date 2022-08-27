Class {
	#name : #GtLineBreak,
	#superclass : #Object,
	#instVars : [
		'column'
	],
	#category : #'GToolkitFormatter-Formatting'
}

{ #category : #accessing }
GtLineBreak >> asLineBreakWith: anIndentation [
	^ '
', anIndentation
]

{ #category : #accessing }
GtLineBreak >> asSpace [
	^ ' '
]

{ #category : #accessing }
GtLineBreak >> size [
	^ 1
]
