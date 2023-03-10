package com.getcapacitor.plugin.ar

import com.getcapacitor.annotation.CapacitorPlugin
import com.getcapacitor.PluginMethod
import com.getcapacitor.PluginCall
import com.getcapacitor.JSObject
import com.getcapacitor.Plugin

@CapacitorPlugin(name = "AR")
class ARPlugin : Plugin() {
    private var implementation: AR = AR(bridge)

    override fun load() {
        implementation = AR(bridge)
    }

    @PluginMethod
    fun echo(call: PluginCall) {
        val value = call.getString("value")
        val ret = JSObject()
        ret.put("value", implementation.echo(value!!))
        call.resolve(ret)
    }

    @PluginMethod
    fun start(call: PluginCall) {
        val ret = JSObject()
        ret.put("started", implementation.start(call))
        call.resolve(ret)
    }
}