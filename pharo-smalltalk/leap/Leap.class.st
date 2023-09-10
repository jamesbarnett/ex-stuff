Class {
	#name : #Leap,
	#superclass : #Object,
	#category : #'Exercise@Leap'
}

{ #category : #'date calculation' }
Leap >> leapYear: year [ 
	^ year % 4 == 0 & (year % 100 ~= 0) | (year % 400 == 0).
]
