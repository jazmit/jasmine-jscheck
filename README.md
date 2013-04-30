Simple shim which allows for using jscheck from jasmine
- Use jasmine test runner to run jscheck claims
- Use jasmine expect() matchers rather than jscheck verify()
Usage: (coffeescript)

        forAll [JSC.integer(1,10)], 'integers from 1 to 10 should be positive', (arg) ->
            expect( arg ).toBeGreaterThan 0

The number of generated values to be tried can be set via this.reps, and will be passed to JSC.reps

Any suggestions for improvements / pull requests welcome, I'm a newcomer to both jasmine internals and jscheck.
