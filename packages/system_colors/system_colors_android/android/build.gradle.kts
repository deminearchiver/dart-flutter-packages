group = "io.github.deminearchiver.system_colors"
version = "1.0-SNAPSHOT"

buildscript {
  val kotlinVersion = "2.2.20"
  repositories {
    google()
    mavenCentral()
  }

  dependencies {
    classpath("com.android.tools.build:gradle:8.11.1")
    classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlinVersion")
  }
}

allprojects {
  repositories {
    google()
    mavenCentral()
  }
}

plugins {
  id("com.android.library")
  id("kotlin-android")
}

android {
  namespace = "io.github.deminearchiver.system_colors"

  compileSdk = 36

  compileOptions {
    sourceCompatibility = JavaVersion.VERSION_17
    targetCompatibility = JavaVersion.VERSION_17
  }

  kotlinOptions {
    jvmTarget = JavaVersion.VERSION_17.toString()
  }

  sourceSets {
    getByName("main") {
      java.srcDirs("src/main/kotlin")
    }
    getByName("test") {
      java.srcDirs("src/test/kotlin")
    }
  }

  defaultConfig {
    minSdk = 24
    consumerProguardFiles("consumer-rules.pro")
  }

  buildTypes {
    getByName("release") {
      isMinifyEnabled = false
    }
  }
}

dependencies {
  implementation("com.google.android.material:material:1.14.0-alpha10")
}
