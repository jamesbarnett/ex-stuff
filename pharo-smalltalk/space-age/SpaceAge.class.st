Class {
	#name : #SpaceAge,
	#superclass : #Object,
	#category : #'Exercise@SpaceAge'
}

{ #category : #'as yet unclassified' }
SpaceAge >> ageOnPlanet: planet at: ageInSeconds [
 	| orbitPeriodsByPlanet result| 
	orbitPeriodsByPlanet := Dictionary new
    at: 'Mercury' put: 0.2408467;
    at: 'Venus' put: 0.61519726;
    at: 'Earth' put: 1.0;
    at: 'Mars' put: 1.8808158;
    at: 'Jupiter' put: 11.862615;
    at: 'Saturn' put: 29.447498;
    at: 'Uranus' put: 84.016846;
    at: 'Neptune' put: 164.79132;
	 yourself.
	 result := ageInSeconds / ((orbitPeriodsByPlanet at: planet) * 31557600).
	 ^ result
]
