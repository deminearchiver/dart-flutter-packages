@file:Suppress("unused")

package io.qzz.deminearchiver.system_colors_android

import android.content.Context
import android.content.res.Resources
import androidx.annotation.ColorInt
import androidx.annotation.ColorRes
import androidx.core.content.res.ResourcesCompat


internal object ColorResourceHelper {
    @ColorInt
    internal fun getById(context: Context, @ColorRes id: Int): Int? = if(id == 0) null else try {
        ResourcesCompat.getColor(context.resources, id, context.theme)
    } catch (_: Resources.NotFoundException) {
        null
    }

}


