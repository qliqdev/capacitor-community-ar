package com.getcapacitor.plugin.ar

import android.util.Log
import com.getcapacitor.PluginCall
import android.os.Build
import android.os.Handler
import android.widget.Toast
import com.getcapacitor.Bridge
import com.google.ar.core.*

class AR(private val bridge: Bridge) {
    fun echo(value: String): String {
        Log.i("Echo", value)
        return value
    }

    fun start(call: PluginCall): Boolean {
        val session = Session(bridge.context)

        if (!checkIsSupportedDeviceOrFinish()) {
            return false
        }

        val config = Config(session)
        config.updateMode = Config.UpdateMode.LATEST_CAMERA_IMAGE
        config.focusMode = Config.FocusMode.AUTO
        session.configure(config)

        return true
    }

    private fun checkIsSupportedDeviceOrFinish(): Boolean {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.N) {
            Toast.makeText(bridge.context, "ARCore requires Android N or later", Toast.LENGTH_LONG).show()
            return false
        }

        val availability = ArCoreApk.getInstance().checkAvailability(bridge.context)
        if (availability.isTransient) {
            // re-query at 5Hz while compatibility is checked in the background.
            Handler().postDelayed({ checkIsSupportedDeviceOrFinish() }, 200)
        }

        return if (availability.isSupported) {
            true
        } else {
            Toast.makeText(bridge.context, "ARCore is not available on this device", Toast.LENGTH_LONG).show()
            false
        }
    }
}