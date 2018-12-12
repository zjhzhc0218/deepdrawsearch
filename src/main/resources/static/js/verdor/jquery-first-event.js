/*!  2018-10-22 */

!function(a) {
    "use strict";
    function b(a) {
        return a.split(" ")
    }
    function c(b) {
        var c = b.el;
        return e() ? a(c).data("events") : a._data(c, "events")
    }
    function d(b) {
        var d = b.elements
            , f = b.events
            , g = b.isDelegated || !1;
        d.each(function(b, d) {
            var h = c({
                el: d
            });
            a.each(f, function(a, b) {
                if (e())
                    g ? h.live.unshift(h.live.pop()) : h[b].unshift(h[b].pop());
                else {
                    var c = h[b]
                        , d = c.slice(0, c.delegateCount)
                        , f = c.slice(c.delegateCount);
                    g ? (d.unshift(d.pop()),
                        Array.prototype.splice.apply(c, [0, c.delegateCount].concat(d))) : (f.unshift(f.pop()),
                        Array.prototype.splice.apply(c, [c.delegateCount, f.length].concat(f)))
                }
            })
        })
    }
    function e() {
        var b = a.fn.jquery.split(".")
            , c = Number(b[0])
            , d = Number(b[1]);
        return 1 === c && d < 7
    }
    a.fn.firstOn = function() {
        if ("function" != typeof a.fn.on)
            throw new Error("`firstOn` needs the method `on` and this jQuery version doesn't support it");
        var c = a.makeArray(arguments);
        return a.fn.on.apply(this, c),
            d({
                elements: this,
                events: b(c[0])
            }),
            this
    }
        ,
        a.fn.firstBind = function() {
            var c = a.makeArray(arguments)
                , e = c[0];
            return a.fn.bind.apply(this, c),
                d({
                    elements: this,
                    events: b(e)
                }),
                this
        }
        ,
        a.fn.firstDelegate = function() {
            var c = a.makeArray(arguments)
                , e = c[1];
            return e ? (a.fn.delegate.apply(this, arguments),
                d({
                    elements: this,
                    events: b(e),
                    isDelegated: !0
                }),
                this) : this
        }
        ,
        a.fn.firstOne = function() {
            var c = a.makeArray(arguments)
                , e = c[0];
            return a.fn.one.apply(this, c),
                d({
                    elements: this,
                    events: b(e)
                }),
                this
        }
        ,
        a.fn.firstLive = function() {
            if ("function" != typeof a.fn.live)
                throw new Error("`firstLive` needs the method `live` and this jQuery version doesn't support it");
            var c = a.makeArray(arguments)
                , e = c[0];
            return a.fn.live.apply(this, c),
                d({
                    elements: a(document),
                    events: b(e),
                    isDelegated: !0
                }),
                this
        }
}(jQuery);
