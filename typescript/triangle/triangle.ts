export class Triangle {
	a: number;
	b: number;
	c: number;

  constructor(a: number, b: number, c: number) {
      this.a = a;
      this.b = b;
      this.c = c;
  }

  get isEquilateral():boolean {
		return this.isValid && (this.a === this.b && this.b === this.c);
  }

  get isIsosceles():boolean {
		return this.isValid &&
      (this.a === this.b || this.b === this.c || this.a === this.c);
  }

  get isScalene():boolean {
		return this.isValid
      && (this.a !== this.b && this.b !== this.c && this.c !== this.a);
  }

	get isValid():boolean {
		return (this.a > 0 && this.b > 0 && this.c > 0)
      && (this.a + this.b >= this.c)
      && (this.a + this.c >= this.b)
      && (this.b + this.c >= this.a);
	}
}
