forAll = (signature, name, predicate) ->

    pp = new jasmine.StringPrettyPrinter()
    format = (values) ->
        pp.format(value)
        pp.string

    it name, ->
        failedBefore = false
        localJasmine = this
        JSC.clear()
        jscPredicate = (verify, value...) =>
            predicate(value...)
            verify( this.results().failedCount == 0 )
        JSC.claim name, jscPredicate, signature
        if this.reps then JSC.reps(this.reps)
        failure = (f) ->
            theReport = 'Failed: ' + f.name
            unless failedBefore
                console.log 'First failure with arguments:'
                console.log f.args
                if f.exception?
                    console.log 'Exception: ' + f.exception
                localJasmine.fail(theReport)
            failedBefore = true
        JSC.on_fail failure
        JSC.on_lost failure
        JSC.check(5000)


