@file:Suppress("unused")

package io.qzz.deminearchiver.system_colors_android

import android.annotation.SuppressLint
import android.content.Context
import android.content.res.Resources
import androidx.annotation.ColorInt
import androidx.annotation.ColorRes
import androidx.core.content.res.ResourcesCompat
import io.flutter.Log
import java.util.concurrent.ConcurrentHashMap


internal object ColorResourceHelper {
    @ColorInt
    fun getColorById(context: Context, @ColorRes id: Int): Int? {
        return if (id == 0) null
        else try {
            ResourcesCompat.getColor(context.resources, id, context.theme)
        } catch (_: Resources.NotFoundException) {
            null
        }
    }

    private val nameToIdCache = ConcurrentHashMap<String, Int>()

    @ColorInt
    fun getColorByName(context: Context, name: String) = getColorById(
        context,
        nameToIdCache.computeIfAbsent(name) { name ->
            getIdByName(context, name)
        },
    )


    private var classCache: Class<*>? = null

    @SuppressLint("DiscouragedApi")
    @ColorRes
    private fun getIdByName(context: Context, name: String): Int {
        try {
            val clazz = classCache ?: Class.forName($$"android.R$color")
                .also { classCache = it }
            if (clazz != null) {
                val id = clazz.getField(name).getInt(null)
                Log.d(SystemColorsPlugin.TAG, "Resolved @android:color/${name} using reflection: ${id}.")
                return id
            }
        } catch (_: Throwable) {
            // Generated resources class or color resource field is not available at runtime.
        }
        val id = context.resources.getIdentifier(name, "color", "android")
        Log.d(SystemColorsPlugin.TAG, "Resolved @android:color/${name} using inefficient fallback: ${id}.")
        return id
    }
}


