Class {
	#name : #SmalltalkFormatter,
	#superclass : #GtFormatter,
	#traits : 'TGtPharoProgramNodeVisitor',
	#classTraits : 'TGtPharoProgramNodeVisitor classTrait',
	#category : #'GToolkitFormatter-Formatting'
}

{ #category : #generated }
SmalltalkFormatter >> visitMethod: aMethod [
	| res |
	res := OrderedCollection new.
	res add: aMethod selector.
	res add: GtHardBreak new.
	res add: GtIndentation new.
	res add: (self visit: aMethod body).
	^ res
]
