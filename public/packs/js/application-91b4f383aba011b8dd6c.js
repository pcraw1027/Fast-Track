/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/packs/";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./app/javascript/packs/application.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./app/javascript/channels sync recursive _channel\\.js$":
/*!****************************************************!*\
  !*** ./app/javascript/channels sync _channel\.js$ ***!
  \****************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

function webpackEmptyContext(req) {
	var e = new Error("Cannot find module '" + req + "'");
	e.code = 'MODULE_NOT_FOUND';
	throw e;
}
webpackEmptyContext.keys = function() { return []; };
webpackEmptyContext.resolve = webpackEmptyContext;
module.exports = webpackEmptyContext;
webpackEmptyContext.id = "./app/javascript/channels sync recursive _channel\\.js$";

/***/ }),

/***/ "./app/javascript/channels/index.js":
/*!******************************************!*\
  !*** ./app/javascript/channels/index.js ***!
  \******************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

var channels = __webpack_require__("./app/javascript/channels sync recursive _channel\\.js$");
channels.keys().forEach(channels);

/***/ }),

/***/ "./app/javascript/controllers sync recursive \\.js$":
/*!***********************************************!*\
  !*** ./app/javascript/controllers sync \.js$ ***!
  \***********************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

var map = {
	"./barcode_controller.js": "./app/javascript/controllers/barcode_controller.js",
	"./company_select_controller.js": "./app/javascript/controllers/company_select_controller.js",
	"./index.js": "./app/javascript/controllers/index.js",
	"./product_classification_controller.js": "./app/javascript/controllers/product_classification_controller.js"
};


function webpackContext(req) {
	var id = webpackContextResolve(req);
	return __webpack_require__(id);
}
function webpackContextResolve(req) {
	if(!__webpack_require__.o(map, req)) {
		var e = new Error("Cannot find module '" + req + "'");
		e.code = 'MODULE_NOT_FOUND';
		throw e;
	}
	return map[req];
}
webpackContext.keys = function webpackContextKeys() {
	return Object.keys(map);
};
webpackContext.resolve = webpackContextResolve;
module.exports = webpackContext;
webpackContext.id = "./app/javascript/controllers sync recursive \\.js$";

/***/ }),

/***/ "./app/javascript/controllers/barcode_controller.js":
/*!**********************************************************!*\
  !*** ./app/javascript/controllers/barcode_controller.js ***!
  \**********************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "default", function() { return _default; });
/* harmony import */ var _hotwired_stimulus__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @hotwired/stimulus */ "./node_modules/@hotwired/stimulus/dist/stimulus.js");
function _regeneratorRuntime() { "use strict"; /*! regenerator-runtime -- Copyright (c) 2014-present, Facebook, Inc. -- license (MIT): https://github.com/facebook/regenerator/blob/main/LICENSE */ _regeneratorRuntime = function _regeneratorRuntime() { return e; }; var t, e = {}, r = Object.prototype, n = r.hasOwnProperty, o = Object.defineProperty || function (t, e, r) { t[e] = r.value; }, i = "function" == typeof Symbol ? Symbol : {}, a = i.iterator || "@@iterator", c = i.asyncIterator || "@@asyncIterator", u = i.toStringTag || "@@toStringTag"; function define(t, e, r) { return Object.defineProperty(t, e, { value: r, enumerable: !0, configurable: !0, writable: !0 }), t[e]; } try { define({}, ""); } catch (t) { define = function define(t, e, r) { return t[e] = r; }; } function wrap(t, e, r, n) { var i = e && e.prototype instanceof Generator ? e : Generator, a = Object.create(i.prototype), c = new Context(n || []); return o(a, "_invoke", { value: makeInvokeMethod(t, r, c) }), a; } function tryCatch(t, e, r) { try { return { type: "normal", arg: t.call(e, r) }; } catch (t) { return { type: "throw", arg: t }; } } e.wrap = wrap; var h = "suspendedStart", l = "suspendedYield", f = "executing", s = "completed", y = {}; function Generator() {} function GeneratorFunction() {} function GeneratorFunctionPrototype() {} var p = {}; define(p, a, function () { return this; }); var d = Object.getPrototypeOf, v = d && d(d(values([]))); v && v !== r && n.call(v, a) && (p = v); var g = GeneratorFunctionPrototype.prototype = Generator.prototype = Object.create(p); function defineIteratorMethods(t) { ["next", "throw", "return"].forEach(function (e) { define(t, e, function (t) { return this._invoke(e, t); }); }); } function AsyncIterator(t, e) { function invoke(r, o, i, a) { var c = tryCatch(t[r], t, o); if ("throw" !== c.type) { var u = c.arg, h = u.value; return h && "object" == typeof h && n.call(h, "__await") ? e.resolve(h.__await).then(function (t) { invoke("next", t, i, a); }, function (t) { invoke("throw", t, i, a); }) : e.resolve(h).then(function (t) { u.value = t, i(u); }, function (t) { return invoke("throw", t, i, a); }); } a(c.arg); } var r; o(this, "_invoke", { value: function value(t, n) { function callInvokeWithMethodAndArg() { return new e(function (e, r) { invoke(t, n, e, r); }); } return r = r ? r.then(callInvokeWithMethodAndArg, callInvokeWithMethodAndArg) : callInvokeWithMethodAndArg(); } }); } function makeInvokeMethod(e, r, n) { var o = h; return function (i, a) { if (o === f) throw Error("Generator is already running"); if (o === s) { if ("throw" === i) throw a; return { value: t, done: !0 }; } for (n.method = i, n.arg = a;;) { var c = n.delegate; if (c) { var u = maybeInvokeDelegate(c, n); if (u) { if (u === y) continue; return u; } } if ("next" === n.method) n.sent = n._sent = n.arg;else if ("throw" === n.method) { if (o === h) throw o = s, n.arg; n.dispatchException(n.arg); } else "return" === n.method && n.abrupt("return", n.arg); o = f; var p = tryCatch(e, r, n); if ("normal" === p.type) { if (o = n.done ? s : l, p.arg === y) continue; return { value: p.arg, done: n.done }; } "throw" === p.type && (o = s, n.method = "throw", n.arg = p.arg); } }; } function maybeInvokeDelegate(e, r) { var n = r.method, o = e.iterator[n]; if (o === t) return r.delegate = null, "throw" === n && e.iterator["return"] && (r.method = "return", r.arg = t, maybeInvokeDelegate(e, r), "throw" === r.method) || "return" !== n && (r.method = "throw", r.arg = new TypeError("The iterator does not provide a '" + n + "' method")), y; var i = tryCatch(o, e.iterator, r.arg); if ("throw" === i.type) return r.method = "throw", r.arg = i.arg, r.delegate = null, y; var a = i.arg; return a ? a.done ? (r[e.resultName] = a.value, r.next = e.nextLoc, "return" !== r.method && (r.method = "next", r.arg = t), r.delegate = null, y) : a : (r.method = "throw", r.arg = new TypeError("iterator result is not an object"), r.delegate = null, y); } function pushTryEntry(t) { var e = { tryLoc: t[0] }; 1 in t && (e.catchLoc = t[1]), 2 in t && (e.finallyLoc = t[2], e.afterLoc = t[3]), this.tryEntries.push(e); } function resetTryEntry(t) { var e = t.completion || {}; e.type = "normal", delete e.arg, t.completion = e; } function Context(t) { this.tryEntries = [{ tryLoc: "root" }], t.forEach(pushTryEntry, this), this.reset(!0); } function values(e) { if (e || "" === e) { var r = e[a]; if (r) return r.call(e); if ("function" == typeof e.next) return e; if (!isNaN(e.length)) { var o = -1, i = function next() { for (; ++o < e.length;) if (n.call(e, o)) return next.value = e[o], next.done = !1, next; return next.value = t, next.done = !0, next; }; return i.next = i; } } throw new TypeError(typeof e + " is not iterable"); } return GeneratorFunction.prototype = GeneratorFunctionPrototype, o(g, "constructor", { value: GeneratorFunctionPrototype, configurable: !0 }), o(GeneratorFunctionPrototype, "constructor", { value: GeneratorFunction, configurable: !0 }), GeneratorFunction.displayName = define(GeneratorFunctionPrototype, u, "GeneratorFunction"), e.isGeneratorFunction = function (t) { var e = "function" == typeof t && t.constructor; return !!e && (e === GeneratorFunction || "GeneratorFunction" === (e.displayName || e.name)); }, e.mark = function (t) { return Object.setPrototypeOf ? Object.setPrototypeOf(t, GeneratorFunctionPrototype) : (t.__proto__ = GeneratorFunctionPrototype, define(t, u, "GeneratorFunction")), t.prototype = Object.create(g), t; }, e.awrap = function (t) { return { __await: t }; }, defineIteratorMethods(AsyncIterator.prototype), define(AsyncIterator.prototype, c, function () { return this; }), e.AsyncIterator = AsyncIterator, e.async = function (t, r, n, o, i) { void 0 === i && (i = Promise); var a = new AsyncIterator(wrap(t, r, n, o), i); return e.isGeneratorFunction(r) ? a : a.next().then(function (t) { return t.done ? t.value : a.next(); }); }, defineIteratorMethods(g), define(g, u, "Generator"), define(g, a, function () { return this; }), define(g, "toString", function () { return "[object Generator]"; }), e.keys = function (t) { var e = Object(t), r = []; for (var n in e) r.push(n); return r.reverse(), function next() { for (; r.length;) { var t = r.pop(); if (t in e) return next.value = t, next.done = !1, next; } return next.done = !0, next; }; }, e.values = values, Context.prototype = { constructor: Context, reset: function reset(e) { if (this.prev = 0, this.next = 0, this.sent = this._sent = t, this.done = !1, this.delegate = null, this.method = "next", this.arg = t, this.tryEntries.forEach(resetTryEntry), !e) for (var r in this) "t" === r.charAt(0) && n.call(this, r) && !isNaN(+r.slice(1)) && (this[r] = t); }, stop: function stop() { this.done = !0; var t = this.tryEntries[0].completion; if ("throw" === t.type) throw t.arg; return this.rval; }, dispatchException: function dispatchException(e) { if (this.done) throw e; var r = this; function handle(n, o) { return a.type = "throw", a.arg = e, r.next = n, o && (r.method = "next", r.arg = t), !!o; } for (var o = this.tryEntries.length - 1; o >= 0; --o) { var i = this.tryEntries[o], a = i.completion; if ("root" === i.tryLoc) return handle("end"); if (i.tryLoc <= this.prev) { var c = n.call(i, "catchLoc"), u = n.call(i, "finallyLoc"); if (c && u) { if (this.prev < i.catchLoc) return handle(i.catchLoc, !0); if (this.prev < i.finallyLoc) return handle(i.finallyLoc); } else if (c) { if (this.prev < i.catchLoc) return handle(i.catchLoc, !0); } else { if (!u) throw Error("try statement without catch or finally"); if (this.prev < i.finallyLoc) return handle(i.finallyLoc); } } } }, abrupt: function abrupt(t, e) { for (var r = this.tryEntries.length - 1; r >= 0; --r) { var o = this.tryEntries[r]; if (o.tryLoc <= this.prev && n.call(o, "finallyLoc") && this.prev < o.finallyLoc) { var i = o; break; } } i && ("break" === t || "continue" === t) && i.tryLoc <= e && e <= i.finallyLoc && (i = null); var a = i ? i.completion : {}; return a.type = t, a.arg = e, i ? (this.method = "next", this.next = i.finallyLoc, y) : this.complete(a); }, complete: function complete(t, e) { if ("throw" === t.type) throw t.arg; return "break" === t.type || "continue" === t.type ? this.next = t.arg : "return" === t.type ? (this.rval = this.arg = t.arg, this.method = "return", this.next = "end") : "normal" === t.type && e && (this.next = e), y; }, finish: function finish(t) { for (var e = this.tryEntries.length - 1; e >= 0; --e) { var r = this.tryEntries[e]; if (r.finallyLoc === t) return this.complete(r.completion, r.afterLoc), resetTryEntry(r), y; } }, "catch": function _catch(t) { for (var e = this.tryEntries.length - 1; e >= 0; --e) { var r = this.tryEntries[e]; if (r.tryLoc === t) { var n = r.completion; if ("throw" === n.type) { var o = n.arg; resetTryEntry(r); } return o; } } throw Error("illegal catch attempt"); }, delegateYield: function delegateYield(e, r, n) { return this.delegate = { iterator: values(e), resultName: r, nextLoc: n }, "next" === this.method && (this.arg = t), y; } }, e; }
function asyncGeneratorStep(n, t, e, r, o, a, c) { try { var i = n[a](c), u = i.value; } catch (n) { return void e(n); } i.done ? t(u) : Promise.resolve(u).then(r, o); }
function _asyncToGenerator(n) { return function () { var t = this, e = arguments; return new Promise(function (r, o) { var a = n.apply(t, e); function _next(n) { asyncGeneratorStep(a, r, o, _next, _throw, "next", n); } function _throw(n) { asyncGeneratorStep(a, r, o, _next, _throw, "throw", n); } _next(void 0); }); }; }
function _classCallCheck(a, n) { if (!(a instanceof n)) throw new TypeError("Cannot call a class as a function"); }
function _defineProperties(e, r) { for (var t = 0; t < r.length; t++) { var o = r[t]; o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(e, _toPropertyKey(o.key), o); } }
function _createClass(e, r, t) { return r && _defineProperties(e.prototype, r), t && _defineProperties(e, t), Object.defineProperty(e, "prototype", { writable: !1 }), e; }
function _toPropertyKey(t) { var i = _toPrimitive(t, "string"); return "symbol" == typeof i ? i : i + ""; }
function _toPrimitive(t, r) { if ("object" != typeof t || !t) return t; var e = t[Symbol.toPrimitive]; if (void 0 !== e) { var i = e.call(t, r || "default"); if ("object" != typeof i) return i; throw new TypeError("@@toPrimitive must return a primitive value."); } return ("string" === r ? String : Number)(t); }
function _callSuper(t, o, e) { return o = _getPrototypeOf(o), _possibleConstructorReturn(t, _isNativeReflectConstruct() ? Reflect.construct(o, e || [], _getPrototypeOf(t).constructor) : o.apply(t, e)); }
function _possibleConstructorReturn(t, e) { if (e && ("object" == typeof e || "function" == typeof e)) return e; if (void 0 !== e) throw new TypeError("Derived constructors may only return object or undefined"); return _assertThisInitialized(t); }
function _assertThisInitialized(e) { if (void 0 === e) throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); return e; }
function _isNativeReflectConstruct() { try { var t = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); } catch (t) {} return (_isNativeReflectConstruct = function _isNativeReflectConstruct() { return !!t; })(); }
function _getPrototypeOf(t) { return _getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf.bind() : function (t) { return t.__proto__ || Object.getPrototypeOf(t); }, _getPrototypeOf(t); }
function _inherits(t, e) { if ("function" != typeof e && null !== e) throw new TypeError("Super expression must either be null or a function"); t.prototype = Object.create(e && e.prototype, { constructor: { value: t, writable: !0, configurable: !0 } }), Object.defineProperty(t, "prototype", { writable: !1 }), e && _setPrototypeOf(t, e); }
function _setPrototypeOf(t, e) { return _setPrototypeOf = Object.setPrototypeOf ? Object.setPrototypeOf.bind() : function (t, e) { return t.__proto__ = e, t; }, _setPrototypeOf(t, e); }

var _default = /*#__PURE__*/function (_Controller) {
  function _default() {
    _classCallCheck(this, _default);
    return _callSuper(this, _default, arguments);
  }
  _inherits(_default, _Controller);
  return _createClass(_default, [{
    key: "submitAdd",
    value: function () {
      var _submitAdd = _asyncToGenerator(/*#__PURE__*/_regeneratorRuntime().mark(function _callee(event) {
        var _this = this;
        var inp, barcode, formData, response, data;
        return _regeneratorRuntime().wrap(function _callee$(_context) {
          while (1) switch (_context.prev = _context.next) {
            case 0:
              event.preventDefault();
              inp = document.getElementById("barcode");
              barcode = inp.value;
              if (barcode) {
                _context.next = 5;
                break;
              }
              return _context.abrupt("return", this.showError("Please enter barcode."));
            case 5:
              if (!(barcode.length < 12 || barcode.length > 13)) {
                _context.next = 7;
                break;
              }
              return _context.abrupt("return", this.showError("barcode minimum and maximum length is 12 and 13 respectively."));
            case 7:
              formData = new FormData();
              formData.append("bit_record[barcode]", barcode);
              _context.prev = 9;
              _context.next = 12;
              return fetch("/insert_barcode", {
                method: "POST",
                body: formData,
                headers: {
                  "Accept": "application/json"
                }
              });
            case 12:
              response = _context.sent;
              _context.next = 15;
              return response.json();
            case 15:
              data = _context.sent;
              if (Array.isArray(data.bit_records)) {
                document.getElementById("barcode").value = "";
                data.bit_records.forEach(function (record) {
                  _this.displayTarget.insertAdjacentHTML("afterbegin", "\n               <tr>\n                <td>".concat(record.bit_rec.barcode, "</td>\n                <td>").concat(record.bit_rec.status, "</td>\n                <td>").concat(record.bit_rec.source, "</td>\n                <td>").concat(record.bit_rec.user_id, "</td>\n                <td>").concat(_this.formatDate(record.bit_rec.created_at), "</td>\n                <td>").concat(record.message, "</td>\n              </tr>\n            "));
                });
              }
              if (data.error) this.showError(data.error);
              _context.next = 24;
              break;
            case 20:
              _context.prev = 20;
              _context.t0 = _context["catch"](9);
              this.showError("An error occurred while uploading.");
              console.error("Upload failed", _context.t0);
            case 24:
            case "end":
              return _context.stop();
          }
        }, _callee, this, [[9, 20]]);
      }));
      function submitAdd(_x) {
        return _submitAdd.apply(this, arguments);
      }
      return submitAdd;
    }()
  }, {
    key: "handleLoad",
    value: function () {
      var _handleLoad = _asyncToGenerator(/*#__PURE__*/_regeneratorRuntime().mark(function _callee2(event) {
        var _this2 = this;
        var file, formData, response, data;
        return _regeneratorRuntime().wrap(function _callee2$(_context2) {
          while (1) switch (_context2.prev = _context2.next) {
            case 0:
              event.preventDefault();
              file = document.getElementById("fileinput").files[0];
              if (file) {
                _context2.next = 4;
                break;
              }
              return _context2.abrupt("return", this.showError("Please choose a file to load."));
            case 4:
              formData = new FormData();
              formData.append("bit_record[file]", file);
              _context2.prev = 6;
              _context2.next = 9;
              return fetch("/insert_barcode", {
                method: "POST",
                body: formData,
                headers: {
                  "Accept": "application/json"
                }
              });
            case 9:
              response = _context2.sent;
              _context2.next = 12;
              return response.json();
            case 12:
              data = _context2.sent;
              console.log("res", data);
              if (Array.isArray(data.bit_records)) {
                data.bit_records.forEach(function (record) {
                  _this2.displayTarget.insertAdjacentHTML("afterbegin", "\n             <tr>\n              <td>".concat(record.bit_rec.barcode, "</td>\n              <td>").concat(record.bit_rec.status, "</td>\n              <td>").concat(record.bit_rec.source, "</td>\n              <td>").concat(record.bit_rec.user_id, "</td>\n              <td>").concat(_this2.formatDate(record.bit_rec.created_at), "</td>\n              <td>").concat(record.message, "</td>\n            </tr>\n          "));
                });
              }
              if (data.error) this.showError(data.error);
              _context2.next = 22;
              break;
            case 18:
              _context2.prev = 18;
              _context2.t0 = _context2["catch"](6);
              this.showError("An error occurred while uploading.");
              console.error("Upload failed", _context2.t0);
            case 22:
            case "end":
              return _context2.stop();
          }
        }, _callee2, this, [[6, 18]]);
      }));
      function handleLoad(_x2) {
        return _handleLoad.apply(this, arguments);
      }
      return handleLoad;
    }()
  }, {
    key: "showError",
    value: function showError(message) {
      document.getElementById("barcode-error").textContent = message;
      document.getElementById("barcode-error").classList.remove("d-none");
      setTimeout(function () {
        document.getElementById("barcode-error").classList.add("d-none");
        document.getElementById("barcode-error").textContent = "";
      }, 5000);
    }
  }, {
    key: "formatDate",
    value: function formatDate(timestamp) {
      var date = new Date(timestamp);
      var day = String(date.getDate()).padStart(2, '0');
      var month = String(date.getMonth() + 1).padStart(2, '0');
      var year = date.getFullYear();
      return "".concat(day, "/").concat(month, "/").concat(year);
    }
  }]);
}(_hotwired_stimulus__WEBPACK_IMPORTED_MODULE_0__["Controller"]);
_default.targets = ["barcodeInput", "fileInput", "display"];


/***/ }),

/***/ "./app/javascript/controllers/company_select_controller.js":
/*!*****************************************************************!*\
  !*** ./app/javascript/controllers/company_select_controller.js ***!
  \*****************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "default", function() { return _default; });
/* harmony import */ var stimulus__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! stimulus */ "./node_modules/stimulus/dist/stimulus.js");
/* harmony import */ var tom_select__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! tom-select */ "./node_modules/tom-select/dist/js/tom-select.complete.js");
/* harmony import */ var tom_select__WEBPACK_IMPORTED_MODULE_1___default = /*#__PURE__*/__webpack_require__.n(tom_select__WEBPACK_IMPORTED_MODULE_1__);
function _classCallCheck(a, n) { if (!(a instanceof n)) throw new TypeError("Cannot call a class as a function"); }
function _defineProperties(e, r) { for (var t = 0; t < r.length; t++) { var o = r[t]; o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(e, _toPropertyKey(o.key), o); } }
function _createClass(e, r, t) { return r && _defineProperties(e.prototype, r), t && _defineProperties(e, t), Object.defineProperty(e, "prototype", { writable: !1 }), e; }
function _toPropertyKey(t) { var i = _toPrimitive(t, "string"); return "symbol" == typeof i ? i : i + ""; }
function _toPrimitive(t, r) { if ("object" != typeof t || !t) return t; var e = t[Symbol.toPrimitive]; if (void 0 !== e) { var i = e.call(t, r || "default"); if ("object" != typeof i) return i; throw new TypeError("@@toPrimitive must return a primitive value."); } return ("string" === r ? String : Number)(t); }
function _callSuper(t, o, e) { return o = _getPrototypeOf(o), _possibleConstructorReturn(t, _isNativeReflectConstruct() ? Reflect.construct(o, e || [], _getPrototypeOf(t).constructor) : o.apply(t, e)); }
function _possibleConstructorReturn(t, e) { if (e && ("object" == typeof e || "function" == typeof e)) return e; if (void 0 !== e) throw new TypeError("Derived constructors may only return object or undefined"); return _assertThisInitialized(t); }
function _assertThisInitialized(e) { if (void 0 === e) throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); return e; }
function _isNativeReflectConstruct() { try { var t = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); } catch (t) {} return (_isNativeReflectConstruct = function _isNativeReflectConstruct() { return !!t; })(); }
function _getPrototypeOf(t) { return _getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf.bind() : function (t) { return t.__proto__ || Object.getPrototypeOf(t); }, _getPrototypeOf(t); }
function _inherits(t, e) { if ("function" != typeof e && null !== e) throw new TypeError("Super expression must either be null or a function"); t.prototype = Object.create(e && e.prototype, { constructor: { value: t, writable: !0, configurable: !0 } }), Object.defineProperty(t, "prototype", { writable: !1 }), e && _setPrototypeOf(t, e); }
function _setPrototypeOf(t, e) { return _setPrototypeOf = Object.setPrototypeOf ? Object.setPrototypeOf.bind() : function (t, e) { return t.__proto__ = e, t; }, _setPrototypeOf(t, e); }


var _default = /*#__PURE__*/function (_Controller) {
  function _default() {
    _classCallCheck(this, _default);
    return _callSuper(this, _default, arguments);
  }
  _inherits(_default, _Controller);
  return _createClass(_default, [{
    key: "connect",
    value: function connect() {
      if (this.selectInstance) return;
      this.selectInstance = new tom_select__WEBPACK_IMPORTED_MODULE_1___default.a(this.element, {
        valueField: 'id',
        labelField: 'name',
        searchField: 'name',
        create: false,
        //persist: false,
        hideSelected: true,
        placeholder: 'Search for a company',
        load: function load(query, callback) {
          if (!query.length) return callback();
          fetch("/companies_search?q=".concat(encodeURIComponent(query))).then(function (response) {
            return response.json();
          }).then(function (json) {
            return callback(json);
          })["catch"](function () {
            return callback();
          });
        }
      });
    }
  }, {
    key: "disconnect",
    value: function disconnect() {
      if (this.selectInstance) {
        this.selectInstance.destroy();
        this.selectInstance = null;
      }
    }
  }]);
}(stimulus__WEBPACK_IMPORTED_MODULE_0__["Controller"]);


/***/ }),

/***/ "./app/javascript/controllers/index.js":
/*!*********************************************!*\
  !*** ./app/javascript/controllers/index.js ***!
  \*********************************************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var stimulus__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! stimulus */ "./node_modules/stimulus/dist/stimulus.js");
/* harmony import */ var stimulus_webpack_helpers__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! stimulus/webpack-helpers */ "./node_modules/stimulus/webpack-helpers.js");
// Load all Stimulus controllers


var application = stimulus__WEBPACK_IMPORTED_MODULE_0__["Application"].start();
var context = __webpack_require__("./app/javascript/controllers sync recursive \\.js$");
application.load(Object(stimulus_webpack_helpers__WEBPACK_IMPORTED_MODULE_1__["definitionsFromContext"])(context));

/***/ }),

/***/ "./app/javascript/controllers/product_classification_controller.js":
/*!*************************************************************************!*\
  !*** ./app/javascript/controllers/product_classification_controller.js ***!
  \*************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "default", function() { return _default; });
/* harmony import */ var stimulus__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! stimulus */ "./node_modules/stimulus/dist/stimulus.js");
/* harmony import */ var tom_select__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! tom-select */ "./node_modules/tom-select/dist/js/tom-select.complete.js");
/* harmony import */ var tom_select__WEBPACK_IMPORTED_MODULE_1___default = /*#__PURE__*/__webpack_require__.n(tom_select__WEBPACK_IMPORTED_MODULE_1__);
function _regeneratorRuntime() { "use strict"; /*! regenerator-runtime -- Copyright (c) 2014-present, Facebook, Inc. -- license (MIT): https://github.com/facebook/regenerator/blob/main/LICENSE */ _regeneratorRuntime = function _regeneratorRuntime() { return e; }; var t, e = {}, r = Object.prototype, n = r.hasOwnProperty, o = Object.defineProperty || function (t, e, r) { t[e] = r.value; }, i = "function" == typeof Symbol ? Symbol : {}, a = i.iterator || "@@iterator", c = i.asyncIterator || "@@asyncIterator", u = i.toStringTag || "@@toStringTag"; function define(t, e, r) { return Object.defineProperty(t, e, { value: r, enumerable: !0, configurable: !0, writable: !0 }), t[e]; } try { define({}, ""); } catch (t) { define = function define(t, e, r) { return t[e] = r; }; } function wrap(t, e, r, n) { var i = e && e.prototype instanceof Generator ? e : Generator, a = Object.create(i.prototype), c = new Context(n || []); return o(a, "_invoke", { value: makeInvokeMethod(t, r, c) }), a; } function tryCatch(t, e, r) { try { return { type: "normal", arg: t.call(e, r) }; } catch (t) { return { type: "throw", arg: t }; } } e.wrap = wrap; var h = "suspendedStart", l = "suspendedYield", f = "executing", s = "completed", y = {}; function Generator() {} function GeneratorFunction() {} function GeneratorFunctionPrototype() {} var p = {}; define(p, a, function () { return this; }); var d = Object.getPrototypeOf, v = d && d(d(values([]))); v && v !== r && n.call(v, a) && (p = v); var g = GeneratorFunctionPrototype.prototype = Generator.prototype = Object.create(p); function defineIteratorMethods(t) { ["next", "throw", "return"].forEach(function (e) { define(t, e, function (t) { return this._invoke(e, t); }); }); } function AsyncIterator(t, e) { function invoke(r, o, i, a) { var c = tryCatch(t[r], t, o); if ("throw" !== c.type) { var u = c.arg, h = u.value; return h && "object" == typeof h && n.call(h, "__await") ? e.resolve(h.__await).then(function (t) { invoke("next", t, i, a); }, function (t) { invoke("throw", t, i, a); }) : e.resolve(h).then(function (t) { u.value = t, i(u); }, function (t) { return invoke("throw", t, i, a); }); } a(c.arg); } var r; o(this, "_invoke", { value: function value(t, n) { function callInvokeWithMethodAndArg() { return new e(function (e, r) { invoke(t, n, e, r); }); } return r = r ? r.then(callInvokeWithMethodAndArg, callInvokeWithMethodAndArg) : callInvokeWithMethodAndArg(); } }); } function makeInvokeMethod(e, r, n) { var o = h; return function (i, a) { if (o === f) throw Error("Generator is already running"); if (o === s) { if ("throw" === i) throw a; return { value: t, done: !0 }; } for (n.method = i, n.arg = a;;) { var c = n.delegate; if (c) { var u = maybeInvokeDelegate(c, n); if (u) { if (u === y) continue; return u; } } if ("next" === n.method) n.sent = n._sent = n.arg;else if ("throw" === n.method) { if (o === h) throw o = s, n.arg; n.dispatchException(n.arg); } else "return" === n.method && n.abrupt("return", n.arg); o = f; var p = tryCatch(e, r, n); if ("normal" === p.type) { if (o = n.done ? s : l, p.arg === y) continue; return { value: p.arg, done: n.done }; } "throw" === p.type && (o = s, n.method = "throw", n.arg = p.arg); } }; } function maybeInvokeDelegate(e, r) { var n = r.method, o = e.iterator[n]; if (o === t) return r.delegate = null, "throw" === n && e.iterator["return"] && (r.method = "return", r.arg = t, maybeInvokeDelegate(e, r), "throw" === r.method) || "return" !== n && (r.method = "throw", r.arg = new TypeError("The iterator does not provide a '" + n + "' method")), y; var i = tryCatch(o, e.iterator, r.arg); if ("throw" === i.type) return r.method = "throw", r.arg = i.arg, r.delegate = null, y; var a = i.arg; return a ? a.done ? (r[e.resultName] = a.value, r.next = e.nextLoc, "return" !== r.method && (r.method = "next", r.arg = t), r.delegate = null, y) : a : (r.method = "throw", r.arg = new TypeError("iterator result is not an object"), r.delegate = null, y); } function pushTryEntry(t) { var e = { tryLoc: t[0] }; 1 in t && (e.catchLoc = t[1]), 2 in t && (e.finallyLoc = t[2], e.afterLoc = t[3]), this.tryEntries.push(e); } function resetTryEntry(t) { var e = t.completion || {}; e.type = "normal", delete e.arg, t.completion = e; } function Context(t) { this.tryEntries = [{ tryLoc: "root" }], t.forEach(pushTryEntry, this), this.reset(!0); } function values(e) { if (e || "" === e) { var r = e[a]; if (r) return r.call(e); if ("function" == typeof e.next) return e; if (!isNaN(e.length)) { var o = -1, i = function next() { for (; ++o < e.length;) if (n.call(e, o)) return next.value = e[o], next.done = !1, next; return next.value = t, next.done = !0, next; }; return i.next = i; } } throw new TypeError(typeof e + " is not iterable"); } return GeneratorFunction.prototype = GeneratorFunctionPrototype, o(g, "constructor", { value: GeneratorFunctionPrototype, configurable: !0 }), o(GeneratorFunctionPrototype, "constructor", { value: GeneratorFunction, configurable: !0 }), GeneratorFunction.displayName = define(GeneratorFunctionPrototype, u, "GeneratorFunction"), e.isGeneratorFunction = function (t) { var e = "function" == typeof t && t.constructor; return !!e && (e === GeneratorFunction || "GeneratorFunction" === (e.displayName || e.name)); }, e.mark = function (t) { return Object.setPrototypeOf ? Object.setPrototypeOf(t, GeneratorFunctionPrototype) : (t.__proto__ = GeneratorFunctionPrototype, define(t, u, "GeneratorFunction")), t.prototype = Object.create(g), t; }, e.awrap = function (t) { return { __await: t }; }, defineIteratorMethods(AsyncIterator.prototype), define(AsyncIterator.prototype, c, function () { return this; }), e.AsyncIterator = AsyncIterator, e.async = function (t, r, n, o, i) { void 0 === i && (i = Promise); var a = new AsyncIterator(wrap(t, r, n, o), i); return e.isGeneratorFunction(r) ? a : a.next().then(function (t) { return t.done ? t.value : a.next(); }); }, defineIteratorMethods(g), define(g, u, "Generator"), define(g, a, function () { return this; }), define(g, "toString", function () { return "[object Generator]"; }), e.keys = function (t) { var e = Object(t), r = []; for (var n in e) r.push(n); return r.reverse(), function next() { for (; r.length;) { var t = r.pop(); if (t in e) return next.value = t, next.done = !1, next; } return next.done = !0, next; }; }, e.values = values, Context.prototype = { constructor: Context, reset: function reset(e) { if (this.prev = 0, this.next = 0, this.sent = this._sent = t, this.done = !1, this.delegate = null, this.method = "next", this.arg = t, this.tryEntries.forEach(resetTryEntry), !e) for (var r in this) "t" === r.charAt(0) && n.call(this, r) && !isNaN(+r.slice(1)) && (this[r] = t); }, stop: function stop() { this.done = !0; var t = this.tryEntries[0].completion; if ("throw" === t.type) throw t.arg; return this.rval; }, dispatchException: function dispatchException(e) { if (this.done) throw e; var r = this; function handle(n, o) { return a.type = "throw", a.arg = e, r.next = n, o && (r.method = "next", r.arg = t), !!o; } for (var o = this.tryEntries.length - 1; o >= 0; --o) { var i = this.tryEntries[o], a = i.completion; if ("root" === i.tryLoc) return handle("end"); if (i.tryLoc <= this.prev) { var c = n.call(i, "catchLoc"), u = n.call(i, "finallyLoc"); if (c && u) { if (this.prev < i.catchLoc) return handle(i.catchLoc, !0); if (this.prev < i.finallyLoc) return handle(i.finallyLoc); } else if (c) { if (this.prev < i.catchLoc) return handle(i.catchLoc, !0); } else { if (!u) throw Error("try statement without catch or finally"); if (this.prev < i.finallyLoc) return handle(i.finallyLoc); } } } }, abrupt: function abrupt(t, e) { for (var r = this.tryEntries.length - 1; r >= 0; --r) { var o = this.tryEntries[r]; if (o.tryLoc <= this.prev && n.call(o, "finallyLoc") && this.prev < o.finallyLoc) { var i = o; break; } } i && ("break" === t || "continue" === t) && i.tryLoc <= e && e <= i.finallyLoc && (i = null); var a = i ? i.completion : {}; return a.type = t, a.arg = e, i ? (this.method = "next", this.next = i.finallyLoc, y) : this.complete(a); }, complete: function complete(t, e) { if ("throw" === t.type) throw t.arg; return "break" === t.type || "continue" === t.type ? this.next = t.arg : "return" === t.type ? (this.rval = this.arg = t.arg, this.method = "return", this.next = "end") : "normal" === t.type && e && (this.next = e), y; }, finish: function finish(t) { for (var e = this.tryEntries.length - 1; e >= 0; --e) { var r = this.tryEntries[e]; if (r.finallyLoc === t) return this.complete(r.completion, r.afterLoc), resetTryEntry(r), y; } }, "catch": function _catch(t) { for (var e = this.tryEntries.length - 1; e >= 0; --e) { var r = this.tryEntries[e]; if (r.tryLoc === t) { var n = r.completion; if ("throw" === n.type) { var o = n.arg; resetTryEntry(r); } return o; } } throw Error("illegal catch attempt"); }, delegateYield: function delegateYield(e, r, n) { return this.delegate = { iterator: values(e), resultName: r, nextLoc: n }, "next" === this.method && (this.arg = t), y; } }, e; }
function asyncGeneratorStep(n, t, e, r, o, a, c) { try { var i = n[a](c), u = i.value; } catch (n) { return void e(n); } i.done ? t(u) : Promise.resolve(u).then(r, o); }
function _asyncToGenerator(n) { return function () { var t = this, e = arguments; return new Promise(function (r, o) { var a = n.apply(t, e); function _next(n) { asyncGeneratorStep(a, r, o, _next, _throw, "next", n); } function _throw(n) { asyncGeneratorStep(a, r, o, _next, _throw, "throw", n); } _next(void 0); }); }; }
function _classCallCheck(a, n) { if (!(a instanceof n)) throw new TypeError("Cannot call a class as a function"); }
function _defineProperties(e, r) { for (var t = 0; t < r.length; t++) { var o = r[t]; o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(e, _toPropertyKey(o.key), o); } }
function _createClass(e, r, t) { return r && _defineProperties(e.prototype, r), t && _defineProperties(e, t), Object.defineProperty(e, "prototype", { writable: !1 }), e; }
function _toPropertyKey(t) { var i = _toPrimitive(t, "string"); return "symbol" == typeof i ? i : i + ""; }
function _toPrimitive(t, r) { if ("object" != typeof t || !t) return t; var e = t[Symbol.toPrimitive]; if (void 0 !== e) { var i = e.call(t, r || "default"); if ("object" != typeof i) return i; throw new TypeError("@@toPrimitive must return a primitive value."); } return ("string" === r ? String : Number)(t); }
function _callSuper(t, o, e) { return o = _getPrototypeOf(o), _possibleConstructorReturn(t, _isNativeReflectConstruct() ? Reflect.construct(o, e || [], _getPrototypeOf(t).constructor) : o.apply(t, e)); }
function _possibleConstructorReturn(t, e) { if (e && ("object" == typeof e || "function" == typeof e)) return e; if (void 0 !== e) throw new TypeError("Derived constructors may only return object or undefined"); return _assertThisInitialized(t); }
function _assertThisInitialized(e) { if (void 0 === e) throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); return e; }
function _isNativeReflectConstruct() { try { var t = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); } catch (t) {} return (_isNativeReflectConstruct = function _isNativeReflectConstruct() { return !!t; })(); }
function _getPrototypeOf(t) { return _getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf.bind() : function (t) { return t.__proto__ || Object.getPrototypeOf(t); }, _getPrototypeOf(t); }
function _inherits(t, e) { if ("function" != typeof e && null !== e) throw new TypeError("Super expression must either be null or a function"); t.prototype = Object.create(e && e.prototype, { constructor: { value: t, writable: !0, configurable: !0 } }), Object.defineProperty(t, "prototype", { writable: !1 }), e && _setPrototypeOf(t, e); }
function _setPrototypeOf(t, e) { return _setPrototypeOf = Object.setPrototypeOf ? Object.setPrototypeOf.bind() : function (t, e) { return t.__proto__ = e, t; }, _setPrototypeOf(t, e); }


var _default = /*#__PURE__*/function (_Controller) {
  function _default() {
    _classCallCheck(this, _default);
    return _callSuper(this, _default, arguments);
  }
  _inherits(_default, _Controller);
  return _createClass(_default, [{
    key: "connect",
    value: function connect() {
      var _this = this;
      if (document.readyState === "loading") {
        document.addEventListener("DOMContentLoaded", function () {
          return _this.initialize();
        });
      } else {
        this.initialize();
      }
    }
  }, {
    key: "initialize",
    value: function initialize() {
      var _this2 = this;
      console.log("Initializing...");
      if (!this.segmentSelect && this.hasSegmentTarget) {
        this.segmentSelect = new tom_select__WEBPACK_IMPORTED_MODULE_1___default.a(this.segmentTarget, {
          placeholder: "Select a segment",
          onChange: function onChange() {
            return _this2.updateFamilies();
          }
        });
      }
      if (!this.familySelect && this.hasFamilyTarget) {
        this.familySelect = new tom_select__WEBPACK_IMPORTED_MODULE_1___default.a(this.familyTarget, {
          placeholder: "Select a family",
          onChange: function onChange() {
            return _this2.updateKlasses();
          }
        });
      }
      if (!this.klassSelect && this.hasKlassTarget) {
        this.klassSelect = new tom_select__WEBPACK_IMPORTED_MODULE_1___default.a(this.klassTarget, {
          placeholder: "Select a klass",
          onChange: function onChange() {
            return _this2.updateBricks();
          }
        });
      }
      if (!this.brickSelect && this.hasBrickTarget) {
        this.brickSelect = new tom_select__WEBPACK_IMPORTED_MODULE_1___default.a(this.brickTarget, {
          placeholder: "Select a brick"
        });
      }
    }
  }, {
    key: "updateFamilies",
    value: function () {
      var _updateFamilies = _asyncToGenerator(/*#__PURE__*/_regeneratorRuntime().mark(function _callee() {
        var _this3 = this;
        var segmentId, response, families;
        return _regeneratorRuntime().wrap(function _callee$(_context) {
          while (1) switch (_context.prev = _context.next) {
            case 0:
              console.log("updating family...");
              segmentId = this.segmentTarget.value;
              if (segmentId) {
                _context.next = 5;
                break;
              }
              this.familySelect.clearOptions();
              return _context.abrupt("return");
            case 5:
              _context.prev = 5;
              _context.next = 8;
              return fetch("/families_by_segment?segment_id=".concat(segmentId));
            case 8:
              response = _context.sent;
              _context.next = 11;
              return response.json();
            case 11:
              families = _context.sent;
              console.log("families", families);
              this.familySelect.clearOptions();
              families.forEach(function (family) {
                _this3.familySelect.addOption({
                  value: family.id,
                  text: "".concat(family.code, " ").concat(family.title)
                });
              });
              this.familySelect.refreshOptions(false);
              _context.next = 21;
              break;
            case 18:
              _context.prev = 18;
              _context.t0 = _context["catch"](5);
              console.error("Error loading families:", _context.t0);
            case 21:
            case "end":
              return _context.stop();
          }
        }, _callee, this, [[5, 18]]);
      }));
      function updateFamilies() {
        return _updateFamilies.apply(this, arguments);
      }
      return updateFamilies;
    }()
  }, {
    key: "updateKlasses",
    value: function () {
      var _updateKlasses = _asyncToGenerator(/*#__PURE__*/_regeneratorRuntime().mark(function _callee2() {
        var _this4 = this;
        var familyId, response, klasses;
        return _regeneratorRuntime().wrap(function _callee2$(_context2) {
          while (1) switch (_context2.prev = _context2.next) {
            case 0:
              familyId = this.familyTarget.value;
              if (familyId) {
                _context2.next = 4;
                break;
              }
              this.klassSelect.clearOptions();
              return _context2.abrupt("return");
            case 4:
              _context2.prev = 4;
              _context2.next = 7;
              return fetch("/klasses_by_family?family_id=".concat(familyId));
            case 7:
              response = _context2.sent;
              _context2.next = 10;
              return response.json();
            case 10:
              klasses = _context2.sent;
              this.klassSelect.clearOptions();
              klasses.forEach(function (klass) {
                _this4.klassSelect.addOption({
                  value: klass.id,
                  text: "".concat(klass.code, " ").concat(klass.title)
                });
              });
              this.klassSelect.refreshOptions(false);
              _context2.next = 19;
              break;
            case 16:
              _context2.prev = 16;
              _context2.t0 = _context2["catch"](4);
              console.error("Error loading klasses:", _context2.t0);
            case 19:
            case "end":
              return _context2.stop();
          }
        }, _callee2, this, [[4, 16]]);
      }));
      function updateKlasses() {
        return _updateKlasses.apply(this, arguments);
      }
      return updateKlasses;
    }()
  }, {
    key: "updateBricks",
    value: function () {
      var _updateBricks = _asyncToGenerator(/*#__PURE__*/_regeneratorRuntime().mark(function _callee3() {
        var _this5 = this;
        var klassId, response, bricks;
        return _regeneratorRuntime().wrap(function _callee3$(_context3) {
          while (1) switch (_context3.prev = _context3.next) {
            case 0:
              klassId = this.klassTarget.value;
              if (klassId) {
                _context3.next = 4;
                break;
              }
              this.brickSelect.clearOptions();
              return _context3.abrupt("return");
            case 4:
              _context3.prev = 4;
              _context3.next = 7;
              return fetch("/bricks_by_klass?klass_id=".concat(klassId));
            case 7:
              response = _context3.sent;
              _context3.next = 10;
              return response.json();
            case 10:
              bricks = _context3.sent;
              this.brickSelect.clearOptions();
              bricks.forEach(function (brick) {
                _this5.brickSelect.addOption({
                  value: brick.id,
                  text: "".concat(brick.code, " ").concat(brick.title)
                });
              });
              this.brickSelect.refreshOptions(false);
              _context3.next = 19;
              break;
            case 16:
              _context3.prev = 16;
              _context3.t0 = _context3["catch"](4);
              console.error("Error loading bricks:", _context3.t0);
            case 19:
            case "end":
              return _context3.stop();
          }
        }, _callee3, this, [[4, 16]]);
      }));
      function updateBricks() {
        return _updateBricks.apply(this, arguments);
      }
      return updateBricks;
    }()
  }, {
    key: "disconnect",
    value: function disconnect() {
      var _this$segmentSelect, _this$familySelect, _this$klassSelect, _this$brickSelect;
      (_this$segmentSelect = this.segmentSelect) === null || _this$segmentSelect === void 0 || _this$segmentSelect.destroy();
      (_this$familySelect = this.familySelect) === null || _this$familySelect === void 0 || _this$familySelect.destroy();
      (_this$klassSelect = this.klassSelect) === null || _this$klassSelect === void 0 || _this$klassSelect.destroy();
      (_this$brickSelect = this.brickSelect) === null || _this$brickSelect === void 0 || _this$brickSelect.destroy();
      this.segmentSelect = null;
      this.familySelect = null;
      this.klassSelect = null;
      this.brickSelect = null;
    }
  }]);
}(stimulus__WEBPACK_IMPORTED_MODULE_0__["Controller"]);
_default.targets = ["segment", "family", "klass", "brick"];


/***/ }),

/***/ "./app/javascript/packs/application.js":
/*!*********************************************!*\
  !*** ./app/javascript/packs/application.js ***!
  \*********************************************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _rails_ujs__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @rails/ujs */ "./node_modules/@rails/ujs/lib/assets/compiled/rails-ujs.js");
/* harmony import */ var _rails_ujs__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(_rails_ujs__WEBPACK_IMPORTED_MODULE_0__);
/* harmony import */ var turbolinks__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! turbolinks */ "./node_modules/turbolinks/dist/turbolinks.js");
/* harmony import */ var turbolinks__WEBPACK_IMPORTED_MODULE_1___default = /*#__PURE__*/__webpack_require__.n(turbolinks__WEBPACK_IMPORTED_MODULE_1__);
/* harmony import */ var _rails_activestorage__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! @rails/activestorage */ "./node_modules/@rails/activestorage/app/assets/javascripts/activestorage.js");
/* harmony import */ var _rails_activestorage__WEBPACK_IMPORTED_MODULE_2___default = /*#__PURE__*/__webpack_require__.n(_rails_activestorage__WEBPACK_IMPORTED_MODULE_2__);
/* harmony import */ var channels__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! channels */ "./app/javascript/channels/index.js");
/* harmony import */ var channels__WEBPACK_IMPORTED_MODULE_3___default = /*#__PURE__*/__webpack_require__.n(channels__WEBPACK_IMPORTED_MODULE_3__);
/* harmony import */ var _controllers__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! ../controllers */ "./app/javascript/controllers/index.js");
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.






_rails_ujs__WEBPACK_IMPORTED_MODULE_0___default.a.start();
turbolinks__WEBPACK_IMPORTED_MODULE_1___default.a.start();
_rails_activestorage__WEBPACK_IMPORTED_MODULE_2__["start"]();

/***/ }),

/***/ "./node_modules/@hotwired/stimulus-webpack-helpers/dist/stimulus-webpack-helpers.js":
/*!******************************************************************************************!*\
  !*** ./node_modules/@hotwired/stimulus-webpack-helpers/dist/stimulus-webpack-helpers.js ***!
  \******************************************************************************************/
/*! exports provided: definitionForModuleAndIdentifier, definitionForModuleWithContextAndKey, definitionsFromContext, identifierForContextKey */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "definitionForModuleAndIdentifier", function() { return definitionForModuleAndIdentifier; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "definitionForModuleWithContextAndKey", function() { return definitionForModuleWithContextAndKey; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "definitionsFromContext", function() { return definitionsFromContext; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "identifierForContextKey", function() { return identifierForContextKey; });
/*
Stimulus Webpack Helpers 1.0.0
Copyright © 2021 Basecamp, LLC
 */
function definitionsFromContext(context) {
  return context.keys().map(key => definitionForModuleWithContextAndKey(context, key)).filter(value => value);
}
function definitionForModuleWithContextAndKey(context, key) {
  const identifier = identifierForContextKey(key);
  if (identifier) {
    return definitionForModuleAndIdentifier(context(key), identifier);
  }
}
function definitionForModuleAndIdentifier(module, identifier) {
  const controllerConstructor = module.default;
  if (typeof controllerConstructor == "function") {
    return {
      identifier,
      controllerConstructor
    };
  }
}
function identifierForContextKey(key) {
  const logicalName = (key.match(/^(?:\.\/)?(.+)(?:[_-]controller\..+?)$/) || [])[1];
  if (logicalName) {
    return logicalName.replace(/_/g, "-").replace(/\//g, "--");
  }
}


/***/ }),

/***/ "./node_modules/@hotwired/stimulus/dist/stimulus.js":
/*!**********************************************************!*\
  !*** ./node_modules/@hotwired/stimulus/dist/stimulus.js ***!
  \**********************************************************/
/*! exports provided: Application, AttributeObserver, Context, Controller, ElementObserver, IndexedMultimap, Multimap, SelectorObserver, StringMapObserver, TokenListObserver, ValueListObserver, add, defaultSchema, del, fetch, prune */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "Application", function() { return Application; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "AttributeObserver", function() { return AttributeObserver; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "Context", function() { return Context; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "Controller", function() { return Controller; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "ElementObserver", function() { return ElementObserver; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "IndexedMultimap", function() { return IndexedMultimap; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "Multimap", function() { return Multimap; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "SelectorObserver", function() { return SelectorObserver; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "StringMapObserver", function() { return StringMapObserver; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "TokenListObserver", function() { return TokenListObserver; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "ValueListObserver", function() { return ValueListObserver; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "add", function() { return add; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "defaultSchema", function() { return defaultSchema; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "del", function() { return del; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "fetch", function() { return fetch; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "prune", function() { return prune; });
function _slicedToArray(r, e) { return _arrayWithHoles(r) || _iterableToArrayLimit(r, e) || _unsupportedIterableToArray(r, e) || _nonIterableRest(); }
function _nonIterableRest() { throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); }
function _iterableToArrayLimit(r, l) { var t = null == r ? null : "undefined" != typeof Symbol && r[Symbol.iterator] || r["@@iterator"]; if (null != t) { var e, n, i, u, a = [], f = !0, o = !1; try { if (i = (t = t.call(r)).next, 0 === l) { if (Object(t) !== t) return; f = !1; } else for (; !(f = (e = i.call(t)).done) && (a.push(e.value), a.length !== l); f = !0); } catch (r) { o = !0, n = r; } finally { try { if (!f && null != t.return && (u = t.return(), Object(u) !== u)) return; } finally { if (o) throw n; } } return a; } }
function _arrayWithHoles(r) { if (Array.isArray(r)) return r; }
function _createForOfIteratorHelper(r, e) { var t = "undefined" != typeof Symbol && r[Symbol.iterator] || r["@@iterator"]; if (!t) { if (Array.isArray(r) || (t = _unsupportedIterableToArray(r)) || e && r && "number" == typeof r.length) { t && (r = t); var n = 0, F = function () {}; return { s: F, n: function () { return n >= r.length ? { done: !0 } : { done: !1, value: r[n++] }; }, e: function (r) { throw r; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var o, a = !0, u = !1; return { s: function () { t = t.call(r); }, n: function () { var r = t.next(); return a = r.done, r; }, e: function (r) { u = !0, o = r; }, f: function () { try { a || null == t.return || t.return(); } finally { if (u) throw o; } } }; }
function _unsupportedIterableToArray(r, a) { if (r) { if ("string" == typeof r) return _arrayLikeToArray(r, a); var t = {}.toString.call(r).slice(8, -1); return "Object" === t && r.constructor && (t = r.constructor.name), "Map" === t || "Set" === t ? Array.from(r) : "Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t) ? _arrayLikeToArray(r, a) : void 0; } }
function _arrayLikeToArray(r, a) { (null == a || a > r.length) && (a = r.length); for (var e = 0, n = Array(a); e < a; e++) n[e] = r[e]; return n; }
/*
Stimulus 3.2.1
Copyright © 2023 Basecamp, LLC
 */
class EventListener {
  constructor(eventTarget, eventName, eventOptions) {
    this.eventTarget = eventTarget;
    this.eventName = eventName;
    this.eventOptions = eventOptions;
    this.unorderedBindings = new Set();
  }
  connect() {
    this.eventTarget.addEventListener(this.eventName, this, this.eventOptions);
  }
  disconnect() {
    this.eventTarget.removeEventListener(this.eventName, this, this.eventOptions);
  }
  bindingConnected(binding) {
    this.unorderedBindings.add(binding);
  }
  bindingDisconnected(binding) {
    this.unorderedBindings.delete(binding);
  }
  handleEvent(event) {
    const extendedEvent = extendEvent(event);
    var _iterator = _createForOfIteratorHelper(this.bindings),
      _step;
    try {
      for (_iterator.s(); !(_step = _iterator.n()).done;) {
        const binding = _step.value;
        if (extendedEvent.immediatePropagationStopped) {
          break;
        } else {
          binding.handleEvent(extendedEvent);
        }
      }
    } catch (err) {
      _iterator.e(err);
    } finally {
      _iterator.f();
    }
  }
  hasBindings() {
    return this.unorderedBindings.size > 0;
  }
  get bindings() {
    return Array.from(this.unorderedBindings).sort((left, right) => {
      const leftIndex = left.index,
        rightIndex = right.index;
      return leftIndex < rightIndex ? -1 : leftIndex > rightIndex ? 1 : 0;
    });
  }
}
function extendEvent(event) {
  if ("immediatePropagationStopped" in event) {
    return event;
  } else {
    const stopImmediatePropagation = event.stopImmediatePropagation;
    return Object.assign(event, {
      immediatePropagationStopped: false,
      stopImmediatePropagation() {
        this.immediatePropagationStopped = true;
        stopImmediatePropagation.call(this);
      }
    });
  }
}
class Dispatcher {
  constructor(application) {
    this.application = application;
    this.eventListenerMaps = new Map();
    this.started = false;
  }
  start() {
    if (!this.started) {
      this.started = true;
      this.eventListeners.forEach(eventListener => eventListener.connect());
    }
  }
  stop() {
    if (this.started) {
      this.started = false;
      this.eventListeners.forEach(eventListener => eventListener.disconnect());
    }
  }
  get eventListeners() {
    return Array.from(this.eventListenerMaps.values()).reduce((listeners, map) => listeners.concat(Array.from(map.values())), []);
  }
  bindingConnected(binding) {
    this.fetchEventListenerForBinding(binding).bindingConnected(binding);
  }
  bindingDisconnected(binding) {
    let clearEventListeners = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : false;
    this.fetchEventListenerForBinding(binding).bindingDisconnected(binding);
    if (clearEventListeners) this.clearEventListenersForBinding(binding);
  }
  handleError(error, message) {
    let detail = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : {};
    this.application.handleError(error, `Error ${message}`, detail);
  }
  clearEventListenersForBinding(binding) {
    const eventListener = this.fetchEventListenerForBinding(binding);
    if (!eventListener.hasBindings()) {
      eventListener.disconnect();
      this.removeMappedEventListenerFor(binding);
    }
  }
  removeMappedEventListenerFor(binding) {
    const eventTarget = binding.eventTarget,
      eventName = binding.eventName,
      eventOptions = binding.eventOptions;
    const eventListenerMap = this.fetchEventListenerMapForEventTarget(eventTarget);
    const cacheKey = this.cacheKey(eventName, eventOptions);
    eventListenerMap.delete(cacheKey);
    if (eventListenerMap.size == 0) this.eventListenerMaps.delete(eventTarget);
  }
  fetchEventListenerForBinding(binding) {
    const eventTarget = binding.eventTarget,
      eventName = binding.eventName,
      eventOptions = binding.eventOptions;
    return this.fetchEventListener(eventTarget, eventName, eventOptions);
  }
  fetchEventListener(eventTarget, eventName, eventOptions) {
    const eventListenerMap = this.fetchEventListenerMapForEventTarget(eventTarget);
    const cacheKey = this.cacheKey(eventName, eventOptions);
    let eventListener = eventListenerMap.get(cacheKey);
    if (!eventListener) {
      eventListener = this.createEventListener(eventTarget, eventName, eventOptions);
      eventListenerMap.set(cacheKey, eventListener);
    }
    return eventListener;
  }
  createEventListener(eventTarget, eventName, eventOptions) {
    const eventListener = new EventListener(eventTarget, eventName, eventOptions);
    if (this.started) {
      eventListener.connect();
    }
    return eventListener;
  }
  fetchEventListenerMapForEventTarget(eventTarget) {
    let eventListenerMap = this.eventListenerMaps.get(eventTarget);
    if (!eventListenerMap) {
      eventListenerMap = new Map();
      this.eventListenerMaps.set(eventTarget, eventListenerMap);
    }
    return eventListenerMap;
  }
  cacheKey(eventName, eventOptions) {
    const parts = [eventName];
    Object.keys(eventOptions).sort().forEach(key => {
      parts.push(`${eventOptions[key] ? "" : "!"}${key}`);
    });
    return parts.join(":");
  }
}
const defaultActionDescriptorFilters = {
  stop(_ref) {
    let event = _ref.event,
      value = _ref.value;
    if (value) event.stopPropagation();
    return true;
  },
  prevent(_ref2) {
    let event = _ref2.event,
      value = _ref2.value;
    if (value) event.preventDefault();
    return true;
  },
  self(_ref3) {
    let event = _ref3.event,
      value = _ref3.value,
      element = _ref3.element;
    if (value) {
      return element === event.target;
    } else {
      return true;
    }
  }
};
const descriptorPattern = /^(?:(?:([^.]+?)\+)?(.+?)(?:\.(.+?))?(?:@(window|document))?->)?(.+?)(?:#([^:]+?))(?::(.+))?$/;
function parseActionDescriptorString(descriptorString) {
  const source = descriptorString.trim();
  const matches = source.match(descriptorPattern) || [];
  let eventName = matches[2];
  let keyFilter = matches[3];
  if (keyFilter && !["keydown", "keyup", "keypress"].includes(eventName)) {
    eventName += `.${keyFilter}`;
    keyFilter = "";
  }
  return {
    eventTarget: parseEventTarget(matches[4]),
    eventName,
    eventOptions: matches[7] ? parseEventOptions(matches[7]) : {},
    identifier: matches[5],
    methodName: matches[6],
    keyFilter: matches[1] || keyFilter
  };
}
function parseEventTarget(eventTargetName) {
  if (eventTargetName == "window") {
    return window;
  } else if (eventTargetName == "document") {
    return document;
  }
}
function parseEventOptions(eventOptions) {
  return eventOptions.split(":").reduce((options, token) => Object.assign(options, {
    [token.replace(/^!/, "")]: !/^!/.test(token)
  }), {});
}
function stringifyEventTarget(eventTarget) {
  if (eventTarget == window) {
    return "window";
  } else if (eventTarget == document) {
    return "document";
  }
}
function camelize(value) {
  return value.replace(/(?:[_-])([a-z0-9])/g, (_, char) => char.toUpperCase());
}
function namespaceCamelize(value) {
  return camelize(value.replace(/--/g, "-").replace(/__/g, "_"));
}
function capitalize(value) {
  return value.charAt(0).toUpperCase() + value.slice(1);
}
function dasherize(value) {
  return value.replace(/([A-Z])/g, (_, char) => `-${char.toLowerCase()}`);
}
function tokenize(value) {
  return value.match(/[^\s]+/g) || [];
}
function isSomething(object) {
  return object !== null && object !== undefined;
}
function hasProperty(object, property) {
  return Object.prototype.hasOwnProperty.call(object, property);
}
const allModifiers = ["meta", "ctrl", "alt", "shift"];
class Action {
  constructor(element, index, descriptor, schema) {
    this.element = element;
    this.index = index;
    this.eventTarget = descriptor.eventTarget || element;
    this.eventName = descriptor.eventName || getDefaultEventNameForElement(element) || error("missing event name");
    this.eventOptions = descriptor.eventOptions || {};
    this.identifier = descriptor.identifier || error("missing identifier");
    this.methodName = descriptor.methodName || error("missing method name");
    this.keyFilter = descriptor.keyFilter || "";
    this.schema = schema;
  }
  static forToken(token, schema) {
    return new this(token.element, token.index, parseActionDescriptorString(token.content), schema);
  }
  toString() {
    const eventFilter = this.keyFilter ? `.${this.keyFilter}` : "";
    const eventTarget = this.eventTargetName ? `@${this.eventTargetName}` : "";
    return `${this.eventName}${eventFilter}${eventTarget}->${this.identifier}#${this.methodName}`;
  }
  shouldIgnoreKeyboardEvent(event) {
    if (!this.keyFilter) {
      return false;
    }
    const filters = this.keyFilter.split("+");
    if (this.keyFilterDissatisfied(event, filters)) {
      return true;
    }
    const standardFilter = filters.filter(key => !allModifiers.includes(key))[0];
    if (!standardFilter) {
      return false;
    }
    if (!hasProperty(this.keyMappings, standardFilter)) {
      error(`contains unknown key filter: ${this.keyFilter}`);
    }
    return this.keyMappings[standardFilter].toLowerCase() !== event.key.toLowerCase();
  }
  shouldIgnoreMouseEvent(event) {
    if (!this.keyFilter) {
      return false;
    }
    const filters = [this.keyFilter];
    if (this.keyFilterDissatisfied(event, filters)) {
      return true;
    }
    return false;
  }
  get params() {
    const params = {};
    const pattern = new RegExp(`^data-${this.identifier}-(.+)-param$`, "i");
    for (var _i = 0, _Array$from = Array.from(this.element.attributes); _i < _Array$from.length; _i++) {
      const _Array$from$_i = _Array$from[_i],
        name = _Array$from$_i.name,
        value = _Array$from$_i.value;
      const match = name.match(pattern);
      const key = match && match[1];
      if (key) {
        params[camelize(key)] = typecast(value);
      }
    }
    return params;
  }
  get eventTargetName() {
    return stringifyEventTarget(this.eventTarget);
  }
  get keyMappings() {
    return this.schema.keyMappings;
  }
  keyFilterDissatisfied(event, filters) {
    const _allModifiers$map = allModifiers.map(modifier => filters.includes(modifier)),
      _allModifiers$map2 = _slicedToArray(_allModifiers$map, 4),
      meta = _allModifiers$map2[0],
      ctrl = _allModifiers$map2[1],
      alt = _allModifiers$map2[2],
      shift = _allModifiers$map2[3];
    return event.metaKey !== meta || event.ctrlKey !== ctrl || event.altKey !== alt || event.shiftKey !== shift;
  }
}
const defaultEventNames = {
  a: () => "click",
  button: () => "click",
  form: () => "submit",
  details: () => "toggle",
  input: e => e.getAttribute("type") == "submit" ? "click" : "input",
  select: () => "change",
  textarea: () => "input"
};
function getDefaultEventNameForElement(element) {
  const tagName = element.tagName.toLowerCase();
  if (tagName in defaultEventNames) {
    return defaultEventNames[tagName](element);
  }
}
function error(message) {
  throw new Error(message);
}
function typecast(value) {
  try {
    return JSON.parse(value);
  } catch (o_O) {
    return value;
  }
}
class Binding {
  constructor(context, action) {
    this.context = context;
    this.action = action;
  }
  get index() {
    return this.action.index;
  }
  get eventTarget() {
    return this.action.eventTarget;
  }
  get eventOptions() {
    return this.action.eventOptions;
  }
  get identifier() {
    return this.context.identifier;
  }
  handleEvent(event) {
    const actionEvent = this.prepareActionEvent(event);
    if (this.willBeInvokedByEvent(event) && this.applyEventModifiers(actionEvent)) {
      this.invokeWithEvent(actionEvent);
    }
  }
  get eventName() {
    return this.action.eventName;
  }
  get method() {
    const method = this.controller[this.methodName];
    if (typeof method == "function") {
      return method;
    }
    throw new Error(`Action "${this.action}" references undefined method "${this.methodName}"`);
  }
  applyEventModifiers(event) {
    const element = this.action.element;
    const actionDescriptorFilters = this.context.application.actionDescriptorFilters;
    const controller = this.context.controller;
    let passes = true;
    for (var _i2 = 0, _Object$entries = Object.entries(this.eventOptions); _i2 < _Object$entries.length; _i2++) {
      const _Object$entries$_i = _slicedToArray(_Object$entries[_i2], 2),
        name = _Object$entries$_i[0],
        value = _Object$entries$_i[1];
      if (name in actionDescriptorFilters) {
        const filter = actionDescriptorFilters[name];
        passes = passes && filter({
          name,
          value,
          event,
          element,
          controller
        });
      } else {
        continue;
      }
    }
    return passes;
  }
  prepareActionEvent(event) {
    return Object.assign(event, {
      params: this.action.params
    });
  }
  invokeWithEvent(event) {
    const target = event.target,
      currentTarget = event.currentTarget;
    try {
      this.method.call(this.controller, event);
      this.context.logDebugActivity(this.methodName, {
        event,
        target,
        currentTarget,
        action: this.methodName
      });
    } catch (error) {
      const identifier = this.identifier,
        controller = this.controller,
        element = this.element,
        index = this.index;
      const detail = {
        identifier,
        controller,
        element,
        index,
        event
      };
      this.context.handleError(error, `invoking action "${this.action}"`, detail);
    }
  }
  willBeInvokedByEvent(event) {
    const eventTarget = event.target;
    if (event instanceof KeyboardEvent && this.action.shouldIgnoreKeyboardEvent(event)) {
      return false;
    }
    if (event instanceof MouseEvent && this.action.shouldIgnoreMouseEvent(event)) {
      return false;
    }
    if (this.element === eventTarget) {
      return true;
    } else if (eventTarget instanceof Element && this.element.contains(eventTarget)) {
      return this.scope.containsElement(eventTarget);
    } else {
      return this.scope.containsElement(this.action.element);
    }
  }
  get controller() {
    return this.context.controller;
  }
  get methodName() {
    return this.action.methodName;
  }
  get element() {
    return this.scope.element;
  }
  get scope() {
    return this.context.scope;
  }
}
class ElementObserver {
  constructor(element, delegate) {
    this.mutationObserverInit = {
      attributes: true,
      childList: true,
      subtree: true
    };
    this.element = element;
    this.started = false;
    this.delegate = delegate;
    this.elements = new Set();
    this.mutationObserver = new MutationObserver(mutations => this.processMutations(mutations));
  }
  start() {
    if (!this.started) {
      this.started = true;
      this.mutationObserver.observe(this.element, this.mutationObserverInit);
      this.refresh();
    }
  }
  pause(callback) {
    if (this.started) {
      this.mutationObserver.disconnect();
      this.started = false;
    }
    callback();
    if (!this.started) {
      this.mutationObserver.observe(this.element, this.mutationObserverInit);
      this.started = true;
    }
  }
  stop() {
    if (this.started) {
      this.mutationObserver.takeRecords();
      this.mutationObserver.disconnect();
      this.started = false;
    }
  }
  refresh() {
    if (this.started) {
      const matches = new Set(this.matchElementsInTree());
      for (var _i3 = 0, _Array$from2 = Array.from(this.elements); _i3 < _Array$from2.length; _i3++) {
        const element = _Array$from2[_i3];
        if (!matches.has(element)) {
          this.removeElement(element);
        }
      }
      for (var _i4 = 0, _Array$from3 = Array.from(matches); _i4 < _Array$from3.length; _i4++) {
        const element = _Array$from3[_i4];
        this.addElement(element);
      }
    }
  }
  processMutations(mutations) {
    if (this.started) {
      var _iterator2 = _createForOfIteratorHelper(mutations),
        _step2;
      try {
        for (_iterator2.s(); !(_step2 = _iterator2.n()).done;) {
          const mutation = _step2.value;
          this.processMutation(mutation);
        }
      } catch (err) {
        _iterator2.e(err);
      } finally {
        _iterator2.f();
      }
    }
  }
  processMutation(mutation) {
    if (mutation.type == "attributes") {
      this.processAttributeChange(mutation.target, mutation.attributeName);
    } else if (mutation.type == "childList") {
      this.processRemovedNodes(mutation.removedNodes);
      this.processAddedNodes(mutation.addedNodes);
    }
  }
  processAttributeChange(element, attributeName) {
    if (this.elements.has(element)) {
      if (this.delegate.elementAttributeChanged && this.matchElement(element)) {
        this.delegate.elementAttributeChanged(element, attributeName);
      } else {
        this.removeElement(element);
      }
    } else if (this.matchElement(element)) {
      this.addElement(element);
    }
  }
  processRemovedNodes(nodes) {
    for (var _i5 = 0, _Array$from4 = Array.from(nodes); _i5 < _Array$from4.length; _i5++) {
      const node = _Array$from4[_i5];
      const element = this.elementFromNode(node);
      if (element) {
        this.processTree(element, this.removeElement);
      }
    }
  }
  processAddedNodes(nodes) {
    for (var _i6 = 0, _Array$from5 = Array.from(nodes); _i6 < _Array$from5.length; _i6++) {
      const node = _Array$from5[_i6];
      const element = this.elementFromNode(node);
      if (element && this.elementIsActive(element)) {
        this.processTree(element, this.addElement);
      }
    }
  }
  matchElement(element) {
    return this.delegate.matchElement(element);
  }
  matchElementsInTree() {
    let tree = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : this.element;
    return this.delegate.matchElementsInTree(tree);
  }
  processTree(tree, processor) {
    var _iterator3 = _createForOfIteratorHelper(this.matchElementsInTree(tree)),
      _step3;
    try {
      for (_iterator3.s(); !(_step3 = _iterator3.n()).done;) {
        const element = _step3.value;
        processor.call(this, element);
      }
    } catch (err) {
      _iterator3.e(err);
    } finally {
      _iterator3.f();
    }
  }
  elementFromNode(node) {
    if (node.nodeType == Node.ELEMENT_NODE) {
      return node;
    }
  }
  elementIsActive(element) {
    if (element.isConnected != this.element.isConnected) {
      return false;
    } else {
      return this.element.contains(element);
    }
  }
  addElement(element) {
    if (!this.elements.has(element)) {
      if (this.elementIsActive(element)) {
        this.elements.add(element);
        if (this.delegate.elementMatched) {
          this.delegate.elementMatched(element);
        }
      }
    }
  }
  removeElement(element) {
    if (this.elements.has(element)) {
      this.elements.delete(element);
      if (this.delegate.elementUnmatched) {
        this.delegate.elementUnmatched(element);
      }
    }
  }
}
class AttributeObserver {
  constructor(element, attributeName, delegate) {
    this.attributeName = attributeName;
    this.delegate = delegate;
    this.elementObserver = new ElementObserver(element, this);
  }
  get element() {
    return this.elementObserver.element;
  }
  get selector() {
    return `[${this.attributeName}]`;
  }
  start() {
    this.elementObserver.start();
  }
  pause(callback) {
    this.elementObserver.pause(callback);
  }
  stop() {
    this.elementObserver.stop();
  }
  refresh() {
    this.elementObserver.refresh();
  }
  get started() {
    return this.elementObserver.started;
  }
  matchElement(element) {
    return element.hasAttribute(this.attributeName);
  }
  matchElementsInTree(tree) {
    const match = this.matchElement(tree) ? [tree] : [];
    const matches = Array.from(tree.querySelectorAll(this.selector));
    return match.concat(matches);
  }
  elementMatched(element) {
    if (this.delegate.elementMatchedAttribute) {
      this.delegate.elementMatchedAttribute(element, this.attributeName);
    }
  }
  elementUnmatched(element) {
    if (this.delegate.elementUnmatchedAttribute) {
      this.delegate.elementUnmatchedAttribute(element, this.attributeName);
    }
  }
  elementAttributeChanged(element, attributeName) {
    if (this.delegate.elementAttributeValueChanged && this.attributeName == attributeName) {
      this.delegate.elementAttributeValueChanged(element, attributeName);
    }
  }
}
function add(map, key, value) {
  fetch(map, key).add(value);
}
function del(map, key, value) {
  fetch(map, key).delete(value);
  prune(map, key);
}
function fetch(map, key) {
  let values = map.get(key);
  if (!values) {
    values = new Set();
    map.set(key, values);
  }
  return values;
}
function prune(map, key) {
  const values = map.get(key);
  if (values != null && values.size == 0) {
    map.delete(key);
  }
}
class Multimap {
  constructor() {
    this.valuesByKey = new Map();
  }
  get keys() {
    return Array.from(this.valuesByKey.keys());
  }
  get values() {
    const sets = Array.from(this.valuesByKey.values());
    return sets.reduce((values, set) => values.concat(Array.from(set)), []);
  }
  get size() {
    const sets = Array.from(this.valuesByKey.values());
    return sets.reduce((size, set) => size + set.size, 0);
  }
  add(key, value) {
    add(this.valuesByKey, key, value);
  }
  delete(key, value) {
    del(this.valuesByKey, key, value);
  }
  has(key, value) {
    const values = this.valuesByKey.get(key);
    return values != null && values.has(value);
  }
  hasKey(key) {
    return this.valuesByKey.has(key);
  }
  hasValue(value) {
    const sets = Array.from(this.valuesByKey.values());
    return sets.some(set => set.has(value));
  }
  getValuesForKey(key) {
    const values = this.valuesByKey.get(key);
    return values ? Array.from(values) : [];
  }
  getKeysForValue(value) {
    return Array.from(this.valuesByKey).filter(_ref4 => {
      let _ref5 = _slicedToArray(_ref4, 2),
        _key = _ref5[0],
        values = _ref5[1];
      return values.has(value);
    }).map(_ref6 => {
      let _ref7 = _slicedToArray(_ref6, 2),
        key = _ref7[0],
        _values = _ref7[1];
      return key;
    });
  }
}
class IndexedMultimap extends Multimap {
  constructor() {
    super();
    this.keysByValue = new Map();
  }
  get values() {
    return Array.from(this.keysByValue.keys());
  }
  add(key, value) {
    super.add(key, value);
    add(this.keysByValue, value, key);
  }
  delete(key, value) {
    super.delete(key, value);
    del(this.keysByValue, value, key);
  }
  hasValue(value) {
    return this.keysByValue.has(value);
  }
  getKeysForValue(value) {
    const set = this.keysByValue.get(value);
    return set ? Array.from(set) : [];
  }
}
class SelectorObserver {
  constructor(element, selector, delegate, details) {
    this._selector = selector;
    this.details = details;
    this.elementObserver = new ElementObserver(element, this);
    this.delegate = delegate;
    this.matchesByElement = new Multimap();
  }
  get started() {
    return this.elementObserver.started;
  }
  get selector() {
    return this._selector;
  }
  set selector(selector) {
    this._selector = selector;
    this.refresh();
  }
  start() {
    this.elementObserver.start();
  }
  pause(callback) {
    this.elementObserver.pause(callback);
  }
  stop() {
    this.elementObserver.stop();
  }
  refresh() {
    this.elementObserver.refresh();
  }
  get element() {
    return this.elementObserver.element;
  }
  matchElement(element) {
    const selector = this.selector;
    if (selector) {
      const matches = element.matches(selector);
      if (this.delegate.selectorMatchElement) {
        return matches && this.delegate.selectorMatchElement(element, this.details);
      }
      return matches;
    } else {
      return false;
    }
  }
  matchElementsInTree(tree) {
    const selector = this.selector;
    if (selector) {
      const match = this.matchElement(tree) ? [tree] : [];
      const matches = Array.from(tree.querySelectorAll(selector)).filter(match => this.matchElement(match));
      return match.concat(matches);
    } else {
      return [];
    }
  }
  elementMatched(element) {
    const selector = this.selector;
    if (selector) {
      this.selectorMatched(element, selector);
    }
  }
  elementUnmatched(element) {
    const selectors = this.matchesByElement.getKeysForValue(element);
    var _iterator4 = _createForOfIteratorHelper(selectors),
      _step4;
    try {
      for (_iterator4.s(); !(_step4 = _iterator4.n()).done;) {
        const selector = _step4.value;
        this.selectorUnmatched(element, selector);
      }
    } catch (err) {
      _iterator4.e(err);
    } finally {
      _iterator4.f();
    }
  }
  elementAttributeChanged(element, _attributeName) {
    const selector = this.selector;
    if (selector) {
      const matches = this.matchElement(element);
      const matchedBefore = this.matchesByElement.has(selector, element);
      if (matches && !matchedBefore) {
        this.selectorMatched(element, selector);
      } else if (!matches && matchedBefore) {
        this.selectorUnmatched(element, selector);
      }
    }
  }
  selectorMatched(element, selector) {
    this.delegate.selectorMatched(element, selector, this.details);
    this.matchesByElement.add(selector, element);
  }
  selectorUnmatched(element, selector) {
    this.delegate.selectorUnmatched(element, selector, this.details);
    this.matchesByElement.delete(selector, element);
  }
}
class StringMapObserver {
  constructor(element, delegate) {
    this.element = element;
    this.delegate = delegate;
    this.started = false;
    this.stringMap = new Map();
    this.mutationObserver = new MutationObserver(mutations => this.processMutations(mutations));
  }
  start() {
    if (!this.started) {
      this.started = true;
      this.mutationObserver.observe(this.element, {
        attributes: true,
        attributeOldValue: true
      });
      this.refresh();
    }
  }
  stop() {
    if (this.started) {
      this.mutationObserver.takeRecords();
      this.mutationObserver.disconnect();
      this.started = false;
    }
  }
  refresh() {
    if (this.started) {
      var _iterator5 = _createForOfIteratorHelper(this.knownAttributeNames),
        _step5;
      try {
        for (_iterator5.s(); !(_step5 = _iterator5.n()).done;) {
          const attributeName = _step5.value;
          this.refreshAttribute(attributeName, null);
        }
      } catch (err) {
        _iterator5.e(err);
      } finally {
        _iterator5.f();
      }
    }
  }
  processMutations(mutations) {
    if (this.started) {
      var _iterator6 = _createForOfIteratorHelper(mutations),
        _step6;
      try {
        for (_iterator6.s(); !(_step6 = _iterator6.n()).done;) {
          const mutation = _step6.value;
          this.processMutation(mutation);
        }
      } catch (err) {
        _iterator6.e(err);
      } finally {
        _iterator6.f();
      }
    }
  }
  processMutation(mutation) {
    const attributeName = mutation.attributeName;
    if (attributeName) {
      this.refreshAttribute(attributeName, mutation.oldValue);
    }
  }
  refreshAttribute(attributeName, oldValue) {
    const key = this.delegate.getStringMapKeyForAttribute(attributeName);
    if (key != null) {
      if (!this.stringMap.has(attributeName)) {
        this.stringMapKeyAdded(key, attributeName);
      }
      const value = this.element.getAttribute(attributeName);
      if (this.stringMap.get(attributeName) != value) {
        this.stringMapValueChanged(value, key, oldValue);
      }
      if (value == null) {
        const oldValue = this.stringMap.get(attributeName);
        this.stringMap.delete(attributeName);
        if (oldValue) this.stringMapKeyRemoved(key, attributeName, oldValue);
      } else {
        this.stringMap.set(attributeName, value);
      }
    }
  }
  stringMapKeyAdded(key, attributeName) {
    if (this.delegate.stringMapKeyAdded) {
      this.delegate.stringMapKeyAdded(key, attributeName);
    }
  }
  stringMapValueChanged(value, key, oldValue) {
    if (this.delegate.stringMapValueChanged) {
      this.delegate.stringMapValueChanged(value, key, oldValue);
    }
  }
  stringMapKeyRemoved(key, attributeName, oldValue) {
    if (this.delegate.stringMapKeyRemoved) {
      this.delegate.stringMapKeyRemoved(key, attributeName, oldValue);
    }
  }
  get knownAttributeNames() {
    return Array.from(new Set(this.currentAttributeNames.concat(this.recordedAttributeNames)));
  }
  get currentAttributeNames() {
    return Array.from(this.element.attributes).map(attribute => attribute.name);
  }
  get recordedAttributeNames() {
    return Array.from(this.stringMap.keys());
  }
}
class TokenListObserver {
  constructor(element, attributeName, delegate) {
    this.attributeObserver = new AttributeObserver(element, attributeName, this);
    this.delegate = delegate;
    this.tokensByElement = new Multimap();
  }
  get started() {
    return this.attributeObserver.started;
  }
  start() {
    this.attributeObserver.start();
  }
  pause(callback) {
    this.attributeObserver.pause(callback);
  }
  stop() {
    this.attributeObserver.stop();
  }
  refresh() {
    this.attributeObserver.refresh();
  }
  get element() {
    return this.attributeObserver.element;
  }
  get attributeName() {
    return this.attributeObserver.attributeName;
  }
  elementMatchedAttribute(element) {
    this.tokensMatched(this.readTokensForElement(element));
  }
  elementAttributeValueChanged(element) {
    const _this$refreshTokensFo = this.refreshTokensForElement(element),
      _this$refreshTokensFo2 = _slicedToArray(_this$refreshTokensFo, 2),
      unmatchedTokens = _this$refreshTokensFo2[0],
      matchedTokens = _this$refreshTokensFo2[1];
    this.tokensUnmatched(unmatchedTokens);
    this.tokensMatched(matchedTokens);
  }
  elementUnmatchedAttribute(element) {
    this.tokensUnmatched(this.tokensByElement.getValuesForKey(element));
  }
  tokensMatched(tokens) {
    tokens.forEach(token => this.tokenMatched(token));
  }
  tokensUnmatched(tokens) {
    tokens.forEach(token => this.tokenUnmatched(token));
  }
  tokenMatched(token) {
    this.delegate.tokenMatched(token);
    this.tokensByElement.add(token.element, token);
  }
  tokenUnmatched(token) {
    this.delegate.tokenUnmatched(token);
    this.tokensByElement.delete(token.element, token);
  }
  refreshTokensForElement(element) {
    const previousTokens = this.tokensByElement.getValuesForKey(element);
    const currentTokens = this.readTokensForElement(element);
    const firstDifferingIndex = zip(previousTokens, currentTokens).findIndex(_ref8 => {
      let _ref9 = _slicedToArray(_ref8, 2),
        previousToken = _ref9[0],
        currentToken = _ref9[1];
      return !tokensAreEqual(previousToken, currentToken);
    });
    if (firstDifferingIndex == -1) {
      return [[], []];
    } else {
      return [previousTokens.slice(firstDifferingIndex), currentTokens.slice(firstDifferingIndex)];
    }
  }
  readTokensForElement(element) {
    const attributeName = this.attributeName;
    const tokenString = element.getAttribute(attributeName) || "";
    return parseTokenString(tokenString, element, attributeName);
  }
}
function parseTokenString(tokenString, element, attributeName) {
  return tokenString.trim().split(/\s+/).filter(content => content.length).map((content, index) => ({
    element,
    attributeName,
    content,
    index
  }));
}
function zip(left, right) {
  const length = Math.max(left.length, right.length);
  return Array.from({
    length
  }, (_, index) => [left[index], right[index]]);
}
function tokensAreEqual(left, right) {
  return left && right && left.index == right.index && left.content == right.content;
}
class ValueListObserver {
  constructor(element, attributeName, delegate) {
    this.tokenListObserver = new TokenListObserver(element, attributeName, this);
    this.delegate = delegate;
    this.parseResultsByToken = new WeakMap();
    this.valuesByTokenByElement = new WeakMap();
  }
  get started() {
    return this.tokenListObserver.started;
  }
  start() {
    this.tokenListObserver.start();
  }
  stop() {
    this.tokenListObserver.stop();
  }
  refresh() {
    this.tokenListObserver.refresh();
  }
  get element() {
    return this.tokenListObserver.element;
  }
  get attributeName() {
    return this.tokenListObserver.attributeName;
  }
  tokenMatched(token) {
    const element = token.element;
    const _this$fetchParseResul = this.fetchParseResultForToken(token),
      value = _this$fetchParseResul.value;
    if (value) {
      this.fetchValuesByTokenForElement(element).set(token, value);
      this.delegate.elementMatchedValue(element, value);
    }
  }
  tokenUnmatched(token) {
    const element = token.element;
    const _this$fetchParseResul2 = this.fetchParseResultForToken(token),
      value = _this$fetchParseResul2.value;
    if (value) {
      this.fetchValuesByTokenForElement(element).delete(token);
      this.delegate.elementUnmatchedValue(element, value);
    }
  }
  fetchParseResultForToken(token) {
    let parseResult = this.parseResultsByToken.get(token);
    if (!parseResult) {
      parseResult = this.parseToken(token);
      this.parseResultsByToken.set(token, parseResult);
    }
    return parseResult;
  }
  fetchValuesByTokenForElement(element) {
    let valuesByToken = this.valuesByTokenByElement.get(element);
    if (!valuesByToken) {
      valuesByToken = new Map();
      this.valuesByTokenByElement.set(element, valuesByToken);
    }
    return valuesByToken;
  }
  parseToken(token) {
    try {
      const value = this.delegate.parseValueForToken(token);
      return {
        value
      };
    } catch (error) {
      return {
        error
      };
    }
  }
}
class BindingObserver {
  constructor(context, delegate) {
    this.context = context;
    this.delegate = delegate;
    this.bindingsByAction = new Map();
  }
  start() {
    if (!this.valueListObserver) {
      this.valueListObserver = new ValueListObserver(this.element, this.actionAttribute, this);
      this.valueListObserver.start();
    }
  }
  stop() {
    if (this.valueListObserver) {
      this.valueListObserver.stop();
      delete this.valueListObserver;
      this.disconnectAllActions();
    }
  }
  get element() {
    return this.context.element;
  }
  get identifier() {
    return this.context.identifier;
  }
  get actionAttribute() {
    return this.schema.actionAttribute;
  }
  get schema() {
    return this.context.schema;
  }
  get bindings() {
    return Array.from(this.bindingsByAction.values());
  }
  connectAction(action) {
    const binding = new Binding(this.context, action);
    this.bindingsByAction.set(action, binding);
    this.delegate.bindingConnected(binding);
  }
  disconnectAction(action) {
    const binding = this.bindingsByAction.get(action);
    if (binding) {
      this.bindingsByAction.delete(action);
      this.delegate.bindingDisconnected(binding);
    }
  }
  disconnectAllActions() {
    this.bindings.forEach(binding => this.delegate.bindingDisconnected(binding, true));
    this.bindingsByAction.clear();
  }
  parseValueForToken(token) {
    const action = Action.forToken(token, this.schema);
    if (action.identifier == this.identifier) {
      return action;
    }
  }
  elementMatchedValue(element, action) {
    this.connectAction(action);
  }
  elementUnmatchedValue(element, action) {
    this.disconnectAction(action);
  }
}
class ValueObserver {
  constructor(context, receiver) {
    this.context = context;
    this.receiver = receiver;
    this.stringMapObserver = new StringMapObserver(this.element, this);
    this.valueDescriptorMap = this.controller.valueDescriptorMap;
  }
  start() {
    this.stringMapObserver.start();
    this.invokeChangedCallbacksForDefaultValues();
  }
  stop() {
    this.stringMapObserver.stop();
  }
  get element() {
    return this.context.element;
  }
  get controller() {
    return this.context.controller;
  }
  getStringMapKeyForAttribute(attributeName) {
    if (attributeName in this.valueDescriptorMap) {
      return this.valueDescriptorMap[attributeName].name;
    }
  }
  stringMapKeyAdded(key, attributeName) {
    const descriptor = this.valueDescriptorMap[attributeName];
    if (!this.hasValue(key)) {
      this.invokeChangedCallback(key, descriptor.writer(this.receiver[key]), descriptor.writer(descriptor.defaultValue));
    }
  }
  stringMapValueChanged(value, name, oldValue) {
    const descriptor = this.valueDescriptorNameMap[name];
    if (value === null) return;
    if (oldValue === null) {
      oldValue = descriptor.writer(descriptor.defaultValue);
    }
    this.invokeChangedCallback(name, value, oldValue);
  }
  stringMapKeyRemoved(key, attributeName, oldValue) {
    const descriptor = this.valueDescriptorNameMap[key];
    if (this.hasValue(key)) {
      this.invokeChangedCallback(key, descriptor.writer(this.receiver[key]), oldValue);
    } else {
      this.invokeChangedCallback(key, descriptor.writer(descriptor.defaultValue), oldValue);
    }
  }
  invokeChangedCallbacksForDefaultValues() {
    var _iterator7 = _createForOfIteratorHelper(this.valueDescriptors),
      _step7;
    try {
      for (_iterator7.s(); !(_step7 = _iterator7.n()).done;) {
        const _step7$value = _step7.value,
          key = _step7$value.key,
          name = _step7$value.name,
          defaultValue = _step7$value.defaultValue,
          writer = _step7$value.writer;
        if (defaultValue != undefined && !this.controller.data.has(key)) {
          this.invokeChangedCallback(name, writer(defaultValue), undefined);
        }
      }
    } catch (err) {
      _iterator7.e(err);
    } finally {
      _iterator7.f();
    }
  }
  invokeChangedCallback(name, rawValue, rawOldValue) {
    const changedMethodName = `${name}Changed`;
    const changedMethod = this.receiver[changedMethodName];
    if (typeof changedMethod == "function") {
      const descriptor = this.valueDescriptorNameMap[name];
      try {
        const value = descriptor.reader(rawValue);
        let oldValue = rawOldValue;
        if (rawOldValue) {
          oldValue = descriptor.reader(rawOldValue);
        }
        changedMethod.call(this.receiver, value, oldValue);
      } catch (error) {
        if (error instanceof TypeError) {
          error.message = `Stimulus Value "${this.context.identifier}.${descriptor.name}" - ${error.message}`;
        }
        throw error;
      }
    }
  }
  get valueDescriptors() {
    const valueDescriptorMap = this.valueDescriptorMap;
    return Object.keys(valueDescriptorMap).map(key => valueDescriptorMap[key]);
  }
  get valueDescriptorNameMap() {
    const descriptors = {};
    Object.keys(this.valueDescriptorMap).forEach(key => {
      const descriptor = this.valueDescriptorMap[key];
      descriptors[descriptor.name] = descriptor;
    });
    return descriptors;
  }
  hasValue(attributeName) {
    const descriptor = this.valueDescriptorNameMap[attributeName];
    const hasMethodName = `has${capitalize(descriptor.name)}`;
    return this.receiver[hasMethodName];
  }
}
class TargetObserver {
  constructor(context, delegate) {
    this.context = context;
    this.delegate = delegate;
    this.targetsByName = new Multimap();
  }
  start() {
    if (!this.tokenListObserver) {
      this.tokenListObserver = new TokenListObserver(this.element, this.attributeName, this);
      this.tokenListObserver.start();
    }
  }
  stop() {
    if (this.tokenListObserver) {
      this.disconnectAllTargets();
      this.tokenListObserver.stop();
      delete this.tokenListObserver;
    }
  }
  tokenMatched(_ref10) {
    let element = _ref10.element,
      name = _ref10.content;
    if (this.scope.containsElement(element)) {
      this.connectTarget(element, name);
    }
  }
  tokenUnmatched(_ref11) {
    let element = _ref11.element,
      name = _ref11.content;
    this.disconnectTarget(element, name);
  }
  connectTarget(element, name) {
    var _a;
    if (!this.targetsByName.has(name, element)) {
      this.targetsByName.add(name, element);
      (_a = this.tokenListObserver) === null || _a === void 0 ? void 0 : _a.pause(() => this.delegate.targetConnected(element, name));
    }
  }
  disconnectTarget(element, name) {
    var _a;
    if (this.targetsByName.has(name, element)) {
      this.targetsByName.delete(name, element);
      (_a = this.tokenListObserver) === null || _a === void 0 ? void 0 : _a.pause(() => this.delegate.targetDisconnected(element, name));
    }
  }
  disconnectAllTargets() {
    var _iterator8 = _createForOfIteratorHelper(this.targetsByName.keys),
      _step8;
    try {
      for (_iterator8.s(); !(_step8 = _iterator8.n()).done;) {
        const name = _step8.value;
        var _iterator9 = _createForOfIteratorHelper(this.targetsByName.getValuesForKey(name)),
          _step9;
        try {
          for (_iterator9.s(); !(_step9 = _iterator9.n()).done;) {
            const element = _step9.value;
            this.disconnectTarget(element, name);
          }
        } catch (err) {
          _iterator9.e(err);
        } finally {
          _iterator9.f();
        }
      }
    } catch (err) {
      _iterator8.e(err);
    } finally {
      _iterator8.f();
    }
  }
  get attributeName() {
    return `data-${this.context.identifier}-target`;
  }
  get element() {
    return this.context.element;
  }
  get scope() {
    return this.context.scope;
  }
}
function readInheritableStaticArrayValues(constructor, propertyName) {
  const ancestors = getAncestorsForConstructor(constructor);
  return Array.from(ancestors.reduce((values, constructor) => {
    getOwnStaticArrayValues(constructor, propertyName).forEach(name => values.add(name));
    return values;
  }, new Set()));
}
function readInheritableStaticObjectPairs(constructor, propertyName) {
  const ancestors = getAncestorsForConstructor(constructor);
  return ancestors.reduce((pairs, constructor) => {
    pairs.push(...getOwnStaticObjectPairs(constructor, propertyName));
    return pairs;
  }, []);
}
function getAncestorsForConstructor(constructor) {
  const ancestors = [];
  while (constructor) {
    ancestors.push(constructor);
    constructor = Object.getPrototypeOf(constructor);
  }
  return ancestors.reverse();
}
function getOwnStaticArrayValues(constructor, propertyName) {
  const definition = constructor[propertyName];
  return Array.isArray(definition) ? definition : [];
}
function getOwnStaticObjectPairs(constructor, propertyName) {
  const definition = constructor[propertyName];
  return definition ? Object.keys(definition).map(key => [key, definition[key]]) : [];
}
class OutletObserver {
  constructor(context, delegate) {
    this.started = false;
    this.context = context;
    this.delegate = delegate;
    this.outletsByName = new Multimap();
    this.outletElementsByName = new Multimap();
    this.selectorObserverMap = new Map();
    this.attributeObserverMap = new Map();
  }
  start() {
    if (!this.started) {
      this.outletDefinitions.forEach(outletName => {
        this.setupSelectorObserverForOutlet(outletName);
        this.setupAttributeObserverForOutlet(outletName);
      });
      this.started = true;
      this.dependentContexts.forEach(context => context.refresh());
    }
  }
  refresh() {
    this.selectorObserverMap.forEach(observer => observer.refresh());
    this.attributeObserverMap.forEach(observer => observer.refresh());
  }
  stop() {
    if (this.started) {
      this.started = false;
      this.disconnectAllOutlets();
      this.stopSelectorObservers();
      this.stopAttributeObservers();
    }
  }
  stopSelectorObservers() {
    if (this.selectorObserverMap.size > 0) {
      this.selectorObserverMap.forEach(observer => observer.stop());
      this.selectorObserverMap.clear();
    }
  }
  stopAttributeObservers() {
    if (this.attributeObserverMap.size > 0) {
      this.attributeObserverMap.forEach(observer => observer.stop());
      this.attributeObserverMap.clear();
    }
  }
  selectorMatched(element, _selector, _ref12) {
    let outletName = _ref12.outletName;
    const outlet = this.getOutlet(element, outletName);
    if (outlet) {
      this.connectOutlet(outlet, element, outletName);
    }
  }
  selectorUnmatched(element, _selector, _ref13) {
    let outletName = _ref13.outletName;
    const outlet = this.getOutletFromMap(element, outletName);
    if (outlet) {
      this.disconnectOutlet(outlet, element, outletName);
    }
  }
  selectorMatchElement(element, _ref14) {
    let outletName = _ref14.outletName;
    const selector = this.selector(outletName);
    const hasOutlet = this.hasOutlet(element, outletName);
    const hasOutletController = element.matches(`[${this.schema.controllerAttribute}~=${outletName}]`);
    if (selector) {
      return hasOutlet && hasOutletController && element.matches(selector);
    } else {
      return false;
    }
  }
  elementMatchedAttribute(_element, attributeName) {
    const outletName = this.getOutletNameFromOutletAttributeName(attributeName);
    if (outletName) {
      this.updateSelectorObserverForOutlet(outletName);
    }
  }
  elementAttributeValueChanged(_element, attributeName) {
    const outletName = this.getOutletNameFromOutletAttributeName(attributeName);
    if (outletName) {
      this.updateSelectorObserverForOutlet(outletName);
    }
  }
  elementUnmatchedAttribute(_element, attributeName) {
    const outletName = this.getOutletNameFromOutletAttributeName(attributeName);
    if (outletName) {
      this.updateSelectorObserverForOutlet(outletName);
    }
  }
  connectOutlet(outlet, element, outletName) {
    var _a;
    if (!this.outletElementsByName.has(outletName, element)) {
      this.outletsByName.add(outletName, outlet);
      this.outletElementsByName.add(outletName, element);
      (_a = this.selectorObserverMap.get(outletName)) === null || _a === void 0 ? void 0 : _a.pause(() => this.delegate.outletConnected(outlet, element, outletName));
    }
  }
  disconnectOutlet(outlet, element, outletName) {
    var _a;
    if (this.outletElementsByName.has(outletName, element)) {
      this.outletsByName.delete(outletName, outlet);
      this.outletElementsByName.delete(outletName, element);
      (_a = this.selectorObserverMap.get(outletName)) === null || _a === void 0 ? void 0 : _a.pause(() => this.delegate.outletDisconnected(outlet, element, outletName));
    }
  }
  disconnectAllOutlets() {
    var _iterator10 = _createForOfIteratorHelper(this.outletElementsByName.keys),
      _step10;
    try {
      for (_iterator10.s(); !(_step10 = _iterator10.n()).done;) {
        const outletName = _step10.value;
        var _iterator11 = _createForOfIteratorHelper(this.outletElementsByName.getValuesForKey(outletName)),
          _step11;
        try {
          for (_iterator11.s(); !(_step11 = _iterator11.n()).done;) {
            const element = _step11.value;
            var _iterator12 = _createForOfIteratorHelper(this.outletsByName.getValuesForKey(outletName)),
              _step12;
            try {
              for (_iterator12.s(); !(_step12 = _iterator12.n()).done;) {
                const outlet = _step12.value;
                this.disconnectOutlet(outlet, element, outletName);
              }
            } catch (err) {
              _iterator12.e(err);
            } finally {
              _iterator12.f();
            }
          }
        } catch (err) {
          _iterator11.e(err);
        } finally {
          _iterator11.f();
        }
      }
    } catch (err) {
      _iterator10.e(err);
    } finally {
      _iterator10.f();
    }
  }
  updateSelectorObserverForOutlet(outletName) {
    const observer = this.selectorObserverMap.get(outletName);
    if (observer) {
      observer.selector = this.selector(outletName);
    }
  }
  setupSelectorObserverForOutlet(outletName) {
    const selector = this.selector(outletName);
    const selectorObserver = new SelectorObserver(document.body, selector, this, {
      outletName
    });
    this.selectorObserverMap.set(outletName, selectorObserver);
    selectorObserver.start();
  }
  setupAttributeObserverForOutlet(outletName) {
    const attributeName = this.attributeNameForOutletName(outletName);
    const attributeObserver = new AttributeObserver(this.scope.element, attributeName, this);
    this.attributeObserverMap.set(outletName, attributeObserver);
    attributeObserver.start();
  }
  selector(outletName) {
    return this.scope.outlets.getSelectorForOutletName(outletName);
  }
  attributeNameForOutletName(outletName) {
    return this.scope.schema.outletAttributeForScope(this.identifier, outletName);
  }
  getOutletNameFromOutletAttributeName(attributeName) {
    return this.outletDefinitions.find(outletName => this.attributeNameForOutletName(outletName) === attributeName);
  }
  get outletDependencies() {
    const dependencies = new Multimap();
    this.router.modules.forEach(module => {
      const constructor = module.definition.controllerConstructor;
      const outlets = readInheritableStaticArrayValues(constructor, "outlets");
      outlets.forEach(outlet => dependencies.add(outlet, module.identifier));
    });
    return dependencies;
  }
  get outletDefinitions() {
    return this.outletDependencies.getKeysForValue(this.identifier);
  }
  get dependentControllerIdentifiers() {
    return this.outletDependencies.getValuesForKey(this.identifier);
  }
  get dependentContexts() {
    const identifiers = this.dependentControllerIdentifiers;
    return this.router.contexts.filter(context => identifiers.includes(context.identifier));
  }
  hasOutlet(element, outletName) {
    return !!this.getOutlet(element, outletName) || !!this.getOutletFromMap(element, outletName);
  }
  getOutlet(element, outletName) {
    return this.application.getControllerForElementAndIdentifier(element, outletName);
  }
  getOutletFromMap(element, outletName) {
    return this.outletsByName.getValuesForKey(outletName).find(outlet => outlet.element === element);
  }
  get scope() {
    return this.context.scope;
  }
  get schema() {
    return this.context.schema;
  }
  get identifier() {
    return this.context.identifier;
  }
  get application() {
    return this.context.application;
  }
  get router() {
    return this.application.router;
  }
}
class Context {
  constructor(module, scope) {
    var _this = this;
    this.logDebugActivity = function (functionName) {
      let detail = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {};
      const identifier = _this.identifier,
        controller = _this.controller,
        element = _this.element;
      detail = Object.assign({
        identifier,
        controller,
        element
      }, detail);
      _this.application.logDebugActivity(_this.identifier, functionName, detail);
    };
    this.module = module;
    this.scope = scope;
    this.controller = new module.controllerConstructor(this);
    this.bindingObserver = new BindingObserver(this, this.dispatcher);
    this.valueObserver = new ValueObserver(this, this.controller);
    this.targetObserver = new TargetObserver(this, this);
    this.outletObserver = new OutletObserver(this, this);
    try {
      this.controller.initialize();
      this.logDebugActivity("initialize");
    } catch (error) {
      this.handleError(error, "initializing controller");
    }
  }
  connect() {
    this.bindingObserver.start();
    this.valueObserver.start();
    this.targetObserver.start();
    this.outletObserver.start();
    try {
      this.controller.connect();
      this.logDebugActivity("connect");
    } catch (error) {
      this.handleError(error, "connecting controller");
    }
  }
  refresh() {
    this.outletObserver.refresh();
  }
  disconnect() {
    try {
      this.controller.disconnect();
      this.logDebugActivity("disconnect");
    } catch (error) {
      this.handleError(error, "disconnecting controller");
    }
    this.outletObserver.stop();
    this.targetObserver.stop();
    this.valueObserver.stop();
    this.bindingObserver.stop();
  }
  get application() {
    return this.module.application;
  }
  get identifier() {
    return this.module.identifier;
  }
  get schema() {
    return this.application.schema;
  }
  get dispatcher() {
    return this.application.dispatcher;
  }
  get element() {
    return this.scope.element;
  }
  get parentElement() {
    return this.element.parentElement;
  }
  handleError(error, message) {
    let detail = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : {};
    const identifier = this.identifier,
      controller = this.controller,
      element = this.element;
    detail = Object.assign({
      identifier,
      controller,
      element
    }, detail);
    this.application.handleError(error, `Error ${message}`, detail);
  }
  targetConnected(element, name) {
    this.invokeControllerMethod(`${name}TargetConnected`, element);
  }
  targetDisconnected(element, name) {
    this.invokeControllerMethod(`${name}TargetDisconnected`, element);
  }
  outletConnected(outlet, element, name) {
    this.invokeControllerMethod(`${namespaceCamelize(name)}OutletConnected`, outlet, element);
  }
  outletDisconnected(outlet, element, name) {
    this.invokeControllerMethod(`${namespaceCamelize(name)}OutletDisconnected`, outlet, element);
  }
  invokeControllerMethod(methodName) {
    const controller = this.controller;
    if (typeof controller[methodName] == "function") {
      for (var _len = arguments.length, args = new Array(_len > 1 ? _len - 1 : 0), _key2 = 1; _key2 < _len; _key2++) {
        args[_key2 - 1] = arguments[_key2];
      }
      controller[methodName](...args);
    }
  }
}
function bless(constructor) {
  return shadow(constructor, getBlessedProperties(constructor));
}
function shadow(constructor, properties) {
  const shadowConstructor = extend(constructor);
  const shadowProperties = getShadowProperties(constructor.prototype, properties);
  Object.defineProperties(shadowConstructor.prototype, shadowProperties);
  return shadowConstructor;
}
function getBlessedProperties(constructor) {
  const blessings = readInheritableStaticArrayValues(constructor, "blessings");
  return blessings.reduce((blessedProperties, blessing) => {
    const properties = blessing(constructor);
    for (const key in properties) {
      const descriptor = blessedProperties[key] || {};
      blessedProperties[key] = Object.assign(descriptor, properties[key]);
    }
    return blessedProperties;
  }, {});
}
function getShadowProperties(prototype, properties) {
  return getOwnKeys(properties).reduce((shadowProperties, key) => {
    const descriptor = getShadowedDescriptor(prototype, properties, key);
    if (descriptor) {
      Object.assign(shadowProperties, {
        [key]: descriptor
      });
    }
    return shadowProperties;
  }, {});
}
function getShadowedDescriptor(prototype, properties, key) {
  const shadowingDescriptor = Object.getOwnPropertyDescriptor(prototype, key);
  const shadowedByValue = shadowingDescriptor && "value" in shadowingDescriptor;
  if (!shadowedByValue) {
    const descriptor = Object.getOwnPropertyDescriptor(properties, key).value;
    if (shadowingDescriptor) {
      descriptor.get = shadowingDescriptor.get || descriptor.get;
      descriptor.set = shadowingDescriptor.set || descriptor.set;
    }
    return descriptor;
  }
}
const getOwnKeys = (() => {
  if (typeof Object.getOwnPropertySymbols == "function") {
    return object => [...Object.getOwnPropertyNames(object), ...Object.getOwnPropertySymbols(object)];
  } else {
    return Object.getOwnPropertyNames;
  }
})();
const extend = (() => {
  function extendWithReflect(constructor) {
    function extended() {
      return Reflect.construct(constructor, arguments, new.target);
    }
    extended.prototype = Object.create(constructor.prototype, {
      constructor: {
        value: extended
      }
    });
    Reflect.setPrototypeOf(extended, constructor);
    return extended;
  }
  function testReflectExtension() {
    const a = function () {
      this.a.call(this);
    };
    const b = extendWithReflect(a);
    b.prototype.a = function () {};
    return new b();
  }
  try {
    testReflectExtension();
    return extendWithReflect;
  } catch (error) {
    return constructor => class extended extends constructor {};
  }
})();
function blessDefinition(definition) {
  return {
    identifier: definition.identifier,
    controllerConstructor: bless(definition.controllerConstructor)
  };
}
class Module {
  constructor(application, definition) {
    this.application = application;
    this.definition = blessDefinition(definition);
    this.contextsByScope = new WeakMap();
    this.connectedContexts = new Set();
  }
  get identifier() {
    return this.definition.identifier;
  }
  get controllerConstructor() {
    return this.definition.controllerConstructor;
  }
  get contexts() {
    return Array.from(this.connectedContexts);
  }
  connectContextForScope(scope) {
    const context = this.fetchContextForScope(scope);
    this.connectedContexts.add(context);
    context.connect();
  }
  disconnectContextForScope(scope) {
    const context = this.contextsByScope.get(scope);
    if (context) {
      this.connectedContexts.delete(context);
      context.disconnect();
    }
  }
  fetchContextForScope(scope) {
    let context = this.contextsByScope.get(scope);
    if (!context) {
      context = new Context(this, scope);
      this.contextsByScope.set(scope, context);
    }
    return context;
  }
}
class ClassMap {
  constructor(scope) {
    this.scope = scope;
  }
  has(name) {
    return this.data.has(this.getDataKey(name));
  }
  get(name) {
    return this.getAll(name)[0];
  }
  getAll(name) {
    const tokenString = this.data.get(this.getDataKey(name)) || "";
    return tokenize(tokenString);
  }
  getAttributeName(name) {
    return this.data.getAttributeNameForKey(this.getDataKey(name));
  }
  getDataKey(name) {
    return `${name}-class`;
  }
  get data() {
    return this.scope.data;
  }
}
class DataMap {
  constructor(scope) {
    this.scope = scope;
  }
  get element() {
    return this.scope.element;
  }
  get identifier() {
    return this.scope.identifier;
  }
  get(key) {
    const name = this.getAttributeNameForKey(key);
    return this.element.getAttribute(name);
  }
  set(key, value) {
    const name = this.getAttributeNameForKey(key);
    this.element.setAttribute(name, value);
    return this.get(key);
  }
  has(key) {
    const name = this.getAttributeNameForKey(key);
    return this.element.hasAttribute(name);
  }
  delete(key) {
    if (this.has(key)) {
      const name = this.getAttributeNameForKey(key);
      this.element.removeAttribute(name);
      return true;
    } else {
      return false;
    }
  }
  getAttributeNameForKey(key) {
    return `data-${this.identifier}-${dasherize(key)}`;
  }
}
class Guide {
  constructor(logger) {
    this.warnedKeysByObject = new WeakMap();
    this.logger = logger;
  }
  warn(object, key, message) {
    let warnedKeys = this.warnedKeysByObject.get(object);
    if (!warnedKeys) {
      warnedKeys = new Set();
      this.warnedKeysByObject.set(object, warnedKeys);
    }
    if (!warnedKeys.has(key)) {
      warnedKeys.add(key);
      this.logger.warn(message, object);
    }
  }
}
function attributeValueContainsToken(attributeName, token) {
  return `[${attributeName}~="${token}"]`;
}
class TargetSet {
  constructor(scope) {
    this.scope = scope;
  }
  get element() {
    return this.scope.element;
  }
  get identifier() {
    return this.scope.identifier;
  }
  get schema() {
    return this.scope.schema;
  }
  has(targetName) {
    return this.find(targetName) != null;
  }
  find() {
    for (var _len2 = arguments.length, targetNames = new Array(_len2), _key3 = 0; _key3 < _len2; _key3++) {
      targetNames[_key3] = arguments[_key3];
    }
    return targetNames.reduce((target, targetName) => target || this.findTarget(targetName) || this.findLegacyTarget(targetName), undefined);
  }
  findAll() {
    for (var _len3 = arguments.length, targetNames = new Array(_len3), _key4 = 0; _key4 < _len3; _key4++) {
      targetNames[_key4] = arguments[_key4];
    }
    return targetNames.reduce((targets, targetName) => [...targets, ...this.findAllTargets(targetName), ...this.findAllLegacyTargets(targetName)], []);
  }
  findTarget(targetName) {
    const selector = this.getSelectorForTargetName(targetName);
    return this.scope.findElement(selector);
  }
  findAllTargets(targetName) {
    const selector = this.getSelectorForTargetName(targetName);
    return this.scope.findAllElements(selector);
  }
  getSelectorForTargetName(targetName) {
    const attributeName = this.schema.targetAttributeForScope(this.identifier);
    return attributeValueContainsToken(attributeName, targetName);
  }
  findLegacyTarget(targetName) {
    const selector = this.getLegacySelectorForTargetName(targetName);
    return this.deprecate(this.scope.findElement(selector), targetName);
  }
  findAllLegacyTargets(targetName) {
    const selector = this.getLegacySelectorForTargetName(targetName);
    return this.scope.findAllElements(selector).map(element => this.deprecate(element, targetName));
  }
  getLegacySelectorForTargetName(targetName) {
    const targetDescriptor = `${this.identifier}.${targetName}`;
    return attributeValueContainsToken(this.schema.targetAttribute, targetDescriptor);
  }
  deprecate(element, targetName) {
    if (element) {
      const identifier = this.identifier;
      const attributeName = this.schema.targetAttribute;
      const revisedAttributeName = this.schema.targetAttributeForScope(identifier);
      this.guide.warn(element, `target:${targetName}`, `Please replace ${attributeName}="${identifier}.${targetName}" with ${revisedAttributeName}="${targetName}". ` + `The ${attributeName} attribute is deprecated and will be removed in a future version of Stimulus.`);
    }
    return element;
  }
  get guide() {
    return this.scope.guide;
  }
}
class OutletSet {
  constructor(scope, controllerElement) {
    this.scope = scope;
    this.controllerElement = controllerElement;
  }
  get element() {
    return this.scope.element;
  }
  get identifier() {
    return this.scope.identifier;
  }
  get schema() {
    return this.scope.schema;
  }
  has(outletName) {
    return this.find(outletName) != null;
  }
  find() {
    for (var _len4 = arguments.length, outletNames = new Array(_len4), _key5 = 0; _key5 < _len4; _key5++) {
      outletNames[_key5] = arguments[_key5];
    }
    return outletNames.reduce((outlet, outletName) => outlet || this.findOutlet(outletName), undefined);
  }
  findAll() {
    for (var _len5 = arguments.length, outletNames = new Array(_len5), _key6 = 0; _key6 < _len5; _key6++) {
      outletNames[_key6] = arguments[_key6];
    }
    return outletNames.reduce((outlets, outletName) => [...outlets, ...this.findAllOutlets(outletName)], []);
  }
  getSelectorForOutletName(outletName) {
    const attributeName = this.schema.outletAttributeForScope(this.identifier, outletName);
    return this.controllerElement.getAttribute(attributeName);
  }
  findOutlet(outletName) {
    const selector = this.getSelectorForOutletName(outletName);
    if (selector) return this.findElement(selector, outletName);
  }
  findAllOutlets(outletName) {
    const selector = this.getSelectorForOutletName(outletName);
    return selector ? this.findAllElements(selector, outletName) : [];
  }
  findElement(selector, outletName) {
    const elements = this.scope.queryElements(selector);
    return elements.filter(element => this.matchesElement(element, selector, outletName))[0];
  }
  findAllElements(selector, outletName) {
    const elements = this.scope.queryElements(selector);
    return elements.filter(element => this.matchesElement(element, selector, outletName));
  }
  matchesElement(element, selector, outletName) {
    const controllerAttribute = element.getAttribute(this.scope.schema.controllerAttribute) || "";
    return element.matches(selector) && controllerAttribute.split(" ").includes(outletName);
  }
}
class Scope {
  constructor(schema, element, identifier, logger) {
    this.targets = new TargetSet(this);
    this.classes = new ClassMap(this);
    this.data = new DataMap(this);
    this.containsElement = element => {
      return element.closest(this.controllerSelector) === this.element;
    };
    this.schema = schema;
    this.element = element;
    this.identifier = identifier;
    this.guide = new Guide(logger);
    this.outlets = new OutletSet(this.documentScope, element);
  }
  findElement(selector) {
    return this.element.matches(selector) ? this.element : this.queryElements(selector).find(this.containsElement);
  }
  findAllElements(selector) {
    return [...(this.element.matches(selector) ? [this.element] : []), ...this.queryElements(selector).filter(this.containsElement)];
  }
  queryElements(selector) {
    return Array.from(this.element.querySelectorAll(selector));
  }
  get controllerSelector() {
    return attributeValueContainsToken(this.schema.controllerAttribute, this.identifier);
  }
  get isDocumentScope() {
    return this.element === document.documentElement;
  }
  get documentScope() {
    return this.isDocumentScope ? this : new Scope(this.schema, document.documentElement, this.identifier, this.guide.logger);
  }
}
class ScopeObserver {
  constructor(element, schema, delegate) {
    this.element = element;
    this.schema = schema;
    this.delegate = delegate;
    this.valueListObserver = new ValueListObserver(this.element, this.controllerAttribute, this);
    this.scopesByIdentifierByElement = new WeakMap();
    this.scopeReferenceCounts = new WeakMap();
  }
  start() {
    this.valueListObserver.start();
  }
  stop() {
    this.valueListObserver.stop();
  }
  get controllerAttribute() {
    return this.schema.controllerAttribute;
  }
  parseValueForToken(token) {
    const element = token.element,
      identifier = token.content;
    return this.parseValueForElementAndIdentifier(element, identifier);
  }
  parseValueForElementAndIdentifier(element, identifier) {
    const scopesByIdentifier = this.fetchScopesByIdentifierForElement(element);
    let scope = scopesByIdentifier.get(identifier);
    if (!scope) {
      scope = this.delegate.createScopeForElementAndIdentifier(element, identifier);
      scopesByIdentifier.set(identifier, scope);
    }
    return scope;
  }
  elementMatchedValue(element, value) {
    const referenceCount = (this.scopeReferenceCounts.get(value) || 0) + 1;
    this.scopeReferenceCounts.set(value, referenceCount);
    if (referenceCount == 1) {
      this.delegate.scopeConnected(value);
    }
  }
  elementUnmatchedValue(element, value) {
    const referenceCount = this.scopeReferenceCounts.get(value);
    if (referenceCount) {
      this.scopeReferenceCounts.set(value, referenceCount - 1);
      if (referenceCount == 1) {
        this.delegate.scopeDisconnected(value);
      }
    }
  }
  fetchScopesByIdentifierForElement(element) {
    let scopesByIdentifier = this.scopesByIdentifierByElement.get(element);
    if (!scopesByIdentifier) {
      scopesByIdentifier = new Map();
      this.scopesByIdentifierByElement.set(element, scopesByIdentifier);
    }
    return scopesByIdentifier;
  }
}
class Router {
  constructor(application) {
    this.application = application;
    this.scopeObserver = new ScopeObserver(this.element, this.schema, this);
    this.scopesByIdentifier = new Multimap();
    this.modulesByIdentifier = new Map();
  }
  get element() {
    return this.application.element;
  }
  get schema() {
    return this.application.schema;
  }
  get logger() {
    return this.application.logger;
  }
  get controllerAttribute() {
    return this.schema.controllerAttribute;
  }
  get modules() {
    return Array.from(this.modulesByIdentifier.values());
  }
  get contexts() {
    return this.modules.reduce((contexts, module) => contexts.concat(module.contexts), []);
  }
  start() {
    this.scopeObserver.start();
  }
  stop() {
    this.scopeObserver.stop();
  }
  loadDefinition(definition) {
    this.unloadIdentifier(definition.identifier);
    const module = new Module(this.application, definition);
    this.connectModule(module);
    const afterLoad = definition.controllerConstructor.afterLoad;
    if (afterLoad) {
      afterLoad.call(definition.controllerConstructor, definition.identifier, this.application);
    }
  }
  unloadIdentifier(identifier) {
    const module = this.modulesByIdentifier.get(identifier);
    if (module) {
      this.disconnectModule(module);
    }
  }
  getContextForElementAndIdentifier(element, identifier) {
    const module = this.modulesByIdentifier.get(identifier);
    if (module) {
      return module.contexts.find(context => context.element == element);
    }
  }
  proposeToConnectScopeForElementAndIdentifier(element, identifier) {
    const scope = this.scopeObserver.parseValueForElementAndIdentifier(element, identifier);
    if (scope) {
      this.scopeObserver.elementMatchedValue(scope.element, scope);
    } else {
      console.error(`Couldn't find or create scope for identifier: "${identifier}" and element:`, element);
    }
  }
  handleError(error, message, detail) {
    this.application.handleError(error, message, detail);
  }
  createScopeForElementAndIdentifier(element, identifier) {
    return new Scope(this.schema, element, identifier, this.logger);
  }
  scopeConnected(scope) {
    this.scopesByIdentifier.add(scope.identifier, scope);
    const module = this.modulesByIdentifier.get(scope.identifier);
    if (module) {
      module.connectContextForScope(scope);
    }
  }
  scopeDisconnected(scope) {
    this.scopesByIdentifier.delete(scope.identifier, scope);
    const module = this.modulesByIdentifier.get(scope.identifier);
    if (module) {
      module.disconnectContextForScope(scope);
    }
  }
  connectModule(module) {
    this.modulesByIdentifier.set(module.identifier, module);
    const scopes = this.scopesByIdentifier.getValuesForKey(module.identifier);
    scopes.forEach(scope => module.connectContextForScope(scope));
  }
  disconnectModule(module) {
    this.modulesByIdentifier.delete(module.identifier);
    const scopes = this.scopesByIdentifier.getValuesForKey(module.identifier);
    scopes.forEach(scope => module.disconnectContextForScope(scope));
  }
}
const defaultSchema = {
  controllerAttribute: "data-controller",
  actionAttribute: "data-action",
  targetAttribute: "data-target",
  targetAttributeForScope: identifier => `data-${identifier}-target`,
  outletAttributeForScope: (identifier, outlet) => `data-${identifier}-${outlet}-outlet`,
  keyMappings: Object.assign(Object.assign({
    enter: "Enter",
    tab: "Tab",
    esc: "Escape",
    space: " ",
    up: "ArrowUp",
    down: "ArrowDown",
    left: "ArrowLeft",
    right: "ArrowRight",
    home: "Home",
    end: "End",
    page_up: "PageUp",
    page_down: "PageDown"
  }, objectFromEntries("abcdefghijklmnopqrstuvwxyz".split("").map(c => [c, c]))), objectFromEntries("0123456789".split("").map(n => [n, n])))
};
function objectFromEntries(array) {
  return array.reduce((memo, _ref15) => {
    let _ref16 = _slicedToArray(_ref15, 2),
      k = _ref16[0],
      v = _ref16[1];
    return Object.assign(Object.assign({}, memo), {
      [k]: v
    });
  }, {});
}
class Application {
  constructor() {
    var _this2 = this;
    let element = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : document.documentElement;
    let schema = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : defaultSchema;
    this.logger = console;
    this.debug = false;
    this.logDebugActivity = function (identifier, functionName) {
      let detail = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : {};
      if (_this2.debug) {
        _this2.logFormattedMessage(identifier, functionName, detail);
      }
    };
    this.element = element;
    this.schema = schema;
    this.dispatcher = new Dispatcher(this);
    this.router = new Router(this);
    this.actionDescriptorFilters = Object.assign({}, defaultActionDescriptorFilters);
  }
  static start(element, schema) {
    const application = new this(element, schema);
    application.start();
    return application;
  }
  async start() {
    await domReady();
    this.logDebugActivity("application", "starting");
    this.dispatcher.start();
    this.router.start();
    this.logDebugActivity("application", "start");
  }
  stop() {
    this.logDebugActivity("application", "stopping");
    this.dispatcher.stop();
    this.router.stop();
    this.logDebugActivity("application", "stop");
  }
  register(identifier, controllerConstructor) {
    this.load({
      identifier,
      controllerConstructor
    });
  }
  registerActionOption(name, filter) {
    this.actionDescriptorFilters[name] = filter;
  }
  load(head) {
    for (var _len6 = arguments.length, rest = new Array(_len6 > 1 ? _len6 - 1 : 0), _key7 = 1; _key7 < _len6; _key7++) {
      rest[_key7 - 1] = arguments[_key7];
    }
    const definitions = Array.isArray(head) ? head : [head, ...rest];
    definitions.forEach(definition => {
      if (definition.controllerConstructor.shouldLoad) {
        this.router.loadDefinition(definition);
      }
    });
  }
  unload(head) {
    for (var _len7 = arguments.length, rest = new Array(_len7 > 1 ? _len7 - 1 : 0), _key8 = 1; _key8 < _len7; _key8++) {
      rest[_key8 - 1] = arguments[_key8];
    }
    const identifiers = Array.isArray(head) ? head : [head, ...rest];
    identifiers.forEach(identifier => this.router.unloadIdentifier(identifier));
  }
  get controllers() {
    return this.router.contexts.map(context => context.controller);
  }
  getControllerForElementAndIdentifier(element, identifier) {
    const context = this.router.getContextForElementAndIdentifier(element, identifier);
    return context ? context.controller : null;
  }
  handleError(error, message, detail) {
    var _a;
    this.logger.error(`%s\n\n%o\n\n%o`, message, error, detail);
    (_a = window.onerror) === null || _a === void 0 ? void 0 : _a.call(window, message, "", 0, 0, error);
  }
  logFormattedMessage(identifier, functionName) {
    let detail = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : {};
    detail = Object.assign({
      application: this
    }, detail);
    this.logger.groupCollapsed(`${identifier} #${functionName}`);
    this.logger.log("details:", Object.assign({}, detail));
    this.logger.groupEnd();
  }
}
function domReady() {
  return new Promise(resolve => {
    if (document.readyState == "loading") {
      document.addEventListener("DOMContentLoaded", () => resolve());
    } else {
      resolve();
    }
  });
}
function ClassPropertiesBlessing(constructor) {
  const classes = readInheritableStaticArrayValues(constructor, "classes");
  return classes.reduce((properties, classDefinition) => {
    return Object.assign(properties, propertiesForClassDefinition(classDefinition));
  }, {});
}
function propertiesForClassDefinition(key) {
  return {
    [`${key}Class`]: {
      get() {
        const classes = this.classes;
        if (classes.has(key)) {
          return classes.get(key);
        } else {
          const attribute = classes.getAttributeName(key);
          throw new Error(`Missing attribute "${attribute}"`);
        }
      }
    },
    [`${key}Classes`]: {
      get() {
        return this.classes.getAll(key);
      }
    },
    [`has${capitalize(key)}Class`]: {
      get() {
        return this.classes.has(key);
      }
    }
  };
}
function OutletPropertiesBlessing(constructor) {
  const outlets = readInheritableStaticArrayValues(constructor, "outlets");
  return outlets.reduce((properties, outletDefinition) => {
    return Object.assign(properties, propertiesForOutletDefinition(outletDefinition));
  }, {});
}
function getOutletController(controller, element, identifier) {
  return controller.application.getControllerForElementAndIdentifier(element, identifier);
}
function getControllerAndEnsureConnectedScope(controller, element, outletName) {
  let outletController = getOutletController(controller, element, outletName);
  if (outletController) return outletController;
  controller.application.router.proposeToConnectScopeForElementAndIdentifier(element, outletName);
  outletController = getOutletController(controller, element, outletName);
  if (outletController) return outletController;
}
function propertiesForOutletDefinition(name) {
  const camelizedName = namespaceCamelize(name);
  return {
    [`${camelizedName}Outlet`]: {
      get() {
        const outletElement = this.outlets.find(name);
        const selector = this.outlets.getSelectorForOutletName(name);
        if (outletElement) {
          const outletController = getControllerAndEnsureConnectedScope(this, outletElement, name);
          if (outletController) return outletController;
          throw new Error(`The provided outlet element is missing an outlet controller "${name}" instance for host controller "${this.identifier}"`);
        }
        throw new Error(`Missing outlet element "${name}" for host controller "${this.identifier}". Stimulus couldn't find a matching outlet element using selector "${selector}".`);
      }
    },
    [`${camelizedName}Outlets`]: {
      get() {
        const outlets = this.outlets.findAll(name);
        if (outlets.length > 0) {
          return outlets.map(outletElement => {
            const outletController = getControllerAndEnsureConnectedScope(this, outletElement, name);
            if (outletController) return outletController;
            console.warn(`The provided outlet element is missing an outlet controller "${name}" instance for host controller "${this.identifier}"`, outletElement);
          }).filter(controller => controller);
        }
        return [];
      }
    },
    [`${camelizedName}OutletElement`]: {
      get() {
        const outletElement = this.outlets.find(name);
        const selector = this.outlets.getSelectorForOutletName(name);
        if (outletElement) {
          return outletElement;
        } else {
          throw new Error(`Missing outlet element "${name}" for host controller "${this.identifier}". Stimulus couldn't find a matching outlet element using selector "${selector}".`);
        }
      }
    },
    [`${camelizedName}OutletElements`]: {
      get() {
        return this.outlets.findAll(name);
      }
    },
    [`has${capitalize(camelizedName)}Outlet`]: {
      get() {
        return this.outlets.has(name);
      }
    }
  };
}
function TargetPropertiesBlessing(constructor) {
  const targets = readInheritableStaticArrayValues(constructor, "targets");
  return targets.reduce((properties, targetDefinition) => {
    return Object.assign(properties, propertiesForTargetDefinition(targetDefinition));
  }, {});
}
function propertiesForTargetDefinition(name) {
  return {
    [`${name}Target`]: {
      get() {
        const target = this.targets.find(name);
        if (target) {
          return target;
        } else {
          throw new Error(`Missing target element "${name}" for "${this.identifier}" controller`);
        }
      }
    },
    [`${name}Targets`]: {
      get() {
        return this.targets.findAll(name);
      }
    },
    [`has${capitalize(name)}Target`]: {
      get() {
        return this.targets.has(name);
      }
    }
  };
}
function ValuePropertiesBlessing(constructor) {
  const valueDefinitionPairs = readInheritableStaticObjectPairs(constructor, "values");
  const propertyDescriptorMap = {
    valueDescriptorMap: {
      get() {
        return valueDefinitionPairs.reduce((result, valueDefinitionPair) => {
          const valueDescriptor = parseValueDefinitionPair(valueDefinitionPair, this.identifier);
          const attributeName = this.data.getAttributeNameForKey(valueDescriptor.key);
          return Object.assign(result, {
            [attributeName]: valueDescriptor
          });
        }, {});
      }
    }
  };
  return valueDefinitionPairs.reduce((properties, valueDefinitionPair) => {
    return Object.assign(properties, propertiesForValueDefinitionPair(valueDefinitionPair));
  }, propertyDescriptorMap);
}
function propertiesForValueDefinitionPair(valueDefinitionPair, controller) {
  const definition = parseValueDefinitionPair(valueDefinitionPair, controller);
  const key = definition.key,
    name = definition.name,
    read = definition.reader,
    write = definition.writer;
  return {
    [name]: {
      get() {
        const value = this.data.get(key);
        if (value !== null) {
          return read(value);
        } else {
          return definition.defaultValue;
        }
      },
      set(value) {
        if (value === undefined) {
          this.data.delete(key);
        } else {
          this.data.set(key, write(value));
        }
      }
    },
    [`has${capitalize(name)}`]: {
      get() {
        return this.data.has(key) || definition.hasCustomDefaultValue;
      }
    }
  };
}
function parseValueDefinitionPair(_ref17, controller) {
  let _ref18 = _slicedToArray(_ref17, 2),
    token = _ref18[0],
    typeDefinition = _ref18[1];
  return valueDescriptorForTokenAndTypeDefinition({
    controller,
    token,
    typeDefinition
  });
}
function parseValueTypeConstant(constant) {
  switch (constant) {
    case Array:
      return "array";
    case Boolean:
      return "boolean";
    case Number:
      return "number";
    case Object:
      return "object";
    case String:
      return "string";
  }
}
function parseValueTypeDefault(defaultValue) {
  switch (typeof defaultValue) {
    case "boolean":
      return "boolean";
    case "number":
      return "number";
    case "string":
      return "string";
  }
  if (Array.isArray(defaultValue)) return "array";
  if (Object.prototype.toString.call(defaultValue) === "[object Object]") return "object";
}
function parseValueTypeObject(payload) {
  const controller = payload.controller,
    token = payload.token,
    typeObject = payload.typeObject;
  const hasType = isSomething(typeObject.type);
  const hasDefault = isSomething(typeObject.default);
  const fullObject = hasType && hasDefault;
  const onlyType = hasType && !hasDefault;
  const onlyDefault = !hasType && hasDefault;
  const typeFromObject = parseValueTypeConstant(typeObject.type);
  const typeFromDefaultValue = parseValueTypeDefault(payload.typeObject.default);
  if (onlyType) return typeFromObject;
  if (onlyDefault) return typeFromDefaultValue;
  if (typeFromObject !== typeFromDefaultValue) {
    const propertyPath = controller ? `${controller}.${token}` : token;
    throw new Error(`The specified default value for the Stimulus Value "${propertyPath}" must match the defined type "${typeFromObject}". The provided default value of "${typeObject.default}" is of type "${typeFromDefaultValue}".`);
  }
  if (fullObject) return typeFromObject;
}
function parseValueTypeDefinition(payload) {
  const controller = payload.controller,
    token = payload.token,
    typeDefinition = payload.typeDefinition;
  const typeObject = {
    controller,
    token,
    typeObject: typeDefinition
  };
  const typeFromObject = parseValueTypeObject(typeObject);
  const typeFromDefaultValue = parseValueTypeDefault(typeDefinition);
  const typeFromConstant = parseValueTypeConstant(typeDefinition);
  const type = typeFromObject || typeFromDefaultValue || typeFromConstant;
  if (type) return type;
  const propertyPath = controller ? `${controller}.${typeDefinition}` : token;
  throw new Error(`Unknown value type "${propertyPath}" for "${token}" value`);
}
function defaultValueForDefinition(typeDefinition) {
  const constant = parseValueTypeConstant(typeDefinition);
  if (constant) return defaultValuesByType[constant];
  const hasDefault = hasProperty(typeDefinition, "default");
  const hasType = hasProperty(typeDefinition, "type");
  const typeObject = typeDefinition;
  if (hasDefault) return typeObject.default;
  if (hasType) {
    const type = typeObject.type;
    const constantFromType = parseValueTypeConstant(type);
    if (constantFromType) return defaultValuesByType[constantFromType];
  }
  return typeDefinition;
}
function valueDescriptorForTokenAndTypeDefinition(payload) {
  const token = payload.token,
    typeDefinition = payload.typeDefinition;
  const key = `${dasherize(token)}-value`;
  const type = parseValueTypeDefinition(payload);
  return {
    type,
    key,
    name: camelize(key),
    get defaultValue() {
      return defaultValueForDefinition(typeDefinition);
    },
    get hasCustomDefaultValue() {
      return parseValueTypeDefault(typeDefinition) !== undefined;
    },
    reader: readers[type],
    writer: writers[type] || writers.default
  };
}
const defaultValuesByType = {
  get array() {
    return [];
  },
  boolean: false,
  number: 0,
  get object() {
    return {};
  },
  string: ""
};
const readers = {
  array(value) {
    const array = JSON.parse(value);
    if (!Array.isArray(array)) {
      throw new TypeError(`expected value of type "array" but instead got value "${value}" of type "${parseValueTypeDefault(array)}"`);
    }
    return array;
  },
  boolean(value) {
    return !(value == "0" || String(value).toLowerCase() == "false");
  },
  number(value) {
    return Number(value.replace(/_/g, ""));
  },
  object(value) {
    const object = JSON.parse(value);
    if (object === null || typeof object != "object" || Array.isArray(object)) {
      throw new TypeError(`expected value of type "object" but instead got value "${value}" of type "${parseValueTypeDefault(object)}"`);
    }
    return object;
  },
  string(value) {
    return value;
  }
};
const writers = {
  default: writeString,
  array: writeJSON,
  object: writeJSON
};
function writeJSON(value) {
  return JSON.stringify(value);
}
function writeString(value) {
  return `${value}`;
}
class Controller {
  constructor(context) {
    this.context = context;
  }
  static get shouldLoad() {
    return true;
  }
  static afterLoad(_identifier, _application) {
    return;
  }
  get application() {
    return this.context.application;
  }
  get scope() {
    return this.context.scope;
  }
  get element() {
    return this.scope.element;
  }
  get identifier() {
    return this.scope.identifier;
  }
  get targets() {
    return this.scope.targets;
  }
  get outlets() {
    return this.scope.outlets;
  }
  get classes() {
    return this.scope.classes;
  }
  get data() {
    return this.scope.data;
  }
  initialize() {}
  connect() {}
  disconnect() {}
  dispatch(eventName) {
    let _ref19 = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {},
      _ref19$target = _ref19.target,
      target = _ref19$target === void 0 ? this.element : _ref19$target,
      _ref19$detail = _ref19.detail,
      detail = _ref19$detail === void 0 ? {} : _ref19$detail,
      _ref19$prefix = _ref19.prefix,
      prefix = _ref19$prefix === void 0 ? this.identifier : _ref19$prefix,
      _ref19$bubbles = _ref19.bubbles,
      bubbles = _ref19$bubbles === void 0 ? true : _ref19$bubbles,
      _ref19$cancelable = _ref19.cancelable,
      cancelable = _ref19$cancelable === void 0 ? true : _ref19$cancelable;
    const type = prefix ? `${prefix}:${eventName}` : eventName;
    const event = new CustomEvent(type, {
      detail,
      bubbles,
      cancelable
    });
    target.dispatchEvent(event);
    return event;
  }
}
Controller.blessings = [ClassPropertiesBlessing, TargetPropertiesBlessing, ValuePropertiesBlessing, OutletPropertiesBlessing];
Controller.targets = [];
Controller.outlets = [];
Controller.values = {};


/***/ }),

/***/ "./node_modules/@rails/activestorage/app/assets/javascripts/activestorage.js":
/*!***********************************************************************************!*\
  !*** ./node_modules/@rails/activestorage/app/assets/javascripts/activestorage.js ***!
  \***********************************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

(function (global, factory) {
   true ? factory(exports) : undefined;
})(this, function (exports) {
  "use strict";

  function createCommonjsModule(fn, module) {
    return module = {
      exports: {}
    }, fn(module, module.exports), module.exports;
  }
  var sparkMd5 = createCommonjsModule(function (module, exports) {
    (function (factory) {
      {
        module.exports = factory();
      }
    })(function (undefined) {
      var hex_chr = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"];
      function md5cycle(x, k) {
        var a = x[0],
          b = x[1],
          c = x[2],
          d = x[3];
        a += (b & c | ~b & d) + k[0] - 680876936 | 0;
        a = (a << 7 | a >>> 25) + b | 0;
        d += (a & b | ~a & c) + k[1] - 389564586 | 0;
        d = (d << 12 | d >>> 20) + a | 0;
        c += (d & a | ~d & b) + k[2] + 606105819 | 0;
        c = (c << 17 | c >>> 15) + d | 0;
        b += (c & d | ~c & a) + k[3] - 1044525330 | 0;
        b = (b << 22 | b >>> 10) + c | 0;
        a += (b & c | ~b & d) + k[4] - 176418897 | 0;
        a = (a << 7 | a >>> 25) + b | 0;
        d += (a & b | ~a & c) + k[5] + 1200080426 | 0;
        d = (d << 12 | d >>> 20) + a | 0;
        c += (d & a | ~d & b) + k[6] - 1473231341 | 0;
        c = (c << 17 | c >>> 15) + d | 0;
        b += (c & d | ~c & a) + k[7] - 45705983 | 0;
        b = (b << 22 | b >>> 10) + c | 0;
        a += (b & c | ~b & d) + k[8] + 1770035416 | 0;
        a = (a << 7 | a >>> 25) + b | 0;
        d += (a & b | ~a & c) + k[9] - 1958414417 | 0;
        d = (d << 12 | d >>> 20) + a | 0;
        c += (d & a | ~d & b) + k[10] - 42063 | 0;
        c = (c << 17 | c >>> 15) + d | 0;
        b += (c & d | ~c & a) + k[11] - 1990404162 | 0;
        b = (b << 22 | b >>> 10) + c | 0;
        a += (b & c | ~b & d) + k[12] + 1804603682 | 0;
        a = (a << 7 | a >>> 25) + b | 0;
        d += (a & b | ~a & c) + k[13] - 40341101 | 0;
        d = (d << 12 | d >>> 20) + a | 0;
        c += (d & a | ~d & b) + k[14] - 1502002290 | 0;
        c = (c << 17 | c >>> 15) + d | 0;
        b += (c & d | ~c & a) + k[15] + 1236535329 | 0;
        b = (b << 22 | b >>> 10) + c | 0;
        a += (b & d | c & ~d) + k[1] - 165796510 | 0;
        a = (a << 5 | a >>> 27) + b | 0;
        d += (a & c | b & ~c) + k[6] - 1069501632 | 0;
        d = (d << 9 | d >>> 23) + a | 0;
        c += (d & b | a & ~b) + k[11] + 643717713 | 0;
        c = (c << 14 | c >>> 18) + d | 0;
        b += (c & a | d & ~a) + k[0] - 373897302 | 0;
        b = (b << 20 | b >>> 12) + c | 0;
        a += (b & d | c & ~d) + k[5] - 701558691 | 0;
        a = (a << 5 | a >>> 27) + b | 0;
        d += (a & c | b & ~c) + k[10] + 38016083 | 0;
        d = (d << 9 | d >>> 23) + a | 0;
        c += (d & b | a & ~b) + k[15] - 660478335 | 0;
        c = (c << 14 | c >>> 18) + d | 0;
        b += (c & a | d & ~a) + k[4] - 405537848 | 0;
        b = (b << 20 | b >>> 12) + c | 0;
        a += (b & d | c & ~d) + k[9] + 568446438 | 0;
        a = (a << 5 | a >>> 27) + b | 0;
        d += (a & c | b & ~c) + k[14] - 1019803690 | 0;
        d = (d << 9 | d >>> 23) + a | 0;
        c += (d & b | a & ~b) + k[3] - 187363961 | 0;
        c = (c << 14 | c >>> 18) + d | 0;
        b += (c & a | d & ~a) + k[8] + 1163531501 | 0;
        b = (b << 20 | b >>> 12) + c | 0;
        a += (b & d | c & ~d) + k[13] - 1444681467 | 0;
        a = (a << 5 | a >>> 27) + b | 0;
        d += (a & c | b & ~c) + k[2] - 51403784 | 0;
        d = (d << 9 | d >>> 23) + a | 0;
        c += (d & b | a & ~b) + k[7] + 1735328473 | 0;
        c = (c << 14 | c >>> 18) + d | 0;
        b += (c & a | d & ~a) + k[12] - 1926607734 | 0;
        b = (b << 20 | b >>> 12) + c | 0;
        a += (b ^ c ^ d) + k[5] - 378558 | 0;
        a = (a << 4 | a >>> 28) + b | 0;
        d += (a ^ b ^ c) + k[8] - 2022574463 | 0;
        d = (d << 11 | d >>> 21) + a | 0;
        c += (d ^ a ^ b) + k[11] + 1839030562 | 0;
        c = (c << 16 | c >>> 16) + d | 0;
        b += (c ^ d ^ a) + k[14] - 35309556 | 0;
        b = (b << 23 | b >>> 9) + c | 0;
        a += (b ^ c ^ d) + k[1] - 1530992060 | 0;
        a = (a << 4 | a >>> 28) + b | 0;
        d += (a ^ b ^ c) + k[4] + 1272893353 | 0;
        d = (d << 11 | d >>> 21) + a | 0;
        c += (d ^ a ^ b) + k[7] - 155497632 | 0;
        c = (c << 16 | c >>> 16) + d | 0;
        b += (c ^ d ^ a) + k[10] - 1094730640 | 0;
        b = (b << 23 | b >>> 9) + c | 0;
        a += (b ^ c ^ d) + k[13] + 681279174 | 0;
        a = (a << 4 | a >>> 28) + b | 0;
        d += (a ^ b ^ c) + k[0] - 358537222 | 0;
        d = (d << 11 | d >>> 21) + a | 0;
        c += (d ^ a ^ b) + k[3] - 722521979 | 0;
        c = (c << 16 | c >>> 16) + d | 0;
        b += (c ^ d ^ a) + k[6] + 76029189 | 0;
        b = (b << 23 | b >>> 9) + c | 0;
        a += (b ^ c ^ d) + k[9] - 640364487 | 0;
        a = (a << 4 | a >>> 28) + b | 0;
        d += (a ^ b ^ c) + k[12] - 421815835 | 0;
        d = (d << 11 | d >>> 21) + a | 0;
        c += (d ^ a ^ b) + k[15] + 530742520 | 0;
        c = (c << 16 | c >>> 16) + d | 0;
        b += (c ^ d ^ a) + k[2] - 995338651 | 0;
        b = (b << 23 | b >>> 9) + c | 0;
        a += (c ^ (b | ~d)) + k[0] - 198630844 | 0;
        a = (a << 6 | a >>> 26) + b | 0;
        d += (b ^ (a | ~c)) + k[7] + 1126891415 | 0;
        d = (d << 10 | d >>> 22) + a | 0;
        c += (a ^ (d | ~b)) + k[14] - 1416354905 | 0;
        c = (c << 15 | c >>> 17) + d | 0;
        b += (d ^ (c | ~a)) + k[5] - 57434055 | 0;
        b = (b << 21 | b >>> 11) + c | 0;
        a += (c ^ (b | ~d)) + k[12] + 1700485571 | 0;
        a = (a << 6 | a >>> 26) + b | 0;
        d += (b ^ (a | ~c)) + k[3] - 1894986606 | 0;
        d = (d << 10 | d >>> 22) + a | 0;
        c += (a ^ (d | ~b)) + k[10] - 1051523 | 0;
        c = (c << 15 | c >>> 17) + d | 0;
        b += (d ^ (c | ~a)) + k[1] - 2054922799 | 0;
        b = (b << 21 | b >>> 11) + c | 0;
        a += (c ^ (b | ~d)) + k[8] + 1873313359 | 0;
        a = (a << 6 | a >>> 26) + b | 0;
        d += (b ^ (a | ~c)) + k[15] - 30611744 | 0;
        d = (d << 10 | d >>> 22) + a | 0;
        c += (a ^ (d | ~b)) + k[6] - 1560198380 | 0;
        c = (c << 15 | c >>> 17) + d | 0;
        b += (d ^ (c | ~a)) + k[13] + 1309151649 | 0;
        b = (b << 21 | b >>> 11) + c | 0;
        a += (c ^ (b | ~d)) + k[4] - 145523070 | 0;
        a = (a << 6 | a >>> 26) + b | 0;
        d += (b ^ (a | ~c)) + k[11] - 1120210379 | 0;
        d = (d << 10 | d >>> 22) + a | 0;
        c += (a ^ (d | ~b)) + k[2] + 718787259 | 0;
        c = (c << 15 | c >>> 17) + d | 0;
        b += (d ^ (c | ~a)) + k[9] - 343485551 | 0;
        b = (b << 21 | b >>> 11) + c | 0;
        x[0] = a + x[0] | 0;
        x[1] = b + x[1] | 0;
        x[2] = c + x[2] | 0;
        x[3] = d + x[3] | 0;
      }
      function md5blk(s) {
        var md5blks = [],
          i;
        for (i = 0; i < 64; i += 4) {
          md5blks[i >> 2] = s.charCodeAt(i) + (s.charCodeAt(i + 1) << 8) + (s.charCodeAt(i + 2) << 16) + (s.charCodeAt(i + 3) << 24);
        }
        return md5blks;
      }
      function md5blk_array(a) {
        var md5blks = [],
          i;
        for (i = 0; i < 64; i += 4) {
          md5blks[i >> 2] = a[i] + (a[i + 1] << 8) + (a[i + 2] << 16) + (a[i + 3] << 24);
        }
        return md5blks;
      }
      function md51(s) {
        var n = s.length,
          state = [1732584193, -271733879, -1732584194, 271733878],
          i,
          length,
          tail,
          tmp,
          lo,
          hi;
        for (i = 64; i <= n; i += 64) {
          md5cycle(state, md5blk(s.substring(i - 64, i)));
        }
        s = s.substring(i - 64);
        length = s.length;
        tail = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        for (i = 0; i < length; i += 1) {
          tail[i >> 2] |= s.charCodeAt(i) << (i % 4 << 3);
        }
        tail[i >> 2] |= 128 << (i % 4 << 3);
        if (i > 55) {
          md5cycle(state, tail);
          for (i = 0; i < 16; i += 1) {
            tail[i] = 0;
          }
        }
        tmp = n * 8;
        tmp = tmp.toString(16).match(/(.*?)(.{0,8})$/);
        lo = parseInt(tmp[2], 16);
        hi = parseInt(tmp[1], 16) || 0;
        tail[14] = lo;
        tail[15] = hi;
        md5cycle(state, tail);
        return state;
      }
      function md51_array(a) {
        var n = a.length,
          state = [1732584193, -271733879, -1732584194, 271733878],
          i,
          length,
          tail,
          tmp,
          lo,
          hi;
        for (i = 64; i <= n; i += 64) {
          md5cycle(state, md5blk_array(a.subarray(i - 64, i)));
        }
        a = i - 64 < n ? a.subarray(i - 64) : new Uint8Array(0);
        length = a.length;
        tail = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        for (i = 0; i < length; i += 1) {
          tail[i >> 2] |= a[i] << (i % 4 << 3);
        }
        tail[i >> 2] |= 128 << (i % 4 << 3);
        if (i > 55) {
          md5cycle(state, tail);
          for (i = 0; i < 16; i += 1) {
            tail[i] = 0;
          }
        }
        tmp = n * 8;
        tmp = tmp.toString(16).match(/(.*?)(.{0,8})$/);
        lo = parseInt(tmp[2], 16);
        hi = parseInt(tmp[1], 16) || 0;
        tail[14] = lo;
        tail[15] = hi;
        md5cycle(state, tail);
        return state;
      }
      function rhex(n) {
        var s = "",
          j;
        for (j = 0; j < 4; j += 1) {
          s += hex_chr[n >> j * 8 + 4 & 15] + hex_chr[n >> j * 8 & 15];
        }
        return s;
      }
      function hex(x) {
        var i;
        for (i = 0; i < x.length; i += 1) {
          x[i] = rhex(x[i]);
        }
        return x.join("");
      }
      if (hex(md51("hello")) !== "5d41402abc4b2a76b9719d911017c592") ;
      if (typeof ArrayBuffer !== "undefined" && !ArrayBuffer.prototype.slice) {
        (function () {
          function clamp(val, length) {
            val = val | 0 || 0;
            if (val < 0) {
              return Math.max(val + length, 0);
            }
            return Math.min(val, length);
          }
          ArrayBuffer.prototype.slice = function (from, to) {
            var length = this.byteLength,
              begin = clamp(from, length),
              end = length,
              num,
              target,
              targetArray,
              sourceArray;
            if (to !== undefined) {
              end = clamp(to, length);
            }
            if (begin > end) {
              return new ArrayBuffer(0);
            }
            num = end - begin;
            target = new ArrayBuffer(num);
            targetArray = new Uint8Array(target);
            sourceArray = new Uint8Array(this, begin, num);
            targetArray.set(sourceArray);
            return target;
          };
        })();
      }
      function toUtf8(str) {
        if (/[\u0080-\uFFFF]/.test(str)) {
          str = unescape(encodeURIComponent(str));
        }
        return str;
      }
      function utf8Str2ArrayBuffer(str, returnUInt8Array) {
        var length = str.length,
          buff = new ArrayBuffer(length),
          arr = new Uint8Array(buff),
          i;
        for (i = 0; i < length; i += 1) {
          arr[i] = str.charCodeAt(i);
        }
        return returnUInt8Array ? arr : buff;
      }
      function arrayBuffer2Utf8Str(buff) {
        return String.fromCharCode.apply(null, new Uint8Array(buff));
      }
      function concatenateArrayBuffers(first, second, returnUInt8Array) {
        var result = new Uint8Array(first.byteLength + second.byteLength);
        result.set(new Uint8Array(first));
        result.set(new Uint8Array(second), first.byteLength);
        return returnUInt8Array ? result : result.buffer;
      }
      function hexToBinaryString(hex) {
        var bytes = [],
          length = hex.length,
          x;
        for (x = 0; x < length - 1; x += 2) {
          bytes.push(parseInt(hex.substr(x, 2), 16));
        }
        return String.fromCharCode.apply(String, bytes);
      }
      function SparkMD5() {
        this.reset();
      }
      SparkMD5.prototype.append = function (str) {
        this.appendBinary(toUtf8(str));
        return this;
      };
      SparkMD5.prototype.appendBinary = function (contents) {
        this._buff += contents;
        this._length += contents.length;
        var length = this._buff.length,
          i;
        for (i = 64; i <= length; i += 64) {
          md5cycle(this._hash, md5blk(this._buff.substring(i - 64, i)));
        }
        this._buff = this._buff.substring(i - 64);
        return this;
      };
      SparkMD5.prototype.end = function (raw) {
        var buff = this._buff,
          length = buff.length,
          i,
          tail = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
          ret;
        for (i = 0; i < length; i += 1) {
          tail[i >> 2] |= buff.charCodeAt(i) << (i % 4 << 3);
        }
        this._finish(tail, length);
        ret = hex(this._hash);
        if (raw) {
          ret = hexToBinaryString(ret);
        }
        this.reset();
        return ret;
      };
      SparkMD5.prototype.reset = function () {
        this._buff = "";
        this._length = 0;
        this._hash = [1732584193, -271733879, -1732584194, 271733878];
        return this;
      };
      SparkMD5.prototype.getState = function () {
        return {
          buff: this._buff,
          length: this._length,
          hash: this._hash
        };
      };
      SparkMD5.prototype.setState = function (state) {
        this._buff = state.buff;
        this._length = state.length;
        this._hash = state.hash;
        return this;
      };
      SparkMD5.prototype.destroy = function () {
        delete this._hash;
        delete this._buff;
        delete this._length;
      };
      SparkMD5.prototype._finish = function (tail, length) {
        var i = length,
          tmp,
          lo,
          hi;
        tail[i >> 2] |= 128 << (i % 4 << 3);
        if (i > 55) {
          md5cycle(this._hash, tail);
          for (i = 0; i < 16; i += 1) {
            tail[i] = 0;
          }
        }
        tmp = this._length * 8;
        tmp = tmp.toString(16).match(/(.*?)(.{0,8})$/);
        lo = parseInt(tmp[2], 16);
        hi = parseInt(tmp[1], 16) || 0;
        tail[14] = lo;
        tail[15] = hi;
        md5cycle(this._hash, tail);
      };
      SparkMD5.hash = function (str, raw) {
        return SparkMD5.hashBinary(toUtf8(str), raw);
      };
      SparkMD5.hashBinary = function (content, raw) {
        var hash = md51(content),
          ret = hex(hash);
        return raw ? hexToBinaryString(ret) : ret;
      };
      SparkMD5.ArrayBuffer = function () {
        this.reset();
      };
      SparkMD5.ArrayBuffer.prototype.append = function (arr) {
        var buff = concatenateArrayBuffers(this._buff.buffer, arr, true),
          length = buff.length,
          i;
        this._length += arr.byteLength;
        for (i = 64; i <= length; i += 64) {
          md5cycle(this._hash, md5blk_array(buff.subarray(i - 64, i)));
        }
        this._buff = i - 64 < length ? new Uint8Array(buff.buffer.slice(i - 64)) : new Uint8Array(0);
        return this;
      };
      SparkMD5.ArrayBuffer.prototype.end = function (raw) {
        var buff = this._buff,
          length = buff.length,
          tail = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
          i,
          ret;
        for (i = 0; i < length; i += 1) {
          tail[i >> 2] |= buff[i] << (i % 4 << 3);
        }
        this._finish(tail, length);
        ret = hex(this._hash);
        if (raw) {
          ret = hexToBinaryString(ret);
        }
        this.reset();
        return ret;
      };
      SparkMD5.ArrayBuffer.prototype.reset = function () {
        this._buff = new Uint8Array(0);
        this._length = 0;
        this._hash = [1732584193, -271733879, -1732584194, 271733878];
        return this;
      };
      SparkMD5.ArrayBuffer.prototype.getState = function () {
        var state = SparkMD5.prototype.getState.call(this);
        state.buff = arrayBuffer2Utf8Str(state.buff);
        return state;
      };
      SparkMD5.ArrayBuffer.prototype.setState = function (state) {
        state.buff = utf8Str2ArrayBuffer(state.buff, true);
        return SparkMD5.prototype.setState.call(this, state);
      };
      SparkMD5.ArrayBuffer.prototype.destroy = SparkMD5.prototype.destroy;
      SparkMD5.ArrayBuffer.prototype._finish = SparkMD5.prototype._finish;
      SparkMD5.ArrayBuffer.hash = function (arr, raw) {
        var hash = md51_array(new Uint8Array(arr)),
          ret = hex(hash);
        return raw ? hexToBinaryString(ret) : ret;
      };
      return SparkMD5;
    });
  });
  var classCallCheck = function (instance, Constructor) {
    if (!(instance instanceof Constructor)) {
      throw new TypeError("Cannot call a class as a function");
    }
  };
  var createClass = function () {
    function defineProperties(target, props) {
      for (var i = 0; i < props.length; i++) {
        var descriptor = props[i];
        descriptor.enumerable = descriptor.enumerable || false;
        descriptor.configurable = true;
        if ("value" in descriptor) descriptor.writable = true;
        Object.defineProperty(target, descriptor.key, descriptor);
      }
    }
    return function (Constructor, protoProps, staticProps) {
      if (protoProps) defineProperties(Constructor.prototype, protoProps);
      if (staticProps) defineProperties(Constructor, staticProps);
      return Constructor;
    };
  }();
  var fileSlice = File.prototype.slice || File.prototype.mozSlice || File.prototype.webkitSlice;
  var FileChecksum = function () {
    createClass(FileChecksum, null, [{
      key: "create",
      value: function create(file, callback) {
        var instance = new FileChecksum(file);
        instance.create(callback);
      }
    }]);
    function FileChecksum(file) {
      classCallCheck(this, FileChecksum);
      this.file = file;
      this.chunkSize = 2097152;
      this.chunkCount = Math.ceil(this.file.size / this.chunkSize);
      this.chunkIndex = 0;
    }
    createClass(FileChecksum, [{
      key: "create",
      value: function create(callback) {
        var _this = this;
        this.callback = callback;
        this.md5Buffer = new sparkMd5.ArrayBuffer();
        this.fileReader = new FileReader();
        this.fileReader.addEventListener("load", function (event) {
          return _this.fileReaderDidLoad(event);
        });
        this.fileReader.addEventListener("error", function (event) {
          return _this.fileReaderDidError(event);
        });
        this.readNextChunk();
      }
    }, {
      key: "fileReaderDidLoad",
      value: function fileReaderDidLoad(event) {
        this.md5Buffer.append(event.target.result);
        if (!this.readNextChunk()) {
          var binaryDigest = this.md5Buffer.end(true);
          var base64digest = btoa(binaryDigest);
          this.callback(null, base64digest);
        }
      }
    }, {
      key: "fileReaderDidError",
      value: function fileReaderDidError(event) {
        this.callback("Error reading " + this.file.name);
      }
    }, {
      key: "readNextChunk",
      value: function readNextChunk() {
        if (this.chunkIndex < this.chunkCount || this.chunkIndex == 0 && this.chunkCount == 0) {
          var start = this.chunkIndex * this.chunkSize;
          var end = Math.min(start + this.chunkSize, this.file.size);
          var bytes = fileSlice.call(this.file, start, end);
          this.fileReader.readAsArrayBuffer(bytes);
          this.chunkIndex++;
          return true;
        } else {
          return false;
        }
      }
    }]);
    return FileChecksum;
  }();
  function getMetaValue(name) {
    var element = findElement(document.head, 'meta[name="' + name + '"]');
    if (element) {
      return element.getAttribute("content");
    }
  }
  function findElements(root, selector) {
    if (typeof root == "string") {
      selector = root;
      root = document;
    }
    var elements = root.querySelectorAll(selector);
    return toArray$1(elements);
  }
  function findElement(root, selector) {
    if (typeof root == "string") {
      selector = root;
      root = document;
    }
    return root.querySelector(selector);
  }
  function dispatchEvent(element, type) {
    var eventInit = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : {};
    var disabled = element.disabled;
    var bubbles = eventInit.bubbles,
      cancelable = eventInit.cancelable,
      detail = eventInit.detail;
    var event = document.createEvent("Event");
    event.initEvent(type, bubbles || true, cancelable || true);
    event.detail = detail || {};
    try {
      element.disabled = false;
      element.dispatchEvent(event);
    } finally {
      element.disabled = disabled;
    }
    return event;
  }
  function toArray$1(value) {
    if (Array.isArray(value)) {
      return value;
    } else if (Array.from) {
      return Array.from(value);
    } else {
      return [].slice.call(value);
    }
  }
  var BlobRecord = function () {
    function BlobRecord(file, checksum, url) {
      var _this = this;
      classCallCheck(this, BlobRecord);
      this.file = file;
      this.attributes = {
        filename: file.name,
        content_type: file.type || "application/octet-stream",
        byte_size: file.size,
        checksum: checksum
      };
      this.xhr = new XMLHttpRequest();
      this.xhr.open("POST", url, true);
      this.xhr.responseType = "json";
      this.xhr.setRequestHeader("Content-Type", "application/json");
      this.xhr.setRequestHeader("Accept", "application/json");
      this.xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest");
      var csrfToken = getMetaValue("csrf-token");
      if (csrfToken != undefined) {
        this.xhr.setRequestHeader("X-CSRF-Token", csrfToken);
      }
      this.xhr.addEventListener("load", function (event) {
        return _this.requestDidLoad(event);
      });
      this.xhr.addEventListener("error", function (event) {
        return _this.requestDidError(event);
      });
    }
    createClass(BlobRecord, [{
      key: "create",
      value: function create(callback) {
        this.callback = callback;
        this.xhr.send(JSON.stringify({
          blob: this.attributes
        }));
      }
    }, {
      key: "requestDidLoad",
      value: function requestDidLoad(event) {
        if (this.status >= 200 && this.status < 300) {
          var response = this.response;
          var direct_upload = response.direct_upload;
          delete response.direct_upload;
          this.attributes = response;
          this.directUploadData = direct_upload;
          this.callback(null, this.toJSON());
        } else {
          this.requestDidError(event);
        }
      }
    }, {
      key: "requestDidError",
      value: function requestDidError(event) {
        this.callback('Error creating Blob for "' + this.file.name + '". Status: ' + this.status);
      }
    }, {
      key: "toJSON",
      value: function toJSON() {
        var result = {};
        for (var key in this.attributes) {
          result[key] = this.attributes[key];
        }
        return result;
      }
    }, {
      key: "status",
      get: function get$$1() {
        return this.xhr.status;
      }
    }, {
      key: "response",
      get: function get$$1() {
        var _xhr = this.xhr,
          responseType = _xhr.responseType,
          response = _xhr.response;
        if (responseType == "json") {
          return response;
        } else {
          return JSON.parse(response);
        }
      }
    }]);
    return BlobRecord;
  }();
  var BlobUpload = function () {
    function BlobUpload(blob) {
      var _this = this;
      classCallCheck(this, BlobUpload);
      this.blob = blob;
      this.file = blob.file;
      var _blob$directUploadDat = blob.directUploadData,
        url = _blob$directUploadDat.url,
        headers = _blob$directUploadDat.headers;
      this.xhr = new XMLHttpRequest();
      this.xhr.open("PUT", url, true);
      this.xhr.responseType = "text";
      for (var key in headers) {
        this.xhr.setRequestHeader(key, headers[key]);
      }
      this.xhr.addEventListener("load", function (event) {
        return _this.requestDidLoad(event);
      });
      this.xhr.addEventListener("error", function (event) {
        return _this.requestDidError(event);
      });
    }
    createClass(BlobUpload, [{
      key: "create",
      value: function create(callback) {
        this.callback = callback;
        this.xhr.send(this.file.slice());
      }
    }, {
      key: "requestDidLoad",
      value: function requestDidLoad(event) {
        var _xhr = this.xhr,
          status = _xhr.status,
          response = _xhr.response;
        if (status >= 200 && status < 300) {
          this.callback(null, response);
        } else {
          this.requestDidError(event);
        }
      }
    }, {
      key: "requestDidError",
      value: function requestDidError(event) {
        this.callback('Error storing "' + this.file.name + '". Status: ' + this.xhr.status);
      }
    }]);
    return BlobUpload;
  }();
  var id = 0;
  var DirectUpload = function () {
    function DirectUpload(file, url, delegate) {
      classCallCheck(this, DirectUpload);
      this.id = ++id;
      this.file = file;
      this.url = url;
      this.delegate = delegate;
    }
    createClass(DirectUpload, [{
      key: "create",
      value: function create(callback) {
        var _this = this;
        FileChecksum.create(this.file, function (error, checksum) {
          if (error) {
            callback(error);
            return;
          }
          var blob = new BlobRecord(_this.file, checksum, _this.url);
          notify(_this.delegate, "directUploadWillCreateBlobWithXHR", blob.xhr);
          blob.create(function (error) {
            if (error) {
              callback(error);
            } else {
              var upload = new BlobUpload(blob);
              notify(_this.delegate, "directUploadWillStoreFileWithXHR", upload.xhr);
              upload.create(function (error) {
                if (error) {
                  callback(error);
                } else {
                  callback(null, blob.toJSON());
                }
              });
            }
          });
        });
      }
    }]);
    return DirectUpload;
  }();
  function notify(object, methodName) {
    if (object && typeof object[methodName] == "function") {
      for (var _len = arguments.length, messages = Array(_len > 2 ? _len - 2 : 0), _key = 2; _key < _len; _key++) {
        messages[_key - 2] = arguments[_key];
      }
      return object[methodName].apply(object, messages);
    }
  }
  var DirectUploadController = function () {
    function DirectUploadController(input, file) {
      classCallCheck(this, DirectUploadController);
      this.input = input;
      this.file = file;
      this.directUpload = new DirectUpload(this.file, this.url, this);
      this.dispatch("initialize");
    }
    createClass(DirectUploadController, [{
      key: "start",
      value: function start(callback) {
        var _this = this;
        var hiddenInput = document.createElement("input");
        hiddenInput.type = "hidden";
        hiddenInput.name = this.input.name;
        this.input.insertAdjacentElement("beforebegin", hiddenInput);
        this.dispatch("start");
        this.directUpload.create(function (error, attributes) {
          if (error) {
            hiddenInput.parentNode.removeChild(hiddenInput);
            _this.dispatchError(error);
          } else {
            hiddenInput.value = attributes.signed_id;
          }
          _this.dispatch("end");
          callback(error);
        });
      }
    }, {
      key: "uploadRequestDidProgress",
      value: function uploadRequestDidProgress(event) {
        var progress = event.loaded / event.total * 100;
        if (progress) {
          this.dispatch("progress", {
            progress: progress
          });
        }
      }
    }, {
      key: "dispatch",
      value: function dispatch(name) {
        var detail = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {};
        detail.file = this.file;
        detail.id = this.directUpload.id;
        return dispatchEvent(this.input, "direct-upload:" + name, {
          detail: detail
        });
      }
    }, {
      key: "dispatchError",
      value: function dispatchError(error) {
        var event = this.dispatch("error", {
          error: error
        });
        if (!event.defaultPrevented) {
          alert(error);
        }
      }
    }, {
      key: "directUploadWillCreateBlobWithXHR",
      value: function directUploadWillCreateBlobWithXHR(xhr) {
        this.dispatch("before-blob-request", {
          xhr: xhr
        });
      }
    }, {
      key: "directUploadWillStoreFileWithXHR",
      value: function directUploadWillStoreFileWithXHR(xhr) {
        var _this2 = this;
        this.dispatch("before-storage-request", {
          xhr: xhr
        });
        xhr.upload.addEventListener("progress", function (event) {
          return _this2.uploadRequestDidProgress(event);
        });
      }
    }, {
      key: "url",
      get: function get$$1() {
        return this.input.getAttribute("data-direct-upload-url");
      }
    }]);
    return DirectUploadController;
  }();
  var inputSelector = "input[type=file][data-direct-upload-url]:not([disabled])";
  var DirectUploadsController = function () {
    function DirectUploadsController(form) {
      classCallCheck(this, DirectUploadsController);
      this.form = form;
      this.inputs = findElements(form, inputSelector).filter(function (input) {
        return input.files.length;
      });
    }
    createClass(DirectUploadsController, [{
      key: "start",
      value: function start(callback) {
        var _this = this;
        var controllers = this.createDirectUploadControllers();
        var startNextController = function startNextController() {
          var controller = controllers.shift();
          if (controller) {
            controller.start(function (error) {
              if (error) {
                callback(error);
                _this.dispatch("end");
              } else {
                startNextController();
              }
            });
          } else {
            callback();
            _this.dispatch("end");
          }
        };
        this.dispatch("start");
        startNextController();
      }
    }, {
      key: "createDirectUploadControllers",
      value: function createDirectUploadControllers() {
        var controllers = [];
        this.inputs.forEach(function (input) {
          toArray$1(input.files).forEach(function (file) {
            var controller = new DirectUploadController(input, file);
            controllers.push(controller);
          });
        });
        return controllers;
      }
    }, {
      key: "dispatch",
      value: function dispatch(name) {
        var detail = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {};
        return dispatchEvent(this.form, "direct-uploads:" + name, {
          detail: detail
        });
      }
    }]);
    return DirectUploadsController;
  }();
  var processingAttribute = "data-direct-uploads-processing";
  var submitButtonsByForm = new WeakMap();
  var started = false;
  function start() {
    if (!started) {
      started = true;
      document.addEventListener("click", didClick, true);
      document.addEventListener("submit", didSubmitForm);
      document.addEventListener("ajax:before", didSubmitRemoteElement);
    }
  }
  function didClick(event) {
    var target = event.target;
    if ((target.tagName == "INPUT" || target.tagName == "BUTTON") && target.type == "submit" && target.form) {
      submitButtonsByForm.set(target.form, target);
    }
  }
  function didSubmitForm(event) {
    handleFormSubmissionEvent(event);
  }
  function didSubmitRemoteElement(event) {
    if (event.target.tagName == "FORM") {
      handleFormSubmissionEvent(event);
    }
  }
  function handleFormSubmissionEvent(event) {
    var form = event.target;
    if (form.hasAttribute(processingAttribute)) {
      event.preventDefault();
      return;
    }
    var controller = new DirectUploadsController(form);
    var inputs = controller.inputs;
    if (inputs.length) {
      event.preventDefault();
      form.setAttribute(processingAttribute, "");
      inputs.forEach(disable);
      controller.start(function (error) {
        form.removeAttribute(processingAttribute);
        if (error) {
          inputs.forEach(enable);
        } else {
          submitForm(form);
        }
      });
    }
  }
  function submitForm(form) {
    var button = submitButtonsByForm.get(form) || findElement(form, "input[type=submit], button[type=submit]");
    if (button) {
      var _button = button,
        disabled = _button.disabled;
      button.disabled = false;
      button.focus();
      button.click();
      button.disabled = disabled;
    } else {
      button = document.createElement("input");
      button.type = "submit";
      button.style.display = "none";
      form.appendChild(button);
      button.click();
      form.removeChild(button);
    }
    submitButtonsByForm.delete(form);
  }
  function disable(input) {
    input.disabled = true;
  }
  function enable(input) {
    input.disabled = false;
  }
  function autostart() {
    if (window.ActiveStorage) {
      start();
    }
  }
  setTimeout(autostart, 1);
  exports.start = start;
  exports.DirectUpload = DirectUpload;
  Object.defineProperty(exports, "__esModule", {
    value: true
  });
});

/***/ }),

/***/ "./node_modules/@rails/ujs/lib/assets/compiled/rails-ujs.js":
/*!******************************************************************!*\
  !*** ./node_modules/@rails/ujs/lib/assets/compiled/rails-ujs.js ***!
  \******************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

var __WEBPACK_AMD_DEFINE_FACTORY__, __WEBPACK_AMD_DEFINE_RESULT__;/*
Unobtrusive JavaScript
https://github.com/rails/rails/blob/main/actionview/app/assets/javascripts
Released under the MIT license
 */;
(function () {
  var context = this;
  (function () {
    (function () {
      this.Rails = {
        linkClickSelector: 'a[data-confirm], a[data-method], a[data-remote]:not([disabled]), a[data-disable-with], a[data-disable]',
        buttonClickSelector: {
          selector: 'button[data-remote]:not([form]), button[data-confirm]:not([form])',
          exclude: 'form button'
        },
        inputChangeSelector: 'select[data-remote], input[data-remote], textarea[data-remote]',
        formSubmitSelector: 'form:not([data-turbo=true])',
        formInputClickSelector: 'form:not([data-turbo=true]) input[type=submit], form:not([data-turbo=true]) input[type=image], form:not([data-turbo=true]) button[type=submit], form:not([data-turbo=true]) button:not([type]), input[type=submit][form], input[type=image][form], button[type=submit][form], button[form]:not([type])',
        formDisableSelector: 'input[data-disable-with]:enabled, button[data-disable-with]:enabled, textarea[data-disable-with]:enabled, input[data-disable]:enabled, button[data-disable]:enabled, textarea[data-disable]:enabled',
        formEnableSelector: 'input[data-disable-with]:disabled, button[data-disable-with]:disabled, textarea[data-disable-with]:disabled, input[data-disable]:disabled, button[data-disable]:disabled, textarea[data-disable]:disabled',
        fileInputSelector: 'input[name][type=file]:not([disabled])',
        linkDisableSelector: 'a[data-disable-with], a[data-disable]',
        buttonDisableSelector: 'button[data-remote][data-disable-with], button[data-remote][data-disable]'
      };
    }).call(this);
  }).call(context);
  var Rails = context.Rails;
  (function () {
    (function () {
      var nonce;
      nonce = null;
      Rails.loadCSPNonce = function () {
        var ref;
        return nonce = (ref = document.querySelector("meta[name=csp-nonce]")) != null ? ref.content : void 0;
      };
      Rails.cspNonce = function () {
        return nonce != null ? nonce : Rails.loadCSPNonce();
      };
    }).call(this);
    (function () {
      var expando, m;
      m = Element.prototype.matches || Element.prototype.matchesSelector || Element.prototype.mozMatchesSelector || Element.prototype.msMatchesSelector || Element.prototype.oMatchesSelector || Element.prototype.webkitMatchesSelector;
      Rails.matches = function (element, selector) {
        if (selector.exclude != null) {
          return m.call(element, selector.selector) && !m.call(element, selector.exclude);
        } else {
          return m.call(element, selector);
        }
      };
      expando = '_ujsData';
      Rails.getData = function (element, key) {
        var ref;
        return (ref = element[expando]) != null ? ref[key] : void 0;
      };
      Rails.setData = function (element, key, value) {
        if (element[expando] == null) {
          element[expando] = {};
        }
        return element[expando][key] = value;
      };
      Rails.isContentEditable = function (element) {
        var isEditable;
        isEditable = false;
        while (true) {
          if (element.isContentEditable) {
            isEditable = true;
            break;
          }
          element = element.parentElement;
          if (!element) {
            break;
          }
        }
        return isEditable;
      };
      Rails.$ = function (selector) {
        return Array.prototype.slice.call(document.querySelectorAll(selector));
      };
    }).call(this);
    (function () {
      var $, csrfParam, csrfToken;
      $ = Rails.$;
      csrfToken = Rails.csrfToken = function () {
        var meta;
        meta = document.querySelector('meta[name=csrf-token]');
        return meta && meta.content;
      };
      csrfParam = Rails.csrfParam = function () {
        var meta;
        meta = document.querySelector('meta[name=csrf-param]');
        return meta && meta.content;
      };
      Rails.CSRFProtection = function (xhr) {
        var token;
        token = csrfToken();
        if (token != null) {
          return xhr.setRequestHeader('X-CSRF-Token', token);
        }
      };
      Rails.refreshCSRFTokens = function () {
        var param, token;
        token = csrfToken();
        param = csrfParam();
        if (token != null && param != null) {
          return $('form input[name="' + param + '"]').forEach(function (input) {
            return input.value = token;
          });
        }
      };
    }).call(this);
    (function () {
      var CustomEvent, fire, matches, preventDefault;
      matches = Rails.matches;
      CustomEvent = window.CustomEvent;
      if (typeof CustomEvent !== 'function') {
        CustomEvent = function (event, params) {
          var evt;
          evt = document.createEvent('CustomEvent');
          evt.initCustomEvent(event, params.bubbles, params.cancelable, params.detail);
          return evt;
        };
        CustomEvent.prototype = window.Event.prototype;
        preventDefault = CustomEvent.prototype.preventDefault;
        CustomEvent.prototype.preventDefault = function () {
          var result;
          result = preventDefault.call(this);
          if (this.cancelable && !this.defaultPrevented) {
            Object.defineProperty(this, 'defaultPrevented', {
              get: function () {
                return true;
              }
            });
          }
          return result;
        };
      }
      fire = Rails.fire = function (obj, name, data) {
        var event;
        event = new CustomEvent(name, {
          bubbles: true,
          cancelable: true,
          detail: data
        });
        obj.dispatchEvent(event);
        return !event.defaultPrevented;
      };
      Rails.stopEverything = function (e) {
        fire(e.target, 'ujs:everythingStopped');
        e.preventDefault();
        e.stopPropagation();
        return e.stopImmediatePropagation();
      };
      Rails.delegate = function (element, selector, eventType, handler) {
        return element.addEventListener(eventType, function (e) {
          var target;
          target = e.target;
          while (!(!(target instanceof Element) || matches(target, selector))) {
            target = target.parentNode;
          }
          if (target instanceof Element && handler.call(target, e) === false) {
            e.preventDefault();
            return e.stopPropagation();
          }
        });
      };
    }).call(this);
    (function () {
      var AcceptHeaders, CSRFProtection, createXHR, cspNonce, fire, prepareOptions, processResponse;
      cspNonce = Rails.cspNonce, CSRFProtection = Rails.CSRFProtection, fire = Rails.fire;
      AcceptHeaders = {
        '*': '*/*',
        text: 'text/plain',
        html: 'text/html',
        xml: 'application/xml, text/xml',
        json: 'application/json, text/javascript',
        script: 'text/javascript, application/javascript, application/ecmascript, application/x-ecmascript'
      };
      Rails.ajax = function (options) {
        var xhr;
        options = prepareOptions(options);
        xhr = createXHR(options, function () {
          var ref, response;
          response = processResponse((ref = xhr.response) != null ? ref : xhr.responseText, xhr.getResponseHeader('Content-Type'));
          if (Math.floor(xhr.status / 100) === 2) {
            if (typeof options.success === "function") {
              options.success(response, xhr.statusText, xhr);
            }
          } else {
            if (typeof options.error === "function") {
              options.error(response, xhr.statusText, xhr);
            }
          }
          return typeof options.complete === "function" ? options.complete(xhr, xhr.statusText) : void 0;
        });
        if (options.beforeSend != null && !options.beforeSend(xhr, options)) {
          return false;
        }
        if (xhr.readyState === XMLHttpRequest.OPENED) {
          return xhr.send(options.data);
        }
      };
      prepareOptions = function (options) {
        options.url = options.url || location.href;
        options.type = options.type.toUpperCase();
        if (options.type === 'GET' && options.data) {
          if (options.url.indexOf('?') < 0) {
            options.url += '?' + options.data;
          } else {
            options.url += '&' + options.data;
          }
        }
        if (AcceptHeaders[options.dataType] == null) {
          options.dataType = '*';
        }
        options.accept = AcceptHeaders[options.dataType];
        if (options.dataType !== '*') {
          options.accept += ', */*; q=0.01';
        }
        return options;
      };
      createXHR = function (options, done) {
        var xhr;
        xhr = new XMLHttpRequest();
        xhr.open(options.type, options.url, true);
        xhr.setRequestHeader('Accept', options.accept);
        if (typeof options.data === 'string') {
          xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
        }
        if (!options.crossDomain) {
          xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
          CSRFProtection(xhr);
        }
        xhr.withCredentials = !!options.withCredentials;
        xhr.onreadystatechange = function () {
          if (xhr.readyState === XMLHttpRequest.DONE) {
            return done(xhr);
          }
        };
        return xhr;
      };
      processResponse = function (response, type) {
        var parser, script;
        if (typeof response === 'string' && typeof type === 'string') {
          if (type.match(/\bjson\b/)) {
            try {
              response = JSON.parse(response);
            } catch (error) {}
          } else if (type.match(/\b(?:java|ecma)script\b/)) {
            script = document.createElement('script');
            script.setAttribute('nonce', cspNonce());
            script.text = response;
            document.head.appendChild(script).parentNode.removeChild(script);
          } else if (type.match(/\b(xml|html|svg)\b/)) {
            parser = new DOMParser();
            type = type.replace(/;.+/, '');
            try {
              response = parser.parseFromString(response, type);
            } catch (error) {}
          }
        }
        return response;
      };
      Rails.href = function (element) {
        return element.href;
      };
      Rails.isCrossDomain = function (url) {
        var e, originAnchor, urlAnchor;
        originAnchor = document.createElement('a');
        originAnchor.href = location.href;
        urlAnchor = document.createElement('a');
        try {
          urlAnchor.href = url;
          return !((!urlAnchor.protocol || urlAnchor.protocol === ':') && !urlAnchor.host || originAnchor.protocol + '//' + originAnchor.host === urlAnchor.protocol + '//' + urlAnchor.host);
        } catch (error) {
          e = error;
          return true;
        }
      };
    }).call(this);
    (function () {
      var matches, toArray;
      matches = Rails.matches;
      toArray = function (e) {
        return Array.prototype.slice.call(e);
      };
      Rails.serializeElement = function (element, additionalParam) {
        var inputs, params;
        inputs = [element];
        if (matches(element, 'form')) {
          inputs = toArray(element.elements);
        }
        params = [];
        inputs.forEach(function (input) {
          if (!input.name || input.disabled) {
            return;
          }
          if (matches(input, 'fieldset[disabled] *')) {
            return;
          }
          if (matches(input, 'select')) {
            return toArray(input.options).forEach(function (option) {
              if (option.selected) {
                return params.push({
                  name: input.name,
                  value: option.value
                });
              }
            });
          } else if (input.checked || ['radio', 'checkbox', 'submit'].indexOf(input.type) === -1) {
            return params.push({
              name: input.name,
              value: input.value
            });
          }
        });
        if (additionalParam) {
          params.push(additionalParam);
        }
        return params.map(function (param) {
          if (param.name != null) {
            return encodeURIComponent(param.name) + "=" + encodeURIComponent(param.value);
          } else {
            return param;
          }
        }).join('&');
      };
      Rails.formElements = function (form, selector) {
        if (matches(form, 'form')) {
          return toArray(form.elements).filter(function (el) {
            return matches(el, selector);
          });
        } else {
          return toArray(form.querySelectorAll(selector));
        }
      };
    }).call(this);
    (function () {
      var allowAction, fire, stopEverything;
      fire = Rails.fire, stopEverything = Rails.stopEverything;
      Rails.handleConfirm = function (e) {
        if (!allowAction(this)) {
          return stopEverything(e);
        }
      };
      Rails.confirm = function (message, element) {
        return confirm(message);
      };
      allowAction = function (element) {
        var answer, callback, message;
        message = element.getAttribute('data-confirm');
        if (!message) {
          return true;
        }
        answer = false;
        if (fire(element, 'confirm')) {
          try {
            answer = Rails.confirm(message, element);
          } catch (error) {}
          callback = fire(element, 'confirm:complete', [answer]);
        }
        return answer && callback;
      };
    }).call(this);
    (function () {
      var disableFormElement, disableFormElements, disableLinkElement, enableFormElement, enableFormElements, enableLinkElement, formElements, getData, isContentEditable, isXhrRedirect, matches, setData, stopEverything;
      matches = Rails.matches, getData = Rails.getData, setData = Rails.setData, stopEverything = Rails.stopEverything, formElements = Rails.formElements, isContentEditable = Rails.isContentEditable;
      Rails.handleDisabledElement = function (e) {
        var element;
        element = this;
        if (element.disabled) {
          return stopEverything(e);
        }
      };
      Rails.enableElement = function (e) {
        var element;
        if (e instanceof Event) {
          if (isXhrRedirect(e)) {
            return;
          }
          element = e.target;
        } else {
          element = e;
        }
        if (isContentEditable(element)) {
          return;
        }
        if (matches(element, Rails.linkDisableSelector)) {
          return enableLinkElement(element);
        } else if (matches(element, Rails.buttonDisableSelector) || matches(element, Rails.formEnableSelector)) {
          return enableFormElement(element);
        } else if (matches(element, Rails.formSubmitSelector)) {
          return enableFormElements(element);
        }
      };
      Rails.disableElement = function (e) {
        var element;
        element = e instanceof Event ? e.target : e;
        if (isContentEditable(element)) {
          return;
        }
        if (matches(element, Rails.linkDisableSelector)) {
          return disableLinkElement(element);
        } else if (matches(element, Rails.buttonDisableSelector) || matches(element, Rails.formDisableSelector)) {
          return disableFormElement(element);
        } else if (matches(element, Rails.formSubmitSelector)) {
          return disableFormElements(element);
        }
      };
      disableLinkElement = function (element) {
        var replacement;
        if (getData(element, 'ujs:disabled')) {
          return;
        }
        replacement = element.getAttribute('data-disable-with');
        if (replacement != null) {
          setData(element, 'ujs:enable-with', element.innerHTML);
          element.innerHTML = replacement;
        }
        element.addEventListener('click', stopEverything);
        return setData(element, 'ujs:disabled', true);
      };
      enableLinkElement = function (element) {
        var originalText;
        originalText = getData(element, 'ujs:enable-with');
        if (originalText != null) {
          element.innerHTML = originalText;
          setData(element, 'ujs:enable-with', null);
        }
        element.removeEventListener('click', stopEverything);
        return setData(element, 'ujs:disabled', null);
      };
      disableFormElements = function (form) {
        return formElements(form, Rails.formDisableSelector).forEach(disableFormElement);
      };
      disableFormElement = function (element) {
        var replacement;
        if (getData(element, 'ujs:disabled')) {
          return;
        }
        replacement = element.getAttribute('data-disable-with');
        if (replacement != null) {
          if (matches(element, 'button')) {
            setData(element, 'ujs:enable-with', element.innerHTML);
            element.innerHTML = replacement;
          } else {
            setData(element, 'ujs:enable-with', element.value);
            element.value = replacement;
          }
        }
        element.disabled = true;
        return setData(element, 'ujs:disabled', true);
      };
      enableFormElements = function (form) {
        return formElements(form, Rails.formEnableSelector).forEach(enableFormElement);
      };
      enableFormElement = function (element) {
        var originalText;
        originalText = getData(element, 'ujs:enable-with');
        if (originalText != null) {
          if (matches(element, 'button')) {
            element.innerHTML = originalText;
          } else {
            element.value = originalText;
          }
          setData(element, 'ujs:enable-with', null);
        }
        element.disabled = false;
        return setData(element, 'ujs:disabled', null);
      };
      isXhrRedirect = function (event) {
        var ref, xhr;
        xhr = (ref = event.detail) != null ? ref[0] : void 0;
        return (xhr != null ? xhr.getResponseHeader("X-Xhr-Redirect") : void 0) != null;
      };
    }).call(this);
    (function () {
      var isContentEditable, stopEverything;
      stopEverything = Rails.stopEverything;
      isContentEditable = Rails.isContentEditable;
      Rails.handleMethod = function (e) {
        var csrfParam, csrfToken, form, formContent, href, link, method;
        link = this;
        method = link.getAttribute('data-method');
        if (!method) {
          return;
        }
        if (isContentEditable(this)) {
          return;
        }
        href = Rails.href(link);
        csrfToken = Rails.csrfToken();
        csrfParam = Rails.csrfParam();
        form = document.createElement('form');
        formContent = "<input name='_method' value='" + method + "' type='hidden' />";
        if (csrfParam != null && csrfToken != null && !Rails.isCrossDomain(href)) {
          formContent += "<input name='" + csrfParam + "' value='" + csrfToken + "' type='hidden' />";
        }
        formContent += '<input type="submit" />';
        form.method = 'post';
        form.action = href;
        form.target = link.target;
        form.innerHTML = formContent;
        form.style.display = 'none';
        document.body.appendChild(form);
        form.querySelector('[type="submit"]').click();
        return stopEverything(e);
      };
    }).call(this);
    (function () {
      var ajax,
        fire,
        getData,
        isContentEditable,
        isCrossDomain,
        isRemote,
        matches,
        serializeElement,
        setData,
        stopEverything,
        slice = [].slice;
      matches = Rails.matches, getData = Rails.getData, setData = Rails.setData, fire = Rails.fire, stopEverything = Rails.stopEverything, ajax = Rails.ajax, isCrossDomain = Rails.isCrossDomain, serializeElement = Rails.serializeElement, isContentEditable = Rails.isContentEditable;
      isRemote = function (element) {
        var value;
        value = element.getAttribute('data-remote');
        return value != null && value !== 'false';
      };
      Rails.handleRemote = function (e) {
        var button, data, dataType, element, method, url, withCredentials;
        element = this;
        if (!isRemote(element)) {
          return true;
        }
        if (!fire(element, 'ajax:before')) {
          fire(element, 'ajax:stopped');
          return false;
        }
        if (isContentEditable(element)) {
          fire(element, 'ajax:stopped');
          return false;
        }
        withCredentials = element.getAttribute('data-with-credentials');
        dataType = element.getAttribute('data-type') || 'script';
        if (matches(element, Rails.formSubmitSelector)) {
          button = getData(element, 'ujs:submit-button');
          method = getData(element, 'ujs:submit-button-formmethod') || element.method;
          url = getData(element, 'ujs:submit-button-formaction') || element.getAttribute('action') || location.href;
          if (method.toUpperCase() === 'GET') {
            url = url.replace(/\?.*$/, '');
          }
          if (element.enctype === 'multipart/form-data') {
            data = new FormData(element);
            if (button != null) {
              data.append(button.name, button.value);
            }
          } else {
            data = serializeElement(element, button);
          }
          setData(element, 'ujs:submit-button', null);
          setData(element, 'ujs:submit-button-formmethod', null);
          setData(element, 'ujs:submit-button-formaction', null);
        } else if (matches(element, Rails.buttonClickSelector) || matches(element, Rails.inputChangeSelector)) {
          method = element.getAttribute('data-method');
          url = element.getAttribute('data-url');
          data = serializeElement(element, element.getAttribute('data-params'));
        } else {
          method = element.getAttribute('data-method');
          url = Rails.href(element);
          data = element.getAttribute('data-params');
        }
        ajax({
          type: method || 'GET',
          url: url,
          data: data,
          dataType: dataType,
          beforeSend: function (xhr, options) {
            if (fire(element, 'ajax:beforeSend', [xhr, options])) {
              return fire(element, 'ajax:send', [xhr]);
            } else {
              fire(element, 'ajax:stopped');
              return false;
            }
          },
          success: function () {
            var args;
            args = 1 <= arguments.length ? slice.call(arguments, 0) : [];
            return fire(element, 'ajax:success', args);
          },
          error: function () {
            var args;
            args = 1 <= arguments.length ? slice.call(arguments, 0) : [];
            return fire(element, 'ajax:error', args);
          },
          complete: function () {
            var args;
            args = 1 <= arguments.length ? slice.call(arguments, 0) : [];
            return fire(element, 'ajax:complete', args);
          },
          crossDomain: isCrossDomain(url),
          withCredentials: withCredentials != null && withCredentials !== 'false'
        });
        return stopEverything(e);
      };
      Rails.formSubmitButtonClick = function (e) {
        var button, form;
        button = this;
        form = button.form;
        if (!form) {
          return;
        }
        if (button.name) {
          setData(form, 'ujs:submit-button', {
            name: button.name,
            value: button.value
          });
        }
        setData(form, 'ujs:formnovalidate-button', button.formNoValidate);
        setData(form, 'ujs:submit-button-formaction', button.getAttribute('formaction'));
        return setData(form, 'ujs:submit-button-formmethod', button.getAttribute('formmethod'));
      };
      Rails.preventInsignificantClick = function (e) {
        var data, insignificantMetaClick, link, metaClick, method, nonPrimaryMouseClick;
        link = this;
        method = (link.getAttribute('data-method') || 'GET').toUpperCase();
        data = link.getAttribute('data-params');
        metaClick = e.metaKey || e.ctrlKey;
        insignificantMetaClick = metaClick && method === 'GET' && !data;
        nonPrimaryMouseClick = e.button != null && e.button !== 0;
        if (nonPrimaryMouseClick || insignificantMetaClick) {
          return e.stopImmediatePropagation();
        }
      };
    }).call(this);
    (function () {
      var $, CSRFProtection, delegate, disableElement, enableElement, fire, formSubmitButtonClick, getData, handleConfirm, handleDisabledElement, handleMethod, handleRemote, loadCSPNonce, preventInsignificantClick, refreshCSRFTokens;
      fire = Rails.fire, delegate = Rails.delegate, getData = Rails.getData, $ = Rails.$, refreshCSRFTokens = Rails.refreshCSRFTokens, CSRFProtection = Rails.CSRFProtection, loadCSPNonce = Rails.loadCSPNonce, enableElement = Rails.enableElement, disableElement = Rails.disableElement, handleDisabledElement = Rails.handleDisabledElement, handleConfirm = Rails.handleConfirm, preventInsignificantClick = Rails.preventInsignificantClick, handleRemote = Rails.handleRemote, formSubmitButtonClick = Rails.formSubmitButtonClick, handleMethod = Rails.handleMethod;
      if (typeof jQuery !== "undefined" && jQuery !== null && jQuery.ajax != null) {
        if (jQuery.rails) {
          throw new Error('If you load both jquery_ujs and rails-ujs, use rails-ujs only.');
        }
        jQuery.rails = Rails;
        jQuery.ajaxPrefilter(function (options, originalOptions, xhr) {
          if (!options.crossDomain) {
            return CSRFProtection(xhr);
          }
        });
      }
      Rails.start = function () {
        if (window._rails_loaded) {
          throw new Error('rails-ujs has already been loaded!');
        }
        window.addEventListener('pageshow', function () {
          $(Rails.formEnableSelector).forEach(function (el) {
            if (getData(el, 'ujs:disabled')) {
              return enableElement(el);
            }
          });
          return $(Rails.linkDisableSelector).forEach(function (el) {
            if (getData(el, 'ujs:disabled')) {
              return enableElement(el);
            }
          });
        });
        delegate(document, Rails.linkDisableSelector, 'ajax:complete', enableElement);
        delegate(document, Rails.linkDisableSelector, 'ajax:stopped', enableElement);
        delegate(document, Rails.buttonDisableSelector, 'ajax:complete', enableElement);
        delegate(document, Rails.buttonDisableSelector, 'ajax:stopped', enableElement);
        delegate(document, Rails.linkClickSelector, 'click', preventInsignificantClick);
        delegate(document, Rails.linkClickSelector, 'click', handleDisabledElement);
        delegate(document, Rails.linkClickSelector, 'click', handleConfirm);
        delegate(document, Rails.linkClickSelector, 'click', disableElement);
        delegate(document, Rails.linkClickSelector, 'click', handleRemote);
        delegate(document, Rails.linkClickSelector, 'click', handleMethod);
        delegate(document, Rails.buttonClickSelector, 'click', preventInsignificantClick);
        delegate(document, Rails.buttonClickSelector, 'click', handleDisabledElement);
        delegate(document, Rails.buttonClickSelector, 'click', handleConfirm);
        delegate(document, Rails.buttonClickSelector, 'click', disableElement);
        delegate(document, Rails.buttonClickSelector, 'click', handleRemote);
        delegate(document, Rails.inputChangeSelector, 'change', handleDisabledElement);
        delegate(document, Rails.inputChangeSelector, 'change', handleConfirm);
        delegate(document, Rails.inputChangeSelector, 'change', handleRemote);
        delegate(document, Rails.formSubmitSelector, 'submit', handleDisabledElement);
        delegate(document, Rails.formSubmitSelector, 'submit', handleConfirm);
        delegate(document, Rails.formSubmitSelector, 'submit', handleRemote);
        delegate(document, Rails.formSubmitSelector, 'submit', function (e) {
          return setTimeout(function () {
            return disableElement(e);
          }, 13);
        });
        delegate(document, Rails.formSubmitSelector, 'ajax:send', disableElement);
        delegate(document, Rails.formSubmitSelector, 'ajax:complete', enableElement);
        delegate(document, Rails.formInputClickSelector, 'click', preventInsignificantClick);
        delegate(document, Rails.formInputClickSelector, 'click', handleDisabledElement);
        delegate(document, Rails.formInputClickSelector, 'click', handleConfirm);
        delegate(document, Rails.formInputClickSelector, 'click', formSubmitButtonClick);
        document.addEventListener('DOMContentLoaded', refreshCSRFTokens);
        document.addEventListener('DOMContentLoaded', loadCSPNonce);
        return window._rails_loaded = true;
      };
      if (window.Rails === Rails && fire(document, 'rails:attachBindings')) {
        Rails.start();
      }
    }).call(this);
  }).call(this);
  if ( true && module.exports) {
    module.exports = Rails;
  } else if (true) {
    !(__WEBPACK_AMD_DEFINE_FACTORY__ = (Rails),
				__WEBPACK_AMD_DEFINE_RESULT__ = (typeof __WEBPACK_AMD_DEFINE_FACTORY__ === 'function' ?
				(__WEBPACK_AMD_DEFINE_FACTORY__.call(exports, __webpack_require__, exports, module)) :
				__WEBPACK_AMD_DEFINE_FACTORY__),
				__WEBPACK_AMD_DEFINE_RESULT__ !== undefined && (module.exports = __WEBPACK_AMD_DEFINE_RESULT__));
  }
}).call(this);

/***/ }),

/***/ "./node_modules/stimulus/dist/stimulus.js":
/*!************************************************!*\
  !*** ./node_modules/stimulus/dist/stimulus.js ***!
  \************************************************/
/*! exports provided: Application, AttributeObserver, Context, Controller, ElementObserver, IndexedMultimap, Multimap, SelectorObserver, StringMapObserver, TokenListObserver, ValueListObserver, add, defaultSchema, del, fetch, prune */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "Application", function() { return Application; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "AttributeObserver", function() { return AttributeObserver; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "Context", function() { return Context; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "Controller", function() { return Controller; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "ElementObserver", function() { return ElementObserver; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "IndexedMultimap", function() { return IndexedMultimap; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "Multimap", function() { return Multimap; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "SelectorObserver", function() { return SelectorObserver; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "StringMapObserver", function() { return StringMapObserver; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "TokenListObserver", function() { return TokenListObserver; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "ValueListObserver", function() { return ValueListObserver; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "add", function() { return add; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "defaultSchema", function() { return defaultSchema; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "del", function() { return del; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "fetch", function() { return fetch; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "prune", function() { return prune; });
function _slicedToArray(r, e) { return _arrayWithHoles(r) || _iterableToArrayLimit(r, e) || _unsupportedIterableToArray(r, e) || _nonIterableRest(); }
function _nonIterableRest() { throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); }
function _iterableToArrayLimit(r, l) { var t = null == r ? null : "undefined" != typeof Symbol && r[Symbol.iterator] || r["@@iterator"]; if (null != t) { var e, n, i, u, a = [], f = !0, o = !1; try { if (i = (t = t.call(r)).next, 0 === l) { if (Object(t) !== t) return; f = !1; } else for (; !(f = (e = i.call(t)).done) && (a.push(e.value), a.length !== l); f = !0); } catch (r) { o = !0, n = r; } finally { try { if (!f && null != t.return && (u = t.return(), Object(u) !== u)) return; } finally { if (o) throw n; } } return a; } }
function _arrayWithHoles(r) { if (Array.isArray(r)) return r; }
function _createForOfIteratorHelper(r, e) { var t = "undefined" != typeof Symbol && r[Symbol.iterator] || r["@@iterator"]; if (!t) { if (Array.isArray(r) || (t = _unsupportedIterableToArray(r)) || e && r && "number" == typeof r.length) { t && (r = t); var n = 0, F = function () {}; return { s: F, n: function () { return n >= r.length ? { done: !0 } : { done: !1, value: r[n++] }; }, e: function (r) { throw r; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var o, a = !0, u = !1; return { s: function () { t = t.call(r); }, n: function () { var r = t.next(); return a = r.done, r; }, e: function (r) { u = !0, o = r; }, f: function () { try { a || null == t.return || t.return(); } finally { if (u) throw o; } } }; }
function _unsupportedIterableToArray(r, a) { if (r) { if ("string" == typeof r) return _arrayLikeToArray(r, a); var t = {}.toString.call(r).slice(8, -1); return "Object" === t && r.constructor && (t = r.constructor.name), "Map" === t || "Set" === t ? Array.from(r) : "Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t) ? _arrayLikeToArray(r, a) : void 0; } }
function _arrayLikeToArray(r, a) { (null == a || a > r.length) && (a = r.length); for (var e = 0, n = Array(a); e < a; e++) n[e] = r[e]; return n; }
/*
Stimulus 3.2.1
Copyright © 2023 Basecamp, LLC
 */
class EventListener {
  constructor(eventTarget, eventName, eventOptions) {
    this.eventTarget = eventTarget;
    this.eventName = eventName;
    this.eventOptions = eventOptions;
    this.unorderedBindings = new Set();
  }
  connect() {
    this.eventTarget.addEventListener(this.eventName, this, this.eventOptions);
  }
  disconnect() {
    this.eventTarget.removeEventListener(this.eventName, this, this.eventOptions);
  }
  bindingConnected(binding) {
    this.unorderedBindings.add(binding);
  }
  bindingDisconnected(binding) {
    this.unorderedBindings.delete(binding);
  }
  handleEvent(event) {
    const extendedEvent = extendEvent(event);
    var _iterator = _createForOfIteratorHelper(this.bindings),
      _step;
    try {
      for (_iterator.s(); !(_step = _iterator.n()).done;) {
        const binding = _step.value;
        if (extendedEvent.immediatePropagationStopped) {
          break;
        } else {
          binding.handleEvent(extendedEvent);
        }
      }
    } catch (err) {
      _iterator.e(err);
    } finally {
      _iterator.f();
    }
  }
  hasBindings() {
    return this.unorderedBindings.size > 0;
  }
  get bindings() {
    return Array.from(this.unorderedBindings).sort((left, right) => {
      const leftIndex = left.index,
        rightIndex = right.index;
      return leftIndex < rightIndex ? -1 : leftIndex > rightIndex ? 1 : 0;
    });
  }
}
function extendEvent(event) {
  if ("immediatePropagationStopped" in event) {
    return event;
  } else {
    const stopImmediatePropagation = event.stopImmediatePropagation;
    return Object.assign(event, {
      immediatePropagationStopped: false,
      stopImmediatePropagation() {
        this.immediatePropagationStopped = true;
        stopImmediatePropagation.call(this);
      }
    });
  }
}
class Dispatcher {
  constructor(application) {
    this.application = application;
    this.eventListenerMaps = new Map();
    this.started = false;
  }
  start() {
    if (!this.started) {
      this.started = true;
      this.eventListeners.forEach(eventListener => eventListener.connect());
    }
  }
  stop() {
    if (this.started) {
      this.started = false;
      this.eventListeners.forEach(eventListener => eventListener.disconnect());
    }
  }
  get eventListeners() {
    return Array.from(this.eventListenerMaps.values()).reduce((listeners, map) => listeners.concat(Array.from(map.values())), []);
  }
  bindingConnected(binding) {
    this.fetchEventListenerForBinding(binding).bindingConnected(binding);
  }
  bindingDisconnected(binding) {
    let clearEventListeners = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : false;
    this.fetchEventListenerForBinding(binding).bindingDisconnected(binding);
    if (clearEventListeners) this.clearEventListenersForBinding(binding);
  }
  handleError(error, message) {
    let detail = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : {};
    this.application.handleError(error, `Error ${message}`, detail);
  }
  clearEventListenersForBinding(binding) {
    const eventListener = this.fetchEventListenerForBinding(binding);
    if (!eventListener.hasBindings()) {
      eventListener.disconnect();
      this.removeMappedEventListenerFor(binding);
    }
  }
  removeMappedEventListenerFor(binding) {
    const eventTarget = binding.eventTarget,
      eventName = binding.eventName,
      eventOptions = binding.eventOptions;
    const eventListenerMap = this.fetchEventListenerMapForEventTarget(eventTarget);
    const cacheKey = this.cacheKey(eventName, eventOptions);
    eventListenerMap.delete(cacheKey);
    if (eventListenerMap.size == 0) this.eventListenerMaps.delete(eventTarget);
  }
  fetchEventListenerForBinding(binding) {
    const eventTarget = binding.eventTarget,
      eventName = binding.eventName,
      eventOptions = binding.eventOptions;
    return this.fetchEventListener(eventTarget, eventName, eventOptions);
  }
  fetchEventListener(eventTarget, eventName, eventOptions) {
    const eventListenerMap = this.fetchEventListenerMapForEventTarget(eventTarget);
    const cacheKey = this.cacheKey(eventName, eventOptions);
    let eventListener = eventListenerMap.get(cacheKey);
    if (!eventListener) {
      eventListener = this.createEventListener(eventTarget, eventName, eventOptions);
      eventListenerMap.set(cacheKey, eventListener);
    }
    return eventListener;
  }
  createEventListener(eventTarget, eventName, eventOptions) {
    const eventListener = new EventListener(eventTarget, eventName, eventOptions);
    if (this.started) {
      eventListener.connect();
    }
    return eventListener;
  }
  fetchEventListenerMapForEventTarget(eventTarget) {
    let eventListenerMap = this.eventListenerMaps.get(eventTarget);
    if (!eventListenerMap) {
      eventListenerMap = new Map();
      this.eventListenerMaps.set(eventTarget, eventListenerMap);
    }
    return eventListenerMap;
  }
  cacheKey(eventName, eventOptions) {
    const parts = [eventName];
    Object.keys(eventOptions).sort().forEach(key => {
      parts.push(`${eventOptions[key] ? "" : "!"}${key}`);
    });
    return parts.join(":");
  }
}
const defaultActionDescriptorFilters = {
  stop(_ref) {
    let event = _ref.event,
      value = _ref.value;
    if (value) event.stopPropagation();
    return true;
  },
  prevent(_ref2) {
    let event = _ref2.event,
      value = _ref2.value;
    if (value) event.preventDefault();
    return true;
  },
  self(_ref3) {
    let event = _ref3.event,
      value = _ref3.value,
      element = _ref3.element;
    if (value) {
      return element === event.target;
    } else {
      return true;
    }
  }
};
const descriptorPattern = /^(?:(?:([^.]+?)\+)?(.+?)(?:\.(.+?))?(?:@(window|document))?->)?(.+?)(?:#([^:]+?))(?::(.+))?$/;
function parseActionDescriptorString(descriptorString) {
  const source = descriptorString.trim();
  const matches = source.match(descriptorPattern) || [];
  let eventName = matches[2];
  let keyFilter = matches[3];
  if (keyFilter && !["keydown", "keyup", "keypress"].includes(eventName)) {
    eventName += `.${keyFilter}`;
    keyFilter = "";
  }
  return {
    eventTarget: parseEventTarget(matches[4]),
    eventName,
    eventOptions: matches[7] ? parseEventOptions(matches[7]) : {},
    identifier: matches[5],
    methodName: matches[6],
    keyFilter: matches[1] || keyFilter
  };
}
function parseEventTarget(eventTargetName) {
  if (eventTargetName == "window") {
    return window;
  } else if (eventTargetName == "document") {
    return document;
  }
}
function parseEventOptions(eventOptions) {
  return eventOptions.split(":").reduce((options, token) => Object.assign(options, {
    [token.replace(/^!/, "")]: !/^!/.test(token)
  }), {});
}
function stringifyEventTarget(eventTarget) {
  if (eventTarget == window) {
    return "window";
  } else if (eventTarget == document) {
    return "document";
  }
}
function camelize(value) {
  return value.replace(/(?:[_-])([a-z0-9])/g, (_, char) => char.toUpperCase());
}
function namespaceCamelize(value) {
  return camelize(value.replace(/--/g, "-").replace(/__/g, "_"));
}
function capitalize(value) {
  return value.charAt(0).toUpperCase() + value.slice(1);
}
function dasherize(value) {
  return value.replace(/([A-Z])/g, (_, char) => `-${char.toLowerCase()}`);
}
function tokenize(value) {
  return value.match(/[^\s]+/g) || [];
}
function isSomething(object) {
  return object !== null && object !== undefined;
}
function hasProperty(object, property) {
  return Object.prototype.hasOwnProperty.call(object, property);
}
const allModifiers = ["meta", "ctrl", "alt", "shift"];
class Action {
  constructor(element, index, descriptor, schema) {
    this.element = element;
    this.index = index;
    this.eventTarget = descriptor.eventTarget || element;
    this.eventName = descriptor.eventName || getDefaultEventNameForElement(element) || error("missing event name");
    this.eventOptions = descriptor.eventOptions || {};
    this.identifier = descriptor.identifier || error("missing identifier");
    this.methodName = descriptor.methodName || error("missing method name");
    this.keyFilter = descriptor.keyFilter || "";
    this.schema = schema;
  }
  static forToken(token, schema) {
    return new this(token.element, token.index, parseActionDescriptorString(token.content), schema);
  }
  toString() {
    const eventFilter = this.keyFilter ? `.${this.keyFilter}` : "";
    const eventTarget = this.eventTargetName ? `@${this.eventTargetName}` : "";
    return `${this.eventName}${eventFilter}${eventTarget}->${this.identifier}#${this.methodName}`;
  }
  shouldIgnoreKeyboardEvent(event) {
    if (!this.keyFilter) {
      return false;
    }
    const filters = this.keyFilter.split("+");
    if (this.keyFilterDissatisfied(event, filters)) {
      return true;
    }
    const standardFilter = filters.filter(key => !allModifiers.includes(key))[0];
    if (!standardFilter) {
      return false;
    }
    if (!hasProperty(this.keyMappings, standardFilter)) {
      error(`contains unknown key filter: ${this.keyFilter}`);
    }
    return this.keyMappings[standardFilter].toLowerCase() !== event.key.toLowerCase();
  }
  shouldIgnoreMouseEvent(event) {
    if (!this.keyFilter) {
      return false;
    }
    const filters = [this.keyFilter];
    if (this.keyFilterDissatisfied(event, filters)) {
      return true;
    }
    return false;
  }
  get params() {
    const params = {};
    const pattern = new RegExp(`^data-${this.identifier}-(.+)-param$`, "i");
    for (var _i = 0, _Array$from = Array.from(this.element.attributes); _i < _Array$from.length; _i++) {
      const _Array$from$_i = _Array$from[_i],
        name = _Array$from$_i.name,
        value = _Array$from$_i.value;
      const match = name.match(pattern);
      const key = match && match[1];
      if (key) {
        params[camelize(key)] = typecast(value);
      }
    }
    return params;
  }
  get eventTargetName() {
    return stringifyEventTarget(this.eventTarget);
  }
  get keyMappings() {
    return this.schema.keyMappings;
  }
  keyFilterDissatisfied(event, filters) {
    const _allModifiers$map = allModifiers.map(modifier => filters.includes(modifier)),
      _allModifiers$map2 = _slicedToArray(_allModifiers$map, 4),
      meta = _allModifiers$map2[0],
      ctrl = _allModifiers$map2[1],
      alt = _allModifiers$map2[2],
      shift = _allModifiers$map2[3];
    return event.metaKey !== meta || event.ctrlKey !== ctrl || event.altKey !== alt || event.shiftKey !== shift;
  }
}
const defaultEventNames = {
  a: () => "click",
  button: () => "click",
  form: () => "submit",
  details: () => "toggle",
  input: e => e.getAttribute("type") == "submit" ? "click" : "input",
  select: () => "change",
  textarea: () => "input"
};
function getDefaultEventNameForElement(element) {
  const tagName = element.tagName.toLowerCase();
  if (tagName in defaultEventNames) {
    return defaultEventNames[tagName](element);
  }
}
function error(message) {
  throw new Error(message);
}
function typecast(value) {
  try {
    return JSON.parse(value);
  } catch (o_O) {
    return value;
  }
}
class Binding {
  constructor(context, action) {
    this.context = context;
    this.action = action;
  }
  get index() {
    return this.action.index;
  }
  get eventTarget() {
    return this.action.eventTarget;
  }
  get eventOptions() {
    return this.action.eventOptions;
  }
  get identifier() {
    return this.context.identifier;
  }
  handleEvent(event) {
    const actionEvent = this.prepareActionEvent(event);
    if (this.willBeInvokedByEvent(event) && this.applyEventModifiers(actionEvent)) {
      this.invokeWithEvent(actionEvent);
    }
  }
  get eventName() {
    return this.action.eventName;
  }
  get method() {
    const method = this.controller[this.methodName];
    if (typeof method == "function") {
      return method;
    }
    throw new Error(`Action "${this.action}" references undefined method "${this.methodName}"`);
  }
  applyEventModifiers(event) {
    const element = this.action.element;
    const actionDescriptorFilters = this.context.application.actionDescriptorFilters;
    const controller = this.context.controller;
    let passes = true;
    for (var _i2 = 0, _Object$entries = Object.entries(this.eventOptions); _i2 < _Object$entries.length; _i2++) {
      const _Object$entries$_i = _slicedToArray(_Object$entries[_i2], 2),
        name = _Object$entries$_i[0],
        value = _Object$entries$_i[1];
      if (name in actionDescriptorFilters) {
        const filter = actionDescriptorFilters[name];
        passes = passes && filter({
          name,
          value,
          event,
          element,
          controller
        });
      } else {
        continue;
      }
    }
    return passes;
  }
  prepareActionEvent(event) {
    return Object.assign(event, {
      params: this.action.params
    });
  }
  invokeWithEvent(event) {
    const target = event.target,
      currentTarget = event.currentTarget;
    try {
      this.method.call(this.controller, event);
      this.context.logDebugActivity(this.methodName, {
        event,
        target,
        currentTarget,
        action: this.methodName
      });
    } catch (error) {
      const identifier = this.identifier,
        controller = this.controller,
        element = this.element,
        index = this.index;
      const detail = {
        identifier,
        controller,
        element,
        index,
        event
      };
      this.context.handleError(error, `invoking action "${this.action}"`, detail);
    }
  }
  willBeInvokedByEvent(event) {
    const eventTarget = event.target;
    if (event instanceof KeyboardEvent && this.action.shouldIgnoreKeyboardEvent(event)) {
      return false;
    }
    if (event instanceof MouseEvent && this.action.shouldIgnoreMouseEvent(event)) {
      return false;
    }
    if (this.element === eventTarget) {
      return true;
    } else if (eventTarget instanceof Element && this.element.contains(eventTarget)) {
      return this.scope.containsElement(eventTarget);
    } else {
      return this.scope.containsElement(this.action.element);
    }
  }
  get controller() {
    return this.context.controller;
  }
  get methodName() {
    return this.action.methodName;
  }
  get element() {
    return this.scope.element;
  }
  get scope() {
    return this.context.scope;
  }
}
class ElementObserver {
  constructor(element, delegate) {
    this.mutationObserverInit = {
      attributes: true,
      childList: true,
      subtree: true
    };
    this.element = element;
    this.started = false;
    this.delegate = delegate;
    this.elements = new Set();
    this.mutationObserver = new MutationObserver(mutations => this.processMutations(mutations));
  }
  start() {
    if (!this.started) {
      this.started = true;
      this.mutationObserver.observe(this.element, this.mutationObserverInit);
      this.refresh();
    }
  }
  pause(callback) {
    if (this.started) {
      this.mutationObserver.disconnect();
      this.started = false;
    }
    callback();
    if (!this.started) {
      this.mutationObserver.observe(this.element, this.mutationObserverInit);
      this.started = true;
    }
  }
  stop() {
    if (this.started) {
      this.mutationObserver.takeRecords();
      this.mutationObserver.disconnect();
      this.started = false;
    }
  }
  refresh() {
    if (this.started) {
      const matches = new Set(this.matchElementsInTree());
      for (var _i3 = 0, _Array$from2 = Array.from(this.elements); _i3 < _Array$from2.length; _i3++) {
        const element = _Array$from2[_i3];
        if (!matches.has(element)) {
          this.removeElement(element);
        }
      }
      for (var _i4 = 0, _Array$from3 = Array.from(matches); _i4 < _Array$from3.length; _i4++) {
        const element = _Array$from3[_i4];
        this.addElement(element);
      }
    }
  }
  processMutations(mutations) {
    if (this.started) {
      var _iterator2 = _createForOfIteratorHelper(mutations),
        _step2;
      try {
        for (_iterator2.s(); !(_step2 = _iterator2.n()).done;) {
          const mutation = _step2.value;
          this.processMutation(mutation);
        }
      } catch (err) {
        _iterator2.e(err);
      } finally {
        _iterator2.f();
      }
    }
  }
  processMutation(mutation) {
    if (mutation.type == "attributes") {
      this.processAttributeChange(mutation.target, mutation.attributeName);
    } else if (mutation.type == "childList") {
      this.processRemovedNodes(mutation.removedNodes);
      this.processAddedNodes(mutation.addedNodes);
    }
  }
  processAttributeChange(element, attributeName) {
    if (this.elements.has(element)) {
      if (this.delegate.elementAttributeChanged && this.matchElement(element)) {
        this.delegate.elementAttributeChanged(element, attributeName);
      } else {
        this.removeElement(element);
      }
    } else if (this.matchElement(element)) {
      this.addElement(element);
    }
  }
  processRemovedNodes(nodes) {
    for (var _i5 = 0, _Array$from4 = Array.from(nodes); _i5 < _Array$from4.length; _i5++) {
      const node = _Array$from4[_i5];
      const element = this.elementFromNode(node);
      if (element) {
        this.processTree(element, this.removeElement);
      }
    }
  }
  processAddedNodes(nodes) {
    for (var _i6 = 0, _Array$from5 = Array.from(nodes); _i6 < _Array$from5.length; _i6++) {
      const node = _Array$from5[_i6];
      const element = this.elementFromNode(node);
      if (element && this.elementIsActive(element)) {
        this.processTree(element, this.addElement);
      }
    }
  }
  matchElement(element) {
    return this.delegate.matchElement(element);
  }
  matchElementsInTree() {
    let tree = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : this.element;
    return this.delegate.matchElementsInTree(tree);
  }
  processTree(tree, processor) {
    var _iterator3 = _createForOfIteratorHelper(this.matchElementsInTree(tree)),
      _step3;
    try {
      for (_iterator3.s(); !(_step3 = _iterator3.n()).done;) {
        const element = _step3.value;
        processor.call(this, element);
      }
    } catch (err) {
      _iterator3.e(err);
    } finally {
      _iterator3.f();
    }
  }
  elementFromNode(node) {
    if (node.nodeType == Node.ELEMENT_NODE) {
      return node;
    }
  }
  elementIsActive(element) {
    if (element.isConnected != this.element.isConnected) {
      return false;
    } else {
      return this.element.contains(element);
    }
  }
  addElement(element) {
    if (!this.elements.has(element)) {
      if (this.elementIsActive(element)) {
        this.elements.add(element);
        if (this.delegate.elementMatched) {
          this.delegate.elementMatched(element);
        }
      }
    }
  }
  removeElement(element) {
    if (this.elements.has(element)) {
      this.elements.delete(element);
      if (this.delegate.elementUnmatched) {
        this.delegate.elementUnmatched(element);
      }
    }
  }
}
class AttributeObserver {
  constructor(element, attributeName, delegate) {
    this.attributeName = attributeName;
    this.delegate = delegate;
    this.elementObserver = new ElementObserver(element, this);
  }
  get element() {
    return this.elementObserver.element;
  }
  get selector() {
    return `[${this.attributeName}]`;
  }
  start() {
    this.elementObserver.start();
  }
  pause(callback) {
    this.elementObserver.pause(callback);
  }
  stop() {
    this.elementObserver.stop();
  }
  refresh() {
    this.elementObserver.refresh();
  }
  get started() {
    return this.elementObserver.started;
  }
  matchElement(element) {
    return element.hasAttribute(this.attributeName);
  }
  matchElementsInTree(tree) {
    const match = this.matchElement(tree) ? [tree] : [];
    const matches = Array.from(tree.querySelectorAll(this.selector));
    return match.concat(matches);
  }
  elementMatched(element) {
    if (this.delegate.elementMatchedAttribute) {
      this.delegate.elementMatchedAttribute(element, this.attributeName);
    }
  }
  elementUnmatched(element) {
    if (this.delegate.elementUnmatchedAttribute) {
      this.delegate.elementUnmatchedAttribute(element, this.attributeName);
    }
  }
  elementAttributeChanged(element, attributeName) {
    if (this.delegate.elementAttributeValueChanged && this.attributeName == attributeName) {
      this.delegate.elementAttributeValueChanged(element, attributeName);
    }
  }
}
function add(map, key, value) {
  fetch(map, key).add(value);
}
function del(map, key, value) {
  fetch(map, key).delete(value);
  prune(map, key);
}
function fetch(map, key) {
  let values = map.get(key);
  if (!values) {
    values = new Set();
    map.set(key, values);
  }
  return values;
}
function prune(map, key) {
  const values = map.get(key);
  if (values != null && values.size == 0) {
    map.delete(key);
  }
}
class Multimap {
  constructor() {
    this.valuesByKey = new Map();
  }
  get keys() {
    return Array.from(this.valuesByKey.keys());
  }
  get values() {
    const sets = Array.from(this.valuesByKey.values());
    return sets.reduce((values, set) => values.concat(Array.from(set)), []);
  }
  get size() {
    const sets = Array.from(this.valuesByKey.values());
    return sets.reduce((size, set) => size + set.size, 0);
  }
  add(key, value) {
    add(this.valuesByKey, key, value);
  }
  delete(key, value) {
    del(this.valuesByKey, key, value);
  }
  has(key, value) {
    const values = this.valuesByKey.get(key);
    return values != null && values.has(value);
  }
  hasKey(key) {
    return this.valuesByKey.has(key);
  }
  hasValue(value) {
    const sets = Array.from(this.valuesByKey.values());
    return sets.some(set => set.has(value));
  }
  getValuesForKey(key) {
    const values = this.valuesByKey.get(key);
    return values ? Array.from(values) : [];
  }
  getKeysForValue(value) {
    return Array.from(this.valuesByKey).filter(_ref4 => {
      let _ref5 = _slicedToArray(_ref4, 2),
        _key = _ref5[0],
        values = _ref5[1];
      return values.has(value);
    }).map(_ref6 => {
      let _ref7 = _slicedToArray(_ref6, 2),
        key = _ref7[0],
        _values = _ref7[1];
      return key;
    });
  }
}
class IndexedMultimap extends Multimap {
  constructor() {
    super();
    this.keysByValue = new Map();
  }
  get values() {
    return Array.from(this.keysByValue.keys());
  }
  add(key, value) {
    super.add(key, value);
    add(this.keysByValue, value, key);
  }
  delete(key, value) {
    super.delete(key, value);
    del(this.keysByValue, value, key);
  }
  hasValue(value) {
    return this.keysByValue.has(value);
  }
  getKeysForValue(value) {
    const set = this.keysByValue.get(value);
    return set ? Array.from(set) : [];
  }
}
class SelectorObserver {
  constructor(element, selector, delegate, details) {
    this._selector = selector;
    this.details = details;
    this.elementObserver = new ElementObserver(element, this);
    this.delegate = delegate;
    this.matchesByElement = new Multimap();
  }
  get started() {
    return this.elementObserver.started;
  }
  get selector() {
    return this._selector;
  }
  set selector(selector) {
    this._selector = selector;
    this.refresh();
  }
  start() {
    this.elementObserver.start();
  }
  pause(callback) {
    this.elementObserver.pause(callback);
  }
  stop() {
    this.elementObserver.stop();
  }
  refresh() {
    this.elementObserver.refresh();
  }
  get element() {
    return this.elementObserver.element;
  }
  matchElement(element) {
    const selector = this.selector;
    if (selector) {
      const matches = element.matches(selector);
      if (this.delegate.selectorMatchElement) {
        return matches && this.delegate.selectorMatchElement(element, this.details);
      }
      return matches;
    } else {
      return false;
    }
  }
  matchElementsInTree(tree) {
    const selector = this.selector;
    if (selector) {
      const match = this.matchElement(tree) ? [tree] : [];
      const matches = Array.from(tree.querySelectorAll(selector)).filter(match => this.matchElement(match));
      return match.concat(matches);
    } else {
      return [];
    }
  }
  elementMatched(element) {
    const selector = this.selector;
    if (selector) {
      this.selectorMatched(element, selector);
    }
  }
  elementUnmatched(element) {
    const selectors = this.matchesByElement.getKeysForValue(element);
    var _iterator4 = _createForOfIteratorHelper(selectors),
      _step4;
    try {
      for (_iterator4.s(); !(_step4 = _iterator4.n()).done;) {
        const selector = _step4.value;
        this.selectorUnmatched(element, selector);
      }
    } catch (err) {
      _iterator4.e(err);
    } finally {
      _iterator4.f();
    }
  }
  elementAttributeChanged(element, _attributeName) {
    const selector = this.selector;
    if (selector) {
      const matches = this.matchElement(element);
      const matchedBefore = this.matchesByElement.has(selector, element);
      if (matches && !matchedBefore) {
        this.selectorMatched(element, selector);
      } else if (!matches && matchedBefore) {
        this.selectorUnmatched(element, selector);
      }
    }
  }
  selectorMatched(element, selector) {
    this.delegate.selectorMatched(element, selector, this.details);
    this.matchesByElement.add(selector, element);
  }
  selectorUnmatched(element, selector) {
    this.delegate.selectorUnmatched(element, selector, this.details);
    this.matchesByElement.delete(selector, element);
  }
}
class StringMapObserver {
  constructor(element, delegate) {
    this.element = element;
    this.delegate = delegate;
    this.started = false;
    this.stringMap = new Map();
    this.mutationObserver = new MutationObserver(mutations => this.processMutations(mutations));
  }
  start() {
    if (!this.started) {
      this.started = true;
      this.mutationObserver.observe(this.element, {
        attributes: true,
        attributeOldValue: true
      });
      this.refresh();
    }
  }
  stop() {
    if (this.started) {
      this.mutationObserver.takeRecords();
      this.mutationObserver.disconnect();
      this.started = false;
    }
  }
  refresh() {
    if (this.started) {
      var _iterator5 = _createForOfIteratorHelper(this.knownAttributeNames),
        _step5;
      try {
        for (_iterator5.s(); !(_step5 = _iterator5.n()).done;) {
          const attributeName = _step5.value;
          this.refreshAttribute(attributeName, null);
        }
      } catch (err) {
        _iterator5.e(err);
      } finally {
        _iterator5.f();
      }
    }
  }
  processMutations(mutations) {
    if (this.started) {
      var _iterator6 = _createForOfIteratorHelper(mutations),
        _step6;
      try {
        for (_iterator6.s(); !(_step6 = _iterator6.n()).done;) {
          const mutation = _step6.value;
          this.processMutation(mutation);
        }
      } catch (err) {
        _iterator6.e(err);
      } finally {
        _iterator6.f();
      }
    }
  }
  processMutation(mutation) {
    const attributeName = mutation.attributeName;
    if (attributeName) {
      this.refreshAttribute(attributeName, mutation.oldValue);
    }
  }
  refreshAttribute(attributeName, oldValue) {
    const key = this.delegate.getStringMapKeyForAttribute(attributeName);
    if (key != null) {
      if (!this.stringMap.has(attributeName)) {
        this.stringMapKeyAdded(key, attributeName);
      }
      const value = this.element.getAttribute(attributeName);
      if (this.stringMap.get(attributeName) != value) {
        this.stringMapValueChanged(value, key, oldValue);
      }
      if (value == null) {
        const oldValue = this.stringMap.get(attributeName);
        this.stringMap.delete(attributeName);
        if (oldValue) this.stringMapKeyRemoved(key, attributeName, oldValue);
      } else {
        this.stringMap.set(attributeName, value);
      }
    }
  }
  stringMapKeyAdded(key, attributeName) {
    if (this.delegate.stringMapKeyAdded) {
      this.delegate.stringMapKeyAdded(key, attributeName);
    }
  }
  stringMapValueChanged(value, key, oldValue) {
    if (this.delegate.stringMapValueChanged) {
      this.delegate.stringMapValueChanged(value, key, oldValue);
    }
  }
  stringMapKeyRemoved(key, attributeName, oldValue) {
    if (this.delegate.stringMapKeyRemoved) {
      this.delegate.stringMapKeyRemoved(key, attributeName, oldValue);
    }
  }
  get knownAttributeNames() {
    return Array.from(new Set(this.currentAttributeNames.concat(this.recordedAttributeNames)));
  }
  get currentAttributeNames() {
    return Array.from(this.element.attributes).map(attribute => attribute.name);
  }
  get recordedAttributeNames() {
    return Array.from(this.stringMap.keys());
  }
}
class TokenListObserver {
  constructor(element, attributeName, delegate) {
    this.attributeObserver = new AttributeObserver(element, attributeName, this);
    this.delegate = delegate;
    this.tokensByElement = new Multimap();
  }
  get started() {
    return this.attributeObserver.started;
  }
  start() {
    this.attributeObserver.start();
  }
  pause(callback) {
    this.attributeObserver.pause(callback);
  }
  stop() {
    this.attributeObserver.stop();
  }
  refresh() {
    this.attributeObserver.refresh();
  }
  get element() {
    return this.attributeObserver.element;
  }
  get attributeName() {
    return this.attributeObserver.attributeName;
  }
  elementMatchedAttribute(element) {
    this.tokensMatched(this.readTokensForElement(element));
  }
  elementAttributeValueChanged(element) {
    const _this$refreshTokensFo = this.refreshTokensForElement(element),
      _this$refreshTokensFo2 = _slicedToArray(_this$refreshTokensFo, 2),
      unmatchedTokens = _this$refreshTokensFo2[0],
      matchedTokens = _this$refreshTokensFo2[1];
    this.tokensUnmatched(unmatchedTokens);
    this.tokensMatched(matchedTokens);
  }
  elementUnmatchedAttribute(element) {
    this.tokensUnmatched(this.tokensByElement.getValuesForKey(element));
  }
  tokensMatched(tokens) {
    tokens.forEach(token => this.tokenMatched(token));
  }
  tokensUnmatched(tokens) {
    tokens.forEach(token => this.tokenUnmatched(token));
  }
  tokenMatched(token) {
    this.delegate.tokenMatched(token);
    this.tokensByElement.add(token.element, token);
  }
  tokenUnmatched(token) {
    this.delegate.tokenUnmatched(token);
    this.tokensByElement.delete(token.element, token);
  }
  refreshTokensForElement(element) {
    const previousTokens = this.tokensByElement.getValuesForKey(element);
    const currentTokens = this.readTokensForElement(element);
    const firstDifferingIndex = zip(previousTokens, currentTokens).findIndex(_ref8 => {
      let _ref9 = _slicedToArray(_ref8, 2),
        previousToken = _ref9[0],
        currentToken = _ref9[1];
      return !tokensAreEqual(previousToken, currentToken);
    });
    if (firstDifferingIndex == -1) {
      return [[], []];
    } else {
      return [previousTokens.slice(firstDifferingIndex), currentTokens.slice(firstDifferingIndex)];
    }
  }
  readTokensForElement(element) {
    const attributeName = this.attributeName;
    const tokenString = element.getAttribute(attributeName) || "";
    return parseTokenString(tokenString, element, attributeName);
  }
}
function parseTokenString(tokenString, element, attributeName) {
  return tokenString.trim().split(/\s+/).filter(content => content.length).map((content, index) => ({
    element,
    attributeName,
    content,
    index
  }));
}
function zip(left, right) {
  const length = Math.max(left.length, right.length);
  return Array.from({
    length
  }, (_, index) => [left[index], right[index]]);
}
function tokensAreEqual(left, right) {
  return left && right && left.index == right.index && left.content == right.content;
}
class ValueListObserver {
  constructor(element, attributeName, delegate) {
    this.tokenListObserver = new TokenListObserver(element, attributeName, this);
    this.delegate = delegate;
    this.parseResultsByToken = new WeakMap();
    this.valuesByTokenByElement = new WeakMap();
  }
  get started() {
    return this.tokenListObserver.started;
  }
  start() {
    this.tokenListObserver.start();
  }
  stop() {
    this.tokenListObserver.stop();
  }
  refresh() {
    this.tokenListObserver.refresh();
  }
  get element() {
    return this.tokenListObserver.element;
  }
  get attributeName() {
    return this.tokenListObserver.attributeName;
  }
  tokenMatched(token) {
    const element = token.element;
    const _this$fetchParseResul = this.fetchParseResultForToken(token),
      value = _this$fetchParseResul.value;
    if (value) {
      this.fetchValuesByTokenForElement(element).set(token, value);
      this.delegate.elementMatchedValue(element, value);
    }
  }
  tokenUnmatched(token) {
    const element = token.element;
    const _this$fetchParseResul2 = this.fetchParseResultForToken(token),
      value = _this$fetchParseResul2.value;
    if (value) {
      this.fetchValuesByTokenForElement(element).delete(token);
      this.delegate.elementUnmatchedValue(element, value);
    }
  }
  fetchParseResultForToken(token) {
    let parseResult = this.parseResultsByToken.get(token);
    if (!parseResult) {
      parseResult = this.parseToken(token);
      this.parseResultsByToken.set(token, parseResult);
    }
    return parseResult;
  }
  fetchValuesByTokenForElement(element) {
    let valuesByToken = this.valuesByTokenByElement.get(element);
    if (!valuesByToken) {
      valuesByToken = new Map();
      this.valuesByTokenByElement.set(element, valuesByToken);
    }
    return valuesByToken;
  }
  parseToken(token) {
    try {
      const value = this.delegate.parseValueForToken(token);
      return {
        value
      };
    } catch (error) {
      return {
        error
      };
    }
  }
}
class BindingObserver {
  constructor(context, delegate) {
    this.context = context;
    this.delegate = delegate;
    this.bindingsByAction = new Map();
  }
  start() {
    if (!this.valueListObserver) {
      this.valueListObserver = new ValueListObserver(this.element, this.actionAttribute, this);
      this.valueListObserver.start();
    }
  }
  stop() {
    if (this.valueListObserver) {
      this.valueListObserver.stop();
      delete this.valueListObserver;
      this.disconnectAllActions();
    }
  }
  get element() {
    return this.context.element;
  }
  get identifier() {
    return this.context.identifier;
  }
  get actionAttribute() {
    return this.schema.actionAttribute;
  }
  get schema() {
    return this.context.schema;
  }
  get bindings() {
    return Array.from(this.bindingsByAction.values());
  }
  connectAction(action) {
    const binding = new Binding(this.context, action);
    this.bindingsByAction.set(action, binding);
    this.delegate.bindingConnected(binding);
  }
  disconnectAction(action) {
    const binding = this.bindingsByAction.get(action);
    if (binding) {
      this.bindingsByAction.delete(action);
      this.delegate.bindingDisconnected(binding);
    }
  }
  disconnectAllActions() {
    this.bindings.forEach(binding => this.delegate.bindingDisconnected(binding, true));
    this.bindingsByAction.clear();
  }
  parseValueForToken(token) {
    const action = Action.forToken(token, this.schema);
    if (action.identifier == this.identifier) {
      return action;
    }
  }
  elementMatchedValue(element, action) {
    this.connectAction(action);
  }
  elementUnmatchedValue(element, action) {
    this.disconnectAction(action);
  }
}
class ValueObserver {
  constructor(context, receiver) {
    this.context = context;
    this.receiver = receiver;
    this.stringMapObserver = new StringMapObserver(this.element, this);
    this.valueDescriptorMap = this.controller.valueDescriptorMap;
  }
  start() {
    this.stringMapObserver.start();
    this.invokeChangedCallbacksForDefaultValues();
  }
  stop() {
    this.stringMapObserver.stop();
  }
  get element() {
    return this.context.element;
  }
  get controller() {
    return this.context.controller;
  }
  getStringMapKeyForAttribute(attributeName) {
    if (attributeName in this.valueDescriptorMap) {
      return this.valueDescriptorMap[attributeName].name;
    }
  }
  stringMapKeyAdded(key, attributeName) {
    const descriptor = this.valueDescriptorMap[attributeName];
    if (!this.hasValue(key)) {
      this.invokeChangedCallback(key, descriptor.writer(this.receiver[key]), descriptor.writer(descriptor.defaultValue));
    }
  }
  stringMapValueChanged(value, name, oldValue) {
    const descriptor = this.valueDescriptorNameMap[name];
    if (value === null) return;
    if (oldValue === null) {
      oldValue = descriptor.writer(descriptor.defaultValue);
    }
    this.invokeChangedCallback(name, value, oldValue);
  }
  stringMapKeyRemoved(key, attributeName, oldValue) {
    const descriptor = this.valueDescriptorNameMap[key];
    if (this.hasValue(key)) {
      this.invokeChangedCallback(key, descriptor.writer(this.receiver[key]), oldValue);
    } else {
      this.invokeChangedCallback(key, descriptor.writer(descriptor.defaultValue), oldValue);
    }
  }
  invokeChangedCallbacksForDefaultValues() {
    var _iterator7 = _createForOfIteratorHelper(this.valueDescriptors),
      _step7;
    try {
      for (_iterator7.s(); !(_step7 = _iterator7.n()).done;) {
        const _step7$value = _step7.value,
          key = _step7$value.key,
          name = _step7$value.name,
          defaultValue = _step7$value.defaultValue,
          writer = _step7$value.writer;
        if (defaultValue != undefined && !this.controller.data.has(key)) {
          this.invokeChangedCallback(name, writer(defaultValue), undefined);
        }
      }
    } catch (err) {
      _iterator7.e(err);
    } finally {
      _iterator7.f();
    }
  }
  invokeChangedCallback(name, rawValue, rawOldValue) {
    const changedMethodName = `${name}Changed`;
    const changedMethod = this.receiver[changedMethodName];
    if (typeof changedMethod == "function") {
      const descriptor = this.valueDescriptorNameMap[name];
      try {
        const value = descriptor.reader(rawValue);
        let oldValue = rawOldValue;
        if (rawOldValue) {
          oldValue = descriptor.reader(rawOldValue);
        }
        changedMethod.call(this.receiver, value, oldValue);
      } catch (error) {
        if (error instanceof TypeError) {
          error.message = `Stimulus Value "${this.context.identifier}.${descriptor.name}" - ${error.message}`;
        }
        throw error;
      }
    }
  }
  get valueDescriptors() {
    const valueDescriptorMap = this.valueDescriptorMap;
    return Object.keys(valueDescriptorMap).map(key => valueDescriptorMap[key]);
  }
  get valueDescriptorNameMap() {
    const descriptors = {};
    Object.keys(this.valueDescriptorMap).forEach(key => {
      const descriptor = this.valueDescriptorMap[key];
      descriptors[descriptor.name] = descriptor;
    });
    return descriptors;
  }
  hasValue(attributeName) {
    const descriptor = this.valueDescriptorNameMap[attributeName];
    const hasMethodName = `has${capitalize(descriptor.name)}`;
    return this.receiver[hasMethodName];
  }
}
class TargetObserver {
  constructor(context, delegate) {
    this.context = context;
    this.delegate = delegate;
    this.targetsByName = new Multimap();
  }
  start() {
    if (!this.tokenListObserver) {
      this.tokenListObserver = new TokenListObserver(this.element, this.attributeName, this);
      this.tokenListObserver.start();
    }
  }
  stop() {
    if (this.tokenListObserver) {
      this.disconnectAllTargets();
      this.tokenListObserver.stop();
      delete this.tokenListObserver;
    }
  }
  tokenMatched(_ref10) {
    let element = _ref10.element,
      name = _ref10.content;
    if (this.scope.containsElement(element)) {
      this.connectTarget(element, name);
    }
  }
  tokenUnmatched(_ref11) {
    let element = _ref11.element,
      name = _ref11.content;
    this.disconnectTarget(element, name);
  }
  connectTarget(element, name) {
    var _a;
    if (!this.targetsByName.has(name, element)) {
      this.targetsByName.add(name, element);
      (_a = this.tokenListObserver) === null || _a === void 0 ? void 0 : _a.pause(() => this.delegate.targetConnected(element, name));
    }
  }
  disconnectTarget(element, name) {
    var _a;
    if (this.targetsByName.has(name, element)) {
      this.targetsByName.delete(name, element);
      (_a = this.tokenListObserver) === null || _a === void 0 ? void 0 : _a.pause(() => this.delegate.targetDisconnected(element, name));
    }
  }
  disconnectAllTargets() {
    var _iterator8 = _createForOfIteratorHelper(this.targetsByName.keys),
      _step8;
    try {
      for (_iterator8.s(); !(_step8 = _iterator8.n()).done;) {
        const name = _step8.value;
        var _iterator9 = _createForOfIteratorHelper(this.targetsByName.getValuesForKey(name)),
          _step9;
        try {
          for (_iterator9.s(); !(_step9 = _iterator9.n()).done;) {
            const element = _step9.value;
            this.disconnectTarget(element, name);
          }
        } catch (err) {
          _iterator9.e(err);
        } finally {
          _iterator9.f();
        }
      }
    } catch (err) {
      _iterator8.e(err);
    } finally {
      _iterator8.f();
    }
  }
  get attributeName() {
    return `data-${this.context.identifier}-target`;
  }
  get element() {
    return this.context.element;
  }
  get scope() {
    return this.context.scope;
  }
}
function readInheritableStaticArrayValues(constructor, propertyName) {
  const ancestors = getAncestorsForConstructor(constructor);
  return Array.from(ancestors.reduce((values, constructor) => {
    getOwnStaticArrayValues(constructor, propertyName).forEach(name => values.add(name));
    return values;
  }, new Set()));
}
function readInheritableStaticObjectPairs(constructor, propertyName) {
  const ancestors = getAncestorsForConstructor(constructor);
  return ancestors.reduce((pairs, constructor) => {
    pairs.push(...getOwnStaticObjectPairs(constructor, propertyName));
    return pairs;
  }, []);
}
function getAncestorsForConstructor(constructor) {
  const ancestors = [];
  while (constructor) {
    ancestors.push(constructor);
    constructor = Object.getPrototypeOf(constructor);
  }
  return ancestors.reverse();
}
function getOwnStaticArrayValues(constructor, propertyName) {
  const definition = constructor[propertyName];
  return Array.isArray(definition) ? definition : [];
}
function getOwnStaticObjectPairs(constructor, propertyName) {
  const definition = constructor[propertyName];
  return definition ? Object.keys(definition).map(key => [key, definition[key]]) : [];
}
class OutletObserver {
  constructor(context, delegate) {
    this.started = false;
    this.context = context;
    this.delegate = delegate;
    this.outletsByName = new Multimap();
    this.outletElementsByName = new Multimap();
    this.selectorObserverMap = new Map();
    this.attributeObserverMap = new Map();
  }
  start() {
    if (!this.started) {
      this.outletDefinitions.forEach(outletName => {
        this.setupSelectorObserverForOutlet(outletName);
        this.setupAttributeObserverForOutlet(outletName);
      });
      this.started = true;
      this.dependentContexts.forEach(context => context.refresh());
    }
  }
  refresh() {
    this.selectorObserverMap.forEach(observer => observer.refresh());
    this.attributeObserverMap.forEach(observer => observer.refresh());
  }
  stop() {
    if (this.started) {
      this.started = false;
      this.disconnectAllOutlets();
      this.stopSelectorObservers();
      this.stopAttributeObservers();
    }
  }
  stopSelectorObservers() {
    if (this.selectorObserverMap.size > 0) {
      this.selectorObserverMap.forEach(observer => observer.stop());
      this.selectorObserverMap.clear();
    }
  }
  stopAttributeObservers() {
    if (this.attributeObserverMap.size > 0) {
      this.attributeObserverMap.forEach(observer => observer.stop());
      this.attributeObserverMap.clear();
    }
  }
  selectorMatched(element, _selector, _ref12) {
    let outletName = _ref12.outletName;
    const outlet = this.getOutlet(element, outletName);
    if (outlet) {
      this.connectOutlet(outlet, element, outletName);
    }
  }
  selectorUnmatched(element, _selector, _ref13) {
    let outletName = _ref13.outletName;
    const outlet = this.getOutletFromMap(element, outletName);
    if (outlet) {
      this.disconnectOutlet(outlet, element, outletName);
    }
  }
  selectorMatchElement(element, _ref14) {
    let outletName = _ref14.outletName;
    const selector = this.selector(outletName);
    const hasOutlet = this.hasOutlet(element, outletName);
    const hasOutletController = element.matches(`[${this.schema.controllerAttribute}~=${outletName}]`);
    if (selector) {
      return hasOutlet && hasOutletController && element.matches(selector);
    } else {
      return false;
    }
  }
  elementMatchedAttribute(_element, attributeName) {
    const outletName = this.getOutletNameFromOutletAttributeName(attributeName);
    if (outletName) {
      this.updateSelectorObserverForOutlet(outletName);
    }
  }
  elementAttributeValueChanged(_element, attributeName) {
    const outletName = this.getOutletNameFromOutletAttributeName(attributeName);
    if (outletName) {
      this.updateSelectorObserverForOutlet(outletName);
    }
  }
  elementUnmatchedAttribute(_element, attributeName) {
    const outletName = this.getOutletNameFromOutletAttributeName(attributeName);
    if (outletName) {
      this.updateSelectorObserverForOutlet(outletName);
    }
  }
  connectOutlet(outlet, element, outletName) {
    var _a;
    if (!this.outletElementsByName.has(outletName, element)) {
      this.outletsByName.add(outletName, outlet);
      this.outletElementsByName.add(outletName, element);
      (_a = this.selectorObserverMap.get(outletName)) === null || _a === void 0 ? void 0 : _a.pause(() => this.delegate.outletConnected(outlet, element, outletName));
    }
  }
  disconnectOutlet(outlet, element, outletName) {
    var _a;
    if (this.outletElementsByName.has(outletName, element)) {
      this.outletsByName.delete(outletName, outlet);
      this.outletElementsByName.delete(outletName, element);
      (_a = this.selectorObserverMap.get(outletName)) === null || _a === void 0 ? void 0 : _a.pause(() => this.delegate.outletDisconnected(outlet, element, outletName));
    }
  }
  disconnectAllOutlets() {
    var _iterator10 = _createForOfIteratorHelper(this.outletElementsByName.keys),
      _step10;
    try {
      for (_iterator10.s(); !(_step10 = _iterator10.n()).done;) {
        const outletName = _step10.value;
        var _iterator11 = _createForOfIteratorHelper(this.outletElementsByName.getValuesForKey(outletName)),
          _step11;
        try {
          for (_iterator11.s(); !(_step11 = _iterator11.n()).done;) {
            const element = _step11.value;
            var _iterator12 = _createForOfIteratorHelper(this.outletsByName.getValuesForKey(outletName)),
              _step12;
            try {
              for (_iterator12.s(); !(_step12 = _iterator12.n()).done;) {
                const outlet = _step12.value;
                this.disconnectOutlet(outlet, element, outletName);
              }
            } catch (err) {
              _iterator12.e(err);
            } finally {
              _iterator12.f();
            }
          }
        } catch (err) {
          _iterator11.e(err);
        } finally {
          _iterator11.f();
        }
      }
    } catch (err) {
      _iterator10.e(err);
    } finally {
      _iterator10.f();
    }
  }
  updateSelectorObserverForOutlet(outletName) {
    const observer = this.selectorObserverMap.get(outletName);
    if (observer) {
      observer.selector = this.selector(outletName);
    }
  }
  setupSelectorObserverForOutlet(outletName) {
    const selector = this.selector(outletName);
    const selectorObserver = new SelectorObserver(document.body, selector, this, {
      outletName
    });
    this.selectorObserverMap.set(outletName, selectorObserver);
    selectorObserver.start();
  }
  setupAttributeObserverForOutlet(outletName) {
    const attributeName = this.attributeNameForOutletName(outletName);
    const attributeObserver = new AttributeObserver(this.scope.element, attributeName, this);
    this.attributeObserverMap.set(outletName, attributeObserver);
    attributeObserver.start();
  }
  selector(outletName) {
    return this.scope.outlets.getSelectorForOutletName(outletName);
  }
  attributeNameForOutletName(outletName) {
    return this.scope.schema.outletAttributeForScope(this.identifier, outletName);
  }
  getOutletNameFromOutletAttributeName(attributeName) {
    return this.outletDefinitions.find(outletName => this.attributeNameForOutletName(outletName) === attributeName);
  }
  get outletDependencies() {
    const dependencies = new Multimap();
    this.router.modules.forEach(module => {
      const constructor = module.definition.controllerConstructor;
      const outlets = readInheritableStaticArrayValues(constructor, "outlets");
      outlets.forEach(outlet => dependencies.add(outlet, module.identifier));
    });
    return dependencies;
  }
  get outletDefinitions() {
    return this.outletDependencies.getKeysForValue(this.identifier);
  }
  get dependentControllerIdentifiers() {
    return this.outletDependencies.getValuesForKey(this.identifier);
  }
  get dependentContexts() {
    const identifiers = this.dependentControllerIdentifiers;
    return this.router.contexts.filter(context => identifiers.includes(context.identifier));
  }
  hasOutlet(element, outletName) {
    return !!this.getOutlet(element, outletName) || !!this.getOutletFromMap(element, outletName);
  }
  getOutlet(element, outletName) {
    return this.application.getControllerForElementAndIdentifier(element, outletName);
  }
  getOutletFromMap(element, outletName) {
    return this.outletsByName.getValuesForKey(outletName).find(outlet => outlet.element === element);
  }
  get scope() {
    return this.context.scope;
  }
  get schema() {
    return this.context.schema;
  }
  get identifier() {
    return this.context.identifier;
  }
  get application() {
    return this.context.application;
  }
  get router() {
    return this.application.router;
  }
}
class Context {
  constructor(module, scope) {
    var _this = this;
    this.logDebugActivity = function (functionName) {
      let detail = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {};
      const identifier = _this.identifier,
        controller = _this.controller,
        element = _this.element;
      detail = Object.assign({
        identifier,
        controller,
        element
      }, detail);
      _this.application.logDebugActivity(_this.identifier, functionName, detail);
    };
    this.module = module;
    this.scope = scope;
    this.controller = new module.controllerConstructor(this);
    this.bindingObserver = new BindingObserver(this, this.dispatcher);
    this.valueObserver = new ValueObserver(this, this.controller);
    this.targetObserver = new TargetObserver(this, this);
    this.outletObserver = new OutletObserver(this, this);
    try {
      this.controller.initialize();
      this.logDebugActivity("initialize");
    } catch (error) {
      this.handleError(error, "initializing controller");
    }
  }
  connect() {
    this.bindingObserver.start();
    this.valueObserver.start();
    this.targetObserver.start();
    this.outletObserver.start();
    try {
      this.controller.connect();
      this.logDebugActivity("connect");
    } catch (error) {
      this.handleError(error, "connecting controller");
    }
  }
  refresh() {
    this.outletObserver.refresh();
  }
  disconnect() {
    try {
      this.controller.disconnect();
      this.logDebugActivity("disconnect");
    } catch (error) {
      this.handleError(error, "disconnecting controller");
    }
    this.outletObserver.stop();
    this.targetObserver.stop();
    this.valueObserver.stop();
    this.bindingObserver.stop();
  }
  get application() {
    return this.module.application;
  }
  get identifier() {
    return this.module.identifier;
  }
  get schema() {
    return this.application.schema;
  }
  get dispatcher() {
    return this.application.dispatcher;
  }
  get element() {
    return this.scope.element;
  }
  get parentElement() {
    return this.element.parentElement;
  }
  handleError(error, message) {
    let detail = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : {};
    const identifier = this.identifier,
      controller = this.controller,
      element = this.element;
    detail = Object.assign({
      identifier,
      controller,
      element
    }, detail);
    this.application.handleError(error, `Error ${message}`, detail);
  }
  targetConnected(element, name) {
    this.invokeControllerMethod(`${name}TargetConnected`, element);
  }
  targetDisconnected(element, name) {
    this.invokeControllerMethod(`${name}TargetDisconnected`, element);
  }
  outletConnected(outlet, element, name) {
    this.invokeControllerMethod(`${namespaceCamelize(name)}OutletConnected`, outlet, element);
  }
  outletDisconnected(outlet, element, name) {
    this.invokeControllerMethod(`${namespaceCamelize(name)}OutletDisconnected`, outlet, element);
  }
  invokeControllerMethod(methodName) {
    const controller = this.controller;
    if (typeof controller[methodName] == "function") {
      for (var _len = arguments.length, args = new Array(_len > 1 ? _len - 1 : 0), _key2 = 1; _key2 < _len; _key2++) {
        args[_key2 - 1] = arguments[_key2];
      }
      controller[methodName](...args);
    }
  }
}
function bless(constructor) {
  return shadow(constructor, getBlessedProperties(constructor));
}
function shadow(constructor, properties) {
  const shadowConstructor = extend(constructor);
  const shadowProperties = getShadowProperties(constructor.prototype, properties);
  Object.defineProperties(shadowConstructor.prototype, shadowProperties);
  return shadowConstructor;
}
function getBlessedProperties(constructor) {
  const blessings = readInheritableStaticArrayValues(constructor, "blessings");
  return blessings.reduce((blessedProperties, blessing) => {
    const properties = blessing(constructor);
    for (const key in properties) {
      const descriptor = blessedProperties[key] || {};
      blessedProperties[key] = Object.assign(descriptor, properties[key]);
    }
    return blessedProperties;
  }, {});
}
function getShadowProperties(prototype, properties) {
  return getOwnKeys(properties).reduce((shadowProperties, key) => {
    const descriptor = getShadowedDescriptor(prototype, properties, key);
    if (descriptor) {
      Object.assign(shadowProperties, {
        [key]: descriptor
      });
    }
    return shadowProperties;
  }, {});
}
function getShadowedDescriptor(prototype, properties, key) {
  const shadowingDescriptor = Object.getOwnPropertyDescriptor(prototype, key);
  const shadowedByValue = shadowingDescriptor && "value" in shadowingDescriptor;
  if (!shadowedByValue) {
    const descriptor = Object.getOwnPropertyDescriptor(properties, key).value;
    if (shadowingDescriptor) {
      descriptor.get = shadowingDescriptor.get || descriptor.get;
      descriptor.set = shadowingDescriptor.set || descriptor.set;
    }
    return descriptor;
  }
}
const getOwnKeys = (() => {
  if (typeof Object.getOwnPropertySymbols == "function") {
    return object => [...Object.getOwnPropertyNames(object), ...Object.getOwnPropertySymbols(object)];
  } else {
    return Object.getOwnPropertyNames;
  }
})();
const extend = (() => {
  function extendWithReflect(constructor) {
    function extended() {
      return Reflect.construct(constructor, arguments, new.target);
    }
    extended.prototype = Object.create(constructor.prototype, {
      constructor: {
        value: extended
      }
    });
    Reflect.setPrototypeOf(extended, constructor);
    return extended;
  }
  function testReflectExtension() {
    const a = function () {
      this.a.call(this);
    };
    const b = extendWithReflect(a);
    b.prototype.a = function () {};
    return new b();
  }
  try {
    testReflectExtension();
    return extendWithReflect;
  } catch (error) {
    return constructor => class extended extends constructor {};
  }
})();
function blessDefinition(definition) {
  return {
    identifier: definition.identifier,
    controllerConstructor: bless(definition.controllerConstructor)
  };
}
class Module {
  constructor(application, definition) {
    this.application = application;
    this.definition = blessDefinition(definition);
    this.contextsByScope = new WeakMap();
    this.connectedContexts = new Set();
  }
  get identifier() {
    return this.definition.identifier;
  }
  get controllerConstructor() {
    return this.definition.controllerConstructor;
  }
  get contexts() {
    return Array.from(this.connectedContexts);
  }
  connectContextForScope(scope) {
    const context = this.fetchContextForScope(scope);
    this.connectedContexts.add(context);
    context.connect();
  }
  disconnectContextForScope(scope) {
    const context = this.contextsByScope.get(scope);
    if (context) {
      this.connectedContexts.delete(context);
      context.disconnect();
    }
  }
  fetchContextForScope(scope) {
    let context = this.contextsByScope.get(scope);
    if (!context) {
      context = new Context(this, scope);
      this.contextsByScope.set(scope, context);
    }
    return context;
  }
}
class ClassMap {
  constructor(scope) {
    this.scope = scope;
  }
  has(name) {
    return this.data.has(this.getDataKey(name));
  }
  get(name) {
    return this.getAll(name)[0];
  }
  getAll(name) {
    const tokenString = this.data.get(this.getDataKey(name)) || "";
    return tokenize(tokenString);
  }
  getAttributeName(name) {
    return this.data.getAttributeNameForKey(this.getDataKey(name));
  }
  getDataKey(name) {
    return `${name}-class`;
  }
  get data() {
    return this.scope.data;
  }
}
class DataMap {
  constructor(scope) {
    this.scope = scope;
  }
  get element() {
    return this.scope.element;
  }
  get identifier() {
    return this.scope.identifier;
  }
  get(key) {
    const name = this.getAttributeNameForKey(key);
    return this.element.getAttribute(name);
  }
  set(key, value) {
    const name = this.getAttributeNameForKey(key);
    this.element.setAttribute(name, value);
    return this.get(key);
  }
  has(key) {
    const name = this.getAttributeNameForKey(key);
    return this.element.hasAttribute(name);
  }
  delete(key) {
    if (this.has(key)) {
      const name = this.getAttributeNameForKey(key);
      this.element.removeAttribute(name);
      return true;
    } else {
      return false;
    }
  }
  getAttributeNameForKey(key) {
    return `data-${this.identifier}-${dasherize(key)}`;
  }
}
class Guide {
  constructor(logger) {
    this.warnedKeysByObject = new WeakMap();
    this.logger = logger;
  }
  warn(object, key, message) {
    let warnedKeys = this.warnedKeysByObject.get(object);
    if (!warnedKeys) {
      warnedKeys = new Set();
      this.warnedKeysByObject.set(object, warnedKeys);
    }
    if (!warnedKeys.has(key)) {
      warnedKeys.add(key);
      this.logger.warn(message, object);
    }
  }
}
function attributeValueContainsToken(attributeName, token) {
  return `[${attributeName}~="${token}"]`;
}
class TargetSet {
  constructor(scope) {
    this.scope = scope;
  }
  get element() {
    return this.scope.element;
  }
  get identifier() {
    return this.scope.identifier;
  }
  get schema() {
    return this.scope.schema;
  }
  has(targetName) {
    return this.find(targetName) != null;
  }
  find() {
    for (var _len2 = arguments.length, targetNames = new Array(_len2), _key3 = 0; _key3 < _len2; _key3++) {
      targetNames[_key3] = arguments[_key3];
    }
    return targetNames.reduce((target, targetName) => target || this.findTarget(targetName) || this.findLegacyTarget(targetName), undefined);
  }
  findAll() {
    for (var _len3 = arguments.length, targetNames = new Array(_len3), _key4 = 0; _key4 < _len3; _key4++) {
      targetNames[_key4] = arguments[_key4];
    }
    return targetNames.reduce((targets, targetName) => [...targets, ...this.findAllTargets(targetName), ...this.findAllLegacyTargets(targetName)], []);
  }
  findTarget(targetName) {
    const selector = this.getSelectorForTargetName(targetName);
    return this.scope.findElement(selector);
  }
  findAllTargets(targetName) {
    const selector = this.getSelectorForTargetName(targetName);
    return this.scope.findAllElements(selector);
  }
  getSelectorForTargetName(targetName) {
    const attributeName = this.schema.targetAttributeForScope(this.identifier);
    return attributeValueContainsToken(attributeName, targetName);
  }
  findLegacyTarget(targetName) {
    const selector = this.getLegacySelectorForTargetName(targetName);
    return this.deprecate(this.scope.findElement(selector), targetName);
  }
  findAllLegacyTargets(targetName) {
    const selector = this.getLegacySelectorForTargetName(targetName);
    return this.scope.findAllElements(selector).map(element => this.deprecate(element, targetName));
  }
  getLegacySelectorForTargetName(targetName) {
    const targetDescriptor = `${this.identifier}.${targetName}`;
    return attributeValueContainsToken(this.schema.targetAttribute, targetDescriptor);
  }
  deprecate(element, targetName) {
    if (element) {
      const identifier = this.identifier;
      const attributeName = this.schema.targetAttribute;
      const revisedAttributeName = this.schema.targetAttributeForScope(identifier);
      this.guide.warn(element, `target:${targetName}`, `Please replace ${attributeName}="${identifier}.${targetName}" with ${revisedAttributeName}="${targetName}". ` + `The ${attributeName} attribute is deprecated and will be removed in a future version of Stimulus.`);
    }
    return element;
  }
  get guide() {
    return this.scope.guide;
  }
}
class OutletSet {
  constructor(scope, controllerElement) {
    this.scope = scope;
    this.controllerElement = controllerElement;
  }
  get element() {
    return this.scope.element;
  }
  get identifier() {
    return this.scope.identifier;
  }
  get schema() {
    return this.scope.schema;
  }
  has(outletName) {
    return this.find(outletName) != null;
  }
  find() {
    for (var _len4 = arguments.length, outletNames = new Array(_len4), _key5 = 0; _key5 < _len4; _key5++) {
      outletNames[_key5] = arguments[_key5];
    }
    return outletNames.reduce((outlet, outletName) => outlet || this.findOutlet(outletName), undefined);
  }
  findAll() {
    for (var _len5 = arguments.length, outletNames = new Array(_len5), _key6 = 0; _key6 < _len5; _key6++) {
      outletNames[_key6] = arguments[_key6];
    }
    return outletNames.reduce((outlets, outletName) => [...outlets, ...this.findAllOutlets(outletName)], []);
  }
  getSelectorForOutletName(outletName) {
    const attributeName = this.schema.outletAttributeForScope(this.identifier, outletName);
    return this.controllerElement.getAttribute(attributeName);
  }
  findOutlet(outletName) {
    const selector = this.getSelectorForOutletName(outletName);
    if (selector) return this.findElement(selector, outletName);
  }
  findAllOutlets(outletName) {
    const selector = this.getSelectorForOutletName(outletName);
    return selector ? this.findAllElements(selector, outletName) : [];
  }
  findElement(selector, outletName) {
    const elements = this.scope.queryElements(selector);
    return elements.filter(element => this.matchesElement(element, selector, outletName))[0];
  }
  findAllElements(selector, outletName) {
    const elements = this.scope.queryElements(selector);
    return elements.filter(element => this.matchesElement(element, selector, outletName));
  }
  matchesElement(element, selector, outletName) {
    const controllerAttribute = element.getAttribute(this.scope.schema.controllerAttribute) || "";
    return element.matches(selector) && controllerAttribute.split(" ").includes(outletName);
  }
}
class Scope {
  constructor(schema, element, identifier, logger) {
    this.targets = new TargetSet(this);
    this.classes = new ClassMap(this);
    this.data = new DataMap(this);
    this.containsElement = element => {
      return element.closest(this.controllerSelector) === this.element;
    };
    this.schema = schema;
    this.element = element;
    this.identifier = identifier;
    this.guide = new Guide(logger);
    this.outlets = new OutletSet(this.documentScope, element);
  }
  findElement(selector) {
    return this.element.matches(selector) ? this.element : this.queryElements(selector).find(this.containsElement);
  }
  findAllElements(selector) {
    return [...(this.element.matches(selector) ? [this.element] : []), ...this.queryElements(selector).filter(this.containsElement)];
  }
  queryElements(selector) {
    return Array.from(this.element.querySelectorAll(selector));
  }
  get controllerSelector() {
    return attributeValueContainsToken(this.schema.controllerAttribute, this.identifier);
  }
  get isDocumentScope() {
    return this.element === document.documentElement;
  }
  get documentScope() {
    return this.isDocumentScope ? this : new Scope(this.schema, document.documentElement, this.identifier, this.guide.logger);
  }
}
class ScopeObserver {
  constructor(element, schema, delegate) {
    this.element = element;
    this.schema = schema;
    this.delegate = delegate;
    this.valueListObserver = new ValueListObserver(this.element, this.controllerAttribute, this);
    this.scopesByIdentifierByElement = new WeakMap();
    this.scopeReferenceCounts = new WeakMap();
  }
  start() {
    this.valueListObserver.start();
  }
  stop() {
    this.valueListObserver.stop();
  }
  get controllerAttribute() {
    return this.schema.controllerAttribute;
  }
  parseValueForToken(token) {
    const element = token.element,
      identifier = token.content;
    return this.parseValueForElementAndIdentifier(element, identifier);
  }
  parseValueForElementAndIdentifier(element, identifier) {
    const scopesByIdentifier = this.fetchScopesByIdentifierForElement(element);
    let scope = scopesByIdentifier.get(identifier);
    if (!scope) {
      scope = this.delegate.createScopeForElementAndIdentifier(element, identifier);
      scopesByIdentifier.set(identifier, scope);
    }
    return scope;
  }
  elementMatchedValue(element, value) {
    const referenceCount = (this.scopeReferenceCounts.get(value) || 0) + 1;
    this.scopeReferenceCounts.set(value, referenceCount);
    if (referenceCount == 1) {
      this.delegate.scopeConnected(value);
    }
  }
  elementUnmatchedValue(element, value) {
    const referenceCount = this.scopeReferenceCounts.get(value);
    if (referenceCount) {
      this.scopeReferenceCounts.set(value, referenceCount - 1);
      if (referenceCount == 1) {
        this.delegate.scopeDisconnected(value);
      }
    }
  }
  fetchScopesByIdentifierForElement(element) {
    let scopesByIdentifier = this.scopesByIdentifierByElement.get(element);
    if (!scopesByIdentifier) {
      scopesByIdentifier = new Map();
      this.scopesByIdentifierByElement.set(element, scopesByIdentifier);
    }
    return scopesByIdentifier;
  }
}
class Router {
  constructor(application) {
    this.application = application;
    this.scopeObserver = new ScopeObserver(this.element, this.schema, this);
    this.scopesByIdentifier = new Multimap();
    this.modulesByIdentifier = new Map();
  }
  get element() {
    return this.application.element;
  }
  get schema() {
    return this.application.schema;
  }
  get logger() {
    return this.application.logger;
  }
  get controllerAttribute() {
    return this.schema.controllerAttribute;
  }
  get modules() {
    return Array.from(this.modulesByIdentifier.values());
  }
  get contexts() {
    return this.modules.reduce((contexts, module) => contexts.concat(module.contexts), []);
  }
  start() {
    this.scopeObserver.start();
  }
  stop() {
    this.scopeObserver.stop();
  }
  loadDefinition(definition) {
    this.unloadIdentifier(definition.identifier);
    const module = new Module(this.application, definition);
    this.connectModule(module);
    const afterLoad = definition.controllerConstructor.afterLoad;
    if (afterLoad) {
      afterLoad.call(definition.controllerConstructor, definition.identifier, this.application);
    }
  }
  unloadIdentifier(identifier) {
    const module = this.modulesByIdentifier.get(identifier);
    if (module) {
      this.disconnectModule(module);
    }
  }
  getContextForElementAndIdentifier(element, identifier) {
    const module = this.modulesByIdentifier.get(identifier);
    if (module) {
      return module.contexts.find(context => context.element == element);
    }
  }
  proposeToConnectScopeForElementAndIdentifier(element, identifier) {
    const scope = this.scopeObserver.parseValueForElementAndIdentifier(element, identifier);
    if (scope) {
      this.scopeObserver.elementMatchedValue(scope.element, scope);
    } else {
      console.error(`Couldn't find or create scope for identifier: "${identifier}" and element:`, element);
    }
  }
  handleError(error, message, detail) {
    this.application.handleError(error, message, detail);
  }
  createScopeForElementAndIdentifier(element, identifier) {
    return new Scope(this.schema, element, identifier, this.logger);
  }
  scopeConnected(scope) {
    this.scopesByIdentifier.add(scope.identifier, scope);
    const module = this.modulesByIdentifier.get(scope.identifier);
    if (module) {
      module.connectContextForScope(scope);
    }
  }
  scopeDisconnected(scope) {
    this.scopesByIdentifier.delete(scope.identifier, scope);
    const module = this.modulesByIdentifier.get(scope.identifier);
    if (module) {
      module.disconnectContextForScope(scope);
    }
  }
  connectModule(module) {
    this.modulesByIdentifier.set(module.identifier, module);
    const scopes = this.scopesByIdentifier.getValuesForKey(module.identifier);
    scopes.forEach(scope => module.connectContextForScope(scope));
  }
  disconnectModule(module) {
    this.modulesByIdentifier.delete(module.identifier);
    const scopes = this.scopesByIdentifier.getValuesForKey(module.identifier);
    scopes.forEach(scope => module.disconnectContextForScope(scope));
  }
}
const defaultSchema = {
  controllerAttribute: "data-controller",
  actionAttribute: "data-action",
  targetAttribute: "data-target",
  targetAttributeForScope: identifier => `data-${identifier}-target`,
  outletAttributeForScope: (identifier, outlet) => `data-${identifier}-${outlet}-outlet`,
  keyMappings: Object.assign(Object.assign({
    enter: "Enter",
    tab: "Tab",
    esc: "Escape",
    space: " ",
    up: "ArrowUp",
    down: "ArrowDown",
    left: "ArrowLeft",
    right: "ArrowRight",
    home: "Home",
    end: "End",
    page_up: "PageUp",
    page_down: "PageDown"
  }, objectFromEntries("abcdefghijklmnopqrstuvwxyz".split("").map(c => [c, c]))), objectFromEntries("0123456789".split("").map(n => [n, n])))
};
function objectFromEntries(array) {
  return array.reduce((memo, _ref15) => {
    let _ref16 = _slicedToArray(_ref15, 2),
      k = _ref16[0],
      v = _ref16[1];
    return Object.assign(Object.assign({}, memo), {
      [k]: v
    });
  }, {});
}
class Application {
  constructor() {
    var _this2 = this;
    let element = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : document.documentElement;
    let schema = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : defaultSchema;
    this.logger = console;
    this.debug = false;
    this.logDebugActivity = function (identifier, functionName) {
      let detail = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : {};
      if (_this2.debug) {
        _this2.logFormattedMessage(identifier, functionName, detail);
      }
    };
    this.element = element;
    this.schema = schema;
    this.dispatcher = new Dispatcher(this);
    this.router = new Router(this);
    this.actionDescriptorFilters = Object.assign({}, defaultActionDescriptorFilters);
  }
  static start(element, schema) {
    const application = new this(element, schema);
    application.start();
    return application;
  }
  async start() {
    await domReady();
    this.logDebugActivity("application", "starting");
    this.dispatcher.start();
    this.router.start();
    this.logDebugActivity("application", "start");
  }
  stop() {
    this.logDebugActivity("application", "stopping");
    this.dispatcher.stop();
    this.router.stop();
    this.logDebugActivity("application", "stop");
  }
  register(identifier, controllerConstructor) {
    this.load({
      identifier,
      controllerConstructor
    });
  }
  registerActionOption(name, filter) {
    this.actionDescriptorFilters[name] = filter;
  }
  load(head) {
    for (var _len6 = arguments.length, rest = new Array(_len6 > 1 ? _len6 - 1 : 0), _key7 = 1; _key7 < _len6; _key7++) {
      rest[_key7 - 1] = arguments[_key7];
    }
    const definitions = Array.isArray(head) ? head : [head, ...rest];
    definitions.forEach(definition => {
      if (definition.controllerConstructor.shouldLoad) {
        this.router.loadDefinition(definition);
      }
    });
  }
  unload(head) {
    for (var _len7 = arguments.length, rest = new Array(_len7 > 1 ? _len7 - 1 : 0), _key8 = 1; _key8 < _len7; _key8++) {
      rest[_key8 - 1] = arguments[_key8];
    }
    const identifiers = Array.isArray(head) ? head : [head, ...rest];
    identifiers.forEach(identifier => this.router.unloadIdentifier(identifier));
  }
  get controllers() {
    return this.router.contexts.map(context => context.controller);
  }
  getControllerForElementAndIdentifier(element, identifier) {
    const context = this.router.getContextForElementAndIdentifier(element, identifier);
    return context ? context.controller : null;
  }
  handleError(error, message, detail) {
    var _a;
    this.logger.error(`%s\n\n%o\n\n%o`, message, error, detail);
    (_a = window.onerror) === null || _a === void 0 ? void 0 : _a.call(window, message, "", 0, 0, error);
  }
  logFormattedMessage(identifier, functionName) {
    let detail = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : {};
    detail = Object.assign({
      application: this
    }, detail);
    this.logger.groupCollapsed(`${identifier} #${functionName}`);
    this.logger.log("details:", Object.assign({}, detail));
    this.logger.groupEnd();
  }
}
function domReady() {
  return new Promise(resolve => {
    if (document.readyState == "loading") {
      document.addEventListener("DOMContentLoaded", () => resolve());
    } else {
      resolve();
    }
  });
}
function ClassPropertiesBlessing(constructor) {
  const classes = readInheritableStaticArrayValues(constructor, "classes");
  return classes.reduce((properties, classDefinition) => {
    return Object.assign(properties, propertiesForClassDefinition(classDefinition));
  }, {});
}
function propertiesForClassDefinition(key) {
  return {
    [`${key}Class`]: {
      get() {
        const classes = this.classes;
        if (classes.has(key)) {
          return classes.get(key);
        } else {
          const attribute = classes.getAttributeName(key);
          throw new Error(`Missing attribute "${attribute}"`);
        }
      }
    },
    [`${key}Classes`]: {
      get() {
        return this.classes.getAll(key);
      }
    },
    [`has${capitalize(key)}Class`]: {
      get() {
        return this.classes.has(key);
      }
    }
  };
}
function OutletPropertiesBlessing(constructor) {
  const outlets = readInheritableStaticArrayValues(constructor, "outlets");
  return outlets.reduce((properties, outletDefinition) => {
    return Object.assign(properties, propertiesForOutletDefinition(outletDefinition));
  }, {});
}
function getOutletController(controller, element, identifier) {
  return controller.application.getControllerForElementAndIdentifier(element, identifier);
}
function getControllerAndEnsureConnectedScope(controller, element, outletName) {
  let outletController = getOutletController(controller, element, outletName);
  if (outletController) return outletController;
  controller.application.router.proposeToConnectScopeForElementAndIdentifier(element, outletName);
  outletController = getOutletController(controller, element, outletName);
  if (outletController) return outletController;
}
function propertiesForOutletDefinition(name) {
  const camelizedName = namespaceCamelize(name);
  return {
    [`${camelizedName}Outlet`]: {
      get() {
        const outletElement = this.outlets.find(name);
        const selector = this.outlets.getSelectorForOutletName(name);
        if (outletElement) {
          const outletController = getControllerAndEnsureConnectedScope(this, outletElement, name);
          if (outletController) return outletController;
          throw new Error(`The provided outlet element is missing an outlet controller "${name}" instance for host controller "${this.identifier}"`);
        }
        throw new Error(`Missing outlet element "${name}" for host controller "${this.identifier}". Stimulus couldn't find a matching outlet element using selector "${selector}".`);
      }
    },
    [`${camelizedName}Outlets`]: {
      get() {
        const outlets = this.outlets.findAll(name);
        if (outlets.length > 0) {
          return outlets.map(outletElement => {
            const outletController = getControllerAndEnsureConnectedScope(this, outletElement, name);
            if (outletController) return outletController;
            console.warn(`The provided outlet element is missing an outlet controller "${name}" instance for host controller "${this.identifier}"`, outletElement);
          }).filter(controller => controller);
        }
        return [];
      }
    },
    [`${camelizedName}OutletElement`]: {
      get() {
        const outletElement = this.outlets.find(name);
        const selector = this.outlets.getSelectorForOutletName(name);
        if (outletElement) {
          return outletElement;
        } else {
          throw new Error(`Missing outlet element "${name}" for host controller "${this.identifier}". Stimulus couldn't find a matching outlet element using selector "${selector}".`);
        }
      }
    },
    [`${camelizedName}OutletElements`]: {
      get() {
        return this.outlets.findAll(name);
      }
    },
    [`has${capitalize(camelizedName)}Outlet`]: {
      get() {
        return this.outlets.has(name);
      }
    }
  };
}
function TargetPropertiesBlessing(constructor) {
  const targets = readInheritableStaticArrayValues(constructor, "targets");
  return targets.reduce((properties, targetDefinition) => {
    return Object.assign(properties, propertiesForTargetDefinition(targetDefinition));
  }, {});
}
function propertiesForTargetDefinition(name) {
  return {
    [`${name}Target`]: {
      get() {
        const target = this.targets.find(name);
        if (target) {
          return target;
        } else {
          throw new Error(`Missing target element "${name}" for "${this.identifier}" controller`);
        }
      }
    },
    [`${name}Targets`]: {
      get() {
        return this.targets.findAll(name);
      }
    },
    [`has${capitalize(name)}Target`]: {
      get() {
        return this.targets.has(name);
      }
    }
  };
}
function ValuePropertiesBlessing(constructor) {
  const valueDefinitionPairs = readInheritableStaticObjectPairs(constructor, "values");
  const propertyDescriptorMap = {
    valueDescriptorMap: {
      get() {
        return valueDefinitionPairs.reduce((result, valueDefinitionPair) => {
          const valueDescriptor = parseValueDefinitionPair(valueDefinitionPair, this.identifier);
          const attributeName = this.data.getAttributeNameForKey(valueDescriptor.key);
          return Object.assign(result, {
            [attributeName]: valueDescriptor
          });
        }, {});
      }
    }
  };
  return valueDefinitionPairs.reduce((properties, valueDefinitionPair) => {
    return Object.assign(properties, propertiesForValueDefinitionPair(valueDefinitionPair));
  }, propertyDescriptorMap);
}
function propertiesForValueDefinitionPair(valueDefinitionPair, controller) {
  const definition = parseValueDefinitionPair(valueDefinitionPair, controller);
  const key = definition.key,
    name = definition.name,
    read = definition.reader,
    write = definition.writer;
  return {
    [name]: {
      get() {
        const value = this.data.get(key);
        if (value !== null) {
          return read(value);
        } else {
          return definition.defaultValue;
        }
      },
      set(value) {
        if (value === undefined) {
          this.data.delete(key);
        } else {
          this.data.set(key, write(value));
        }
      }
    },
    [`has${capitalize(name)}`]: {
      get() {
        return this.data.has(key) || definition.hasCustomDefaultValue;
      }
    }
  };
}
function parseValueDefinitionPair(_ref17, controller) {
  let _ref18 = _slicedToArray(_ref17, 2),
    token = _ref18[0],
    typeDefinition = _ref18[1];
  return valueDescriptorForTokenAndTypeDefinition({
    controller,
    token,
    typeDefinition
  });
}
function parseValueTypeConstant(constant) {
  switch (constant) {
    case Array:
      return "array";
    case Boolean:
      return "boolean";
    case Number:
      return "number";
    case Object:
      return "object";
    case String:
      return "string";
  }
}
function parseValueTypeDefault(defaultValue) {
  switch (typeof defaultValue) {
    case "boolean":
      return "boolean";
    case "number":
      return "number";
    case "string":
      return "string";
  }
  if (Array.isArray(defaultValue)) return "array";
  if (Object.prototype.toString.call(defaultValue) === "[object Object]") return "object";
}
function parseValueTypeObject(payload) {
  const controller = payload.controller,
    token = payload.token,
    typeObject = payload.typeObject;
  const hasType = isSomething(typeObject.type);
  const hasDefault = isSomething(typeObject.default);
  const fullObject = hasType && hasDefault;
  const onlyType = hasType && !hasDefault;
  const onlyDefault = !hasType && hasDefault;
  const typeFromObject = parseValueTypeConstant(typeObject.type);
  const typeFromDefaultValue = parseValueTypeDefault(payload.typeObject.default);
  if (onlyType) return typeFromObject;
  if (onlyDefault) return typeFromDefaultValue;
  if (typeFromObject !== typeFromDefaultValue) {
    const propertyPath = controller ? `${controller}.${token}` : token;
    throw new Error(`The specified default value for the Stimulus Value "${propertyPath}" must match the defined type "${typeFromObject}". The provided default value of "${typeObject.default}" is of type "${typeFromDefaultValue}".`);
  }
  if (fullObject) return typeFromObject;
}
function parseValueTypeDefinition(payload) {
  const controller = payload.controller,
    token = payload.token,
    typeDefinition = payload.typeDefinition;
  const typeObject = {
    controller,
    token,
    typeObject: typeDefinition
  };
  const typeFromObject = parseValueTypeObject(typeObject);
  const typeFromDefaultValue = parseValueTypeDefault(typeDefinition);
  const typeFromConstant = parseValueTypeConstant(typeDefinition);
  const type = typeFromObject || typeFromDefaultValue || typeFromConstant;
  if (type) return type;
  const propertyPath = controller ? `${controller}.${typeDefinition}` : token;
  throw new Error(`Unknown value type "${propertyPath}" for "${token}" value`);
}
function defaultValueForDefinition(typeDefinition) {
  const constant = parseValueTypeConstant(typeDefinition);
  if (constant) return defaultValuesByType[constant];
  const hasDefault = hasProperty(typeDefinition, "default");
  const hasType = hasProperty(typeDefinition, "type");
  const typeObject = typeDefinition;
  if (hasDefault) return typeObject.default;
  if (hasType) {
    const type = typeObject.type;
    const constantFromType = parseValueTypeConstant(type);
    if (constantFromType) return defaultValuesByType[constantFromType];
  }
  return typeDefinition;
}
function valueDescriptorForTokenAndTypeDefinition(payload) {
  const token = payload.token,
    typeDefinition = payload.typeDefinition;
  const key = `${dasherize(token)}-value`;
  const type = parseValueTypeDefinition(payload);
  return {
    type,
    key,
    name: camelize(key),
    get defaultValue() {
      return defaultValueForDefinition(typeDefinition);
    },
    get hasCustomDefaultValue() {
      return parseValueTypeDefault(typeDefinition) !== undefined;
    },
    reader: readers[type],
    writer: writers[type] || writers.default
  };
}
const defaultValuesByType = {
  get array() {
    return [];
  },
  boolean: false,
  number: 0,
  get object() {
    return {};
  },
  string: ""
};
const readers = {
  array(value) {
    const array = JSON.parse(value);
    if (!Array.isArray(array)) {
      throw new TypeError(`expected value of type "array" but instead got value "${value}" of type "${parseValueTypeDefault(array)}"`);
    }
    return array;
  },
  boolean(value) {
    return !(value == "0" || String(value).toLowerCase() == "false");
  },
  number(value) {
    return Number(value.replace(/_/g, ""));
  },
  object(value) {
    const object = JSON.parse(value);
    if (object === null || typeof object != "object" || Array.isArray(object)) {
      throw new TypeError(`expected value of type "object" but instead got value "${value}" of type "${parseValueTypeDefault(object)}"`);
    }
    return object;
  },
  string(value) {
    return value;
  }
};
const writers = {
  default: writeString,
  array: writeJSON,
  object: writeJSON
};
function writeJSON(value) {
  return JSON.stringify(value);
}
function writeString(value) {
  return `${value}`;
}
class Controller {
  constructor(context) {
    this.context = context;
  }
  static get shouldLoad() {
    return true;
  }
  static afterLoad(_identifier, _application) {
    return;
  }
  get application() {
    return this.context.application;
  }
  get scope() {
    return this.context.scope;
  }
  get element() {
    return this.scope.element;
  }
  get identifier() {
    return this.scope.identifier;
  }
  get targets() {
    return this.scope.targets;
  }
  get outlets() {
    return this.scope.outlets;
  }
  get classes() {
    return this.scope.classes;
  }
  get data() {
    return this.scope.data;
  }
  initialize() {}
  connect() {}
  disconnect() {}
  dispatch(eventName) {
    let _ref19 = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {},
      _ref19$target = _ref19.target,
      target = _ref19$target === void 0 ? this.element : _ref19$target,
      _ref19$detail = _ref19.detail,
      detail = _ref19$detail === void 0 ? {} : _ref19$detail,
      _ref19$prefix = _ref19.prefix,
      prefix = _ref19$prefix === void 0 ? this.identifier : _ref19$prefix,
      _ref19$bubbles = _ref19.bubbles,
      bubbles = _ref19$bubbles === void 0 ? true : _ref19$bubbles,
      _ref19$cancelable = _ref19.cancelable,
      cancelable = _ref19$cancelable === void 0 ? true : _ref19$cancelable;
    const type = prefix ? `${prefix}:${eventName}` : eventName;
    const event = new CustomEvent(type, {
      detail,
      bubbles,
      cancelable
    });
    target.dispatchEvent(event);
    return event;
  }
}
Controller.blessings = [ClassPropertiesBlessing, TargetPropertiesBlessing, ValuePropertiesBlessing, OutletPropertiesBlessing];
Controller.targets = [];
Controller.outlets = [];
Controller.values = {};


/***/ }),

/***/ "./node_modules/stimulus/webpack-helpers.js":
/*!**************************************************!*\
  !*** ./node_modules/stimulus/webpack-helpers.js ***!
  \**************************************************/
/*! exports provided: definitionForModuleAndIdentifier, definitionForModuleWithContextAndKey, definitionsFromContext, identifierForContextKey */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _hotwired_stimulus_webpack_helpers__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @hotwired/stimulus-webpack-helpers */ "./node_modules/@hotwired/stimulus-webpack-helpers/dist/stimulus-webpack-helpers.js");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "definitionForModuleAndIdentifier", function() { return _hotwired_stimulus_webpack_helpers__WEBPACK_IMPORTED_MODULE_0__["definitionForModuleAndIdentifier"]; });

/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "definitionForModuleWithContextAndKey", function() { return _hotwired_stimulus_webpack_helpers__WEBPACK_IMPORTED_MODULE_0__["definitionForModuleWithContextAndKey"]; });

/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "definitionsFromContext", function() { return _hotwired_stimulus_webpack_helpers__WEBPACK_IMPORTED_MODULE_0__["definitionsFromContext"]; });

/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "identifierForContextKey", function() { return _hotwired_stimulus_webpack_helpers__WEBPACK_IMPORTED_MODULE_0__["identifierForContextKey"]; });



/***/ }),

/***/ "./node_modules/tom-select/dist/js/tom-select.complete.js":
/*!****************************************************************!*\
  !*** ./node_modules/tom-select/dist/js/tom-select.complete.js ***!
  \****************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

function _regeneratorRuntime() { "use strict"; /*! regenerator-runtime -- Copyright (c) 2014-present, Facebook, Inc. -- license (MIT): https://github.com/facebook/regenerator/blob/main/LICENSE */ _regeneratorRuntime = function () { return e; }; var t, e = {}, r = Object.prototype, n = r.hasOwnProperty, o = Object.defineProperty || function (t, e, r) { t[e] = r.value; }, i = "function" == typeof Symbol ? Symbol : {}, a = i.iterator || "@@iterator", c = i.asyncIterator || "@@asyncIterator", u = i.toStringTag || "@@toStringTag"; function define(t, e, r) { return Object.defineProperty(t, e, { value: r, enumerable: !0, configurable: !0, writable: !0 }), t[e]; } try { define({}, ""); } catch (t) { define = function (t, e, r) { return t[e] = r; }; } function wrap(t, e, r, n) { var i = e && e.prototype instanceof Generator ? e : Generator, a = Object.create(i.prototype), c = new Context(n || []); return o(a, "_invoke", { value: makeInvokeMethod(t, r, c) }), a; } function tryCatch(t, e, r) { try { return { type: "normal", arg: t.call(e, r) }; } catch (t) { return { type: "throw", arg: t }; } } e.wrap = wrap; var h = "suspendedStart", l = "suspendedYield", f = "executing", s = "completed", y = {}; function Generator() {} function GeneratorFunction() {} function GeneratorFunctionPrototype() {} var p = {}; define(p, a, function () { return this; }); var d = Object.getPrototypeOf, v = d && d(d(values([]))); v && v !== r && n.call(v, a) && (p = v); var g = GeneratorFunctionPrototype.prototype = Generator.prototype = Object.create(p); function defineIteratorMethods(t) { ["next", "throw", "return"].forEach(function (e) { define(t, e, function (t) { return this._invoke(e, t); }); }); } function AsyncIterator(t, e) { function invoke(r, o, i, a) { var c = tryCatch(t[r], t, o); if ("throw" !== c.type) { var u = c.arg, h = u.value; return h && "object" == typeof h && n.call(h, "__await") ? e.resolve(h.__await).then(function (t) { invoke("next", t, i, a); }, function (t) { invoke("throw", t, i, a); }) : e.resolve(h).then(function (t) { u.value = t, i(u); }, function (t) { return invoke("throw", t, i, a); }); } a(c.arg); } var r; o(this, "_invoke", { value: function (t, n) { function callInvokeWithMethodAndArg() { return new e(function (e, r) { invoke(t, n, e, r); }); } return r = r ? r.then(callInvokeWithMethodAndArg, callInvokeWithMethodAndArg) : callInvokeWithMethodAndArg(); } }); } function makeInvokeMethod(e, r, n) { var o = h; return function (i, a) { if (o === f) throw Error("Generator is already running"); if (o === s) { if ("throw" === i) throw a; return { value: t, done: !0 }; } for (n.method = i, n.arg = a;;) { var c = n.delegate; if (c) { var u = maybeInvokeDelegate(c, n); if (u) { if (u === y) continue; return u; } } if ("next" === n.method) n.sent = n._sent = n.arg;else if ("throw" === n.method) { if (o === h) throw o = s, n.arg; n.dispatchException(n.arg); } else "return" === n.method && n.abrupt("return", n.arg); o = f; var p = tryCatch(e, r, n); if ("normal" === p.type) { if (o = n.done ? s : l, p.arg === y) continue; return { value: p.arg, done: n.done }; } "throw" === p.type && (o = s, n.method = "throw", n.arg = p.arg); } }; } function maybeInvokeDelegate(e, r) { var n = r.method, o = e.iterator[n]; if (o === t) return r.delegate = null, "throw" === n && e.iterator.return && (r.method = "return", r.arg = t, maybeInvokeDelegate(e, r), "throw" === r.method) || "return" !== n && (r.method = "throw", r.arg = new TypeError("The iterator does not provide a '" + n + "' method")), y; var i = tryCatch(o, e.iterator, r.arg); if ("throw" === i.type) return r.method = "throw", r.arg = i.arg, r.delegate = null, y; var a = i.arg; return a ? a.done ? (r[e.resultName] = a.value, r.next = e.nextLoc, "return" !== r.method && (r.method = "next", r.arg = t), r.delegate = null, y) : a : (r.method = "throw", r.arg = new TypeError("iterator result is not an object"), r.delegate = null, y); } function pushTryEntry(t) { var e = { tryLoc: t[0] }; 1 in t && (e.catchLoc = t[1]), 2 in t && (e.finallyLoc = t[2], e.afterLoc = t[3]), this.tryEntries.push(e); } function resetTryEntry(t) { var e = t.completion || {}; e.type = "normal", delete e.arg, t.completion = e; } function Context(t) { this.tryEntries = [{ tryLoc: "root" }], t.forEach(pushTryEntry, this), this.reset(!0); } function values(e) { if (e || "" === e) { var r = e[a]; if (r) return r.call(e); if ("function" == typeof e.next) return e; if (!isNaN(e.length)) { var o = -1, i = function next() { for (; ++o < e.length;) if (n.call(e, o)) return next.value = e[o], next.done = !1, next; return next.value = t, next.done = !0, next; }; return i.next = i; } } throw new TypeError(typeof e + " is not iterable"); } return GeneratorFunction.prototype = GeneratorFunctionPrototype, o(g, "constructor", { value: GeneratorFunctionPrototype, configurable: !0 }), o(GeneratorFunctionPrototype, "constructor", { value: GeneratorFunction, configurable: !0 }), GeneratorFunction.displayName = define(GeneratorFunctionPrototype, u, "GeneratorFunction"), e.isGeneratorFunction = function (t) { var e = "function" == typeof t && t.constructor; return !!e && (e === GeneratorFunction || "GeneratorFunction" === (e.displayName || e.name)); }, e.mark = function (t) { return Object.setPrototypeOf ? Object.setPrototypeOf(t, GeneratorFunctionPrototype) : (t.__proto__ = GeneratorFunctionPrototype, define(t, u, "GeneratorFunction")), t.prototype = Object.create(g), t; }, e.awrap = function (t) { return { __await: t }; }, defineIteratorMethods(AsyncIterator.prototype), define(AsyncIterator.prototype, c, function () { return this; }), e.AsyncIterator = AsyncIterator, e.async = function (t, r, n, o, i) { void 0 === i && (i = Promise); var a = new AsyncIterator(wrap(t, r, n, o), i); return e.isGeneratorFunction(r) ? a : a.next().then(function (t) { return t.done ? t.value : a.next(); }); }, defineIteratorMethods(g), define(g, u, "Generator"), define(g, a, function () { return this; }), define(g, "toString", function () { return "[object Generator]"; }), e.keys = function (t) { var e = Object(t), r = []; for (var n in e) r.push(n); return r.reverse(), function next() { for (; r.length;) { var t = r.pop(); if (t in e) return next.value = t, next.done = !1, next; } return next.done = !0, next; }; }, e.values = values, Context.prototype = { constructor: Context, reset: function (e) { if (this.prev = 0, this.next = 0, this.sent = this._sent = t, this.done = !1, this.delegate = null, this.method = "next", this.arg = t, this.tryEntries.forEach(resetTryEntry), !e) for (var r in this) "t" === r.charAt(0) && n.call(this, r) && !isNaN(+r.slice(1)) && (this[r] = t); }, stop: function () { this.done = !0; var t = this.tryEntries[0].completion; if ("throw" === t.type) throw t.arg; return this.rval; }, dispatchException: function (e) { if (this.done) throw e; var r = this; function handle(n, o) { return a.type = "throw", a.arg = e, r.next = n, o && (r.method = "next", r.arg = t), !!o; } for (var o = this.tryEntries.length - 1; o >= 0; --o) { var i = this.tryEntries[o], a = i.completion; if ("root" === i.tryLoc) return handle("end"); if (i.tryLoc <= this.prev) { var c = n.call(i, "catchLoc"), u = n.call(i, "finallyLoc"); if (c && u) { if (this.prev < i.catchLoc) return handle(i.catchLoc, !0); if (this.prev < i.finallyLoc) return handle(i.finallyLoc); } else if (c) { if (this.prev < i.catchLoc) return handle(i.catchLoc, !0); } else { if (!u) throw Error("try statement without catch or finally"); if (this.prev < i.finallyLoc) return handle(i.finallyLoc); } } } }, abrupt: function (t, e) { for (var r = this.tryEntries.length - 1; r >= 0; --r) { var o = this.tryEntries[r]; if (o.tryLoc <= this.prev && n.call(o, "finallyLoc") && this.prev < o.finallyLoc) { var i = o; break; } } i && ("break" === t || "continue" === t) && i.tryLoc <= e && e <= i.finallyLoc && (i = null); var a = i ? i.completion : {}; return a.type = t, a.arg = e, i ? (this.method = "next", this.next = i.finallyLoc, y) : this.complete(a); }, complete: function (t, e) { if ("throw" === t.type) throw t.arg; return "break" === t.type || "continue" === t.type ? this.next = t.arg : "return" === t.type ? (this.rval = this.arg = t.arg, this.method = "return", this.next = "end") : "normal" === t.type && e && (this.next = e), y; }, finish: function (t) { for (var e = this.tryEntries.length - 1; e >= 0; --e) { var r = this.tryEntries[e]; if (r.finallyLoc === t) return this.complete(r.completion, r.afterLoc), resetTryEntry(r), y; } }, catch: function (t) { for (var e = this.tryEntries.length - 1; e >= 0; --e) { var r = this.tryEntries[e]; if (r.tryLoc === t) { var n = r.completion; if ("throw" === n.type) { var o = n.arg; resetTryEntry(r); } return o; } } throw Error("illegal catch attempt"); }, delegateYield: function (e, r, n) { return this.delegate = { iterator: values(e), resultName: r, nextLoc: n }, "next" === this.method && (this.arg = t), y; } }, e; }
function _slicedToArray(r, e) { return _arrayWithHoles(r) || _iterableToArrayLimit(r, e) || _unsupportedIterableToArray(r, e) || _nonIterableRest(); }
function _nonIterableRest() { throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); }
function _iterableToArrayLimit(r, l) { var t = null == r ? null : "undefined" != typeof Symbol && r[Symbol.iterator] || r["@@iterator"]; if (null != t) { var e, n, i, u, a = [], f = !0, o = !1; try { if (i = (t = t.call(r)).next, 0 === l) { if (Object(t) !== t) return; f = !1; } else for (; !(f = (e = i.call(t)).done) && (a.push(e.value), a.length !== l); f = !0); } catch (r) { o = !0, n = r; } finally { try { if (!f && null != t.return && (u = t.return(), Object(u) !== u)) return; } finally { if (o) throw n; } } return a; } }
function _arrayWithHoles(r) { if (Array.isArray(r)) return r; }
function _createForOfIteratorHelper(r, e) { var t = "undefined" != typeof Symbol && r[Symbol.iterator] || r["@@iterator"]; if (!t) { if (Array.isArray(r) || (t = _unsupportedIterableToArray(r)) || e && r && "number" == typeof r.length) { t && (r = t); var n = 0, F = function () {}; return { s: F, n: function () { return n >= r.length ? { done: !0 } : { done: !1, value: r[n++] }; }, e: function (r) { throw r; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var o, a = !0, u = !1; return { s: function () { t = t.call(r); }, n: function () { var r = t.next(); return a = r.done, r; }, e: function (r) { u = !0, o = r; }, f: function () { try { a || null == t.return || t.return(); } finally { if (u) throw o; } } }; }
function _unsupportedIterableToArray(r, a) { if (r) { if ("string" == typeof r) return _arrayLikeToArray(r, a); var t = {}.toString.call(r).slice(8, -1); return "Object" === t && r.constructor && (t = r.constructor.name), "Map" === t || "Set" === t ? Array.from(r) : "Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t) ? _arrayLikeToArray(r, a) : void 0; } }
function _arrayLikeToArray(r, a) { (null == a || a > r.length) && (a = r.length); for (var e = 0, n = Array(a); e < a; e++) n[e] = r[e]; return n; }
/**
* Tom Select v2.4.3
* Licensed under the Apache License, Version 2.0 (the "License");
*/

(function (global, factory) {
   true ? module.exports = factory() : undefined;
})(this, function () {
  'use strict';

  /**
   * MicroEvent - to make any js object an event emitter
   *
   * - pure javascript - server compatible, browser compatible
   * - dont rely on the browser doms
   * - super simple - you get it immediatly, no mistery, no magic involved
   *
   * @author Jerome Etienne (https://github.com/jeromeetienne)
   */

  /**
   * Execute callback for each event in space separated list of event names
   *
   */
  var _marked = /*#__PURE__*/_regeneratorRuntime().mark(generator);
  function forEvents(events, callback) {
    events.split(/\s+/).forEach(event => {
      callback(event);
    });
  }
  class MicroEvent {
    constructor() {
      this._events = {};
    }
    on(events, fct) {
      forEvents(events, event => {
        const event_array = this._events[event] || [];
        event_array.push(fct);
        this._events[event] = event_array;
      });
    }
    off(events, fct) {
      var n = arguments.length;
      if (n === 0) {
        this._events = {};
        return;
      }
      forEvents(events, event => {
        if (n === 1) {
          delete this._events[event];
          return;
        }
        const event_array = this._events[event];
        if (event_array === undefined) return;
        event_array.splice(event_array.indexOf(fct), 1);
        this._events[event] = event_array;
      });
    }
    trigger(events) {
      for (var _len = arguments.length, args = new Array(_len > 1 ? _len - 1 : 0), _key = 1; _key < _len; _key++) {
        args[_key - 1] = arguments[_key];
      }
      var self = this;
      forEvents(events, event => {
        const event_array = self._events[event];
        if (event_array === undefined) return;
        event_array.forEach(fct => {
          fct.apply(self, args);
        });
      });
    }
  }

  /**
   * microplugin.js
   * Copyright (c) 2013 Brian Reavis & contributors
   *
   * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this
   * file except in compliance with the License. You may obtain a copy of the License at:
   * http://www.apache.org/licenses/LICENSE-2.0
   *
   * Unless required by applicable law or agreed to in writing, software distributed under
   * the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
   * ANY KIND, either express or implied. See the License for the specific language
   * governing permissions and limitations under the License.
   *
   * @author Brian Reavis <brian@thirdroute.com>
   */

  function MicroPlugin(Interface) {
    Interface.plugins = {};
    return class extends Interface {
      constructor() {
        super(...arguments);
        this.plugins = {
          names: [],
          settings: {},
          requested: {},
          loaded: {}
        };
      }
      /**
       * Registers a plugin.
       *
       * @param {function} fn
       */
      static define(name, fn) {
        Interface.plugins[name] = {
          'name': name,
          'fn': fn
        };
      }

      /**
       * Initializes the listed plugins (with options).
       * Acceptable formats:
       *
       * List (without options):
       *   ['a', 'b', 'c']
       *
       * List (with options):
       *   [{'name': 'a', options: {}}, {'name': 'b', options: {}}]
       *
       * Hash (with options):
       *   {'a': { ... }, 'b': { ... }, 'c': { ... }}
       *
       * @param {array|object} plugins
       */
      initializePlugins(plugins) {
        var key, name;
        const self = this;
        const queue = [];
        if (Array.isArray(plugins)) {
          plugins.forEach(plugin => {
            if (typeof plugin === 'string') {
              queue.push(plugin);
            } else {
              self.plugins.settings[plugin.name] = plugin.options;
              queue.push(plugin.name);
            }
          });
        } else if (plugins) {
          for (key in plugins) {
            if (plugins.hasOwnProperty(key)) {
              self.plugins.settings[key] = plugins[key];
              queue.push(key);
            }
          }
        }
        while (name = queue.shift()) {
          self.require(name);
        }
      }
      loadPlugin(name) {
        var self = this;
        var plugins = self.plugins;
        var plugin = Interface.plugins[name];
        if (!Interface.plugins.hasOwnProperty(name)) {
          throw new Error('Unable to find "' + name + '" plugin');
        }
        plugins.requested[name] = true;
        plugins.loaded[name] = plugin.fn.apply(self, [self.plugins.settings[name] || {}]);
        plugins.names.push(name);
      }

      /**
       * Initializes a plugin.
       *
       */
      require(name) {
        var self = this;
        var plugins = self.plugins;
        if (!self.plugins.loaded.hasOwnProperty(name)) {
          if (plugins.requested[name]) {
            throw new Error('Plugin has circular dependency ("' + name + '")');
          }
          self.loadPlugin(name);
        }
        return plugins.loaded[name];
      }
    };
  }

  /**
   * Convert array of strings to a regular expression
   *	ex ['ab','a'] => (?:ab|a)
   * 	ex ['a','b'] => [ab]
   */
  const arrayToPattern = chars => {
    chars = chars.filter(Boolean);
    if (chars.length < 2) {
      return chars[0] || '';
    }
    return maxValueLength(chars) == 1 ? '[' + chars.join('') + ']' : '(?:' + chars.join('|') + ')';
  };
  const sequencePattern = array => {
    if (!hasDuplicates(array)) {
      return array.join('');
    }
    let pattern = '';
    let prev_char_count = 0;
    const prev_pattern = () => {
      if (prev_char_count > 1) {
        pattern += '{' + prev_char_count + '}';
      }
    };
    array.forEach((char, i) => {
      if (char === array[i - 1]) {
        prev_char_count++;
        return;
      }
      prev_pattern();
      pattern += char;
      prev_char_count = 1;
    });
    prev_pattern();
    return pattern;
  };
  /**
   * Convert array of strings to a regular expression
   *	ex ['ab','a'] => (?:ab|a)
   * 	ex ['a','b'] => [ab]
   */
  const setToPattern = chars => {
    let array = Array.from(chars);
    return arrayToPattern(array);
  };
  /**
   * https://stackoverflow.com/questions/7376598/in-javascript-how-do-i-check-if-an-array-has-duplicate-values
   */
  const hasDuplicates = array => {
    return new Set(array).size !== array.length;
  };
  /**
   * https://stackoverflow.com/questions/63006601/why-does-u-throw-an-invalid-escape-error
   */
  const escape_regex = str => {
    return (str + '').replace(/([\$\(\)\*\+\.\?\[\]\^\{\|\}\\])/gu, '\\$1');
  };
  /**
   * Return the max length of array values
   */
  const maxValueLength = array => {
    return array.reduce((longest, value) => Math.max(longest, unicodeLength(value)), 0);
  };
  const unicodeLength = str => {
    return Array.from(str).length;
  };

  /**
   * Get all possible combinations of substrings that add up to the given string
   * https://stackoverflow.com/questions/30169587/find-all-the-combination-of-substrings-that-add-up-to-the-given-string
   */
  const allSubstrings = input => {
    if (input.length === 1) return [[input]];
    let result = [];
    const start = input.substring(1);
    const suba = allSubstrings(start);
    suba.forEach(function (subresult) {
      let tmp = subresult.slice(0);
      tmp[0] = input.charAt(0) + tmp[0];
      result.push(tmp);
      tmp = subresult.slice(0);
      tmp.unshift(input.charAt(0));
      result.push(tmp);
    });
    return result;
  };
  const code_points = [[0, 65535]];
  const accent_pat = '[\u0300-\u036F\u{b7}\u{2be}\u{2bc}]';
  let unicode_map;
  let multi_char_reg;
  const max_char_length = 3;
  const latin_convert = {};
  const latin_condensed = {
    '/': '⁄∕',
    '0': '߀',
    "a": "ⱥɐɑ",
    "aa": "ꜳ",
    "ae": "æǽǣ",
    "ao": "ꜵ",
    "au": "ꜷ",
    "av": "ꜹꜻ",
    "ay": "ꜽ",
    "b": "ƀɓƃ",
    "c": "ꜿƈȼↄ",
    "d": "đɗɖᴅƌꮷԁɦ",
    "e": "ɛǝᴇɇ",
    "f": "ꝼƒ",
    "g": "ǥɠꞡᵹꝿɢ",
    "h": "ħⱨⱶɥ",
    "i": "ɨı",
    "j": "ɉȷ",
    "k": "ƙⱪꝁꝃꝅꞣ",
    "l": "łƚɫⱡꝉꝇꞁɭ",
    "m": "ɱɯϻ",
    "n": "ꞥƞɲꞑᴎлԉ",
    "o": "øǿɔɵꝋꝍᴑ",
    "oe": "œ",
    "oi": "ƣ",
    "oo": "ꝏ",
    "ou": "ȣ",
    "p": "ƥᵽꝑꝓꝕρ",
    "q": "ꝗꝙɋ",
    "r": "ɍɽꝛꞧꞃ",
    "s": "ßȿꞩꞅʂ",
    "t": "ŧƭʈⱦꞇ",
    "th": "þ",
    "tz": "ꜩ",
    "u": "ʉ",
    "v": "ʋꝟʌ",
    "vy": "ꝡ",
    "w": "ⱳ",
    "y": "ƴɏỿ",
    "z": "ƶȥɀⱬꝣ",
    "hv": "ƕ"
  };
  for (let latin in latin_condensed) {
    let unicode = latin_condensed[latin] || '';
    for (let i = 0; i < unicode.length; i++) {
      let char = unicode.substring(i, i + 1);
      latin_convert[char] = latin;
    }
  }
  const convert_pat = new RegExp(Object.keys(latin_convert).join('|') + '|' + accent_pat, 'gu');
  /**
   * Initialize the unicode_map from the give code point ranges
   */
  const initialize = _code_points => {
    if (unicode_map !== undefined) return;
    unicode_map = generateMap(code_points);
  };
  /**
   * Helper method for normalize a string
   * https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/normalize
   */
  const normalize = function (str) {
    let form = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : 'NFKD';
    return str.normalize(form);
  };
  /**
   * Remove accents without reordering string
   * calling str.normalize('NFKD') on \u{594}\u{595}\u{596} becomes \u{596}\u{594}\u{595}
   * via https://github.com/krisk/Fuse/issues/133#issuecomment-318692703
   */
  const asciifold = str => {
    return Array.from(str).reduce(
    /**
     * @param {string} result
     * @param {string} char
     */
    (result, char) => {
      return result + _asciifold(char);
    }, '');
  };
  const _asciifold = str => {
    str = normalize(str).toLowerCase().replace(convert_pat, (/** @type {string} */char) => {
      return latin_convert[char] || '';
    });
    //return str;
    return normalize(str, 'NFC');
  };
  /**
   * Generate a list of unicode variants from the list of code points
   */
  function generator(code_points) {
    var _iterator, _step, _step$value, code_point_min, code_point_max, i, composed, folded;
    return _regeneratorRuntime().wrap(function generator$(_context) {
      while (1) switch (_context.prev = _context.next) {
        case 0:
          _iterator = _createForOfIteratorHelper(code_points);
          _context.prev = 1;
          _iterator.s();
        case 3:
          if ((_step = _iterator.n()).done) {
            _context.next = 22;
            break;
          }
          _step$value = _slicedToArray(_step.value, 2), code_point_min = _step$value[0], code_point_max = _step$value[1];
          i = code_point_min;
        case 6:
          if (!(i <= code_point_max)) {
            _context.next = 20;
            break;
          }
          composed = String.fromCharCode(i);
          folded = asciifold(composed);
          if (!(folded == composed.toLowerCase())) {
            _context.next = 11;
            break;
          }
          return _context.abrupt("continue", 17);
        case 11:
          if (!(folded.length > max_char_length)) {
            _context.next = 13;
            break;
          }
          return _context.abrupt("continue", 17);
        case 13:
          if (!(folded.length == 0)) {
            _context.next = 15;
            break;
          }
          return _context.abrupt("continue", 17);
        case 15:
          _context.next = 17;
          return {
            folded: folded,
            composed: composed,
            code_point: i
          };
        case 17:
          i++;
          _context.next = 6;
          break;
        case 20:
          _context.next = 3;
          break;
        case 22:
          _context.next = 27;
          break;
        case 24:
          _context.prev = 24;
          _context.t0 = _context["catch"](1);
          _iterator.e(_context.t0);
        case 27:
          _context.prev = 27;
          _iterator.f();
          return _context.finish(27);
        case 30:
        case "end":
          return _context.stop();
      }
    }, _marked, null, [[1, 24, 27, 30]]);
  }
  /**
   * Generate a unicode map from the list of code points
   */
  const generateSets = code_points => {
    const unicode_sets = {};
    const addMatching = (folded, to_add) => {
      /** @type {Set<string>} */
      const folded_set = unicode_sets[folded] || new Set();
      const patt = new RegExp('^' + setToPattern(folded_set) + '$', 'iu');
      if (to_add.match(patt)) {
        return;
      }
      folded_set.add(escape_regex(to_add));
      unicode_sets[folded] = folded_set;
    };
    var _iterator2 = _createForOfIteratorHelper(generator(code_points)),
      _step2;
    try {
      for (_iterator2.s(); !(_step2 = _iterator2.n()).done;) {
        let value = _step2.value;
        addMatching(value.folded, value.folded);
        addMatching(value.folded, value.composed);
      }
    } catch (err) {
      _iterator2.e(err);
    } finally {
      _iterator2.f();
    }
    return unicode_sets;
  };
  /**
   * Generate a unicode map from the list of code points
   * ae => (?:(?:ae|Æ|Ǽ|Ǣ)|(?:A|Ⓐ|Ａ...)(?:E|ɛ|Ⓔ...))
   */
  const generateMap = code_points => {
    const unicode_sets = generateSets(code_points);
    const unicode_map = {};
    let multi_char = [];
    for (let folded in unicode_sets) {
      let set = unicode_sets[folded];
      if (set) {
        unicode_map[folded] = setToPattern(set);
      }
      if (folded.length > 1) {
        multi_char.push(escape_regex(folded));
      }
    }
    multi_char.sort((a, b) => b.length - a.length);
    const multi_char_patt = arrayToPattern(multi_char);
    multi_char_reg = new RegExp('^' + multi_char_patt, 'u');
    return unicode_map;
  };
  /**
   * Map each element of an array from its folded value to all possible unicode matches
   */
  const mapSequence = function (strings) {
    let min_replacement = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : 1;
    let chars_replaced = 0;
    strings = strings.map(str => {
      if (unicode_map[str]) {
        chars_replaced += str.length;
      }
      return unicode_map[str] || str;
    });
    if (chars_replaced >= min_replacement) {
      return sequencePattern(strings);
    }
    return '';
  };
  /**
   * Convert a short string and split it into all possible patterns
   * Keep a pattern only if min_replacement is met
   *
   * 'abc'
   * 		=> [['abc'],['ab','c'],['a','bc'],['a','b','c']]
   *		=> ['abc-pattern','ab-c-pattern'...]
   */
  const substringsToPattern = function (str) {
    let min_replacement = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : 1;
    min_replacement = Math.max(min_replacement, str.length - 1);
    return arrayToPattern(allSubstrings(str).map(sub_pat => {
      return mapSequence(sub_pat, min_replacement);
    }));
  };
  /**
   * Convert an array of sequences into a pattern
   * [{start:0,end:3,length:3,substr:'iii'}...] => (?:iii...)
   */
  const sequencesToPattern = function (sequences) {
    let all = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : true;
    let min_replacement = sequences.length > 1 ? 1 : 0;
    return arrayToPattern(sequences.map(sequence => {
      let seq = [];
      const len = all ? sequence.length() : sequence.length() - 1;
      for (let j = 0; j < len; j++) {
        seq.push(substringsToPattern(sequence.substrs[j] || '', min_replacement));
      }
      return sequencePattern(seq);
    }));
  };
  /**
   * Return true if the sequence is already in the sequences
   */
  const inSequences = (needle_seq, sequences) => {
    var _iterator3 = _createForOfIteratorHelper(sequences),
      _step3;
    try {
      for (_iterator3.s(); !(_step3 = _iterator3.n()).done;) {
        const seq = _step3.value;
        if (seq.start != needle_seq.start || seq.end != needle_seq.end) {
          continue;
        }
        if (seq.substrs.join('') !== needle_seq.substrs.join('')) {
          continue;
        }
        let needle_parts = needle_seq.parts;
        const filter = part => {
          var _iterator4 = _createForOfIteratorHelper(needle_parts),
            _step4;
          try {
            for (_iterator4.s(); !(_step4 = _iterator4.n()).done;) {
              const needle_part = _step4.value;
              if (needle_part.start === part.start && needle_part.substr === part.substr) {
                return false;
              }
              if (part.length == 1 || needle_part.length == 1) {
                continue;
              }
              // check for overlapping parts
              // a = ['::=','==']
              // b = ['::','===']
              // a = ['r','sm']
              // b = ['rs','m']
              if (part.start < needle_part.start && part.end > needle_part.start) {
                return true;
              }
              if (needle_part.start < part.start && needle_part.end > part.start) {
                return true;
              }
            }
          } catch (err) {
            _iterator4.e(err);
          } finally {
            _iterator4.f();
          }
          return false;
        };
        let filtered = seq.parts.filter(filter);
        if (filtered.length > 0) {
          continue;
        }
        return true;
      }
    } catch (err) {
      _iterator3.e(err);
    } finally {
      _iterator3.f();
    }
    return false;
  };
  class Sequence {
    constructor() {
      this.parts = void 0;
      this.substrs = void 0;
      this.start = void 0;
      this.end = void 0;
      this.parts = [];
      this.substrs = [];
      this.start = 0;
      this.end = 0;
    }
    add(part) {
      if (part) {
        this.parts.push(part);
        this.substrs.push(part.substr);
        this.start = Math.min(part.start, this.start);
        this.end = Math.max(part.end, this.end);
      }
    }
    last() {
      return this.parts[this.parts.length - 1];
    }
    length() {
      return this.parts.length;
    }
    clone(position, last_piece) {
      let clone = new Sequence();
      let parts = JSON.parse(JSON.stringify(this.parts));
      let last_part = parts.pop();
      var _iterator5 = _createForOfIteratorHelper(parts),
        _step5;
      try {
        for (_iterator5.s(); !(_step5 = _iterator5.n()).done;) {
          const part = _step5.value;
          clone.add(part);
        }
      } catch (err) {
        _iterator5.e(err);
      } finally {
        _iterator5.f();
      }
      let last_substr = last_piece.substr.substring(0, position - last_part.start);
      let clone_last_len = last_substr.length;
      clone.add({
        start: last_part.start,
        end: last_part.start + clone_last_len,
        length: clone_last_len,
        substr: last_substr
      });
      return clone;
    }
  }
  /**
   * Expand a regular expression pattern to include unicode variants
   * 	eg /a/ becomes /aⓐａẚàáâầấẫẩãāăằắẵẳȧǡäǟảåǻǎȁȃạậặḁąⱥɐɑAⒶＡÀÁÂẦẤẪẨÃĀĂẰẮẴẲȦǠÄǞẢÅǺǍȀȂẠẬẶḀĄȺⱯ/
   *
   * Issue:
   *  ﺊﺋ [ 'ﺊ = \\u{fe8a}', 'ﺋ = \\u{fe8b}' ]
   *	becomes:	ئئ [ 'ي = \\u{64a}', 'ٔ = \\u{654}', 'ي = \\u{64a}', 'ٔ = \\u{654}' ]
   *
   *	İĲ = IIJ = ⅡJ
   *
   * 	1/2/4
   */
  const getPattern = str => {
    initialize();
    str = asciifold(str);
    let pattern = '';
    let sequences = [new Sequence()];
    for (let i = 0; i < str.length; i++) {
      let substr = str.substring(i);
      let match = substr.match(multi_char_reg);
      const char = str.substring(i, i + 1);
      const match_str = match ? match[0] : null;
      // loop through sequences
      // add either the char or multi_match
      let overlapping = [];
      let added_types = new Set();
      var _iterator6 = _createForOfIteratorHelper(sequences),
        _step6;
      try {
        for (_iterator6.s(); !(_step6 = _iterator6.n()).done;) {
          const sequence = _step6.value;
          const last_piece = sequence.last();
          if (!last_piece || last_piece.length == 1 || last_piece.end <= i) {
            // if we have a multi match
            if (match_str) {
              const len = match_str.length;
              sequence.add({
                start: i,
                end: i + len,
                length: len,
                substr: match_str
              });
              added_types.add('1');
            } else {
              sequence.add({
                start: i,
                end: i + 1,
                length: 1,
                substr: char
              });
              added_types.add('2');
            }
          } else if (match_str) {
            let clone = sequence.clone(i, last_piece);
            const len = match_str.length;
            clone.add({
              start: i,
              end: i + len,
              length: len,
              substr: match_str
            });
            overlapping.push(clone);
          } else {
            // don't add char
            // adding would create invalid patterns: 234 => [2,34,4]
            added_types.add('3');
          }
        }
        // if we have overlapping
      } catch (err) {
        _iterator6.e(err);
      } finally {
        _iterator6.f();
      }
      if (overlapping.length > 0) {
        // ['ii','iii'] before ['i','i','iii']
        overlapping = overlapping.sort((a, b) => {
          return a.length() - b.length();
        });
        var _iterator7 = _createForOfIteratorHelper(overlapping),
          _step7;
        try {
          for (_iterator7.s(); !(_step7 = _iterator7.n()).done;) {
            let clone = _step7.value;
            // don't add if we already have an equivalent sequence
            if (inSequences(clone, sequences)) {
              continue;
            }
            sequences.push(clone);
          }
        } catch (err) {
          _iterator7.e(err);
        } finally {
          _iterator7.f();
        }
        continue;
      }
      // if we haven't done anything unique
      // clean up the patterns
      // helps keep patterns smaller
      // if str = 'r₨㎧aarss', pattern will be 446 instead of 655
      if (i > 0 && added_types.size == 1 && !added_types.has('3')) {
        pattern += sequencesToPattern(sequences, false);
        let new_seq = new Sequence();
        const old_seq = sequences[0];
        if (old_seq) {
          new_seq.add(old_seq.last());
        }
        sequences = [new_seq];
      }
    }
    pattern += sequencesToPattern(sequences, true);
    return pattern;
  };

  /**
   * A property getter resolving dot-notation
   * @param  {Object}  obj     The root object to fetch property on
   * @param  {String}  name    The optionally dotted property name to fetch
   * @return {Object}          The resolved property value
   */
  const getAttr = (obj, name) => {
    if (!obj) return;
    return obj[name];
  };
  /**
   * A property getter resolving dot-notation
   * @param  {Object}  obj     The root object to fetch property on
   * @param  {String}  name    The optionally dotted property name to fetch
   * @return {Object}          The resolved property value
   */
  const getAttrNesting = (obj, name) => {
    if (!obj) return;
    var part,
      names = name.split(".");
    while ((part = names.shift()) && (obj = obj[part]));
    return obj;
  };
  /**
   * Calculates how close of a match the
   * given value is against a search token.
   *
   */
  const scoreValue = (value, token, weight) => {
    var score, pos;
    if (!value) return 0;
    value = value + '';
    if (token.regex == null) return 0;
    pos = value.search(token.regex);
    if (pos === -1) return 0;
    score = token.string.length / value.length;
    if (pos === 0) score += 0.5;
    return score * weight;
  };
  /**
   * Cast object property to an array if it exists and has a value
   *
   */
  const propToArray = (obj, key) => {
    var value = obj[key];
    if (typeof value == 'function') return value;
    if (value && !Array.isArray(value)) {
      obj[key] = [value];
    }
  };
  /**
   * Iterates over arrays and hashes.
   *
   * ```
   * iterate(this.items, function(item, id) {
   *    // invoked for each item
   * });
   * ```
   *
   */
  const iterate$1 = (object, callback) => {
    if (Array.isArray(object)) {
      object.forEach(callback);
    } else {
      for (var key in object) {
        if (object.hasOwnProperty(key)) {
          callback(object[key], key);
        }
      }
    }
  };
  const cmp = (a, b) => {
    if (typeof a === 'number' && typeof b === 'number') {
      return a > b ? 1 : a < b ? -1 : 0;
    }
    a = asciifold(a + '').toLowerCase();
    b = asciifold(b + '').toLowerCase();
    if (a > b) return 1;
    if (b > a) return -1;
    return 0;
  };

  /**
   * sifter.js
   * Copyright (c) 2013–2020 Brian Reavis & contributors
   *
   * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this
   * file except in compliance with the License. You may obtain a copy of the License at:
   * http://www.apache.org/licenses/LICENSE-2.0
   *
   * Unless required by applicable law or agreed to in writing, software distributed under
   * the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
   * ANY KIND, either express or implied. See the License for the specific language
   * governing permissions and limitations under the License.
   *
   * @author Brian Reavis <brian@thirdroute.com>
   */
  class Sifter {
    /**
     * Textually searches arrays and hashes of objects
     * by property (or multiple properties). Designed
     * specifically for autocomplete.
     *
     */
    constructor(items, settings) {
      this.items = void 0;
      // []|{};
      this.settings = void 0;
      this.items = items;
      this.settings = settings || {
        diacritics: true
      };
    }
    /**
     * Splits a search string into an array of individual
     * regexps to be used to match results.
     *
     */
    tokenize(query, respect_word_boundaries, weights) {
      if (!query || !query.length) return [];
      const tokens = [];
      const words = query.split(/\s+/);
      var field_regex;
      if (weights) {
        field_regex = new RegExp('^(' + Object.keys(weights).map(escape_regex).join('|') + ')\:(.*)$');
      }
      words.forEach(word => {
        let field_match;
        let field = null;
        let regex = null;
        // look for "field:query" tokens
        if (field_regex && (field_match = word.match(field_regex))) {
          field = field_match[1];
          word = field_match[2];
        }
        if (word.length > 0) {
          if (this.settings.diacritics) {
            regex = getPattern(word) || null;
          } else {
            regex = escape_regex(word);
          }
          if (regex && respect_word_boundaries) regex = "\\b" + regex;
        }
        tokens.push({
          string: word,
          regex: regex ? new RegExp(regex, 'iu') : null,
          field: field
        });
      });
      return tokens;
    }
    /**
     * Returns a function to be used to score individual results.
     *
     * Good matches will have a higher score than poor matches.
     * If an item is not a match, 0 will be returned by the function.
     *
     * @returns {T.ScoreFn}
     */
    getScoreFunction(query, options) {
      var search = this.prepareSearch(query, options);
      return this._getScoreFunction(search);
    }
    /**
     * @returns {T.ScoreFn}
     *
     */
    _getScoreFunction(search) {
      const tokens = search.tokens,
        token_count = tokens.length;
      if (!token_count) {
        return function () {
          return 0;
        };
      }
      const fields = search.options.fields,
        weights = search.weights,
        field_count = fields.length,
        getAttrFn = search.getAttrFn;
      if (!field_count) {
        return function () {
          return 1;
        };
      }
      /**
       * Calculates the score of an object
       * against the search query.
       *
       */
      const scoreObject = function () {
        if (field_count === 1) {
          return function (token, data) {
            const field = fields[0].field;
            return scoreValue(getAttrFn(data, field), token, weights[field] || 1);
          };
        }
        return function (token, data) {
          var sum = 0;
          // is the token specific to a field?
          if (token.field) {
            const value = getAttrFn(data, token.field);
            if (!token.regex && value) {
              sum += 1 / field_count;
            } else {
              sum += scoreValue(value, token, 1);
            }
          } else {
            iterate$1(weights, (weight, field) => {
              sum += scoreValue(getAttrFn(data, field), token, weight);
            });
          }
          return sum / field_count;
        };
      }();
      if (token_count === 1) {
        return function (data) {
          return scoreObject(tokens[0], data);
        };
      }
      if (search.options.conjunction === 'and') {
        return function (data) {
          var score,
            sum = 0;
          var _iterator8 = _createForOfIteratorHelper(tokens),
            _step8;
          try {
            for (_iterator8.s(); !(_step8 = _iterator8.n()).done;) {
              let token = _step8.value;
              score = scoreObject(token, data);
              if (score <= 0) return 0;
              sum += score;
            }
          } catch (err) {
            _iterator8.e(err);
          } finally {
            _iterator8.f();
          }
          return sum / token_count;
        };
      } else {
        return function (data) {
          var sum = 0;
          iterate$1(tokens, token => {
            sum += scoreObject(token, data);
          });
          return sum / token_count;
        };
      }
    }
    /**
     * Returns a function that can be used to compare two
     * results, for sorting purposes. If no sorting should
     * be performed, `null` will be returned.
     *
     * @return function(a,b)
     */
    getSortFunction(query, options) {
      var search = this.prepareSearch(query, options);
      return this._getSortFunction(search);
    }
    _getSortFunction(search) {
      var implicit_score,
        sort_flds = [];
      const self = this,
        options = search.options,
        sort = !search.query && options.sort_empty ? options.sort_empty : options.sort;
      if (typeof sort == 'function') {
        return sort.bind(this);
      }
      /**
       * Fetches the specified sort field value
       * from a search result item.
       *
       */
      const get_field = function (name, result) {
        if (name === '$score') return result.score;
        return search.getAttrFn(self.items[result.id], name);
      };
      // parse options
      if (sort) {
        var _iterator9 = _createForOfIteratorHelper(sort),
          _step9;
        try {
          for (_iterator9.s(); !(_step9 = _iterator9.n()).done;) {
            let s = _step9.value;
            if (search.query || s.field !== '$score') {
              sort_flds.push(s);
            }
          }
        } catch (err) {
          _iterator9.e(err);
        } finally {
          _iterator9.f();
        }
      }
      // the "$score" field is implied to be the primary
      // sort field, unless it's manually specified
      if (search.query) {
        implicit_score = true;
        var _iterator10 = _createForOfIteratorHelper(sort_flds),
          _step10;
        try {
          for (_iterator10.s(); !(_step10 = _iterator10.n()).done;) {
            let fld = _step10.value;
            if (fld.field === '$score') {
              implicit_score = false;
              break;
            }
          }
        } catch (err) {
          _iterator10.e(err);
        } finally {
          _iterator10.f();
        }
        if (implicit_score) {
          sort_flds.unshift({
            field: '$score',
            direction: 'desc'
          });
        }
        // without a search.query, all items will have the same score
      } else {
        sort_flds = sort_flds.filter(fld => fld.field !== '$score');
      }
      // build function
      const sort_flds_count = sort_flds.length;
      if (!sort_flds_count) {
        return null;
      }
      return function (a, b) {
        var result, field;
        var _iterator11 = _createForOfIteratorHelper(sort_flds),
          _step11;
        try {
          for (_iterator11.s(); !(_step11 = _iterator11.n()).done;) {
            let sort_fld = _step11.value;
            field = sort_fld.field;
            let multiplier = sort_fld.direction === 'desc' ? -1 : 1;
            result = multiplier * cmp(get_field(field, a), get_field(field, b));
            if (result) return result;
          }
        } catch (err) {
          _iterator11.e(err);
        } finally {
          _iterator11.f();
        }
        return 0;
      };
    }
    /**
     * Parses a search query and returns an object
     * with tokens and fields ready to be populated
     * with results.
     *
     */
    prepareSearch(query, optsUser) {
      const weights = {};
      var options = Object.assign({}, optsUser);
      propToArray(options, 'sort');
      propToArray(options, 'sort_empty');
      // convert fields to new format
      if (options.fields) {
        propToArray(options, 'fields');
        const fields = [];
        options.fields.forEach(field => {
          if (typeof field == 'string') {
            field = {
              field: field,
              weight: 1
            };
          }
          fields.push(field);
          weights[field.field] = 'weight' in field ? field.weight : 1;
        });
        options.fields = fields;
      }
      return {
        options: options,
        query: query.toLowerCase().trim(),
        tokens: this.tokenize(query, options.respect_word_boundaries, weights),
        total: 0,
        items: [],
        weights: weights,
        getAttrFn: options.nesting ? getAttrNesting : getAttr
      };
    }
    /**
     * Searches through all items and returns a sorted array of matches.
     *
     */
    search(query, options) {
      var self = this,
        score,
        search;
      search = this.prepareSearch(query, options);
      options = search.options;
      query = search.query;
      // generate result scoring function
      const fn_score = options.score || self._getScoreFunction(search);
      // perform search and sort
      if (query.length) {
        iterate$1(self.items, (item, id) => {
          score = fn_score(item);
          if (options.filter === false || score > 0) {
            search.items.push({
              'score': score,
              'id': id
            });
          }
        });
      } else {
        iterate$1(self.items, (_, id) => {
          search.items.push({
            'score': 1,
            'id': id
          });
        });
      }
      const fn_sort = self._getSortFunction(search);
      if (fn_sort) search.items.sort(fn_sort);
      // apply limits
      search.total = search.items.length;
      if (typeof options.limit === 'number') {
        search.items = search.items.slice(0, options.limit);
      }
      return search;
    }
  }

  /**
   * Converts a scalar to its best string representation
   * for hash keys and HTML attribute values.
   *
   * Transformations:
   *   'str'     -> 'str'
   *   null      -> ''
   *   undefined -> ''
   *   true      -> '1'
   *   false     -> '0'
   *   0         -> '0'
   *   1         -> '1'
   *
   */
  const hash_key = value => {
    if (typeof value === 'undefined' || value === null) return null;
    return get_hash(value);
  };
  const get_hash = value => {
    if (typeof value === 'boolean') return value ? '1' : '0';
    return value + '';
  };

  /**
   * Escapes a string for use within HTML.
   *
   */
  const escape_html = str => {
    return (str + '').replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
  };

  /**
   * use setTimeout if timeout > 0 
   */
  const timeout = (fn, timeout) => {
    if (timeout > 0) {
      return window.setTimeout(fn, timeout);
    }
    fn.call(null);
    return null;
  };

  /**
   * Debounce the user provided load function
   *
   */
  const loadDebounce = (fn, delay) => {
    var timeout;
    return function (value, callback) {
      var self = this;
      if (timeout) {
        self.loading = Math.max(self.loading - 1, 0);
        clearTimeout(timeout);
      }
      timeout = setTimeout(function () {
        timeout = null;
        self.loadedSearches[value] = true;
        fn.call(self, value, callback);
      }, delay);
    };
  };

  /**
   * Debounce all fired events types listed in `types`
   * while executing the provided `fn`.
   *
   */
  const debounce_events = (self, types, fn) => {
    var type;
    var trigger = self.trigger;
    var event_args = {};

    // override trigger method
    self.trigger = function () {
      var type = arguments[0];
      if (types.indexOf(type) !== -1) {
        event_args[type] = arguments;
      } else {
        return trigger.apply(self, arguments);
      }
    };

    // invoke provided function
    fn.apply(self, []);
    self.trigger = trigger;

    // trigger queued events
    var _iterator12 = _createForOfIteratorHelper(types),
      _step12;
    try {
      for (_iterator12.s(); !(_step12 = _iterator12.n()).done;) {
        type = _step12.value;
        if (type in event_args) {
          trigger.apply(self, event_args[type]);
        }
      }
    } catch (err) {
      _iterator12.e(err);
    } finally {
      _iterator12.f();
    }
  };

  /**
   * Determines the current selection within a text input control.
   * Returns an object containing:
   *   - start
   *   - length
   *
   * Note: "selectionStart, selectionEnd ... apply only to inputs of types text, search, URL, tel and password"
   * 	- https://developer.mozilla.org/en-US/docs/Web/API/HTMLInputElement/setSelectionRange
   */
  const getSelection = input => {
    return {
      start: input.selectionStart || 0,
      length: (input.selectionEnd || 0) - (input.selectionStart || 0)
    };
  };

  /**
   * Prevent default
   *
   */
  const preventDefault = function (evt) {
    let stop = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : false;
    if (evt) {
      evt.preventDefault();
      if (stop) {
        evt.stopPropagation();
      }
    }
  };

  /**
   * Add event helper
   *
   */
  const addEvent = (target, type, callback, options) => {
    target.addEventListener(type, callback, options);
  };

  /**
   * Return true if the requested key is down
   * Will return false if more than one control character is pressed ( when [ctrl+shift+a] != [ctrl+a] )
   * The current evt may not always set ( eg calling advanceSelection() )
   *
   */
  const isKeyDown = (key_name, evt) => {
    if (!evt) {
      return false;
    }
    if (!evt[key_name]) {
      return false;
    }
    var count = (evt.altKey ? 1 : 0) + (evt.ctrlKey ? 1 : 0) + (evt.shiftKey ? 1 : 0) + (evt.metaKey ? 1 : 0);
    if (count === 1) {
      return true;
    }
    return false;
  };

  /**
   * Get the id of an element
   * If the id attribute is not set, set the attribute with the given id
   *
   */
  const getId = (el, id) => {
    const existing_id = el.getAttribute('id');
    if (existing_id) {
      return existing_id;
    }
    el.setAttribute('id', id);
    return id;
  };

  /**
   * Returns a string with backslashes added before characters that need to be escaped.
   */
  const addSlashes = str => {
    return str.replace(/[\\"']/g, '\\$&');
  };

  /**
   *
   */
  const append = (parent, node) => {
    if (node) parent.append(node);
  };

  /**
   * Iterates over arrays and hashes.
   *
   * ```
   * iterate(this.items, function(item, id) {
   *    // invoked for each item
   * });
   * ```
   *
   */
  const iterate = (object, callback) => {
    if (Array.isArray(object)) {
      object.forEach(callback);
    } else {
      for (var key in object) {
        if (object.hasOwnProperty(key)) {
          callback(object[key], key);
        }
      }
    }
  };

  /**
   * Return a dom element from either a dom query string, jQuery object, a dom element or html string
   * https://stackoverflow.com/questions/494143/creating-a-new-dom-element-from-an-html-string-using-built-in-dom-methods-or-pro/35385518#35385518
   *
   * param query should be {}
   */
  const getDom = query => {
    if (query.jquery) {
      return query[0];
    }
    if (query instanceof HTMLElement) {
      return query;
    }
    if (isHtmlString(query)) {
      var tpl = document.createElement('template');
      tpl.innerHTML = query.trim(); // Never return a text node of whitespace as the result
      return tpl.content.firstChild;
    }
    return document.querySelector(query);
  };
  const isHtmlString = arg => {
    if (typeof arg === 'string' && arg.indexOf('<') > -1) {
      return true;
    }
    return false;
  };
  const escapeQuery = query => {
    return query.replace(/['"\\]/g, '\\$&');
  };

  /**
   * Dispatch an event
   *
   */
  const triggerEvent = (dom_el, event_name) => {
    var event = document.createEvent('HTMLEvents');
    event.initEvent(event_name, true, false);
    dom_el.dispatchEvent(event);
  };

  /**
   * Apply CSS rules to a dom element
   *
   */
  const applyCSS = (dom_el, css) => {
    Object.assign(dom_el.style, css);
  };

  /**
   * Add css classes
   *
   */
  const addClasses = function (elmts) {
    for (var _len2 = arguments.length, classes = new Array(_len2 > 1 ? _len2 - 1 : 0), _key2 = 1; _key2 < _len2; _key2++) {
      classes[_key2 - 1] = arguments[_key2];
    }
    var norm_classes = classesArray(classes);
    elmts = castAsArray(elmts);
    elmts.map(el => {
      norm_classes.map(cls => {
        el.classList.add(cls);
      });
    });
  };

  /**
   * Remove css classes
   *
   */
  const removeClasses = function (elmts) {
    for (var _len3 = arguments.length, classes = new Array(_len3 > 1 ? _len3 - 1 : 0), _key3 = 1; _key3 < _len3; _key3++) {
      classes[_key3 - 1] = arguments[_key3];
    }
    var norm_classes = classesArray(classes);
    elmts = castAsArray(elmts);
    elmts.map(el => {
      norm_classes.map(cls => {
        el.classList.remove(cls);
      });
    });
  };

  /**
   * Return arguments
   *
   */
  const classesArray = args => {
    var classes = [];
    iterate(args, _classes => {
      if (typeof _classes === 'string') {
        _classes = _classes.trim().split(/[\t\n\f\r\s]/);
      }
      if (Array.isArray(_classes)) {
        classes = classes.concat(_classes);
      }
    });
    return classes.filter(Boolean);
  };

  /**
   * Create an array from arg if it's not already an array
   *
   */
  const castAsArray = arg => {
    if (!Array.isArray(arg)) {
      arg = [arg];
    }
    return arg;
  };

  /**
   * Get the closest node to the evt.target matching the selector
   * Stops at wrapper
   *
   */
  const parentMatch = (target, selector, wrapper) => {
    if (wrapper && !wrapper.contains(target)) {
      return;
    }
    while (target && target.matches) {
      if (target.matches(selector)) {
        return target;
      }
      target = target.parentNode;
    }
  };

  /**
   * Get the first or last item from an array
   *
   * > 0 - right (last)
   * <= 0 - left (first)
   *
   */
  const getTail = function (list) {
    let direction = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : 0;
    if (direction > 0) {
      return list[list.length - 1];
    }
    return list[0];
  };

  /**
   * Return true if an object is empty
   *
   */
  const isEmptyObject = obj => {
    return Object.keys(obj).length === 0;
  };

  /**
   * Get the index of an element amongst sibling nodes of the same type
   *
   */
  const nodeIndex = (el, amongst) => {
    if (!el) return -1;
    amongst = amongst || el.nodeName;
    var i = 0;
    while (el = el.previousElementSibling) {
      if (el.matches(amongst)) {
        i++;
      }
    }
    return i;
  };

  /**
   * Set attributes of an element
   *
   */
  const setAttr = (el, attrs) => {
    iterate(attrs, (val, attr) => {
      if (val == null) {
        el.removeAttribute(attr);
      } else {
        el.setAttribute(attr, '' + val);
      }
    });
  };

  /**
   * Replace a node
   */
  const replaceNode = (existing, replacement) => {
    if (existing.parentNode) existing.parentNode.replaceChild(replacement, existing);
  };

  /**
   * highlight v3 | MIT license | Johann Burkard <jb@eaio.com>
   * Highlights arbitrary terms in a node.
   *
   * - Modified by Marshal <beatgates@gmail.com> 2011-6-24 (added regex)
   * - Modified by Brian Reavis <brian@thirdroute.com> 2012-8-27 (cleanup)
   */

  const highlight = (element, regex) => {
    if (regex === null) return;

    // convet string to regex
    if (typeof regex === 'string') {
      if (!regex.length) return;
      regex = new RegExp(regex, 'i');
    }

    // Wrap matching part of text node with highlighting <span>, e.g.
    // Soccer  ->  <span class="highlight">Soc</span>cer  for regex = /soc/i
    const highlightText = node => {
      var match = node.data.match(regex);
      if (match && node.data.length > 0) {
        var spannode = document.createElement('span');
        spannode.className = 'highlight';
        var middlebit = node.splitText(match.index);
        middlebit.splitText(match[0].length);
        var middleclone = middlebit.cloneNode(true);
        spannode.appendChild(middleclone);
        replaceNode(middlebit, spannode);
        return 1;
      }
      return 0;
    };

    // Recurse element node, looking for child text nodes to highlight, unless element
    // is childless, <script>, <style>, or already highlighted: <span class="hightlight">
    const highlightChildren = node => {
      if (node.nodeType === 1 && node.childNodes && !/(script|style)/i.test(node.tagName) && (node.className !== 'highlight' || node.tagName !== 'SPAN')) {
        Array.from(node.childNodes).forEach(element => {
          highlightRecursive(element);
        });
      }
    };
    const highlightRecursive = node => {
      if (node.nodeType === 3) {
        return highlightText(node);
      }
      highlightChildren(node);
      return 0;
    };
    highlightRecursive(element);
  };

  /**
   * removeHighlight fn copied from highlight v5 and
   * edited to remove with(), pass js strict mode, and use without jquery
   */
  const removeHighlight = el => {
    var elements = el.querySelectorAll("span.highlight");
    Array.prototype.forEach.call(elements, function (el) {
      var parent = el.parentNode;
      parent.replaceChild(el.firstChild, el);
      parent.normalize();
    });
  };
  const KEY_A = 65;
  const KEY_RETURN = 13;
  const KEY_ESC = 27;
  const KEY_LEFT = 37;
  const KEY_UP = 38;
  const KEY_RIGHT = 39;
  const KEY_DOWN = 40;
  const KEY_BACKSPACE = 8;
  const KEY_DELETE = 46;
  const KEY_TAB = 9;
  const IS_MAC = typeof navigator === 'undefined' ? false : /Mac/.test(navigator.userAgent);
  const KEY_SHORTCUT = IS_MAC ? 'metaKey' : 'ctrlKey'; // ctrl key or apple key for ma

  var defaults = {
    options: [],
    optgroups: [],
    plugins: [],
    delimiter: ',',
    splitOn: null,
    // regexp or string for splitting up values from a paste command
    persist: true,
    diacritics: true,
    create: null,
    createOnBlur: false,
    createFilter: null,
    highlight: true,
    openOnFocus: true,
    shouldOpen: null,
    maxOptions: 50,
    maxItems: null,
    hideSelected: null,
    duplicates: false,
    addPrecedence: false,
    selectOnTab: false,
    preload: null,
    allowEmptyOption: false,
    //closeAfterSelect: false,
    refreshThrottle: 300,
    loadThrottle: 300,
    loadingClass: 'loading',
    dataAttr: null,
    //'data-data',
    optgroupField: 'optgroup',
    valueField: 'value',
    labelField: 'text',
    disabledField: 'disabled',
    optgroupLabelField: 'label',
    optgroupValueField: 'value',
    lockOptgroupOrder: false,
    sortField: '$order',
    searchField: ['text'],
    searchConjunction: 'and',
    mode: null,
    wrapperClass: 'ts-wrapper',
    controlClass: 'ts-control',
    dropdownClass: 'ts-dropdown',
    dropdownContentClass: 'ts-dropdown-content',
    itemClass: 'item',
    optionClass: 'option',
    dropdownParent: null,
    controlInput: '<input type="text" autocomplete="off" size="1" />',
    copyClassesToDropdown: false,
    placeholder: null,
    hidePlaceholder: null,
    shouldLoad: function (query) {
      return query.length > 0;
    },
    /*
    load                 : null, // function(query, callback) { ... }
    score                : null, // function(search) { ... }
    onInitialize         : null, // function() { ... }
    onChange             : null, // function(value) { ... }
    onItemAdd            : null, // function(value, $item) { ... }
    onItemRemove         : null, // function(value) { ... }
    onClear              : null, // function() { ... }
    onOptionAdd          : null, // function(value, data) { ... }
    onOptionRemove       : null, // function(value) { ... }
    onOptionClear        : null, // function() { ... }
    onOptionGroupAdd     : null, // function(id, data) { ... }
    onOptionGroupRemove  : null, // function(id) { ... }
    onOptionGroupClear   : null, // function() { ... }
    onDropdownOpen       : null, // function(dropdown) { ... }
    onDropdownClose      : null, // function(dropdown) { ... }
    onType               : null, // function(str) { ... }
    onDelete             : null, // function(values) { ... }
    */

    render: {
      /*
      item: null,
      optgroup: null,
      optgroup_header: null,
      option: null,
      option_create: null
      */
    }
  };
  function getSettings(input, settings_user) {
    var settings = Object.assign({}, defaults, settings_user);
    var attr_data = settings.dataAttr;
    var field_label = settings.labelField;
    var field_value = settings.valueField;
    var field_disabled = settings.disabledField;
    var field_optgroup = settings.optgroupField;
    var field_optgroup_label = settings.optgroupLabelField;
    var field_optgroup_value = settings.optgroupValueField;
    var tag_name = input.tagName.toLowerCase();
    var placeholder = input.getAttribute('placeholder') || input.getAttribute('data-placeholder');
    if (!placeholder && !settings.allowEmptyOption) {
      let option = input.querySelector('option[value=""]');
      if (option) {
        placeholder = option.textContent;
      }
    }
    var settings_element = {
      placeholder: placeholder,
      options: [],
      optgroups: [],
      items: [],
      maxItems: null
    };

    /**
     * Initialize from a <select> element.
     *
     */
    var init_select = () => {
      var tagName;
      var options = settings_element.options;
      var optionsMap = {};
      var group_count = 1;
      let $order = 0;
      var readData = el => {
        var data = Object.assign({}, el.dataset); // get plain object from DOMStringMap
        var json = attr_data && data[attr_data];
        if (typeof json === 'string' && json.length) {
          data = Object.assign(data, JSON.parse(json));
        }
        return data;
      };
      var addOption = (option, group) => {
        var value = hash_key(option.value);
        if (value == null) return;
        if (!value && !settings.allowEmptyOption) return;

        // if the option already exists, it's probably been
        // duplicated in another optgroup. in this case, push
        // the current group to the "optgroup" property on the
        // existing option so that it's rendered in both places.
        if (optionsMap.hasOwnProperty(value)) {
          if (group) {
            var arr = optionsMap[value][field_optgroup];
            if (!arr) {
              optionsMap[value][field_optgroup] = group;
            } else if (!Array.isArray(arr)) {
              optionsMap[value][field_optgroup] = [arr, group];
            } else {
              arr.push(group);
            }
          }
        } else {
          var option_data = readData(option);
          option_data[field_label] = option_data[field_label] || option.textContent;
          option_data[field_value] = option_data[field_value] || value;
          option_data[field_disabled] = option_data[field_disabled] || option.disabled;
          option_data[field_optgroup] = option_data[field_optgroup] || group;
          option_data.$option = option;
          option_data.$order = option_data.$order || ++$order;
          optionsMap[value] = option_data;
          options.push(option_data);
        }
        if (option.selected) {
          settings_element.items.push(value);
        }
      };
      var addGroup = optgroup => {
        var id, optgroup_data;
        optgroup_data = readData(optgroup);
        optgroup_data[field_optgroup_label] = optgroup_data[field_optgroup_label] || optgroup.getAttribute('label') || '';
        optgroup_data[field_optgroup_value] = optgroup_data[field_optgroup_value] || group_count++;
        optgroup_data[field_disabled] = optgroup_data[field_disabled] || optgroup.disabled;
        optgroup_data.$order = optgroup_data.$order || ++$order;
        settings_element.optgroups.push(optgroup_data);
        id = optgroup_data[field_optgroup_value];
        iterate(optgroup.children, option => {
          addOption(option, id);
        });
      };
      settings_element.maxItems = input.hasAttribute('multiple') ? null : 1;
      iterate(input.children, child => {
        tagName = child.tagName.toLowerCase();
        if (tagName === 'optgroup') {
          addGroup(child);
        } else if (tagName === 'option') {
          addOption(child);
        }
      });
    };

    /**
     * Initialize from a <input type="text"> element.
     *
     */
    var init_textbox = () => {
      const data_raw = input.getAttribute(attr_data);
      if (!data_raw) {
        var value = input.value.trim() || '';
        if (!settings.allowEmptyOption && !value.length) return;
        const values = value.split(settings.delimiter);
        iterate(values, value => {
          const option = {};
          option[field_label] = value;
          option[field_value] = value;
          settings_element.options.push(option);
        });
        settings_element.items = values;
      } else {
        settings_element.options = JSON.parse(data_raw);
        iterate(settings_element.options, opt => {
          settings_element.items.push(opt[field_value]);
        });
      }
    };
    if (tag_name === 'select') {
      init_select();
    } else {
      init_textbox();
    }
    return Object.assign({}, defaults, settings_element, settings_user);
  }
  var instance_i = 0;
  class TomSelect extends MicroPlugin(MicroEvent) {
    constructor(input_arg, user_settings) {
      super();
      this.order = 0;
      this.isOpen = false;
      this.isDisabled = false;
      this.isReadOnly = false;
      this.isInvalid = false;
      // @deprecated 1.8
      this.isValid = true;
      this.isLocked = false;
      this.isFocused = false;
      this.isInputHidden = false;
      this.isSetup = false;
      this.ignoreFocus = false;
      this.ignoreHover = false;
      this.hasOptions = false;
      this.lastValue = '';
      this.caretPos = 0;
      this.loading = 0;
      this.loadedSearches = {};
      this.activeOption = null;
      this.activeItems = [];
      this.optgroups = {};
      this.options = {};
      this.userOptions = {};
      this.items = [];
      this.refreshTimeout = null;
      instance_i++;
      var dir;
      var input = getDom(input_arg);
      if (input.tomselect) {
        throw new Error('Tom Select already initialized on this element');
      }
      input.tomselect = this;

      // detect rtl environment
      var computedStyle = window.getComputedStyle && window.getComputedStyle(input, null);
      dir = computedStyle.getPropertyValue('direction');

      // setup default state
      const settings = getSettings(input, user_settings);
      this.settings = settings;
      this.input = input;
      this.tabIndex = input.tabIndex || 0;
      this.is_select_tag = input.tagName.toLowerCase() === 'select';
      this.rtl = /rtl/i.test(dir);
      this.inputId = getId(input, 'tomselect-' + instance_i);
      this.isRequired = input.required;

      // search system
      this.sifter = new Sifter(this.options, {
        diacritics: settings.diacritics
      });

      // option-dependent defaults
      settings.mode = settings.mode || (settings.maxItems === 1 ? 'single' : 'multi');
      if (typeof settings.hideSelected !== 'boolean') {
        settings.hideSelected = settings.mode === 'multi';
      }
      if (typeof settings.hidePlaceholder !== 'boolean') {
        settings.hidePlaceholder = settings.mode !== 'multi';
      }

      // set up createFilter callback
      var filter = settings.createFilter;
      if (typeof filter !== 'function') {
        if (typeof filter === 'string') {
          filter = new RegExp(filter);
        }
        if (filter instanceof RegExp) {
          settings.createFilter = input => filter.test(input);
        } else {
          settings.createFilter = value => {
            return this.settings.duplicates || !this.options[value];
          };
        }
      }
      this.initializePlugins(settings.plugins);
      this.setupCallbacks();
      this.setupTemplates();

      // Create all elements
      const wrapper = getDom('<div>');
      const control = getDom('<div>');
      const dropdown = this._render('dropdown');
      const dropdown_content = getDom(`<div role="listbox" tabindex="-1">`);
      const classes = this.input.getAttribute('class') || '';
      const inputMode = settings.mode;
      var control_input;
      addClasses(wrapper, settings.wrapperClass, classes, inputMode);
      addClasses(control, settings.controlClass);
      append(wrapper, control);
      addClasses(dropdown, settings.dropdownClass, inputMode);
      if (settings.copyClassesToDropdown) {
        addClasses(dropdown, classes);
      }
      addClasses(dropdown_content, settings.dropdownContentClass);
      append(dropdown, dropdown_content);
      getDom(settings.dropdownParent || wrapper).appendChild(dropdown);

      // default controlInput
      if (isHtmlString(settings.controlInput)) {
        control_input = getDom(settings.controlInput);

        // set attributes
        var attrs = ['autocorrect', 'autocapitalize', 'autocomplete', 'spellcheck'];
        iterate(attrs, attr => {
          if (input.getAttribute(attr)) {
            setAttr(control_input, {
              [attr]: input.getAttribute(attr)
            });
          }
        });
        control_input.tabIndex = -1;
        control.appendChild(control_input);
        this.focus_node = control_input;

        // dom element
      } else if (settings.controlInput) {
        control_input = getDom(settings.controlInput);
        this.focus_node = control_input;
      } else {
        control_input = getDom('<input/>');
        this.focus_node = control;
      }
      this.wrapper = wrapper;
      this.dropdown = dropdown;
      this.dropdown_content = dropdown_content;
      this.control = control;
      this.control_input = control_input;
      this.setup();
    }

    /**
     * set up event bindings.
     *
     */
    setup() {
      const self = this;
      const settings = self.settings;
      const control_input = self.control_input;
      const dropdown = self.dropdown;
      const dropdown_content = self.dropdown_content;
      const wrapper = self.wrapper;
      const control = self.control;
      const input = self.input;
      const focus_node = self.focus_node;
      const passive_event = {
        passive: true
      };
      const listboxId = self.inputId + '-ts-dropdown';
      setAttr(dropdown_content, {
        id: listboxId
      });
      setAttr(focus_node, {
        role: 'combobox',
        'aria-haspopup': 'listbox',
        'aria-expanded': 'false',
        'aria-controls': listboxId
      });
      const control_id = getId(focus_node, self.inputId + '-ts-control');
      const query = "label[for='" + escapeQuery(self.inputId) + "']";
      const label = document.querySelector(query);
      const label_click = self.focus.bind(self);
      if (label) {
        addEvent(label, 'click', label_click);
        setAttr(label, {
          for: control_id
        });
        const label_id = getId(label, self.inputId + '-ts-label');
        setAttr(focus_node, {
          'aria-labelledby': label_id
        });
        setAttr(dropdown_content, {
          'aria-labelledby': label_id
        });
      }
      wrapper.style.width = input.style.width;
      if (self.plugins.names.length) {
        const classes_plugins = 'plugin-' + self.plugins.names.join(' plugin-');
        addClasses([wrapper, dropdown], classes_plugins);
      }
      if ((settings.maxItems === null || settings.maxItems > 1) && self.is_select_tag) {
        setAttr(input, {
          multiple: 'multiple'
        });
      }
      if (settings.placeholder) {
        setAttr(control_input, {
          placeholder: settings.placeholder
        });
      }

      // if splitOn was not passed in, construct it from the delimiter to allow pasting universally
      if (!settings.splitOn && settings.delimiter) {
        settings.splitOn = new RegExp('\\s*' + escape_regex(settings.delimiter) + '+\\s*');
      }

      // debounce user defined load() if loadThrottle > 0
      // after initializePlugins() so plugins can create/modify user defined loaders
      if (settings.load && settings.loadThrottle) {
        settings.load = loadDebounce(settings.load, settings.loadThrottle);
      }
      addEvent(dropdown, 'mousemove', () => {
        self.ignoreHover = false;
      });
      addEvent(dropdown, 'mouseenter', e => {
        var target_match = parentMatch(e.target, '[data-selectable]', dropdown);
        if (target_match) self.onOptionHover(e, target_match);
      }, {
        capture: true
      });

      // clicking on an option should select it
      addEvent(dropdown, 'click', evt => {
        const option = parentMatch(evt.target, '[data-selectable]');
        if (option) {
          self.onOptionSelect(evt, option);
          preventDefault(evt, true);
        }
      });
      addEvent(control, 'click', evt => {
        var target_match = parentMatch(evt.target, '[data-ts-item]', control);
        if (target_match && self.onItemSelect(evt, target_match)) {
          preventDefault(evt, true);
          return;
        }

        // retain focus (see control_input mousedown)
        if (control_input.value != '') {
          return;
        }
        self.onClick();
        preventDefault(evt, true);
      });

      // keydown on focus_node for arrow_down/arrow_up
      addEvent(focus_node, 'keydown', e => self.onKeyDown(e));

      // keypress and input/keyup
      addEvent(control_input, 'keypress', e => self.onKeyPress(e));
      addEvent(control_input, 'input', e => self.onInput(e));
      addEvent(focus_node, 'blur', e => self.onBlur(e));
      addEvent(focus_node, 'focus', e => self.onFocus(e));
      addEvent(control_input, 'paste', e => self.onPaste(e));
      const doc_mousedown = evt => {
        // blur if target is outside of this instance
        // dropdown is not always inside wrapper
        const target = evt.composedPath()[0];
        if (!wrapper.contains(target) && !dropdown.contains(target)) {
          if (self.isFocused) {
            self.blur();
          }
          self.inputState();
          return;
        }

        // retain focus by preventing native handling. if the
        // event target is the input it should not be modified.
        // otherwise, text selection within the input won't work.
        // Fixes bug #212 which is no covered by tests
        if (target == control_input && self.isOpen) {
          evt.stopPropagation();

          // clicking anywhere in the control should not blur the control_input (which would close the dropdown)
        } else {
          preventDefault(evt, true);
        }
      };
      const win_scroll = () => {
        if (self.isOpen) {
          self.positionDropdown();
        }
      };
      addEvent(document, 'mousedown', doc_mousedown);
      addEvent(window, 'scroll', win_scroll, passive_event);
      addEvent(window, 'resize', win_scroll, passive_event);
      this._destroy = () => {
        document.removeEventListener('mousedown', doc_mousedown);
        window.removeEventListener('scroll', win_scroll);
        window.removeEventListener('resize', win_scroll);
        if (label) label.removeEventListener('click', label_click);
      };

      // store original html and tab index so that they can be
      // restored when the destroy() method is called.
      this.revertSettings = {
        innerHTML: input.innerHTML,
        tabIndex: input.tabIndex
      };
      input.tabIndex = -1;
      input.insertAdjacentElement('afterend', self.wrapper);
      self.sync(false);
      settings.items = [];
      delete settings.optgroups;
      delete settings.options;
      addEvent(input, 'invalid', () => {
        if (self.isValid) {
          self.isValid = false;
          self.isInvalid = true;
          self.refreshState();
        }
      });
      self.updateOriginalInput();
      self.refreshItems();
      self.close(false);
      self.inputState();
      self.isSetup = true;
      if (input.disabled) {
        self.disable();
      } else if (input.readOnly) {
        self.setReadOnly(true);
      } else {
        self.enable(); //sets tabIndex
      }
      self.on('change', this.onChange);
      addClasses(input, 'tomselected', 'ts-hidden-accessible');
      self.trigger('initialize');

      // preload options
      if (settings.preload === true) {
        self.preload();
      }
    }

    /**
     * Register options and optgroups
     *
     */
    setupOptions() {
      let options = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : [];
      let optgroups = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : [];
      // build options table
      this.addOptions(options);

      // build optgroup table
      iterate(optgroups, optgroup => {
        this.registerOptionGroup(optgroup);
      });
    }

    /**
     * Sets up default rendering functions.
     */
    setupTemplates() {
      var self = this;
      var field_label = self.settings.labelField;
      var field_optgroup = self.settings.optgroupLabelField;
      var templates = {
        'optgroup': data => {
          let optgroup = document.createElement('div');
          optgroup.className = 'optgroup';
          optgroup.appendChild(data.options);
          return optgroup;
        },
        'optgroup_header': (data, escape) => {
          return '<div class="optgroup-header">' + escape(data[field_optgroup]) + '</div>';
        },
        'option': (data, escape) => {
          return '<div>' + escape(data[field_label]) + '</div>';
        },
        'item': (data, escape) => {
          return '<div>' + escape(data[field_label]) + '</div>';
        },
        'option_create': (data, escape) => {
          return '<div class="create">Add <strong>' + escape(data.input) + '</strong>&hellip;</div>';
        },
        'no_results': () => {
          return '<div class="no-results">No results found</div>';
        },
        'loading': () => {
          return '<div class="spinner"></div>';
        },
        'not_loading': () => {},
        'dropdown': () => {
          return '<div></div>';
        }
      };
      self.settings.render = Object.assign({}, templates, self.settings.render);
    }

    /**
     * Maps fired events to callbacks provided
     * in the settings used when creating the control.
     */
    setupCallbacks() {
      var key, fn;
      var callbacks = {
        'initialize': 'onInitialize',
        'change': 'onChange',
        'item_add': 'onItemAdd',
        'item_remove': 'onItemRemove',
        'item_select': 'onItemSelect',
        'clear': 'onClear',
        'option_add': 'onOptionAdd',
        'option_remove': 'onOptionRemove',
        'option_clear': 'onOptionClear',
        'optgroup_add': 'onOptionGroupAdd',
        'optgroup_remove': 'onOptionGroupRemove',
        'optgroup_clear': 'onOptionGroupClear',
        'dropdown_open': 'onDropdownOpen',
        'dropdown_close': 'onDropdownClose',
        'type': 'onType',
        'load': 'onLoad',
        'focus': 'onFocus',
        'blur': 'onBlur'
      };
      for (key in callbacks) {
        fn = this.settings[callbacks[key]];
        if (fn) this.on(key, fn);
      }
    }

    /**
     * Sync the Tom Select instance with the original input or select
     *
     */
    sync() {
      let get_settings = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : true;
      const self = this;
      const settings = get_settings ? getSettings(self.input, {
        delimiter: self.settings.delimiter
      }) : self.settings;
      self.setupOptions(settings.options, settings.optgroups);
      self.setValue(settings.items || [], true); // silent prevents recursion

      self.lastQuery = null; // so updated options will be displayed in dropdown
    }

    /**
     * Triggered when the main control element
     * has a click event.
     *
     */
    onClick() {
      var self = this;
      if (self.activeItems.length > 0) {
        self.clearActiveItems();
        self.focus();
        return;
      }
      if (self.isFocused && self.isOpen) {
        self.blur();
      } else {
        self.focus();
      }
    }

    /**
     * @deprecated v1.7
     *
     */
    onMouseDown() {}

    /**
     * Triggered when the value of the control has been changed.
     * This should propagate the event to the original DOM
     * input / select element.
     */
    onChange() {
      triggerEvent(this.input, 'input');
      triggerEvent(this.input, 'change');
    }

    /**
     * Triggered on <input> paste.
     *
     */
    onPaste(e) {
      var self = this;
      if (self.isInputHidden || self.isLocked) {
        preventDefault(e);
        return;
      }

      // If a regex or string is included, this will split the pasted
      // input and create Items for each separate value
      if (!self.settings.splitOn) {
        return;
      }

      // Wait for pasted text to be recognized in value
      setTimeout(() => {
        var pastedText = self.inputValue();
        if (!pastedText.match(self.settings.splitOn)) {
          return;
        }
        var splitInput = pastedText.trim().split(self.settings.splitOn);
        iterate(splitInput, piece => {
          const hash = hash_key(piece);
          if (hash) {
            if (this.options[piece]) {
              self.addItem(piece);
            } else {
              self.createItem(piece);
            }
          }
        });
      }, 0);
    }

    /**
     * Triggered on <input> keypress.
     *
     */
    onKeyPress(e) {
      var self = this;
      if (self.isLocked) {
        preventDefault(e);
        return;
      }
      var character = String.fromCharCode(e.keyCode || e.which);
      if (self.settings.create && self.settings.mode === 'multi' && character === self.settings.delimiter) {
        self.createItem();
        preventDefault(e);
        return;
      }
    }

    /**
     * Triggered on <input> keydown.
     *
     */
    onKeyDown(e) {
      var self = this;
      self.ignoreHover = true;
      if (self.isLocked) {
        if (e.keyCode !== KEY_TAB) {
          preventDefault(e);
        }
        return;
      }
      switch (e.keyCode) {
        // ctrl+A: select all
        case KEY_A:
          if (isKeyDown(KEY_SHORTCUT, e)) {
            if (self.control_input.value == '') {
              preventDefault(e);
              self.selectAll();
              return;
            }
          }
          break;

        // esc: close dropdown
        case KEY_ESC:
          if (self.isOpen) {
            preventDefault(e, true);
            self.close();
          }
          self.clearActiveItems();
          return;

        // down: open dropdown or move selection down
        case KEY_DOWN:
          if (!self.isOpen && self.hasOptions) {
            self.open();
          } else if (self.activeOption) {
            let next = self.getAdjacent(self.activeOption, 1);
            if (next) self.setActiveOption(next);
          }
          preventDefault(e);
          return;

        // up: move selection up
        case KEY_UP:
          if (self.activeOption) {
            let prev = self.getAdjacent(self.activeOption, -1);
            if (prev) self.setActiveOption(prev);
          }
          preventDefault(e);
          return;

        // return: select active option
        case KEY_RETURN:
          if (self.canSelect(self.activeOption)) {
            self.onOptionSelect(e, self.activeOption);
            preventDefault(e);

            // if the option_create=null, the dropdown might be closed
          } else if (self.settings.create && self.createItem()) {
            preventDefault(e);

            // don't submit form when searching for a value
          } else if (document.activeElement == self.control_input && self.isOpen) {
            preventDefault(e);
          }
          return;

        // left: modifiy item selection to the left
        case KEY_LEFT:
          self.advanceSelection(-1, e);
          return;

        // right: modifiy item selection to the right
        case KEY_RIGHT:
          self.advanceSelection(1, e);
          return;

        // tab: select active option and/or create item
        case KEY_TAB:
          if (self.settings.selectOnTab) {
            if (self.canSelect(self.activeOption)) {
              self.onOptionSelect(e, self.activeOption);

              // prevent default [tab] behaviour of jump to the next field
              // if select isFull, then the dropdown won't be open and [tab] will work normally
              preventDefault(e);
            }
            if (self.settings.create && self.createItem()) {
              preventDefault(e);
            }
          }
          return;

        // delete|backspace: delete items
        case KEY_BACKSPACE:
        case KEY_DELETE:
          self.deleteSelection(e);
          return;
      }

      // don't enter text in the control_input when active items are selected
      if (self.isInputHidden && !isKeyDown(KEY_SHORTCUT, e)) {
        preventDefault(e);
      }
    }

    /**
     * Triggered on <input> keyup.
     *
     */
    onInput(e) {
      if (this.isLocked) {
        return;
      }
      const value = this.inputValue();
      if (this.lastValue === value) return;
      this.lastValue = value;
      if (value == '') {
        this._onInput();
        return;
      }
      if (this.refreshTimeout) {
        window.clearTimeout(this.refreshTimeout);
      }
      this.refreshTimeout = timeout(() => {
        this.refreshTimeout = null;
        this._onInput();
      }, this.settings.refreshThrottle);
    }
    _onInput() {
      const value = this.lastValue;
      if (this.settings.shouldLoad.call(this, value)) {
        this.load(value);
      }
      this.refreshOptions();
      this.trigger('type', value);
    }

    /**
     * Triggered when the user rolls over
     * an option in the autocomplete dropdown menu.
     *
     */
    onOptionHover(evt, option) {
      if (this.ignoreHover) return;
      this.setActiveOption(option, false);
    }

    /**
     * Triggered on <input> focus.
     *
     */
    onFocus(e) {
      var self = this;
      var wasFocused = self.isFocused;
      if (self.isDisabled || self.isReadOnly) {
        self.blur();
        preventDefault(e);
        return;
      }
      if (self.ignoreFocus) return;
      self.isFocused = true;
      if (self.settings.preload === 'focus') self.preload();
      if (!wasFocused) self.trigger('focus');
      if (!self.activeItems.length) {
        self.inputState();
        self.refreshOptions(!!self.settings.openOnFocus);
      }
      self.refreshState();
    }

    /**
     * Triggered on <input> blur.
     *
     */
    onBlur(e) {
      if (document.hasFocus() === false) return;
      var self = this;
      if (!self.isFocused) return;
      self.isFocused = false;
      self.ignoreFocus = false;
      var deactivate = () => {
        self.close();
        self.setActiveItem();
        self.setCaret(self.items.length);
        self.trigger('blur');
      };
      if (self.settings.create && self.settings.createOnBlur) {
        self.createItem(null, deactivate);
      } else {
        deactivate();
      }
    }

    /**
     * Triggered when the user clicks on an option
     * in the autocomplete dropdown menu.
     *
     */
    onOptionSelect(evt, option) {
      var value,
        self = this;

      // should not be possible to trigger a option under a disabled optgroup
      if (option.parentElement && option.parentElement.matches('[data-disabled]')) {
        return;
      }
      if (option.classList.contains('create')) {
        self.createItem(null, () => {
          if (self.settings.closeAfterSelect) {
            self.close();
          }
        });
      } else {
        value = option.dataset.value;
        if (typeof value !== 'undefined') {
          self.lastQuery = null;
          self.addItem(value);
          if (self.settings.closeAfterSelect) {
            self.close();
          }
          if (!self.settings.hideSelected && evt.type && /click/.test(evt.type)) {
            self.setActiveOption(option);
          }
        }
      }
    }

    /**
     * Return true if the given option can be selected
     *
     */
    canSelect(option) {
      if (this.isOpen && option && this.dropdown_content.contains(option)) {
        return true;
      }
      return false;
    }

    /**
     * Triggered when the user clicks on an item
     * that has been selected.
     *
     */
    onItemSelect(evt, item) {
      var self = this;
      if (!self.isLocked && self.settings.mode === 'multi') {
        preventDefault(evt);
        self.setActiveItem(item, evt);
        return true;
      }
      return false;
    }

    /**
     * Determines whether or not to invoke
     * the user-provided option provider / loader
     *
     * Note, there is a subtle difference between
     * this.canLoad() and this.settings.shouldLoad();
     *
     *	- settings.shouldLoad() is a user-input validator.
     *	When false is returned, the not_loading template
     *	will be added to the dropdown
     *
     *	- canLoad() is lower level validator that checks
     * 	the Tom Select instance. There is no inherent user
     *	feedback when canLoad returns false
     *
     */
    canLoad(value) {
      if (!this.settings.load) return false;
      if (this.loadedSearches.hasOwnProperty(value)) return false;
      return true;
    }

    /**
     * Invokes the user-provided option provider / loader.
     *
     */
    load(value) {
      const self = this;
      if (!self.canLoad(value)) return;
      addClasses(self.wrapper, self.settings.loadingClass);
      self.loading++;
      const callback = self.loadCallback.bind(self);
      self.settings.load.call(self, value, callback);
    }

    /**
     * Invoked by the user-provided option provider
     *
     */
    loadCallback(options, optgroups) {
      const self = this;
      self.loading = Math.max(self.loading - 1, 0);
      self.lastQuery = null;
      self.clearActiveOption(); // when new results load, focus should be on first option
      self.setupOptions(options, optgroups);
      self.refreshOptions(self.isFocused && !self.isInputHidden);
      if (!self.loading) {
        removeClasses(self.wrapper, self.settings.loadingClass);
      }
      self.trigger('load', options, optgroups);
    }
    preload() {
      var classList = this.wrapper.classList;
      if (classList.contains('preloaded')) return;
      classList.add('preloaded');
      this.load('');
    }

    /**
     * Sets the input field of the control to the specified value.
     *
     */
    setTextboxValue() {
      let value = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : '';
      var input = this.control_input;
      var changed = input.value !== value;
      if (changed) {
        input.value = value;
        triggerEvent(input, 'update');
        this.lastValue = value;
      }
    }

    /**
     * Returns the value of the control. If multiple items
     * can be selected (e.g. <select multiple>), this returns
     * an array. If only one item can be selected, this
     * returns a string.
     *
     */
    getValue() {
      if (this.is_select_tag && this.input.hasAttribute('multiple')) {
        return this.items;
      }
      return this.items.join(this.settings.delimiter);
    }

    /**
     * Resets the selected items to the given value.
     *
     */
    setValue(value, silent) {
      var events = silent ? [] : ['change'];
      debounce_events(this, events, () => {
        this.clear(silent);
        this.addItems(value, silent);
      });
    }

    /**
     * Resets the number of max items to the given value
     *
     */
    setMaxItems(value) {
      if (value === 0) value = null; //reset to unlimited items.
      this.settings.maxItems = value;
      this.refreshState();
    }

    /**
     * Sets the selected item.
     *
     */
    setActiveItem(item, e) {
      var self = this;
      var eventName;
      var i, begin, end, swap;
      var last;
      if (self.settings.mode === 'single') return;

      // clear the active selection
      if (!item) {
        self.clearActiveItems();
        if (self.isFocused) {
          self.inputState();
        }
        return;
      }

      // modify selection
      eventName = e && e.type.toLowerCase();
      if (eventName === 'click' && isKeyDown('shiftKey', e) && self.activeItems.length) {
        last = self.getLastActive();
        begin = Array.prototype.indexOf.call(self.control.children, last);
        end = Array.prototype.indexOf.call(self.control.children, item);
        if (begin > end) {
          swap = begin;
          begin = end;
          end = swap;
        }
        for (i = begin; i <= end; i++) {
          item = self.control.children[i];
          if (self.activeItems.indexOf(item) === -1) {
            self.setActiveItemClass(item);
          }
        }
        preventDefault(e);
      } else if (eventName === 'click' && isKeyDown(KEY_SHORTCUT, e) || eventName === 'keydown' && isKeyDown('shiftKey', e)) {
        if (item.classList.contains('active')) {
          self.removeActiveItem(item);
        } else {
          self.setActiveItemClass(item);
        }
      } else {
        self.clearActiveItems();
        self.setActiveItemClass(item);
      }

      // ensure control has focus
      self.inputState();
      if (!self.isFocused) {
        self.focus();
      }
    }

    /**
     * Set the active and last-active classes
     *
     */
    setActiveItemClass(item) {
      const self = this;
      const last_active = self.control.querySelector('.last-active');
      if (last_active) removeClasses(last_active, 'last-active');
      addClasses(item, 'active last-active');
      self.trigger('item_select', item);
      if (self.activeItems.indexOf(item) == -1) {
        self.activeItems.push(item);
      }
    }

    /**
     * Remove active item
     *
     */
    removeActiveItem(item) {
      var idx = this.activeItems.indexOf(item);
      this.activeItems.splice(idx, 1);
      removeClasses(item, 'active');
    }

    /**
     * Clears all the active items
     *
     */
    clearActiveItems() {
      removeClasses(this.activeItems, 'active');
      this.activeItems = [];
    }

    /**
     * Sets the selected item in the dropdown menu
     * of available options.
     *
     */
    setActiveOption(option) {
      let scroll = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : true;
      if (option === this.activeOption) {
        return;
      }
      this.clearActiveOption();
      if (!option) return;
      this.activeOption = option;
      setAttr(this.focus_node, {
        'aria-activedescendant': option.getAttribute('id')
      });
      setAttr(option, {
        'aria-selected': 'true'
      });
      addClasses(option, 'active');
      if (scroll) this.scrollToOption(option);
    }

    /**
     * Sets the dropdown_content scrollTop to display the option
     *
     */
    scrollToOption(option, behavior) {
      if (!option) return;
      const content = this.dropdown_content;
      const height_menu = content.clientHeight;
      const scrollTop = content.scrollTop || 0;
      const height_item = option.offsetHeight;
      const y = option.getBoundingClientRect().top - content.getBoundingClientRect().top + scrollTop;
      if (y + height_item > height_menu + scrollTop) {
        this.scroll(y - height_menu + height_item, behavior);
      } else if (y < scrollTop) {
        this.scroll(y, behavior);
      }
    }

    /**
     * Scroll the dropdown to the given position
     *
     */
    scroll(scrollTop, behavior) {
      const content = this.dropdown_content;
      if (behavior) {
        content.style.scrollBehavior = behavior;
      }
      content.scrollTop = scrollTop;
      content.style.scrollBehavior = '';
    }

    /**
     * Clears the active option
     *
     */
    clearActiveOption() {
      if (this.activeOption) {
        removeClasses(this.activeOption, 'active');
        setAttr(this.activeOption, {
          'aria-selected': null
        });
      }
      this.activeOption = null;
      setAttr(this.focus_node, {
        'aria-activedescendant': null
      });
    }

    /**
     * Selects all items (CTRL + A).
     */
    selectAll() {
      const self = this;
      if (self.settings.mode === 'single') return;
      const activeItems = self.controlChildren();
      if (!activeItems.length) return;
      self.inputState();
      self.close();
      self.activeItems = activeItems;
      iterate(activeItems, item => {
        self.setActiveItemClass(item);
      });
    }

    /**
     * Determines if the control_input should be in a hidden or visible state
     *
     */
    inputState() {
      var self = this;
      if (!self.control.contains(self.control_input)) return;
      setAttr(self.control_input, {
        placeholder: self.settings.placeholder
      });
      if (self.activeItems.length > 0 || !self.isFocused && self.settings.hidePlaceholder && self.items.length > 0) {
        self.setTextboxValue();
        self.isInputHidden = true;
      } else {
        if (self.settings.hidePlaceholder && self.items.length > 0) {
          setAttr(self.control_input, {
            placeholder: ''
          });
        }
        self.isInputHidden = false;
      }
      self.wrapper.classList.toggle('input-hidden', self.isInputHidden);
    }

    /**
     * Get the input value
     */
    inputValue() {
      return this.control_input.value.trim();
    }

    /**
     * Gives the control focus.
     */
    focus() {
      var self = this;
      if (self.isDisabled || self.isReadOnly) return;
      self.ignoreFocus = true;
      if (self.control_input.offsetWidth) {
        self.control_input.focus();
      } else {
        self.focus_node.focus();
      }
      setTimeout(() => {
        self.ignoreFocus = false;
        self.onFocus();
      }, 0);
    }

    /**
     * Forces the control out of focus.
     *
     */
    blur() {
      this.focus_node.blur();
      this.onBlur();
    }

    /**
     * Returns a function that scores an object
     * to show how good of a match it is to the
     * provided query.
     *
     * @return {function}
     */
    getScoreFunction(query) {
      return this.sifter.getScoreFunction(query, this.getSearchOptions());
    }

    /**
     * Returns search options for sifter (the system
     * for scoring and sorting results).
     *
     * @see https://github.com/orchidjs/sifter.js
     * @return {object}
     */
    getSearchOptions() {
      var settings = this.settings;
      var sort = settings.sortField;
      if (typeof settings.sortField === 'string') {
        sort = [{
          field: settings.sortField
        }];
      }
      return {
        fields: settings.searchField,
        conjunction: settings.searchConjunction,
        sort: sort,
        nesting: settings.nesting
      };
    }

    /**
     * Searches through available options and returns
     * a sorted array of matches.
     *
     */
    search(query) {
      var result, calculateScore;
      var self = this;
      var options = this.getSearchOptions();

      // validate user-provided result scoring function
      if (self.settings.score) {
        calculateScore = self.settings.score.call(self, query);
        if (typeof calculateScore !== 'function') {
          throw new Error('Tom Select "score" setting must be a function that returns a function');
        }
      }

      // perform search
      if (query !== self.lastQuery) {
        self.lastQuery = query;
        result = self.sifter.search(query, Object.assign(options, {
          score: calculateScore
        }));
        self.currentResults = result;
      } else {
        result = Object.assign({}, self.currentResults);
      }

      // filter out selected items
      if (self.settings.hideSelected) {
        result.items = result.items.filter(item => {
          let hashed = hash_key(item.id);
          return !(hashed && self.items.indexOf(hashed) !== -1);
        });
      }
      return result;
    }

    /**
     * Refreshes the list of available options shown
     * in the autocomplete dropdown menu.
     *
     */
    refreshOptions() {
      let triggerDropdown = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : true;
      var i, j, k, n, optgroup, optgroups, html, has_create_option, active_group;
      var create;
      const groups = {};
      const groups_order = [];
      var self = this;
      var query = self.inputValue();
      const same_query = query === self.lastQuery || query == '' && self.lastQuery == null;
      var results = self.search(query);
      var active_option = null;
      var show_dropdown = self.settings.shouldOpen || false;
      var dropdown_content = self.dropdown_content;
      if (same_query) {
        active_option = self.activeOption;
        if (active_option) {
          active_group = active_option.closest('[data-group]');
        }
      }

      // build markup
      n = results.items.length;
      if (typeof self.settings.maxOptions === 'number') {
        n = Math.min(n, self.settings.maxOptions);
      }
      if (n > 0) {
        show_dropdown = true;
      }

      // get fragment for group and the position of the group in group_order
      const getGroupFragment = (optgroup, order) => {
        let group_order_i = groups[optgroup];
        if (group_order_i !== undefined) {
          let order_group = groups_order[group_order_i];
          if (order_group !== undefined) {
            return [group_order_i, order_group.fragment];
          }
        }
        let group_fragment = document.createDocumentFragment();
        group_order_i = groups_order.length;
        groups_order.push({
          fragment: group_fragment,
          order,
          optgroup
        });
        return [group_order_i, group_fragment];
      };

      // render and group available options individually
      for (i = 0; i < n; i++) {
        // get option dom element
        let item = results.items[i];
        if (!item) continue;
        let opt_value = item.id;
        let option = self.options[opt_value];
        if (option === undefined) continue;
        let opt_hash = get_hash(opt_value);
        let option_el = self.getOption(opt_hash, true);

        // toggle 'selected' class
        if (!self.settings.hideSelected) {
          option_el.classList.toggle('selected', self.items.includes(opt_hash));
        }
        optgroup = option[self.settings.optgroupField] || '';
        optgroups = Array.isArray(optgroup) ? optgroup : [optgroup];
        for (j = 0, k = optgroups && optgroups.length; j < k; j++) {
          optgroup = optgroups[j];
          let order = option.$order;
          let self_optgroup = self.optgroups[optgroup];
          if (self_optgroup === undefined) {
            optgroup = '';
          } else {
            order = self_optgroup.$order;
          }
          const _getGroupFragment = getGroupFragment(optgroup, order),
            _getGroupFragment2 = _slicedToArray(_getGroupFragment, 2),
            group_order_i = _getGroupFragment2[0],
            group_fragment = _getGroupFragment2[1];

          // nodes can only have one parent, so if the option is in mutple groups, we need a clone
          if (j > 0) {
            option_el = option_el.cloneNode(true);
            setAttr(option_el, {
              id: option.$id + '-clone-' + j,
              'aria-selected': null
            });
            option_el.classList.add('ts-cloned');
            removeClasses(option_el, 'active');

            // make sure we keep the activeOption in the same group
            if (self.activeOption && self.activeOption.dataset.value == opt_value) {
              if (active_group && active_group.dataset.group === optgroup.toString()) {
                active_option = option_el;
              }
            }
          }
          group_fragment.appendChild(option_el);
          if (optgroup != '') {
            groups[optgroup] = group_order_i;
          }
        }
      }

      // sort optgroups
      if (self.settings.lockOptgroupOrder) {
        groups_order.sort((a, b) => {
          return a.order - b.order;
        });
      }

      // render optgroup headers & join groups
      html = document.createDocumentFragment();
      iterate(groups_order, group_order => {
        let group_fragment = group_order.fragment;
        let optgroup = group_order.optgroup;
        if (!group_fragment || !group_fragment.children.length) return;
        let group_heading = self.optgroups[optgroup];
        if (group_heading !== undefined) {
          let group_options = document.createDocumentFragment();
          let header = self.render('optgroup_header', group_heading);
          append(group_options, header);
          append(group_options, group_fragment);
          let group_html = self.render('optgroup', {
            group: group_heading,
            options: group_options
          });
          append(html, group_html);
        } else {
          append(html, group_fragment);
        }
      });
      dropdown_content.innerHTML = '';
      append(dropdown_content, html);

      // highlight matching terms inline
      if (self.settings.highlight) {
        removeHighlight(dropdown_content);
        if (results.query.length && results.tokens.length) {
          iterate(results.tokens, tok => {
            highlight(dropdown_content, tok.regex);
          });
        }
      }

      // helper method for adding templates to dropdown
      var add_template = template => {
        let content = self.render(template, {
          input: query
        });
        if (content) {
          show_dropdown = true;
          dropdown_content.insertBefore(content, dropdown_content.firstChild);
        }
        return content;
      };

      // add loading message
      if (self.loading) {
        add_template('loading');

        // invalid query
      } else if (!self.settings.shouldLoad.call(self, query)) {
        add_template('not_loading');

        // add no_results message
      } else if (results.items.length === 0) {
        add_template('no_results');
      }

      // add create option
      has_create_option = self.canCreate(query);
      if (has_create_option) {
        create = add_template('option_create');
      }

      // activate
      self.hasOptions = results.items.length > 0 || has_create_option;
      if (show_dropdown) {
        if (results.items.length > 0) {
          if (!active_option && self.settings.mode === 'single' && self.items[0] != undefined) {
            active_option = self.getOption(self.items[0]);
          }
          if (!dropdown_content.contains(active_option)) {
            let active_index = 0;
            if (create && !self.settings.addPrecedence) {
              active_index = 1;
            }
            active_option = self.selectable()[active_index];
          }
        } else if (create) {
          active_option = create;
        }
        if (triggerDropdown && !self.isOpen) {
          self.open();
          self.scrollToOption(active_option, 'auto');
        }
        self.setActiveOption(active_option);
      } else {
        self.clearActiveOption();
        if (triggerDropdown && self.isOpen) {
          self.close(false); // if create_option=null, we want the dropdown to close but not reset the textbox value
        }
      }
    }

    /**
     * Return list of selectable options
     *
     */
    selectable() {
      return this.dropdown_content.querySelectorAll('[data-selectable]');
    }

    /**
     * Adds an available option. If it already exists,
     * nothing will happen. Note: this does not refresh
     * the options list dropdown (use `refreshOptions`
     * for that).
     *
     * Usage:
     *
     *   this.addOption(data)
     *
     */
    addOption(data) {
      let user_created = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : false;
      const self = this;

      // @deprecated 1.7.7
      // use addOptions( array, user_created ) for adding multiple options
      if (Array.isArray(data)) {
        self.addOptions(data, user_created);
        return false;
      }
      const key = hash_key(data[self.settings.valueField]);
      if (key === null || self.options.hasOwnProperty(key)) {
        return false;
      }
      data.$order = data.$order || ++self.order;
      data.$id = self.inputId + '-opt-' + data.$order;
      self.options[key] = data;
      self.lastQuery = null;
      if (user_created) {
        self.userOptions[key] = user_created;
        self.trigger('option_add', key, data);
      }
      return key;
    }

    /**
     * Add multiple options
     *
     */
    addOptions(data) {
      let user_created = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : false;
      iterate(data, dat => {
        this.addOption(dat, user_created);
      });
    }

    /**
     * @deprecated 1.7.7
     */
    registerOption(data) {
      return this.addOption(data);
    }

    /**
     * Registers an option group to the pool of option groups.
     *
     * @return {boolean|string}
     */
    registerOptionGroup(data) {
      var key = hash_key(data[this.settings.optgroupValueField]);
      if (key === null) return false;
      data.$order = data.$order || ++this.order;
      this.optgroups[key] = data;
      return key;
    }

    /**
     * Registers a new optgroup for options
     * to be bucketed into.
     *
     */
    addOptionGroup(id, data) {
      var hashed_id;
      data[this.settings.optgroupValueField] = id;
      if (hashed_id = this.registerOptionGroup(data)) {
        this.trigger('optgroup_add', hashed_id, data);
      }
    }

    /**
     * Removes an existing option group.
     *
     */
    removeOptionGroup(id) {
      if (this.optgroups.hasOwnProperty(id)) {
        delete this.optgroups[id];
        this.clearCache();
        this.trigger('optgroup_remove', id);
      }
    }

    /**
     * Clears all existing option groups.
     */
    clearOptionGroups() {
      this.optgroups = {};
      this.clearCache();
      this.trigger('optgroup_clear');
    }

    /**
     * Updates an option available for selection. If
     * it is visible in the selected items or options
     * dropdown, it will be re-rendered automatically.
     *
     */
    updateOption(value, data) {
      const self = this;
      var item_new;
      var index_item;
      const value_old = hash_key(value);
      const value_new = hash_key(data[self.settings.valueField]);

      // sanity checks
      if (value_old === null) return;
      const data_old = self.options[value_old];
      if (data_old == undefined) return;
      if (typeof value_new !== 'string') throw new Error('Value must be set in option data');
      const option = self.getOption(value_old);
      const item = self.getItem(value_old);
      data.$order = data.$order || data_old.$order;
      delete self.options[value_old];

      // invalidate render cache
      // don't remove existing node yet, we'll remove it after replacing it
      self.uncacheValue(value_new);
      self.options[value_new] = data;

      // update the option if it's in the dropdown
      if (option) {
        if (self.dropdown_content.contains(option)) {
          const option_new = self._render('option', data);
          replaceNode(option, option_new);
          if (self.activeOption === option) {
            self.setActiveOption(option_new);
          }
        }
        option.remove();
      }

      // update the item if we have one
      if (item) {
        index_item = self.items.indexOf(value_old);
        if (index_item !== -1) {
          self.items.splice(index_item, 1, value_new);
        }
        item_new = self._render('item', data);
        if (item.classList.contains('active')) addClasses(item_new, 'active');
        replaceNode(item, item_new);
      }

      // invalidate last query because we might have updated the sortField
      self.lastQuery = null;
    }

    /**
     * Removes a single option.
     *
     */
    removeOption(value, silent) {
      const self = this;
      value = get_hash(value);
      self.uncacheValue(value);
      delete self.userOptions[value];
      delete self.options[value];
      self.lastQuery = null;
      self.trigger('option_remove', value);
      self.removeItem(value, silent);
    }

    /**
     * Clears all options.
     */
    clearOptions(filter) {
      const boundFilter = (filter || this.clearFilter).bind(this);
      this.loadedSearches = {};
      this.userOptions = {};
      this.clearCache();
      const selected = {};
      iterate(this.options, (option, key) => {
        if (boundFilter(option, key)) {
          selected[key] = option;
        }
      });
      this.options = this.sifter.items = selected;
      this.lastQuery = null;
      this.trigger('option_clear');
    }

    /**
     * Used by clearOptions() to decide whether or not an option should be removed
     * Return true to keep an option, false to remove
     *
     */
    clearFilter(option, value) {
      if (this.items.indexOf(value) >= 0) {
        return true;
      }
      return false;
    }

    /**
     * Returns the dom element of the option
     * matching the given value.
     *
     */
    getOption(value) {
      let create = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : false;
      const hashed = hash_key(value);
      if (hashed === null) return null;
      const option = this.options[hashed];
      if (option != undefined) {
        if (option.$div) {
          return option.$div;
        }
        if (create) {
          return this._render('option', option);
        }
      }
      return null;
    }

    /**
     * Returns the dom element of the next or previous dom element of the same type
     * Note: adjacent options may not be adjacent DOM elements (optgroups)
     *
     */
    getAdjacent(option, direction) {
      let type = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : 'option';
      var self = this,
        all;
      if (!option) {
        return null;
      }
      if (type == 'item') {
        all = self.controlChildren();
      } else {
        all = self.dropdown_content.querySelectorAll('[data-selectable]');
      }
      for (let i = 0; i < all.length; i++) {
        if (all[i] != option) {
          continue;
        }
        if (direction > 0) {
          return all[i + 1];
        }
        return all[i - 1];
      }
      return null;
    }

    /**
     * Returns the dom element of the item
     * matching the given value.
     *
     */
    getItem(item) {
      if (typeof item == 'object') {
        return item;
      }
      var value = hash_key(item);
      return value !== null ? this.control.querySelector(`[data-value="${addSlashes(value)}"]`) : null;
    }

    /**
     * "Selects" multiple items at once. Adds them to the list
     * at the current caret position.
     *
     */
    addItems(values, silent) {
      var self = this;
      var items = Array.isArray(values) ? values : [values];
      items = items.filter(x => self.items.indexOf(x) === -1);
      const last_item = items[items.length - 1];
      items.forEach(item => {
        self.isPending = item !== last_item;
        self.addItem(item, silent);
      });
    }

    /**
     * "Selects" an item. Adds it to the list
     * at the current caret position.
     *
     */
    addItem(value, silent) {
      var events = silent ? [] : ['change', 'dropdown_close'];
      debounce_events(this, events, () => {
        var item, wasFull;
        const self = this;
        const inputMode = self.settings.mode;
        const hashed = hash_key(value);
        if (hashed && self.items.indexOf(hashed) !== -1) {
          if (inputMode === 'single') {
            self.close();
          }
          if (inputMode === 'single' || !self.settings.duplicates) {
            return;
          }
        }
        if (hashed === null || !self.options.hasOwnProperty(hashed)) return;
        if (inputMode === 'single') self.clear(silent);
        if (inputMode === 'multi' && self.isFull()) return;
        item = self._render('item', self.options[hashed]);
        if (self.control.contains(item)) {
          // duplicates
          item = item.cloneNode(true);
        }
        wasFull = self.isFull();
        self.items.splice(self.caretPos, 0, hashed);
        self.insertAtCaret(item);
        if (self.isSetup) {
          // update menu / remove the option (if this is not one item being added as part of series)
          if (!self.isPending && self.settings.hideSelected) {
            let option = self.getOption(hashed);
            let next = self.getAdjacent(option, 1);
            if (next) {
              self.setActiveOption(next);
            }
          }

          // refreshOptions after setActiveOption(),
          // otherwise setActiveOption() will be called by refreshOptions() with the wrong value
          if (!self.isPending && !self.settings.closeAfterSelect) {
            self.refreshOptions(self.isFocused && inputMode !== 'single');
          }

          // hide the menu if the maximum number of items have been selected or no options are left
          if (self.settings.closeAfterSelect != false && self.isFull()) {
            self.close();
          } else if (!self.isPending) {
            self.positionDropdown();
          }
          self.trigger('item_add', hashed, item);
          if (!self.isPending) {
            self.updateOriginalInput({
              silent: silent
            });
          }
        }
        if (!self.isPending || !wasFull && self.isFull()) {
          self.inputState();
          self.refreshState();
        }
      });
    }

    /**
     * Removes the selected item matching
     * the provided value.
     *
     */
    removeItem() {
      let item = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : null;
      let silent = arguments.length > 1 ? arguments[1] : undefined;
      const self = this;
      item = self.getItem(item);
      if (!item) return;
      var i, idx;
      const value = item.dataset.value;
      i = nodeIndex(item);
      item.remove();
      if (item.classList.contains('active')) {
        idx = self.activeItems.indexOf(item);
        self.activeItems.splice(idx, 1);
        removeClasses(item, 'active');
      }
      self.items.splice(i, 1);
      self.lastQuery = null;
      if (!self.settings.persist && self.userOptions.hasOwnProperty(value)) {
        self.removeOption(value, silent);
      }
      if (i < self.caretPos) {
        self.setCaret(self.caretPos - 1);
      }
      self.updateOriginalInput({
        silent: silent
      });
      self.refreshState();
      self.positionDropdown();
      self.trigger('item_remove', value, item);
    }

    /**
     * Invokes the `create` method provided in the
     * TomSelect options that should provide the data
     * for the new item, given the user input.
     *
     * Once this completes, it will be added
     * to the item list.
     *
     */
    createItem() {
      let input = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : null;
      let callback = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : () => {};
      // triggerDropdown parameter @deprecated 2.1.1
      if (arguments.length === 3) {
        callback = arguments[2];
      }
      if (typeof callback != 'function') {
        callback = () => {};
      }
      var self = this;
      var caret = self.caretPos;
      var output;
      input = input || self.inputValue();
      if (!self.canCreate(input)) {
        callback();
        return false;
      }
      self.lock();
      var created = false;
      var create = data => {
        self.unlock();
        if (!data || typeof data !== 'object') return callback();
        var value = hash_key(data[self.settings.valueField]);
        if (typeof value !== 'string') {
          return callback();
        }
        self.setTextboxValue();
        self.addOption(data, true);
        self.setCaret(caret);
        self.addItem(value);
        callback(data);
        created = true;
      };
      if (typeof self.settings.create === 'function') {
        output = self.settings.create.call(this, input, create);
      } else {
        output = {
          [self.settings.labelField]: input,
          [self.settings.valueField]: input
        };
      }
      if (!created) {
        create(output);
      }
      return true;
    }

    /**
     * Re-renders the selected item lists.
     */
    refreshItems() {
      var self = this;
      self.lastQuery = null;
      if (self.isSetup) {
        self.addItems(self.items);
      }
      self.updateOriginalInput();
      self.refreshState();
    }

    /**
     * Updates all state-dependent attributes
     * and CSS classes.
     */
    refreshState() {
      const self = this;
      self.refreshValidityState();
      const isFull = self.isFull();
      const isLocked = self.isLocked;
      self.wrapper.classList.toggle('rtl', self.rtl);
      const wrap_classList = self.wrapper.classList;
      wrap_classList.toggle('focus', self.isFocused);
      wrap_classList.toggle('disabled', self.isDisabled);
      wrap_classList.toggle('readonly', self.isReadOnly);
      wrap_classList.toggle('required', self.isRequired);
      wrap_classList.toggle('invalid', !self.isValid);
      wrap_classList.toggle('locked', isLocked);
      wrap_classList.toggle('full', isFull);
      wrap_classList.toggle('input-active', self.isFocused && !self.isInputHidden);
      wrap_classList.toggle('dropdown-active', self.isOpen);
      wrap_classList.toggle('has-options', isEmptyObject(self.options));
      wrap_classList.toggle('has-items', self.items.length > 0);
    }

    /**
     * Update the `required` attribute of both input and control input.
     *
     * The `required` property needs to be activated on the control input
     * for the error to be displayed at the right place. `required` also
     * needs to be temporarily deactivated on the input since the input is
     * hidden and can't show errors.
     */
    refreshValidityState() {
      var self = this;
      if (!self.input.validity) {
        return;
      }
      self.isValid = self.input.validity.valid;
      self.isInvalid = !self.isValid;
    }

    /**
     * Determines whether or not more items can be added
     * to the control without exceeding the user-defined maximum.
     *
     * @returns {boolean}
     */
    isFull() {
      return this.settings.maxItems !== null && this.items.length >= this.settings.maxItems;
    }

    /**
     * Refreshes the original <select> or <input>
     * element to reflect the current state.
     *
     */
    updateOriginalInput() {
      let opts = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
      const self = this;
      var option, label;
      const empty_option = self.input.querySelector('option[value=""]');
      if (self.is_select_tag) {
        const selected = [];
        const has_selected = self.input.querySelectorAll('option:checked').length;
        function AddSelected(option_el, value, label) {
          if (!option_el) {
            option_el = getDom('<option value="' + escape_html(value) + '">' + escape_html(label) + '</option>');
          }

          // don't move empty option from top of list
          // fixes bug in firefox https://bugzilla.mozilla.org/show_bug.cgi?id=1725293
          if (option_el != empty_option) {
            self.input.append(option_el);
          }
          selected.push(option_el);

          // marking empty option as selected can break validation
          // fixes https://github.com/orchidjs/tom-select/issues/303
          if (option_el != empty_option || has_selected > 0) {
            option_el.selected = true;
          }
          return option_el;
        }

        // unselect all selected options
        self.input.querySelectorAll('option:checked').forEach(option_el => {
          option_el.selected = false;
        });

        // nothing selected?
        if (self.items.length == 0 && self.settings.mode == 'single') {
          AddSelected(empty_option, "", "");

          // order selected <option> tags for values in self.items
        } else {
          self.items.forEach(value => {
            option = self.options[value];
            label = option[self.settings.labelField] || '';
            if (selected.includes(option.$option)) {
              const reuse_opt = self.input.querySelector(`option[value="${addSlashes(value)}"]:not(:checked)`);
              AddSelected(reuse_opt, value, label);
            } else {
              option.$option = AddSelected(option.$option, value, label);
            }
          });
        }
      } else {
        self.input.value = self.getValue();
      }
      if (self.isSetup) {
        if (!opts.silent) {
          self.trigger('change', self.getValue());
        }
      }
    }

    /**
     * Shows the autocomplete dropdown containing
     * the available options.
     */
    open() {
      var self = this;
      if (self.isLocked || self.isOpen || self.settings.mode === 'multi' && self.isFull()) return;
      self.isOpen = true;
      setAttr(self.focus_node, {
        'aria-expanded': 'true'
      });
      self.refreshState();
      applyCSS(self.dropdown, {
        visibility: 'hidden',
        display: 'block'
      });
      self.positionDropdown();
      applyCSS(self.dropdown, {
        visibility: 'visible',
        display: 'block'
      });
      self.focus();
      self.trigger('dropdown_open', self.dropdown);
    }

    /**
     * Closes the autocomplete dropdown menu.
     */
    close() {
      let setTextboxValue = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : true;
      var self = this;
      var trigger = self.isOpen;
      if (setTextboxValue) {
        // before blur() to prevent form onchange event
        self.setTextboxValue();
        if (self.settings.mode === 'single' && self.items.length) {
          self.inputState();
        }
      }
      self.isOpen = false;
      setAttr(self.focus_node, {
        'aria-expanded': 'false'
      });
      applyCSS(self.dropdown, {
        display: 'none'
      });
      if (self.settings.hideSelected) {
        self.clearActiveOption();
      }
      self.refreshState();
      if (trigger) self.trigger('dropdown_close', self.dropdown);
    }

    /**
     * Calculates and applies the appropriate
     * position of the dropdown if dropdownParent = 'body'.
     * Otherwise, position is determined by css
     */
    positionDropdown() {
      if (this.settings.dropdownParent !== 'body') {
        return;
      }
      var context = this.control;
      var rect = context.getBoundingClientRect();
      var top = context.offsetHeight + rect.top + window.scrollY;
      var left = rect.left + window.scrollX;
      applyCSS(this.dropdown, {
        width: rect.width + 'px',
        top: top + 'px',
        left: left + 'px'
      });
    }

    /**
     * Resets / clears all selected items
     * from the control.
     *
     */
    clear(silent) {
      var self = this;
      if (!self.items.length) return;
      var items = self.controlChildren();
      iterate(items, item => {
        self.removeItem(item, true);
      });
      self.inputState();
      if (!silent) self.updateOriginalInput();
      self.trigger('clear');
    }

    /**
     * A helper method for inserting an element
     * at the current caret position.
     *
     */
    insertAtCaret(el) {
      const self = this;
      const caret = self.caretPos;
      const target = self.control;
      target.insertBefore(el, target.children[caret] || null);
      self.setCaret(caret + 1);
    }

    /**
     * Removes the current selected item(s).
     *
     */
    deleteSelection(e) {
      var direction, selection, caret, tail;
      var self = this;
      direction = e && e.keyCode === KEY_BACKSPACE ? -1 : 1;
      selection = getSelection(self.control_input);

      // determine items that will be removed
      const rm_items = [];
      if (self.activeItems.length) {
        tail = getTail(self.activeItems, direction);
        caret = nodeIndex(tail);
        if (direction > 0) {
          caret++;
        }
        iterate(self.activeItems, item => rm_items.push(item));
      } else if ((self.isFocused || self.settings.mode === 'single') && self.items.length) {
        const items = self.controlChildren();
        let rm_item;
        if (direction < 0 && selection.start === 0 && selection.length === 0) {
          rm_item = items[self.caretPos - 1];
        } else if (direction > 0 && selection.start === self.inputValue().length) {
          rm_item = items[self.caretPos];
        }
        if (rm_item !== undefined) {
          rm_items.push(rm_item);
        }
      }
      if (!self.shouldDelete(rm_items, e)) {
        return false;
      }
      preventDefault(e, true);

      // perform removal
      if (typeof caret !== 'undefined') {
        self.setCaret(caret);
      }
      while (rm_items.length) {
        self.removeItem(rm_items.pop());
      }
      self.inputState();
      self.positionDropdown();
      self.refreshOptions(false);
      return true;
    }

    /**
     * Return true if the items should be deleted
     */
    shouldDelete(items, evt) {
      const values = items.map(item => item.dataset.value);

      // allow the callback to abort
      if (!values.length || typeof this.settings.onDelete === 'function' && this.settings.onDelete(values, evt) === false) {
        return false;
      }
      return true;
    }

    /**
     * Selects the previous / next item (depending on the `direction` argument).
     *
     * > 0 - right
     * < 0 - left
     *
     */
    advanceSelection(direction, e) {
      var last_active,
        adjacent,
        self = this;
      if (self.rtl) direction *= -1;
      if (self.inputValue().length) return;

      // add or remove to active items
      if (isKeyDown(KEY_SHORTCUT, e) || isKeyDown('shiftKey', e)) {
        last_active = self.getLastActive(direction);
        if (last_active) {
          if (!last_active.classList.contains('active')) {
            adjacent = last_active;
          } else {
            adjacent = self.getAdjacent(last_active, direction, 'item');
          }

          // if no active item, get items adjacent to the control input
        } else if (direction > 0) {
          adjacent = self.control_input.nextElementSibling;
        } else {
          adjacent = self.control_input.previousElementSibling;
        }
        if (adjacent) {
          if (adjacent.classList.contains('active')) {
            self.removeActiveItem(last_active);
          }
          self.setActiveItemClass(adjacent); // mark as last_active !! after removeActiveItem() on last_active
        }

        // move caret to the left or right
      } else {
        self.moveCaret(direction);
      }
    }
    moveCaret(direction) {}

    /**
     * Get the last active item
     *
     */
    getLastActive(direction) {
      let last_active = this.control.querySelector('.last-active');
      if (last_active) {
        return last_active;
      }
      var result = this.control.querySelectorAll('.active');
      if (result) {
        return getTail(result, direction);
      }
    }

    /**
     * Moves the caret to the specified index.
     *
     * The input must be moved by leaving it in place and moving the
     * siblings, due to the fact that focus cannot be restored once lost
     * on mobile webkit devices
     *
     */
    setCaret(new_pos) {
      this.caretPos = this.items.length;
    }

    /**
     * Return list of item dom elements
     *
     */
    controlChildren() {
      return Array.from(this.control.querySelectorAll('[data-ts-item]'));
    }

    /**
     * Disables user input on the control. Used while
     * items are being asynchronously created.
     */
    lock() {
      this.setLocked(true);
    }

    /**
     * Re-enables user input on the control.
     */
    unlock() {
      this.setLocked(false);
    }

    /**
     * Disable or enable user input on the control
     */
    setLocked() {
      let lock = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : this.isReadOnly || this.isDisabled;
      this.isLocked = lock;
      this.refreshState();
    }

    /**
     * Disables user input on the control completely.
     * While disabled, it cannot receive focus.
     */
    disable() {
      this.setDisabled(true);
      this.close();
    }

    /**
     * Enables the control so that it can respond
     * to focus and user input.
     */
    enable() {
      this.setDisabled(false);
    }
    setDisabled(disabled) {
      this.focus_node.tabIndex = disabled ? -1 : this.tabIndex;
      this.isDisabled = disabled;
      this.input.disabled = disabled;
      this.control_input.disabled = disabled;
      this.setLocked();
    }
    setReadOnly(isReadOnly) {
      this.isReadOnly = isReadOnly;
      this.input.readOnly = isReadOnly;
      this.control_input.readOnly = isReadOnly;
      this.setLocked();
    }

    /**
     * Completely destroys the control and
     * unbinds all event listeners so that it can
     * be garbage collected.
     */
    destroy() {
      var self = this;
      var revertSettings = self.revertSettings;
      self.trigger('destroy');
      self.off();
      self.wrapper.remove();
      self.dropdown.remove();
      self.input.innerHTML = revertSettings.innerHTML;
      self.input.tabIndex = revertSettings.tabIndex;
      removeClasses(self.input, 'tomselected', 'ts-hidden-accessible');
      self._destroy();
      delete self.input.tomselect;
    }

    /**
     * A helper method for rendering "item" and
     * "option" templates, given the data.
     *
     */
    render(templateName, data) {
      var id, html;
      const self = this;
      if (typeof this.settings.render[templateName] !== 'function') {
        return null;
      }

      // render markup
      html = self.settings.render[templateName].call(this, data, escape_html);
      if (!html) {
        return null;
      }
      html = getDom(html);

      // add mandatory attributes
      if (templateName === 'option' || templateName === 'option_create') {
        if (data[self.settings.disabledField]) {
          setAttr(html, {
            'aria-disabled': 'true'
          });
        } else {
          setAttr(html, {
            'data-selectable': ''
          });
        }
      } else if (templateName === 'optgroup') {
        id = data.group[self.settings.optgroupValueField];
        setAttr(html, {
          'data-group': id
        });
        if (data.group[self.settings.disabledField]) {
          setAttr(html, {
            'data-disabled': ''
          });
        }
      }
      if (templateName === 'option' || templateName === 'item') {
        const value = get_hash(data[self.settings.valueField]);
        setAttr(html, {
          'data-value': value
        });

        // make sure we have some classes if a template is overwritten
        if (templateName === 'item') {
          addClasses(html, self.settings.itemClass);
          setAttr(html, {
            'data-ts-item': ''
          });
        } else {
          addClasses(html, self.settings.optionClass);
          setAttr(html, {
            role: 'option',
            id: data.$id
          });

          // update cache
          data.$div = html;
          self.options[value] = data;
        }
      }
      return html;
    }

    /**
     * Type guarded rendering
     *
     */
    _render(templateName, data) {
      const html = this.render(templateName, data);
      if (html == null) {
        throw 'HTMLElement expected';
      }
      return html;
    }

    /**
     * Clears the render cache for a template. If
     * no template is given, clears all render
     * caches.
     *
     */
    clearCache() {
      iterate(this.options, option => {
        if (option.$div) {
          option.$div.remove();
          delete option.$div;
        }
      });
    }

    /**
     * Removes a value from item and option caches
     *
     */
    uncacheValue(value) {
      const option_el = this.getOption(value);
      if (option_el) option_el.remove();
    }

    /**
     * Determines whether or not to display the
     * create item prompt, given a user input.
     *
     */
    canCreate(input) {
      return this.settings.create && input.length > 0 && this.settings.createFilter.call(this, input);
    }

    /**
     * Wraps this.`method` so that `new_fn` can be invoked 'before', 'after', or 'instead' of the original method
     *
     * this.hook('instead','onKeyDown',function( arg1, arg2 ...){
     *
     * });
     */
    hook(when, method, new_fn) {
      var self = this;
      var orig_method = self[method];
      self[method] = function () {
        var result, result_new;
        if (when === 'after') {
          result = orig_method.apply(self, arguments);
        }
        result_new = new_fn.apply(self, arguments);
        if (when === 'instead') {
          return result_new;
        }
        if (when === 'before') {
          result = orig_method.apply(self, arguments);
        }
        return result;
      };
    }
  }

  /**
   * Plugin: "change_listener" (Tom Select)
   * Copyright (c) contributors
   *
   * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this
   * file except in compliance with the License. You may obtain a copy of the License at:
   * http://www.apache.org/licenses/LICENSE-2.0
   *
   * Unless required by applicable law or agreed to in writing, software distributed under
   * the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
   * ANY KIND, either express or implied. See the License for the specific language
   * governing permissions and limitations under the License.
   *
   */

  function change_listener() {
    addEvent(this.input, 'change', () => {
      this.sync();
    });
  }

  /**
   * Plugin: "checkbox_options" (Tom Select)
   * Copyright (c) contributors
   *
   * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this
   * file except in compliance with the License. You may obtain a copy of the License at:
   * http://www.apache.org/licenses/LICENSE-2.0
   *
   * Unless required by applicable law or agreed to in writing, software distributed under
   * the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
   * ANY KIND, either express or implied. See the License for the specific language
   * governing permissions and limitations under the License.
   *
   */

  function checkbox_options(userOptions) {
    var self = this;
    var orig_onOptionSelect = self.onOptionSelect;
    self.settings.hideSelected = false;
    const cbOptions = Object.assign({
      // so that the user may add different ones as well
      className: "tomselect-checkbox",
      // the following default to the historic plugin's values
      checkedClassNames: undefined,
      uncheckedClassNames: undefined
    }, userOptions);
    var UpdateChecked = function UpdateChecked(checkbox, toCheck) {
      if (toCheck) {
        checkbox.checked = true;
        if (cbOptions.uncheckedClassNames) {
          checkbox.classList.remove(...cbOptions.uncheckedClassNames);
        }
        if (cbOptions.checkedClassNames) {
          checkbox.classList.add(...cbOptions.checkedClassNames);
        }
      } else {
        checkbox.checked = false;
        if (cbOptions.checkedClassNames) {
          checkbox.classList.remove(...cbOptions.checkedClassNames);
        }
        if (cbOptions.uncheckedClassNames) {
          checkbox.classList.add(...cbOptions.uncheckedClassNames);
        }
      }
    };

    // update the checkbox for an option
    var UpdateCheckbox = function UpdateCheckbox(option) {
      setTimeout(() => {
        var checkbox = option.querySelector('input.' + cbOptions.className);
        if (checkbox instanceof HTMLInputElement) {
          UpdateChecked(checkbox, option.classList.contains('selected'));
        }
      }, 1);
    };

    // add checkbox to option template
    self.hook('after', 'setupTemplates', () => {
      var orig_render_option = self.settings.render.option;
      self.settings.render.option = (data, escape_html) => {
        var rendered = getDom(orig_render_option.call(self, data, escape_html));
        var checkbox = document.createElement('input');
        if (cbOptions.className) {
          checkbox.classList.add(cbOptions.className);
        }
        checkbox.addEventListener('click', function (evt) {
          preventDefault(evt);
        });
        checkbox.type = 'checkbox';
        const hashed = hash_key(data[self.settings.valueField]);
        UpdateChecked(checkbox, !!(hashed && self.items.indexOf(hashed) > -1));
        rendered.prepend(checkbox);
        return rendered;
      };
    });

    // uncheck when item removed
    self.on('item_remove', value => {
      var option = self.getOption(value);
      if (option) {
        // if dropdown hasn't been opened yet, the option won't exist
        option.classList.remove('selected'); // selected class won't be removed yet
        UpdateCheckbox(option);
      }
    });

    // check when item added
    self.on('item_add', value => {
      var option = self.getOption(value);
      if (option) {
        // if dropdown hasn't been opened yet, the option won't exist
        UpdateCheckbox(option);
      }
    });

    // remove items when selected option is clicked
    self.hook('instead', 'onOptionSelect', (evt, option) => {
      if (option.classList.contains('selected')) {
        option.classList.remove('selected');
        self.removeItem(option.dataset.value);
        self.refreshOptions();
        preventDefault(evt, true);
        return;
      }
      orig_onOptionSelect.call(self, evt, option);
      UpdateCheckbox(option);
    });
  }

  /**
   * Plugin: "dropdown_header" (Tom Select)
   * Copyright (c) contributors
   *
   * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this
   * file except in compliance with the License. You may obtain a copy of the License at:
   * http://www.apache.org/licenses/LICENSE-2.0
   *
   * Unless required by applicable law or agreed to in writing, software distributed under
   * the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
   * ANY KIND, either express or implied. See the License for the specific language
   * governing permissions and limitations under the License.
   *
   */

  function clear_button(userOptions) {
    const self = this;
    const options = Object.assign({
      className: 'clear-button',
      title: 'Clear All',
      html: data => {
        return `<div class="${data.className}" title="${data.title}">&#10799;</div>`;
      }
    }, userOptions);
    self.on('initialize', () => {
      var button = getDom(options.html(options));
      button.addEventListener('click', evt => {
        if (self.isLocked) return;
        self.clear();
        if (self.settings.mode === 'single' && self.settings.allowEmptyOption) {
          self.addItem('');
        }
        evt.preventDefault();
        evt.stopPropagation();
      });
      self.control.appendChild(button);
    });
  }

  /**
   * Plugin: "drag_drop" (Tom Select)
   * Copyright (c) contributors
   *
   * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this
   * file except in compliance with the License. You may obtain a copy of the License at:
   * http://www.apache.org/licenses/LICENSE-2.0
   *
   * Unless required by applicable law or agreed to in writing, software distributed under
   * the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
   * ANY KIND, either express or implied. See the License for the specific language
   * governing permissions and limitations under the License.
   *
   */

  const insertAfter = (referenceNode, newNode) => {
    var _referenceNode$parent;
    (_referenceNode$parent = referenceNode.parentNode) == null || _referenceNode$parent.insertBefore(newNode, referenceNode.nextSibling);
  };
  const insertBefore = (referenceNode, newNode) => {
    var _referenceNode$parent2;
    (_referenceNode$parent2 = referenceNode.parentNode) == null || _referenceNode$parent2.insertBefore(newNode, referenceNode);
  };
  const isBefore = (referenceNode, newNode) => {
    do {
      var _newNode;
      newNode = (_newNode = newNode) == null ? void 0 : _newNode.previousElementSibling;
      if (referenceNode == newNode) {
        return true;
      }
    } while (newNode && newNode.previousElementSibling);
    return false;
  };
  function drag_drop() {
    var self = this;
    if (self.settings.mode !== 'multi') return;
    var orig_lock = self.lock;
    var orig_unlock = self.unlock;
    let sortable = true;
    let drag_item;

    /**
     * Add draggable attribute to item
     */
    self.hook('after', 'setupTemplates', () => {
      var orig_render_item = self.settings.render.item;
      self.settings.render.item = (data, escape) => {
        const item = getDom(orig_render_item.call(self, data, escape));
        setAttr(item, {
          'draggable': 'true'
        });

        // prevent doc_mousedown (see tom-select.ts)
        const mousedown = evt => {
          if (!sortable) preventDefault(evt);
          evt.stopPropagation();
        };
        const dragStart = evt => {
          drag_item = item;
          setTimeout(() => {
            item.classList.add('ts-dragging');
          }, 0);
        };
        const dragOver = evt => {
          evt.preventDefault();
          item.classList.add('ts-drag-over');
          moveitem(item, drag_item);
        };
        const dragLeave = () => {
          item.classList.remove('ts-drag-over');
        };
        const moveitem = (targetitem, dragitem) => {
          if (dragitem === undefined) return;
          if (isBefore(dragitem, item)) {
            insertAfter(targetitem, dragitem);
          } else {
            insertBefore(targetitem, dragitem);
          }
        };
        const dragend = () => {
          var _drag_item;
          document.querySelectorAll('.ts-drag-over').forEach(el => el.classList.remove('ts-drag-over'));
          (_drag_item = drag_item) == null || _drag_item.classList.remove('ts-dragging');
          drag_item = undefined;
          var values = [];
          self.control.querySelectorAll(`[data-value]`).forEach(el => {
            if (el.dataset.value) {
              let value = el.dataset.value;
              if (value) {
                values.push(value);
              }
            }
          });
          self.setValue(values);
        };
        addEvent(item, 'mousedown', mousedown);
        addEvent(item, 'dragstart', dragStart);
        addEvent(item, 'dragenter', dragOver);
        addEvent(item, 'dragover', dragOver);
        addEvent(item, 'dragleave', dragLeave);
        addEvent(item, 'dragend', dragend);
        return item;
      };
    });
    self.hook('instead', 'lock', () => {
      sortable = false;
      return orig_lock.call(self);
    });
    self.hook('instead', 'unlock', () => {
      sortable = true;
      return orig_unlock.call(self);
    });
  }

  /**
   * Plugin: "dropdown_header" (Tom Select)
   * Copyright (c) contributors
   *
   * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this
   * file except in compliance with the License. You may obtain a copy of the License at:
   * http://www.apache.org/licenses/LICENSE-2.0
   *
   * Unless required by applicable law or agreed to in writing, software distributed under
   * the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
   * ANY KIND, either express or implied. See the License for the specific language
   * governing permissions and limitations under the License.
   *
   */

  function dropdown_header(userOptions) {
    const self = this;
    const options = Object.assign({
      title: 'Untitled',
      headerClass: 'dropdown-header',
      titleRowClass: 'dropdown-header-title',
      labelClass: 'dropdown-header-label',
      closeClass: 'dropdown-header-close',
      html: data => {
        return '<div class="' + data.headerClass + '">' + '<div class="' + data.titleRowClass + '">' + '<span class="' + data.labelClass + '">' + data.title + '</span>' + '<a class="' + data.closeClass + '">&times;</a>' + '</div>' + '</div>';
      }
    }, userOptions);
    self.on('initialize', () => {
      var header = getDom(options.html(options));
      var close_link = header.querySelector('.' + options.closeClass);
      if (close_link) {
        close_link.addEventListener('click', evt => {
          preventDefault(evt, true);
          self.close();
        });
      }
      self.dropdown.insertBefore(header, self.dropdown.firstChild);
    });
  }

  /**
   * Plugin: "dropdown_input" (Tom Select)
   * Copyright (c) contributors
   *
   * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this
   * file except in compliance with the License. You may obtain a copy of the License at:
   * http://www.apache.org/licenses/LICENSE-2.0
   *
   * Unless required by applicable law or agreed to in writing, software distributed under
   * the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
   * ANY KIND, either express or implied. See the License for the specific language
   * governing permissions and limitations under the License.
   *
   */

  function caret_position() {
    var self = this;

    /**
     * Moves the caret to the specified index.
     *
     * The input must be moved by leaving it in place and moving the
     * siblings, due to the fact that focus cannot be restored once lost
     * on mobile webkit devices
     *
     */
    self.hook('instead', 'setCaret', new_pos => {
      if (self.settings.mode === 'single' || !self.control.contains(self.control_input)) {
        new_pos = self.items.length;
      } else {
        new_pos = Math.max(0, Math.min(self.items.length, new_pos));
        if (new_pos != self.caretPos && !self.isPending) {
          self.controlChildren().forEach((child, j) => {
            if (j < new_pos) {
              self.control_input.insertAdjacentElement('beforebegin', child);
            } else {
              self.control.appendChild(child);
            }
          });
        }
      }
      self.caretPos = new_pos;
    });
    self.hook('instead', 'moveCaret', direction => {
      if (!self.isFocused) return;

      // move caret before or after selected items
      const last_active = self.getLastActive(direction);
      if (last_active) {
        const idx = nodeIndex(last_active);
        self.setCaret(direction > 0 ? idx + 1 : idx);
        self.setActiveItem();
        removeClasses(last_active, 'last-active');

        // move caret left or right of current position
      } else {
        self.setCaret(self.caretPos + direction);
      }
    });
  }

  /**
   * Plugin: "dropdown_input" (Tom Select)
   * Copyright (c) contributors
   *
   * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this
   * file except in compliance with the License. You may obtain a copy of the License at:
   * http://www.apache.org/licenses/LICENSE-2.0
   *
   * Unless required by applicable law or agreed to in writing, software distributed under
   * the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
   * ANY KIND, either express or implied. See the License for the specific language
   * governing permissions and limitations under the License.
   *
   */

  function dropdown_input() {
    const self = this;
    self.settings.shouldOpen = true; // make sure the input is shown even if there are no options to display in the dropdown

    self.hook('before', 'setup', () => {
      self.focus_node = self.control;
      addClasses(self.control_input, 'dropdown-input');
      const div = getDom('<div class="dropdown-input-wrap">');
      div.append(self.control_input);
      self.dropdown.insertBefore(div, self.dropdown.firstChild);

      // set a placeholder in the select control
      const placeholder = getDom('<input class="items-placeholder" tabindex="-1" />');
      placeholder.placeholder = self.settings.placeholder || '';
      self.control.append(placeholder);
    });
    self.on('initialize', () => {
      // set tabIndex on control to -1, otherwise [shift+tab] will put focus right back on control_input
      self.control_input.addEventListener('keydown', evt => {
        //addEvent(self.control_input,'keydown' as const,(evt:KeyboardEvent) =>{
        switch (evt.keyCode) {
          case KEY_ESC:
            if (self.isOpen) {
              preventDefault(evt, true);
              self.close();
            }
            self.clearActiveItems();
            return;
          case KEY_TAB:
            self.focus_node.tabIndex = -1;
            break;
        }
        return self.onKeyDown.call(self, evt);
      });
      self.on('blur', () => {
        self.focus_node.tabIndex = self.isDisabled ? -1 : self.tabIndex;
      });

      // give the control_input focus when the dropdown is open
      self.on('dropdown_open', () => {
        self.control_input.focus();
      });

      // prevent onBlur from closing when focus is on the control_input
      const orig_onBlur = self.onBlur;
      self.hook('instead', 'onBlur', evt => {
        if (evt && evt.relatedTarget == self.control_input) return;
        return orig_onBlur.call(self);
      });
      addEvent(self.control_input, 'blur', () => self.onBlur());

      // return focus to control to allow further keyboard input
      self.hook('before', 'close', () => {
        if (!self.isOpen) return;
        self.focus_node.focus({
          preventScroll: true
        });
      });
    });
  }

  /**
   * Plugin: "input_autogrow" (Tom Select)
   *
   * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this
   * file except in compliance with the License. You may obtain a copy of the License at:
   * http://www.apache.org/licenses/LICENSE-2.0
   *
   * Unless required by applicable law or agreed to in writing, software distributed under
   * the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
   * ANY KIND, either express or implied. See the License for the specific language
   * governing permissions and limitations under the License.
   *
   */

  function input_autogrow() {
    var self = this;
    self.on('initialize', () => {
      var test_input = document.createElement('span');
      var control = self.control_input;
      test_input.style.cssText = 'position:absolute; top:-99999px; left:-99999px; width:auto; padding:0; white-space:pre; ';
      self.wrapper.appendChild(test_input);
      var transfer_styles = ['letterSpacing', 'fontSize', 'fontFamily', 'fontWeight', 'textTransform'];
      for (var _i = 0, _transfer_styles = transfer_styles; _i < _transfer_styles.length; _i++) {
        const style_name = _transfer_styles[_i];
        // @ts-ignore TS7015 https://stackoverflow.com/a/50506154/697576
        test_input.style[style_name] = control.style[style_name];
      }

      /**
       * Set the control width
       *
       */
      var resize = () => {
        test_input.textContent = control.value;
        control.style.width = test_input.clientWidth + 'px';
      };
      resize();
      self.on('update item_add item_remove', resize);
      addEvent(control, 'input', resize);
      addEvent(control, 'keyup', resize);
      addEvent(control, 'blur', resize);
      addEvent(control, 'update', resize);
    });
  }

  /**
   * Plugin: "input_autogrow" (Tom Select)
   *
   * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this
   * file except in compliance with the License. You may obtain a copy of the License at:
   * http://www.apache.org/licenses/LICENSE-2.0
   *
   * Unless required by applicable law or agreed to in writing, software distributed under
   * the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
   * ANY KIND, either express or implied. See the License for the specific language
   * governing permissions and limitations under the License.
   *
   */

  function no_backspace_delete() {
    var self = this;
    var orig_deleteSelection = self.deleteSelection;
    this.hook('instead', 'deleteSelection', evt => {
      if (self.activeItems.length) {
        return orig_deleteSelection.call(self, evt);
      }
      return false;
    });
  }

  /**
   * Plugin: "no_active_items" (Tom Select)
   *
   * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this
   * file except in compliance with the License. You may obtain a copy of the License at:
   * http://www.apache.org/licenses/LICENSE-2.0
   *
   * Unless required by applicable law or agreed to in writing, software distributed under
   * the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
   * ANY KIND, either express or implied. See the License for the specific language
   * governing permissions and limitations under the License.
   *
   */

  function no_active_items() {
    this.hook('instead', 'setActiveItem', () => {});
    this.hook('instead', 'selectAll', () => {});
  }

  /**
   * Plugin: "optgroup_columns" (Tom Select.js)
   * Copyright (c) contributors
   *
   * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this
   * file except in compliance with the License. You may obtain a copy of the License at:
   * http://www.apache.org/licenses/LICENSE-2.0
   *
   * Unless required by applicable law or agreed to in writing, software distributed under
   * the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
   * ANY KIND, either express or implied. See the License for the specific language
   * governing permissions and limitations under the License.
   *
   */

  function optgroup_columns() {
    var self = this;
    var orig_keydown = self.onKeyDown;
    self.hook('instead', 'onKeyDown', evt => {
      var index, option, options, optgroup;
      if (!self.isOpen || !(evt.keyCode === KEY_LEFT || evt.keyCode === KEY_RIGHT)) {
        return orig_keydown.call(self, evt);
      }
      self.ignoreHover = true;
      optgroup = parentMatch(self.activeOption, '[data-group]');
      index = nodeIndex(self.activeOption, '[data-selectable]');
      if (!optgroup) {
        return;
      }
      if (evt.keyCode === KEY_LEFT) {
        optgroup = optgroup.previousSibling;
      } else {
        optgroup = optgroup.nextSibling;
      }
      if (!optgroup) {
        return;
      }
      options = optgroup.querySelectorAll('[data-selectable]');
      option = options[Math.min(options.length - 1, index)];
      if (option) {
        self.setActiveOption(option);
      }
    });
  }

  /**
   * Plugin: "remove_button" (Tom Select)
   * Copyright (c) contributors
   *
   * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this
   * file except in compliance with the License. You may obtain a copy of the License at:
   * http://www.apache.org/licenses/LICENSE-2.0
   *
   * Unless required by applicable law or agreed to in writing, software distributed under
   * the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
   * ANY KIND, either express or implied. See the License for the specific language
   * governing permissions and limitations under the License.
   *
   */

  function remove_button(userOptions) {
    const options = Object.assign({
      label: '&times;',
      title: 'Remove',
      className: 'remove',
      append: true
    }, userOptions);

    //options.className = 'remove-single';
    var self = this;

    // override the render method to add remove button to each item
    if (!options.append) {
      return;
    }
    var html = '<a href="javascript:void(0)" class="' + options.className + '" tabindex="-1" title="' + escape_html(options.title) + '">' + options.label + '</a>';
    self.hook('after', 'setupTemplates', () => {
      var orig_render_item = self.settings.render.item;
      self.settings.render.item = (data, escape) => {
        var item = getDom(orig_render_item.call(self, data, escape));
        var close_button = getDom(html);
        item.appendChild(close_button);
        addEvent(close_button, 'mousedown', evt => {
          preventDefault(evt, true);
        });
        addEvent(close_button, 'click', evt => {
          if (self.isLocked) return;

          // propagating will trigger the dropdown to show for single mode
          preventDefault(evt, true);
          if (self.isLocked) return;
          if (!self.shouldDelete([item], evt)) return;
          self.removeItem(item);
          self.refreshOptions(false);
          self.inputState();
        });
        return item;
      };
    });
  }

  /**
   * Plugin: "restore_on_backspace" (Tom Select)
   * Copyright (c) contributors
   *
   * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this
   * file except in compliance with the License. You may obtain a copy of the License at:
   * http://www.apache.org/licenses/LICENSE-2.0
   *
   * Unless required by applicable law or agreed to in writing, software distributed under
   * the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
   * ANY KIND, either express or implied. See the License for the specific language
   * governing permissions and limitations under the License.
   *
   */

  function restore_on_backspace(userOptions) {
    const self = this;
    const options = Object.assign({
      text: option => {
        return option[self.settings.labelField];
      }
    }, userOptions);
    self.on('item_remove', function (value) {
      if (!self.isFocused) {
        return;
      }
      if (self.control_input.value.trim() === '') {
        var option = self.options[value];
        if (option) {
          self.setTextboxValue(options.text.call(self, option));
        }
      }
    });
  }

  /**
   * Plugin: "restore_on_backspace" (Tom Select)
   * Copyright (c) contributors
   *
   * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this
   * file except in compliance with the License. You may obtain a copy of the License at:
   * http://www.apache.org/licenses/LICENSE-2.0
   *
   * Unless required by applicable law or agreed to in writing, software distributed under
   * the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
   * ANY KIND, either express or implied. See the License for the specific language
   * governing permissions and limitations under the License.
   *
   */

  function virtual_scroll() {
    const self = this;
    const orig_canLoad = self.canLoad;
    const orig_clearActiveOption = self.clearActiveOption;
    const orig_loadCallback = self.loadCallback;
    var pagination = {};
    var dropdown_content;
    var loading_more = false;
    var load_more_opt;
    var default_values = [];
    if (!self.settings.shouldLoadMore) {
      // return true if additional results should be loaded
      self.settings.shouldLoadMore = () => {
        const scroll_percent = dropdown_content.clientHeight / (dropdown_content.scrollHeight - dropdown_content.scrollTop);
        if (scroll_percent > 0.9) {
          return true;
        }
        if (self.activeOption) {
          var selectable = self.selectable();
          var index = Array.from(selectable).indexOf(self.activeOption);
          if (index >= selectable.length - 2) {
            return true;
          }
        }
        return false;
      };
    }
    if (!self.settings.firstUrl) {
      throw 'virtual_scroll plugin requires a firstUrl() method';
    }

    // in order for virtual scrolling to work,
    // options need to be ordered the same way they're returned from the remote data source
    self.settings.sortField = [{
      field: '$order'
    }, {
      field: '$score'
    }];

    // can we load more results for given query?
    const canLoadMore = query => {
      if (typeof self.settings.maxOptions === 'number' && dropdown_content.children.length >= self.settings.maxOptions) {
        return false;
      }
      if (query in pagination && pagination[query]) {
        return true;
      }
      return false;
    };
    const clearFilter = (option, value) => {
      if (self.items.indexOf(value) >= 0 || default_values.indexOf(value) >= 0) {
        return true;
      }
      return false;
    };

    // set the next url that will be
    self.setNextUrl = (value, next_url) => {
      pagination[value] = next_url;
    };

    // getUrl() to be used in settings.load()
    self.getUrl = query => {
      if (query in pagination) {
        const next_url = pagination[query];
        pagination[query] = false;
        return next_url;
      }

      // if the user goes back to a previous query
      // we need to load the first page again
      self.clearPagination();
      return self.settings.firstUrl.call(self, query);
    };

    // clear pagination
    self.clearPagination = () => {
      pagination = {};
    };

    // don't clear the active option (and cause unwanted dropdown scroll)
    // while loading more results
    self.hook('instead', 'clearActiveOption', () => {
      if (loading_more) {
        return;
      }
      return orig_clearActiveOption.call(self);
    });

    // override the canLoad method
    self.hook('instead', 'canLoad', query => {
      // first time the query has been seen
      if (!(query in pagination)) {
        return orig_canLoad.call(self, query);
      }
      return canLoadMore(query);
    });

    // wrap the load
    self.hook('instead', 'loadCallback', (options, optgroups) => {
      if (!loading_more) {
        self.clearOptions(clearFilter);
      } else if (load_more_opt) {
        const first_option = options[0];
        if (first_option !== undefined) {
          load_more_opt.dataset.value = first_option[self.settings.valueField];
        }
      }
      orig_loadCallback.call(self, options, optgroups);
      loading_more = false;
    });

    // add templates to dropdown
    //	loading_more if we have another url in the queue
    //	no_more_results if we don't have another url in the queue
    self.hook('after', 'refreshOptions', () => {
      const query = self.lastValue;
      var option;
      if (canLoadMore(query)) {
        option = self.render('loading_more', {
          query: query
        });
        if (option) {
          option.setAttribute('data-selectable', ''); // so that navigating dropdown with [down] keypresses can navigate to this node
          load_more_opt = option;
        }
      } else if (query in pagination && !dropdown_content.querySelector('.no-results')) {
        option = self.render('no_more_results', {
          query: query
        });
      }
      if (option) {
        addClasses(option, self.settings.optionClass);
        dropdown_content.append(option);
      }
    });

    // add scroll listener and default templates
    self.on('initialize', () => {
      default_values = Object.keys(self.options);
      dropdown_content = self.dropdown_content;

      // default templates
      self.settings.render = Object.assign({}, {
        loading_more: () => {
          return `<div class="loading-more-results">Loading more results ... </div>`;
        },
        no_more_results: () => {
          return `<div class="no-more-results">No more results</div>`;
        }
      }, self.settings.render);

      // watch dropdown content scroll position
      dropdown_content.addEventListener('scroll', () => {
        if (!self.settings.shouldLoadMore.call(self)) {
          return;
        }

        // !important: this will get checked again in load() but we still need to check here otherwise loading_more will be set to true
        if (!canLoadMore(self.lastValue)) {
          return;
        }

        // don't call load() too much
        if (loading_more) return;
        loading_more = true;
        self.load.call(self, self.lastValue);
      });
    });
  }
  TomSelect.define('change_listener', change_listener);
  TomSelect.define('checkbox_options', checkbox_options);
  TomSelect.define('clear_button', clear_button);
  TomSelect.define('drag_drop', drag_drop);
  TomSelect.define('dropdown_header', dropdown_header);
  TomSelect.define('caret_position', caret_position);
  TomSelect.define('dropdown_input', dropdown_input);
  TomSelect.define('input_autogrow', input_autogrow);
  TomSelect.define('no_backspace_delete', no_backspace_delete);
  TomSelect.define('no_active_items', no_active_items);
  TomSelect.define('optgroup_columns', optgroup_columns);
  TomSelect.define('remove_button', remove_button);
  TomSelect.define('restore_on_backspace', restore_on_backspace);
  TomSelect.define('virtual_scroll', virtual_scroll);
  return TomSelect;
});
var tomSelect = function (el, opts) {
  return new TomSelect(el, opts);
};

/***/ }),

/***/ "./node_modules/turbolinks/dist/turbolinks.js":
/*!****************************************************!*\
  !*** ./node_modules/turbolinks/dist/turbolinks.js ***!
  \****************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

var __WEBPACK_AMD_DEFINE_FACTORY__, __WEBPACK_AMD_DEFINE_RESULT__;/*
Turbolinks 5.2.0
Copyright © 2018 Basecamp, LLC
 */
(function () {
  var t = this;
  (function () {
    (function () {
      this.Turbolinks = {
        supported: function () {
          return null != window.history.pushState && null != window.requestAnimationFrame && null != window.addEventListener;
        }(),
        visit: function (t, r) {
          return e.controller.visit(t, r);
        },
        clearCache: function () {
          return e.controller.clearCache();
        },
        setProgressBarDelay: function (t) {
          return e.controller.setProgressBarDelay(t);
        }
      };
    }).call(this);
  }).call(t);
  var e = t.Turbolinks;
  (function () {
    (function () {
      var t,
        r,
        n,
        o = [].slice;
      e.copyObject = function (t) {
        var e, r, n;
        r = {};
        for (e in t) n = t[e], r[e] = n;
        return r;
      }, e.closest = function (e, r) {
        return t.call(e, r);
      }, t = function () {
        var t, e;
        return t = document.documentElement, null != (e = t.closest) ? e : function (t) {
          var e;
          for (e = this; e;) {
            if (e.nodeType === Node.ELEMENT_NODE && r.call(e, t)) return e;
            e = e.parentNode;
          }
        };
      }(), e.defer = function (t) {
        return setTimeout(t, 1);
      }, e.throttle = function (t) {
        var e;
        return e = null, function () {
          var r;
          return r = 1 <= arguments.length ? o.call(arguments, 0) : [], null != e ? e : e = requestAnimationFrame(function (n) {
            return function () {
              return e = null, t.apply(n, r);
            };
          }(this));
        };
      }, e.dispatch = function (t, e) {
        var r, o, i, s, a, u;
        return a = null != e ? e : {}, u = a.target, r = a.cancelable, o = a.data, i = document.createEvent("Events"), i.initEvent(t, !0, r === !0), i.data = null != o ? o : {}, i.cancelable && !n && (s = i.preventDefault, i.preventDefault = function () {
          return this.defaultPrevented || Object.defineProperty(this, "defaultPrevented", {
            get: function () {
              return !0;
            }
          }), s.call(this);
        }), (null != u ? u : document).dispatchEvent(i), i;
      }, n = function () {
        var t;
        return t = document.createEvent("Events"), t.initEvent("test", !0, !0), t.preventDefault(), t.defaultPrevented;
      }(), e.match = function (t, e) {
        return r.call(t, e);
      }, r = function () {
        var t, e, r, n;
        return t = document.documentElement, null != (e = null != (r = null != (n = t.matchesSelector) ? n : t.webkitMatchesSelector) ? r : t.msMatchesSelector) ? e : t.mozMatchesSelector;
      }(), e.uuid = function () {
        var t, e, r;
        for (r = "", t = e = 1; 36 >= e; t = ++e) r += 9 === t || 14 === t || 19 === t || 24 === t ? "-" : 15 === t ? "4" : 20 === t ? (Math.floor(4 * Math.random()) + 8).toString(16) : Math.floor(15 * Math.random()).toString(16);
        return r;
      };
    }).call(this), function () {
      e.Location = function () {
        function t(t) {
          var e, r;
          null == t && (t = ""), r = document.createElement("a"), r.href = t.toString(), this.absoluteURL = r.href, e = r.hash.length, 2 > e ? this.requestURL = this.absoluteURL : (this.requestURL = this.absoluteURL.slice(0, -e), this.anchor = r.hash.slice(1));
        }
        var e, r, n, o;
        return t.wrap = function (t) {
          return t instanceof this ? t : new this(t);
        }, t.prototype.getOrigin = function () {
          return this.absoluteURL.split("/", 3).join("/");
        }, t.prototype.getPath = function () {
          var t, e;
          return null != (t = null != (e = this.requestURL.match(/\/\/[^\/]*(\/[^?;]*)/)) ? e[1] : void 0) ? t : "/";
        }, t.prototype.getPathComponents = function () {
          return this.getPath().split("/").slice(1);
        }, t.prototype.getLastPathComponent = function () {
          return this.getPathComponents().slice(-1)[0];
        }, t.prototype.getExtension = function () {
          var t, e;
          return null != (t = null != (e = this.getLastPathComponent().match(/\.[^.]*$/)) ? e[0] : void 0) ? t : "";
        }, t.prototype.isHTML = function () {
          return this.getExtension().match(/^(?:|\.(?:htm|html|xhtml))$/);
        }, t.prototype.isPrefixedBy = function (t) {
          var e;
          return e = r(t), this.isEqualTo(t) || o(this.absoluteURL, e);
        }, t.prototype.isEqualTo = function (t) {
          return this.absoluteURL === (null != t ? t.absoluteURL : void 0);
        }, t.prototype.toCacheKey = function () {
          return this.requestURL;
        }, t.prototype.toJSON = function () {
          return this.absoluteURL;
        }, t.prototype.toString = function () {
          return this.absoluteURL;
        }, t.prototype.valueOf = function () {
          return this.absoluteURL;
        }, r = function (t) {
          return e(t.getOrigin() + t.getPath());
        }, e = function (t) {
          return n(t, "/") ? t : t + "/";
        }, o = function (t, e) {
          return t.slice(0, e.length) === e;
        }, n = function (t, e) {
          return t.slice(-e.length) === e;
        }, t;
      }();
    }.call(this), function () {
      var t = function (t, e) {
        return function () {
          return t.apply(e, arguments);
        };
      };
      e.HttpRequest = function () {
        function r(r, n, o) {
          this.delegate = r, this.requestCanceled = t(this.requestCanceled, this), this.requestTimedOut = t(this.requestTimedOut, this), this.requestFailed = t(this.requestFailed, this), this.requestLoaded = t(this.requestLoaded, this), this.requestProgressed = t(this.requestProgressed, this), this.url = e.Location.wrap(n).requestURL, this.referrer = e.Location.wrap(o).absoluteURL, this.createXHR();
        }
        return r.NETWORK_FAILURE = 0, r.TIMEOUT_FAILURE = -1, r.timeout = 60, r.prototype.send = function () {
          var t;
          return this.xhr && !this.sent ? (this.notifyApplicationBeforeRequestStart(), this.setProgress(0), this.xhr.send(), this.sent = !0, "function" == typeof (t = this.delegate).requestStarted ? t.requestStarted() : void 0) : void 0;
        }, r.prototype.cancel = function () {
          return this.xhr && this.sent ? this.xhr.abort() : void 0;
        }, r.prototype.requestProgressed = function (t) {
          return t.lengthComputable ? this.setProgress(t.loaded / t.total) : void 0;
        }, r.prototype.requestLoaded = function () {
          return this.endRequest(function (t) {
            return function () {
              var e;
              return 200 <= (e = t.xhr.status) && 300 > e ? t.delegate.requestCompletedWithResponse(t.xhr.responseText, t.xhr.getResponseHeader("Turbolinks-Location")) : (t.failed = !0, t.delegate.requestFailedWithStatusCode(t.xhr.status, t.xhr.responseText));
            };
          }(this));
        }, r.prototype.requestFailed = function () {
          return this.endRequest(function (t) {
            return function () {
              return t.failed = !0, t.delegate.requestFailedWithStatusCode(t.constructor.NETWORK_FAILURE);
            };
          }(this));
        }, r.prototype.requestTimedOut = function () {
          return this.endRequest(function (t) {
            return function () {
              return t.failed = !0, t.delegate.requestFailedWithStatusCode(t.constructor.TIMEOUT_FAILURE);
            };
          }(this));
        }, r.prototype.requestCanceled = function () {
          return this.endRequest();
        }, r.prototype.notifyApplicationBeforeRequestStart = function () {
          return e.dispatch("turbolinks:request-start", {
            data: {
              url: this.url,
              xhr: this.xhr
            }
          });
        }, r.prototype.notifyApplicationAfterRequestEnd = function () {
          return e.dispatch("turbolinks:request-end", {
            data: {
              url: this.url,
              xhr: this.xhr
            }
          });
        }, r.prototype.createXHR = function () {
          return this.xhr = new XMLHttpRequest(), this.xhr.open("GET", this.url, !0), this.xhr.timeout = 1e3 * this.constructor.timeout, this.xhr.setRequestHeader("Accept", "text/html, application/xhtml+xml"), this.xhr.setRequestHeader("Turbolinks-Referrer", this.referrer), this.xhr.onprogress = this.requestProgressed, this.xhr.onload = this.requestLoaded, this.xhr.onerror = this.requestFailed, this.xhr.ontimeout = this.requestTimedOut, this.xhr.onabort = this.requestCanceled;
        }, r.prototype.endRequest = function (t) {
          return this.xhr ? (this.notifyApplicationAfterRequestEnd(), null != t && t.call(this), this.destroy()) : void 0;
        }, r.prototype.setProgress = function (t) {
          var e;
          return this.progress = t, "function" == typeof (e = this.delegate).requestProgressed ? e.requestProgressed(this.progress) : void 0;
        }, r.prototype.destroy = function () {
          var t;
          return this.setProgress(1), "function" == typeof (t = this.delegate).requestFinished && t.requestFinished(), this.delegate = null, this.xhr = null;
        }, r;
      }();
    }.call(this), function () {
      var t = function (t, e) {
        return function () {
          return t.apply(e, arguments);
        };
      };
      e.ProgressBar = function () {
        function e() {
          this.trickle = t(this.trickle, this), this.stylesheetElement = this.createStylesheetElement(), this.progressElement = this.createProgressElement();
        }
        var r;
        return r = 300, e.defaultCSS = ".turbolinks-progress-bar {\n  position: fixed;\n  display: block;\n  top: 0;\n  left: 0;\n  height: 3px;\n  background: #0076ff;\n  z-index: 9999;\n  transition: width " + r + "ms ease-out, opacity " + r / 2 + "ms " + r / 2 + "ms ease-in;\n  transform: translate3d(0, 0, 0);\n}", e.prototype.show = function () {
          return this.visible ? void 0 : (this.visible = !0, this.installStylesheetElement(), this.installProgressElement(), this.startTrickling());
        }, e.prototype.hide = function () {
          return this.visible && !this.hiding ? (this.hiding = !0, this.fadeProgressElement(function (t) {
            return function () {
              return t.uninstallProgressElement(), t.stopTrickling(), t.visible = !1, t.hiding = !1;
            };
          }(this))) : void 0;
        }, e.prototype.setValue = function (t) {
          return this.value = t, this.refresh();
        }, e.prototype.installStylesheetElement = function () {
          return document.head.insertBefore(this.stylesheetElement, document.head.firstChild);
        }, e.prototype.installProgressElement = function () {
          return this.progressElement.style.width = 0, this.progressElement.style.opacity = 1, document.documentElement.insertBefore(this.progressElement, document.body), this.refresh();
        }, e.prototype.fadeProgressElement = function (t) {
          return this.progressElement.style.opacity = 0, setTimeout(t, 1.5 * r);
        }, e.prototype.uninstallProgressElement = function () {
          return this.progressElement.parentNode ? document.documentElement.removeChild(this.progressElement) : void 0;
        }, e.prototype.startTrickling = function () {
          return null != this.trickleInterval ? this.trickleInterval : this.trickleInterval = setInterval(this.trickle, r);
        }, e.prototype.stopTrickling = function () {
          return clearInterval(this.trickleInterval), this.trickleInterval = null;
        }, e.prototype.trickle = function () {
          return this.setValue(this.value + Math.random() / 100);
        }, e.prototype.refresh = function () {
          return requestAnimationFrame(function (t) {
            return function () {
              return t.progressElement.style.width = 10 + 90 * t.value + "%";
            };
          }(this));
        }, e.prototype.createStylesheetElement = function () {
          var t;
          return t = document.createElement("style"), t.type = "text/css", t.textContent = this.constructor.defaultCSS, t;
        }, e.prototype.createProgressElement = function () {
          var t;
          return t = document.createElement("div"), t.className = "turbolinks-progress-bar", t;
        }, e;
      }();
    }.call(this), function () {
      var t = function (t, e) {
        return function () {
          return t.apply(e, arguments);
        };
      };
      e.BrowserAdapter = function () {
        function r(r) {
          this.controller = r, this.showProgressBar = t(this.showProgressBar, this), this.progressBar = new e.ProgressBar();
        }
        var n, o, i;
        return i = e.HttpRequest, n = i.NETWORK_FAILURE, o = i.TIMEOUT_FAILURE, r.prototype.visitProposedToLocationWithAction = function (t, e) {
          return this.controller.startVisitToLocationWithAction(t, e);
        }, r.prototype.visitStarted = function (t) {
          return t.issueRequest(), t.changeHistory(), t.loadCachedSnapshot();
        }, r.prototype.visitRequestStarted = function (t) {
          return this.progressBar.setValue(0), t.hasCachedSnapshot() || "restore" !== t.action ? this.showProgressBarAfterDelay() : this.showProgressBar();
        }, r.prototype.visitRequestProgressed = function (t) {
          return this.progressBar.setValue(t.progress);
        }, r.prototype.visitRequestCompleted = function (t) {
          return t.loadResponse();
        }, r.prototype.visitRequestFailedWithStatusCode = function (t, e) {
          switch (e) {
            case n:
            case o:
              return this.reload();
            default:
              return t.loadResponse();
          }
        }, r.prototype.visitRequestFinished = function (t) {
          return this.hideProgressBar();
        }, r.prototype.visitCompleted = function (t) {
          return t.followRedirect();
        }, r.prototype.pageInvalidated = function () {
          return this.reload();
        }, r.prototype.showProgressBarAfterDelay = function () {
          return this.progressBarTimeout = setTimeout(this.showProgressBar, this.controller.progressBarDelay);
        }, r.prototype.showProgressBar = function () {
          return this.progressBar.show();
        }, r.prototype.hideProgressBar = function () {
          return this.progressBar.hide(), clearTimeout(this.progressBarTimeout);
        }, r.prototype.reload = function () {
          return window.location.reload();
        }, r;
      }();
    }.call(this), function () {
      var t = function (t, e) {
        return function () {
          return t.apply(e, arguments);
        };
      };
      e.History = function () {
        function r(e) {
          this.delegate = e, this.onPageLoad = t(this.onPageLoad, this), this.onPopState = t(this.onPopState, this);
        }
        return r.prototype.start = function () {
          return this.started ? void 0 : (addEventListener("popstate", this.onPopState, !1), addEventListener("load", this.onPageLoad, !1), this.started = !0);
        }, r.prototype.stop = function () {
          return this.started ? (removeEventListener("popstate", this.onPopState, !1), removeEventListener("load", this.onPageLoad, !1), this.started = !1) : void 0;
        }, r.prototype.push = function (t, r) {
          return t = e.Location.wrap(t), this.update("push", t, r);
        }, r.prototype.replace = function (t, r) {
          return t = e.Location.wrap(t), this.update("replace", t, r);
        }, r.prototype.onPopState = function (t) {
          var r, n, o, i;
          return this.shouldHandlePopState() && (i = null != (n = t.state) ? n.turbolinks : void 0) ? (r = e.Location.wrap(window.location), o = i.restorationIdentifier, this.delegate.historyPoppedToLocationWithRestorationIdentifier(r, o)) : void 0;
        }, r.prototype.onPageLoad = function (t) {
          return e.defer(function (t) {
            return function () {
              return t.pageLoaded = !0;
            };
          }(this));
        }, r.prototype.shouldHandlePopState = function () {
          return this.pageIsLoaded();
        }, r.prototype.pageIsLoaded = function () {
          return this.pageLoaded || "complete" === document.readyState;
        }, r.prototype.update = function (t, e, r) {
          var n;
          return n = {
            turbolinks: {
              restorationIdentifier: r
            }
          }, history[t + "State"](n, null, e);
        }, r;
      }();
    }.call(this), function () {
      e.HeadDetails = function () {
        function t(t) {
          var e, r, n, s, a, u;
          for (this.elements = {}, n = 0, a = t.length; a > n; n++) u = t[n], u.nodeType === Node.ELEMENT_NODE && (s = u.outerHTML, r = null != (e = this.elements)[s] ? e[s] : e[s] = {
            type: i(u),
            tracked: o(u),
            elements: []
          }, r.elements.push(u));
        }
        var e, r, n, o, i;
        return t.fromHeadElement = function (t) {
          var e;
          return new this(null != (e = null != t ? t.childNodes : void 0) ? e : []);
        }, t.prototype.hasElementWithKey = function (t) {
          return t in this.elements;
        }, t.prototype.getTrackedElementSignature = function () {
          var t, e;
          return function () {
            var r, n;
            r = this.elements, n = [];
            for (t in r) e = r[t].tracked, e && n.push(t);
            return n;
          }.call(this).join("");
        }, t.prototype.getScriptElementsNotInDetails = function (t) {
          return this.getElementsMatchingTypeNotInDetails("script", t);
        }, t.prototype.getStylesheetElementsNotInDetails = function (t) {
          return this.getElementsMatchingTypeNotInDetails("stylesheet", t);
        }, t.prototype.getElementsMatchingTypeNotInDetails = function (t, e) {
          var r, n, o, i, s, a;
          o = this.elements, s = [];
          for (n in o) i = o[n], a = i.type, r = i.elements, a !== t || e.hasElementWithKey(n) || s.push(r[0]);
          return s;
        }, t.prototype.getProvisionalElements = function () {
          var t, e, r, n, o, i, s;
          r = [], n = this.elements;
          for (e in n) o = n[e], s = o.type, i = o.tracked, t = o.elements, null != s || i ? t.length > 1 && r.push.apply(r, t.slice(1)) : r.push.apply(r, t);
          return r;
        }, t.prototype.getMetaValue = function (t) {
          var e;
          return null != (e = this.findMetaElementByName(t)) ? e.getAttribute("content") : void 0;
        }, t.prototype.findMetaElementByName = function (t) {
          var r, n, o, i;
          r = void 0, i = this.elements;
          for (o in i) n = i[o].elements, e(n[0], t) && (r = n[0]);
          return r;
        }, i = function (t) {
          return r(t) ? "script" : n(t) ? "stylesheet" : void 0;
        }, o = function (t) {
          return "reload" === t.getAttribute("data-turbolinks-track");
        }, r = function (t) {
          var e;
          return e = t.tagName.toLowerCase(), "script" === e;
        }, n = function (t) {
          var e;
          return e = t.tagName.toLowerCase(), "style" === e || "link" === e && "stylesheet" === t.getAttribute("rel");
        }, e = function (t, e) {
          var r;
          return r = t.tagName.toLowerCase(), "meta" === r && t.getAttribute("name") === e;
        }, t;
      }();
    }.call(this), function () {
      e.Snapshot = function () {
        function t(t, e) {
          this.headDetails = t, this.bodyElement = e;
        }
        return t.wrap = function (t) {
          return t instanceof this ? t : "string" == typeof t ? this.fromHTMLString(t) : this.fromHTMLElement(t);
        }, t.fromHTMLString = function (t) {
          var e;
          return e = document.createElement("html"), e.innerHTML = t, this.fromHTMLElement(e);
        }, t.fromHTMLElement = function (t) {
          var r, n, o, i;
          return o = t.querySelector("head"), r = null != (i = t.querySelector("body")) ? i : document.createElement("body"), n = e.HeadDetails.fromHeadElement(o), new this(n, r);
        }, t.prototype.clone = function () {
          return new this.constructor(this.headDetails, this.bodyElement.cloneNode(!0));
        }, t.prototype.getRootLocation = function () {
          var t, r;
          return r = null != (t = this.getSetting("root")) ? t : "/", new e.Location(r);
        }, t.prototype.getCacheControlValue = function () {
          return this.getSetting("cache-control");
        }, t.prototype.getElementForAnchor = function (t) {
          try {
            return this.bodyElement.querySelector("[id='" + t + "'], a[name='" + t + "']");
          } catch (e) {}
        }, t.prototype.getPermanentElements = function () {
          return this.bodyElement.querySelectorAll("[id][data-turbolinks-permanent]");
        }, t.prototype.getPermanentElementById = function (t) {
          return this.bodyElement.querySelector("#" + t + "[data-turbolinks-permanent]");
        }, t.prototype.getPermanentElementsPresentInSnapshot = function (t) {
          var e, r, n, o, i;
          for (o = this.getPermanentElements(), i = [], r = 0, n = o.length; n > r; r++) e = o[r], t.getPermanentElementById(e.id) && i.push(e);
          return i;
        }, t.prototype.findFirstAutofocusableElement = function () {
          return this.bodyElement.querySelector("[autofocus]");
        }, t.prototype.hasAnchor = function (t) {
          return null != this.getElementForAnchor(t);
        }, t.prototype.isPreviewable = function () {
          return "no-preview" !== this.getCacheControlValue();
        }, t.prototype.isCacheable = function () {
          return "no-cache" !== this.getCacheControlValue();
        }, t.prototype.isVisitable = function () {
          return "reload" !== this.getSetting("visit-control");
        }, t.prototype.getSetting = function (t) {
          return this.headDetails.getMetaValue("turbolinks-" + t);
        }, t;
      }();
    }.call(this), function () {
      var t = [].slice;
      e.Renderer = function () {
        function e() {}
        var r;
        return e.render = function () {
          var e, r, n, o;
          return n = arguments[0], r = arguments[1], e = 3 <= arguments.length ? t.call(arguments, 2) : [], o = function (t, e, r) {
            r.prototype = t.prototype;
            var n = new r(),
              o = t.apply(n, e);
            return Object(o) === o ? o : n;
          }(this, e, function () {}), o.delegate = n, o.render(r), o;
        }, e.prototype.renderView = function (t) {
          return this.delegate.viewWillRender(this.newBody), t(), this.delegate.viewRendered(this.newBody);
        }, e.prototype.invalidateView = function () {
          return this.delegate.viewInvalidated();
        }, e.prototype.createScriptElement = function (t) {
          var e;
          return "false" === t.getAttribute("data-turbolinks-eval") ? t : (e = document.createElement("script"), e.textContent = t.textContent, e.async = !1, r(e, t), e);
        }, r = function (t, e) {
          var r, n, o, i, s, a, u;
          for (i = e.attributes, a = [], r = 0, n = i.length; n > r; r++) s = i[r], o = s.name, u = s.value, a.push(t.setAttribute(o, u));
          return a;
        }, e;
      }();
    }.call(this), function () {
      var t,
        r,
        n = function (t, e) {
          function r() {
            this.constructor = t;
          }
          for (var n in e) o.call(e, n) && (t[n] = e[n]);
          return r.prototype = e.prototype, t.prototype = new r(), t.__super__ = e.prototype, t;
        },
        o = {}.hasOwnProperty;
      e.SnapshotRenderer = function (e) {
        function o(t, e, r) {
          this.currentSnapshot = t, this.newSnapshot = e, this.isPreview = r, this.currentHeadDetails = this.currentSnapshot.headDetails, this.newHeadDetails = this.newSnapshot.headDetails, this.currentBody = this.currentSnapshot.bodyElement, this.newBody = this.newSnapshot.bodyElement;
        }
        return n(o, e), o.prototype.render = function (t) {
          return this.shouldRender() ? (this.mergeHead(), this.renderView(function (e) {
            return function () {
              return e.replaceBody(), e.isPreview || e.focusFirstAutofocusableElement(), t();
            };
          }(this))) : this.invalidateView();
        }, o.prototype.mergeHead = function () {
          return this.copyNewHeadStylesheetElements(), this.copyNewHeadScriptElements(), this.removeCurrentHeadProvisionalElements(), this.copyNewHeadProvisionalElements();
        }, o.prototype.replaceBody = function () {
          var t;
          return t = this.relocateCurrentBodyPermanentElements(), this.activateNewBodyScriptElements(), this.assignNewBody(), this.replacePlaceholderElementsWithClonedPermanentElements(t);
        }, o.prototype.shouldRender = function () {
          return this.newSnapshot.isVisitable() && this.trackedElementsAreIdentical();
        }, o.prototype.trackedElementsAreIdentical = function () {
          return this.currentHeadDetails.getTrackedElementSignature() === this.newHeadDetails.getTrackedElementSignature();
        }, o.prototype.copyNewHeadStylesheetElements = function () {
          var t, e, r, n, o;
          for (n = this.getNewHeadStylesheetElements(), o = [], e = 0, r = n.length; r > e; e++) t = n[e], o.push(document.head.appendChild(t));
          return o;
        }, o.prototype.copyNewHeadScriptElements = function () {
          var t, e, r, n, o;
          for (n = this.getNewHeadScriptElements(), o = [], e = 0, r = n.length; r > e; e++) t = n[e], o.push(document.head.appendChild(this.createScriptElement(t)));
          return o;
        }, o.prototype.removeCurrentHeadProvisionalElements = function () {
          var t, e, r, n, o;
          for (n = this.getCurrentHeadProvisionalElements(), o = [], e = 0, r = n.length; r > e; e++) t = n[e], o.push(document.head.removeChild(t));
          return o;
        }, o.prototype.copyNewHeadProvisionalElements = function () {
          var t, e, r, n, o;
          for (n = this.getNewHeadProvisionalElements(), o = [], e = 0, r = n.length; r > e; e++) t = n[e], o.push(document.head.appendChild(t));
          return o;
        }, o.prototype.relocateCurrentBodyPermanentElements = function () {
          var e, n, o, i, s, a, u;
          for (a = this.getCurrentBodyPermanentElements(), u = [], e = 0, n = a.length; n > e; e++) i = a[e], s = t(i), o = this.newSnapshot.getPermanentElementById(i.id), r(i, s.element), r(o, i), u.push(s);
          return u;
        }, o.prototype.replacePlaceholderElementsWithClonedPermanentElements = function (t) {
          var e, n, o, i, s, a, u;
          for (u = [], o = 0, i = t.length; i > o; o++) a = t[o], n = a.element, s = a.permanentElement, e = s.cloneNode(!0), u.push(r(n, e));
          return u;
        }, o.prototype.activateNewBodyScriptElements = function () {
          var t, e, n, o, i, s;
          for (i = this.getNewBodyScriptElements(), s = [], e = 0, o = i.length; o > e; e++) n = i[e], t = this.createScriptElement(n), s.push(r(n, t));
          return s;
        }, o.prototype.assignNewBody = function () {
          return document.body = this.newBody;
        }, o.prototype.focusFirstAutofocusableElement = function () {
          var t;
          return null != (t = this.newSnapshot.findFirstAutofocusableElement()) ? t.focus() : void 0;
        }, o.prototype.getNewHeadStylesheetElements = function () {
          return this.newHeadDetails.getStylesheetElementsNotInDetails(this.currentHeadDetails);
        }, o.prototype.getNewHeadScriptElements = function () {
          return this.newHeadDetails.getScriptElementsNotInDetails(this.currentHeadDetails);
        }, o.prototype.getCurrentHeadProvisionalElements = function () {
          return this.currentHeadDetails.getProvisionalElements();
        }, o.prototype.getNewHeadProvisionalElements = function () {
          return this.newHeadDetails.getProvisionalElements();
        }, o.prototype.getCurrentBodyPermanentElements = function () {
          return this.currentSnapshot.getPermanentElementsPresentInSnapshot(this.newSnapshot);
        }, o.prototype.getNewBodyScriptElements = function () {
          return this.newBody.querySelectorAll("script");
        }, o;
      }(e.Renderer), t = function (t) {
        var e;
        return e = document.createElement("meta"), e.setAttribute("name", "turbolinks-permanent-placeholder"), e.setAttribute("content", t.id), {
          element: e,
          permanentElement: t
        };
      }, r = function (t, e) {
        var r;
        return (r = t.parentNode) ? r.replaceChild(e, t) : void 0;
      };
    }.call(this), function () {
      var t = function (t, e) {
          function n() {
            this.constructor = t;
          }
          for (var o in e) r.call(e, o) && (t[o] = e[o]);
          return n.prototype = e.prototype, t.prototype = new n(), t.__super__ = e.prototype, t;
        },
        r = {}.hasOwnProperty;
      e.ErrorRenderer = function (e) {
        function r(t) {
          var e;
          e = document.createElement("html"), e.innerHTML = t, this.newHead = e.querySelector("head"), this.newBody = e.querySelector("body");
        }
        return t(r, e), r.prototype.render = function (t) {
          return this.renderView(function (e) {
            return function () {
              return e.replaceHeadAndBody(), e.activateBodyScriptElements(), t();
            };
          }(this));
        }, r.prototype.replaceHeadAndBody = function () {
          var t, e;
          return e = document.head, t = document.body, e.parentNode.replaceChild(this.newHead, e), t.parentNode.replaceChild(this.newBody, t);
        }, r.prototype.activateBodyScriptElements = function () {
          var t, e, r, n, o, i;
          for (n = this.getScriptElements(), i = [], e = 0, r = n.length; r > e; e++) o = n[e], t = this.createScriptElement(o), i.push(o.parentNode.replaceChild(t, o));
          return i;
        }, r.prototype.getScriptElements = function () {
          return document.documentElement.querySelectorAll("script");
        }, r;
      }(e.Renderer);
    }.call(this), function () {
      e.View = function () {
        function t(t) {
          this.delegate = t, this.htmlElement = document.documentElement;
        }
        return t.prototype.getRootLocation = function () {
          return this.getSnapshot().getRootLocation();
        }, t.prototype.getElementForAnchor = function (t) {
          return this.getSnapshot().getElementForAnchor(t);
        }, t.prototype.getSnapshot = function () {
          return e.Snapshot.fromHTMLElement(this.htmlElement);
        }, t.prototype.render = function (t, e) {
          var r, n, o;
          return o = t.snapshot, r = t.error, n = t.isPreview, this.markAsPreview(n), null != o ? this.renderSnapshot(o, n, e) : this.renderError(r, e);
        }, t.prototype.markAsPreview = function (t) {
          return t ? this.htmlElement.setAttribute("data-turbolinks-preview", "") : this.htmlElement.removeAttribute("data-turbolinks-preview");
        }, t.prototype.renderSnapshot = function (t, r, n) {
          return e.SnapshotRenderer.render(this.delegate, n, this.getSnapshot(), e.Snapshot.wrap(t), r);
        }, t.prototype.renderError = function (t, r) {
          return e.ErrorRenderer.render(this.delegate, r, t);
        }, t;
      }();
    }.call(this), function () {
      var t = function (t, e) {
        return function () {
          return t.apply(e, arguments);
        };
      };
      e.ScrollManager = function () {
        function r(r) {
          this.delegate = r, this.onScroll = t(this.onScroll, this), this.onScroll = e.throttle(this.onScroll);
        }
        return r.prototype.start = function () {
          return this.started ? void 0 : (addEventListener("scroll", this.onScroll, !1), this.onScroll(), this.started = !0);
        }, r.prototype.stop = function () {
          return this.started ? (removeEventListener("scroll", this.onScroll, !1), this.started = !1) : void 0;
        }, r.prototype.scrollToElement = function (t) {
          return t.scrollIntoView();
        }, r.prototype.scrollToPosition = function (t) {
          var e, r;
          return e = t.x, r = t.y, window.scrollTo(e, r);
        }, r.prototype.onScroll = function (t) {
          return this.updatePosition({
            x: window.pageXOffset,
            y: window.pageYOffset
          });
        }, r.prototype.updatePosition = function (t) {
          var e;
          return this.position = t, null != (e = this.delegate) ? e.scrollPositionChanged(this.position) : void 0;
        }, r;
      }();
    }.call(this), function () {
      e.SnapshotCache = function () {
        function t(t) {
          this.size = t, this.keys = [], this.snapshots = {};
        }
        var r;
        return t.prototype.has = function (t) {
          var e;
          return e = r(t), e in this.snapshots;
        }, t.prototype.get = function (t) {
          var e;
          if (this.has(t)) return e = this.read(t), this.touch(t), e;
        }, t.prototype.put = function (t, e) {
          return this.write(t, e), this.touch(t), e;
        }, t.prototype.read = function (t) {
          var e;
          return e = r(t), this.snapshots[e];
        }, t.prototype.write = function (t, e) {
          var n;
          return n = r(t), this.snapshots[n] = e;
        }, t.prototype.touch = function (t) {
          var e, n;
          return n = r(t), e = this.keys.indexOf(n), e > -1 && this.keys.splice(e, 1), this.keys.unshift(n), this.trim();
        }, t.prototype.trim = function () {
          var t, e, r, n, o;
          for (n = this.keys.splice(this.size), o = [], t = 0, r = n.length; r > t; t++) e = n[t], o.push(delete this.snapshots[e]);
          return o;
        }, r = function (t) {
          return e.Location.wrap(t).toCacheKey();
        }, t;
      }();
    }.call(this), function () {
      var t = function (t, e) {
        return function () {
          return t.apply(e, arguments);
        };
      };
      e.Visit = function () {
        function r(r, n, o) {
          this.controller = r, this.action = o, this.performScroll = t(this.performScroll, this), this.identifier = e.uuid(), this.location = e.Location.wrap(n), this.adapter = this.controller.adapter, this.state = "initialized", this.timingMetrics = {};
        }
        var n;
        return r.prototype.start = function () {
          return "initialized" === this.state ? (this.recordTimingMetric("visitStart"), this.state = "started", this.adapter.visitStarted(this)) : void 0;
        }, r.prototype.cancel = function () {
          var t;
          return "started" === this.state ? (null != (t = this.request) && t.cancel(), this.cancelRender(), this.state = "canceled") : void 0;
        }, r.prototype.complete = function () {
          var t;
          return "started" === this.state ? (this.recordTimingMetric("visitEnd"), this.state = "completed", "function" == typeof (t = this.adapter).visitCompleted && t.visitCompleted(this), this.controller.visitCompleted(this)) : void 0;
        }, r.prototype.fail = function () {
          var t;
          return "started" === this.state ? (this.state = "failed", "function" == typeof (t = this.adapter).visitFailed ? t.visitFailed(this) : void 0) : void 0;
        }, r.prototype.changeHistory = function () {
          var t, e;
          return this.historyChanged ? void 0 : (t = this.location.isEqualTo(this.referrer) ? "replace" : this.action, e = n(t), this.controller[e](this.location, this.restorationIdentifier), this.historyChanged = !0);
        }, r.prototype.issueRequest = function () {
          return this.shouldIssueRequest() && null == this.request ? (this.progress = 0, this.request = new e.HttpRequest(this, this.location, this.referrer), this.request.send()) : void 0;
        }, r.prototype.getCachedSnapshot = function () {
          var t;
          return !(t = this.controller.getCachedSnapshotForLocation(this.location)) || null != this.location.anchor && !t.hasAnchor(this.location.anchor) || "restore" !== this.action && !t.isPreviewable() ? void 0 : t;
        }, r.prototype.hasCachedSnapshot = function () {
          return null != this.getCachedSnapshot();
        }, r.prototype.loadCachedSnapshot = function () {
          var t, e;
          return (e = this.getCachedSnapshot()) ? (t = this.shouldIssueRequest(), this.render(function () {
            var r;
            return this.cacheSnapshot(), this.controller.render({
              snapshot: e,
              isPreview: t
            }, this.performScroll), "function" == typeof (r = this.adapter).visitRendered && r.visitRendered(this), t ? void 0 : this.complete();
          })) : void 0;
        }, r.prototype.loadResponse = function () {
          return null != this.response ? this.render(function () {
            var t, e;
            return this.cacheSnapshot(), this.request.failed ? (this.controller.render({
              error: this.response
            }, this.performScroll), "function" == typeof (t = this.adapter).visitRendered && t.visitRendered(this), this.fail()) : (this.controller.render({
              snapshot: this.response
            }, this.performScroll), "function" == typeof (e = this.adapter).visitRendered && e.visitRendered(this), this.complete());
          }) : void 0;
        }, r.prototype.followRedirect = function () {
          return this.redirectedToLocation && !this.followedRedirect ? (this.location = this.redirectedToLocation, this.controller.replaceHistoryWithLocationAndRestorationIdentifier(this.redirectedToLocation, this.restorationIdentifier), this.followedRedirect = !0) : void 0;
        }, r.prototype.requestStarted = function () {
          var t;
          return this.recordTimingMetric("requestStart"), "function" == typeof (t = this.adapter).visitRequestStarted ? t.visitRequestStarted(this) : void 0;
        }, r.prototype.requestProgressed = function (t) {
          var e;
          return this.progress = t, "function" == typeof (e = this.adapter).visitRequestProgressed ? e.visitRequestProgressed(this) : void 0;
        }, r.prototype.requestCompletedWithResponse = function (t, r) {
          return this.response = t, null != r && (this.redirectedToLocation = e.Location.wrap(r)), this.adapter.visitRequestCompleted(this);
        }, r.prototype.requestFailedWithStatusCode = function (t, e) {
          return this.response = e, this.adapter.visitRequestFailedWithStatusCode(this, t);
        }, r.prototype.requestFinished = function () {
          var t;
          return this.recordTimingMetric("requestEnd"), "function" == typeof (t = this.adapter).visitRequestFinished ? t.visitRequestFinished(this) : void 0;
        }, r.prototype.performScroll = function () {
          return this.scrolled ? void 0 : ("restore" === this.action ? this.scrollToRestoredPosition() || this.scrollToTop() : this.scrollToAnchor() || this.scrollToTop(), this.scrolled = !0);
        }, r.prototype.scrollToRestoredPosition = function () {
          var t, e;
          return t = null != (e = this.restorationData) ? e.scrollPosition : void 0, null != t ? (this.controller.scrollToPosition(t), !0) : void 0;
        }, r.prototype.scrollToAnchor = function () {
          return null != this.location.anchor ? (this.controller.scrollToAnchor(this.location.anchor), !0) : void 0;
        }, r.prototype.scrollToTop = function () {
          return this.controller.scrollToPosition({
            x: 0,
            y: 0
          });
        }, r.prototype.recordTimingMetric = function (t) {
          var e;
          return null != (e = this.timingMetrics)[t] ? e[t] : e[t] = new Date().getTime();
        }, r.prototype.getTimingMetrics = function () {
          return e.copyObject(this.timingMetrics);
        }, n = function (t) {
          switch (t) {
            case "replace":
              return "replaceHistoryWithLocationAndRestorationIdentifier";
            case "advance":
            case "restore":
              return "pushHistoryWithLocationAndRestorationIdentifier";
          }
        }, r.prototype.shouldIssueRequest = function () {
          return "restore" === this.action ? !this.hasCachedSnapshot() : !0;
        }, r.prototype.cacheSnapshot = function () {
          return this.snapshotCached ? void 0 : (this.controller.cacheSnapshot(), this.snapshotCached = !0);
        }, r.prototype.render = function (t) {
          return this.cancelRender(), this.frame = requestAnimationFrame(function (e) {
            return function () {
              return e.frame = null, t.call(e);
            };
          }(this));
        }, r.prototype.cancelRender = function () {
          return this.frame ? cancelAnimationFrame(this.frame) : void 0;
        }, r;
      }();
    }.call(this), function () {
      var t = function (t, e) {
        return function () {
          return t.apply(e, arguments);
        };
      };
      e.Controller = function () {
        function r() {
          this.clickBubbled = t(this.clickBubbled, this), this.clickCaptured = t(this.clickCaptured, this), this.pageLoaded = t(this.pageLoaded, this), this.history = new e.History(this), this.view = new e.View(this), this.scrollManager = new e.ScrollManager(this), this.restorationData = {}, this.clearCache(), this.setProgressBarDelay(500);
        }
        return r.prototype.start = function () {
          return e.supported && !this.started ? (addEventListener("click", this.clickCaptured, !0), addEventListener("DOMContentLoaded", this.pageLoaded, !1), this.scrollManager.start(), this.startHistory(), this.started = !0, this.enabled = !0) : void 0;
        }, r.prototype.disable = function () {
          return this.enabled = !1;
        }, r.prototype.stop = function () {
          return this.started ? (removeEventListener("click", this.clickCaptured, !0), removeEventListener("DOMContentLoaded", this.pageLoaded, !1), this.scrollManager.stop(), this.stopHistory(), this.started = !1) : void 0;
        }, r.prototype.clearCache = function () {
          return this.cache = new e.SnapshotCache(10);
        }, r.prototype.visit = function (t, r) {
          var n, o;
          return null == r && (r = {}), t = e.Location.wrap(t), this.applicationAllowsVisitingLocation(t) ? this.locationIsVisitable(t) ? (n = null != (o = r.action) ? o : "advance", this.adapter.visitProposedToLocationWithAction(t, n)) : window.location = t : void 0;
        }, r.prototype.startVisitToLocationWithAction = function (t, r, n) {
          var o;
          return e.supported ? (o = this.getRestorationDataForIdentifier(n), this.startVisit(t, r, {
            restorationData: o
          })) : window.location = t;
        }, r.prototype.setProgressBarDelay = function (t) {
          return this.progressBarDelay = t;
        }, r.prototype.startHistory = function () {
          return this.location = e.Location.wrap(window.location), this.restorationIdentifier = e.uuid(), this.history.start(), this.history.replace(this.location, this.restorationIdentifier);
        }, r.prototype.stopHistory = function () {
          return this.history.stop();
        }, r.prototype.pushHistoryWithLocationAndRestorationIdentifier = function (t, r) {
          return this.restorationIdentifier = r, this.location = e.Location.wrap(t), this.history.push(this.location, this.restorationIdentifier);
        }, r.prototype.replaceHistoryWithLocationAndRestorationIdentifier = function (t, r) {
          return this.restorationIdentifier = r, this.location = e.Location.wrap(t), this.history.replace(this.location, this.restorationIdentifier);
        }, r.prototype.historyPoppedToLocationWithRestorationIdentifier = function (t, r) {
          var n;
          return this.restorationIdentifier = r, this.enabled ? (n = this.getRestorationDataForIdentifier(this.restorationIdentifier), this.startVisit(t, "restore", {
            restorationIdentifier: this.restorationIdentifier,
            restorationData: n,
            historyChanged: !0
          }), this.location = e.Location.wrap(t)) : this.adapter.pageInvalidated();
        }, r.prototype.getCachedSnapshotForLocation = function (t) {
          var e;
          return null != (e = this.cache.get(t)) ? e.clone() : void 0;
        }, r.prototype.shouldCacheSnapshot = function () {
          return this.view.getSnapshot().isCacheable();
        }, r.prototype.cacheSnapshot = function () {
          var t, r;
          return this.shouldCacheSnapshot() ? (this.notifyApplicationBeforeCachingSnapshot(), r = this.view.getSnapshot(), t = this.lastRenderedLocation, e.defer(function (e) {
            return function () {
              return e.cache.put(t, r.clone());
            };
          }(this))) : void 0;
        }, r.prototype.scrollToAnchor = function (t) {
          var e;
          return (e = this.view.getElementForAnchor(t)) ? this.scrollToElement(e) : this.scrollToPosition({
            x: 0,
            y: 0
          });
        }, r.prototype.scrollToElement = function (t) {
          return this.scrollManager.scrollToElement(t);
        }, r.prototype.scrollToPosition = function (t) {
          return this.scrollManager.scrollToPosition(t);
        }, r.prototype.scrollPositionChanged = function (t) {
          var e;
          return e = this.getCurrentRestorationData(), e.scrollPosition = t;
        }, r.prototype.render = function (t, e) {
          return this.view.render(t, e);
        }, r.prototype.viewInvalidated = function () {
          return this.adapter.pageInvalidated();
        }, r.prototype.viewWillRender = function (t) {
          return this.notifyApplicationBeforeRender(t);
        }, r.prototype.viewRendered = function () {
          return this.lastRenderedLocation = this.currentVisit.location, this.notifyApplicationAfterRender();
        }, r.prototype.pageLoaded = function () {
          return this.lastRenderedLocation = this.location, this.notifyApplicationAfterPageLoad();
        }, r.prototype.clickCaptured = function () {
          return removeEventListener("click", this.clickBubbled, !1), addEventListener("click", this.clickBubbled, !1);
        }, r.prototype.clickBubbled = function (t) {
          var e, r, n;
          return this.enabled && this.clickEventIsSignificant(t) && (r = this.getVisitableLinkForNode(t.target)) && (n = this.getVisitableLocationForLink(r)) && this.applicationAllowsFollowingLinkToLocation(r, n) ? (t.preventDefault(), e = this.getActionForLink(r), this.visit(n, {
            action: e
          })) : void 0;
        }, r.prototype.applicationAllowsFollowingLinkToLocation = function (t, e) {
          var r;
          return r = this.notifyApplicationAfterClickingLinkToLocation(t, e), !r.defaultPrevented;
        }, r.prototype.applicationAllowsVisitingLocation = function (t) {
          var e;
          return e = this.notifyApplicationBeforeVisitingLocation(t), !e.defaultPrevented;
        }, r.prototype.notifyApplicationAfterClickingLinkToLocation = function (t, r) {
          return e.dispatch("turbolinks:click", {
            target: t,
            data: {
              url: r.absoluteURL
            },
            cancelable: !0
          });
        }, r.prototype.notifyApplicationBeforeVisitingLocation = function (t) {
          return e.dispatch("turbolinks:before-visit", {
            data: {
              url: t.absoluteURL
            },
            cancelable: !0
          });
        }, r.prototype.notifyApplicationAfterVisitingLocation = function (t) {
          return e.dispatch("turbolinks:visit", {
            data: {
              url: t.absoluteURL
            }
          });
        }, r.prototype.notifyApplicationBeforeCachingSnapshot = function () {
          return e.dispatch("turbolinks:before-cache");
        }, r.prototype.notifyApplicationBeforeRender = function (t) {
          return e.dispatch("turbolinks:before-render", {
            data: {
              newBody: t
            }
          });
        }, r.prototype.notifyApplicationAfterRender = function () {
          return e.dispatch("turbolinks:render");
        }, r.prototype.notifyApplicationAfterPageLoad = function (t) {
          return null == t && (t = {}), e.dispatch("turbolinks:load", {
            data: {
              url: this.location.absoluteURL,
              timing: t
            }
          });
        }, r.prototype.startVisit = function (t, e, r) {
          var n;
          return null != (n = this.currentVisit) && n.cancel(), this.currentVisit = this.createVisit(t, e, r), this.currentVisit.start(), this.notifyApplicationAfterVisitingLocation(t);
        }, r.prototype.createVisit = function (t, r, n) {
          var o, i, s, a, u;
          return i = null != n ? n : {}, a = i.restorationIdentifier, s = i.restorationData, o = i.historyChanged, u = new e.Visit(this, t, r), u.restorationIdentifier = null != a ? a : e.uuid(), u.restorationData = e.copyObject(s), u.historyChanged = o, u.referrer = this.location, u;
        }, r.prototype.visitCompleted = function (t) {
          return this.notifyApplicationAfterPageLoad(t.getTimingMetrics());
        }, r.prototype.clickEventIsSignificant = function (t) {
          return !(t.defaultPrevented || t.target.isContentEditable || t.which > 1 || t.altKey || t.ctrlKey || t.metaKey || t.shiftKey);
        }, r.prototype.getVisitableLinkForNode = function (t) {
          return this.nodeIsVisitable(t) ? e.closest(t, "a[href]:not([target]):not([download])") : void 0;
        }, r.prototype.getVisitableLocationForLink = function (t) {
          var r;
          return r = new e.Location(t.getAttribute("href")), this.locationIsVisitable(r) ? r : void 0;
        }, r.prototype.getActionForLink = function (t) {
          var e;
          return null != (e = t.getAttribute("data-turbolinks-action")) ? e : "advance";
        }, r.prototype.nodeIsVisitable = function (t) {
          var r;
          return (r = e.closest(t, "[data-turbolinks]")) ? "false" !== r.getAttribute("data-turbolinks") : !0;
        }, r.prototype.locationIsVisitable = function (t) {
          return t.isPrefixedBy(this.view.getRootLocation()) && t.isHTML();
        }, r.prototype.getCurrentRestorationData = function () {
          return this.getRestorationDataForIdentifier(this.restorationIdentifier);
        }, r.prototype.getRestorationDataForIdentifier = function (t) {
          var e;
          return null != (e = this.restorationData)[t] ? e[t] : e[t] = {};
        }, r;
      }();
    }.call(this), function () {
      !function () {
        var t, e;
        if ((t = e = document.currentScript) && !e.hasAttribute("data-turbolinks-suppress-warning")) for (; t = t.parentNode;) if (t === document.body) return console.warn("You are loading Turbolinks from a <script> element inside the <body> element. This is probably not what you meant to do!\n\nLoad your application\u2019s JavaScript bundle inside the <head> element instead. <script> elements in <body> are evaluated with each page change.\n\nFor more information, see: https://github.com/turbolinks/turbolinks#working-with-script-elements\n\n\u2014\u2014\nSuppress this warning by adding a `data-turbolinks-suppress-warning` attribute to: %s", e.outerHTML);
      }();
    }.call(this), function () {
      var t, r, n;
      e.start = function () {
        return r() ? (null == e.controller && (e.controller = t()), e.controller.start()) : void 0;
      }, r = function () {
        return null == window.Turbolinks && (window.Turbolinks = e), n();
      }, t = function () {
        var t;
        return t = new e.Controller(), t.adapter = new e.BrowserAdapter(t), t;
      }, n = function () {
        return window.Turbolinks === e;
      }, n() && e.start();
    }.call(this);
  }).call(this),  true && module.exports ? module.exports = e :  true && !(__WEBPACK_AMD_DEFINE_FACTORY__ = (e),
				__WEBPACK_AMD_DEFINE_RESULT__ = (typeof __WEBPACK_AMD_DEFINE_FACTORY__ === 'function' ?
				(__WEBPACK_AMD_DEFINE_FACTORY__.call(exports, __webpack_require__, exports, module)) :
				__WEBPACK_AMD_DEFINE_FACTORY__),
				__WEBPACK_AMD_DEFINE_RESULT__ !== undefined && (module.exports = __WEBPACK_AMD_DEFINE_RESULT__));
}).call(this);

/***/ })

/******/ });
//# sourceMappingURL=application-91b4f383aba011b8dd6c.js.map