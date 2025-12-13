package dev.deminearchiver.package_info_ffi

import android.content.Context
import android.content.pm.PackageInfo
import android.content.pm.PackageManager
import android.os.Build
import androidx.annotation.Keep
import java.security.MessageDigest
import java.security.NoSuchAlgorithmException

@Suppress("unused")
@Keep
object PackageInfoPlugin {
  @JvmStatic
  fun getPackageInfo(context: Context): PackageInfoData {
    val packageManager = context.packageManager
    val info = packageManager.getPackageInfo(context.packageName, 0)

    val buildSignature = getBuildSignature(context)

    val installerPackage = getInstallerPackageName(context)

    val installTimeMillis = info.firstInstallTime
    val updateTimeMillis = info.lastUpdateTime

    return PackageInfoData(
      appName = info.applicationInfo?.loadLabel(packageManager)?.toString() ?: "",
      packageName = context.packageName,
      version = info.versionName ?: "",
      buildNumber = getLongVersionCode(info).toString(),
      buildSignature = buildSignature,
      installerStore = installerPackage,
      installTime = installTimeMillis,
      updateTime = updateTimeMillis
    )
  }

  /**
   * Using initiatingPackageName on Android 11 and newer because it can't be changed
   * https://developer.android.com/reference/android/content/pm/InstallSourceInfo#getInitiatingPackageName()
   */
  private fun getInstallerPackageName(context: Context): String? {
    val packageManager = context.packageManager
    val packageName = context.packageName
    return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
      packageManager.getInstallSourceInfo(packageName).initiatingPackageName
    } else {
      @Suppress("DEPRECATION")
      packageManager.getInstallerPackageName(packageName)
    }
  }

  @Suppress("deprecation")
  private fun getLongVersionCode(info: PackageInfo): Long {
    return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
      info.longVersionCode
    } else {
      info.versionCode.toLong()
    }
  }

  @Suppress("deprecation", "PackageManagerGetSignatures")
  private fun getBuildSignature(context: Context): String? {
    return try {
      if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
        val packageInfo = context.packageManager.getPackageInfo(
          context.packageName,
          PackageManager.GET_SIGNING_CERTIFICATES
        )
        val signingInfo = packageInfo.signingInfo ?: return null

        if (signingInfo.hasMultipleSigners()) {
          signatureToSha256(signingInfo.apkContentsSigners.first().toByteArray())
        } else {
          signatureToSha256(signingInfo.signingCertificateHistory.first().toByteArray())
        }
      } else {
        val packageInfo = context.packageManager.getPackageInfo(
          context.packageName,
          PackageManager.GET_SIGNATURES
        )
        val signatures = packageInfo.signatures

        if (signatures.isNullOrEmpty() || signatures.first() == null) {
          null
        } else {
          signatureToSha256(signatures.first().toByteArray())
        }
      }
    } catch (e: PackageManager.NameNotFoundException) {
      null
    } catch (e: NoSuchAlgorithmException) {
      null
    }
  }

  // Credits https://gist.github.com/scottyab/b849701972d57cf9562e
  @Throws(NoSuchAlgorithmException::class)
  private fun signatureToSha256(sig: ByteArray): String {
    val digest = MessageDigest.getInstance("SHA-256")
    digest.update(sig)
    val hashText = digest.digest()
    return bytesToHex(hashText)
  }

  // Credits https://gist.github.com/scottyab/b849701972d57cf9562e
  private fun bytesToHex(bytes: ByteArray): String {
    val hexArray = charArrayOf(
      '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'
    )
    val hexChars = CharArray(bytes.size * 2)
    var v: Int
    for (j in bytes.indices) {
      v = bytes[j].toInt() and 0xFF
      hexChars[j * 2] = hexArray[v ushr 4]
      hexChars[j * 2 + 1] = hexArray[v and 0x0F]
    }
    return String(hexChars)
  }
}
