Class {
	#name : #GtFormatterTokenCollection,
	#superclass : #OrderedCollection,
	#category : #'GToolkitFormatter-Model'
}

{ #category : #accessing }
GtFormatterTokenCollection >> gtViewTokensFor: aView [
	<gtView>
	^ aView textEditor
		title: 'Tokens';
		priority: 1;
		text: [ ' ' join: (self collect: #printToken) ]
]
