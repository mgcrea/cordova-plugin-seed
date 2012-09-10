//
//  MyPlugin.js
//
// Created by Olivier Louvignes on 2012-09-01.
//
// Copyright 2012 Olivier Louvignes. All rights reserved.
// MIT Licensed

(function(cordova) {

	function MyPlugin() {}

	MyPlugin.prototype.myMethod = function(options, callback) {
		options || (options = {});
		var scope = options.scope || null;

		var _callback = function(result) {
			if(typeof callback == 'function') callback.apply(scope, []);
		};

		return cordova.exec(_callback, _callback, 'MyPlugin', 'myMethod', [options]);
	};

	cordova.addConstructor(function() {
		if(!window.plugins) window.plugins = {};
		window.plugins.myPlugin = new MyPlugin();
	});

})(window.cordova || window.Cordova);
