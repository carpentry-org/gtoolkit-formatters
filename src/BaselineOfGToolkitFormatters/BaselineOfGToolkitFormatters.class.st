Class {
	#name : #BaselineOfGToolkitFormatters,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitFormatters
}

{ #category : #baseline }
BaselineOfGToolkitFormatters >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec package: 'GToolkitFormatter'.
			spec package: 'GToolkitFormatter' ]
]
