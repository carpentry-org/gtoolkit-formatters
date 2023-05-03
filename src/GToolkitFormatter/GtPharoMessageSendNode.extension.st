Extension { #name : #GtPharoMessageSendNode }

{ #category : #'*GToolkitFormatter' }
GtPharoMessageSendNode >> needsParenthesisForKeyword [
	^ (self selectorParts size = 1) not
]
