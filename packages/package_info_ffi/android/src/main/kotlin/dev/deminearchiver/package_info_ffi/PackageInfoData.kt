package dev.deminearchiver.package_info_ffi

import androidx.annotation.Keep

@Suppress("unused")
@Keep
class PackageInfoData(
  val appName: String,
  val packageName: String,
  val version: String,
  val buildNumber: String,
  val buildSignature: String? = null,
  val installerStore: String? = null,
  val installTime: Long,
  val updateTime: Long,
)
