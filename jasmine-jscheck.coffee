forAll = (signature, name, predicate) ->

    pp = new jasmine.StringPrettyPrinter()
    format = (values) ->
        pp.format(value)
        pp.string

    it name, ->
        localJasmine = this
        JSC.clear()
        jscPredicate = (verify, value...) =>
            predicate(value...)
            verify( this.results().failedCount == 0 )
        JSC.claim name, jscPredicate, signature
        if this.reps then JSC.reps(this.reps)
        failure = (f) ->
            report = 'Failed: ' + f.name +
                '\nArguments: ' + format(f.args) +
                if f.exception? then '\nException:\n' + f.exception else ''
            localJasmine.fail(report)
        JSC.on_fail failure
        JSC.on_lost failure
        JSC.check(5000)

