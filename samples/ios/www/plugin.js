
var plugin = {
    myMethod: function() {
        window.plugins.myPlugin.myMethod({
            foo: 'hello',
            bar: 'world'
        }, function(args) {
            var args = Array.prototype.slice.call(arguments, 0);
            console.log("myPlugin.myMethod:" + JSON.stringify(args));
        });
    }
};

