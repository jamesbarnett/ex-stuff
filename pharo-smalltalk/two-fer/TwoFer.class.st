Class {
	#name : #TwoFer,
	#superclass : #Object,
	#category : #'Exercise@TwoFer'
}

{ #category : #'#computation' }
TwoFer >> who [
	^ 'One for you, one for me.'.
]

{ #category : #'#computation' }
TwoFer >> who: aName [
	^ 'One for ',aName,', one for me.'.
]
