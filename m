Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D04CA0EE4
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 16:29:26 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.16116.1755275361597817319
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 15 Aug 2025 09:29:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fyxgCy6D;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: a-christidis@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57FGTK7t2192216
	for <meta-arago@lists.yoctoproject.org>; Fri, 15 Aug 2025 11:29:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755275360;
	bh=mNDYS4A4wpp3bKtp6PYkDsFVn0mJWeYRRqp5Uou+PRI=;
	h=From:To:CC:Subject:Date;
	b=fyxgCy6Dcj1B7HNPem024X6gY8jIIrlSsT6HiyW/V+4dYLwQQdG1jGowsTdH5YPYk
	 M1VZtaTJwgHEfV7f6714OE2ybL7Y877raVQFDAYpEwRwsApWzcgKRFeNlr/+Lb8FfZ
	 4/rJwcRPcb9s7DXqT/8tk1a+CZPyDCAiwp0zo+GE=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57FGTKt92557018
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 15 Aug 2025 11:29:20 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 15
 Aug 2025 11:29:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 15 Aug 2025 11:29:20 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57FGTK7k1542968;
	Fri, 15 Aug 2025 11:29:20 -0500
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <rs@ti.com>
Subject: [oe-layersetup][master][PATCH v2] configs/arago-scarthgap-*: Introduce meta-flutter config
Date: Fri, 15 Aug 2025 11:29:20 -0500
Message-ID: <20250815162920.181369-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 15 Aug 2025 16:29:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16476

From: Antonios Christidis <a-christidis@ti.com>

Introduce a meta-flutter config. This will enable flutter testing at the
coresdk level.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---

v2: Added missing files
    Files added include:
	bitbake-setup/arago-scarthgap-flutter-config.json
	conf/templates/arago-scarthgap-flutter-config/	
	kas/arago-scarthgap-flutter-config.yml

 .../arago-scarthgap-flutter-config.json       | 147 +++++++++++++++
 .../bblayers.conf.sample                      |  34 ++++
 .../conf-notes.txt                            |  22 +++
 .../conf-summary.txt                          |   1 +
 .../local.conf.sample                         | 175 ++++++++++++++++++
 configs/arago-scarthgap-chromium-config.txt   |   1 +
 configs/arago-scarthgap-config.txt            |   1 +
 configs/arago-scarthgap-flutter-config.txt    |  20 ++
 configs/arago-scarthgap-next-config.txt       |   1 +
 configs/arago-scarthgap-selinux-config.txt    |   1 +
 configs/arago-scarthgap-wip-config.txt        |   1 +
 kas/arago-scarthgap-flutter-config.yml        |  79 ++++++++
 .../arago-scarthgap-chromium-config.xml       |   6 +
 src/configs/arago-scarthgap-config.xml        |   6 +
 .../arago-scarthgap-flutter-config.xml        |  80 ++++++++
 src/configs/arago-scarthgap-next-config.xml   |   6 +
 .../arago-scarthgap-selinux-config.xml        |   6 +
 src/configs/arago-scarthgap-wip-config.xml    |   6 +
 18 files changed, 593 insertions(+)
 create mode 100644 bitbake-setup/arago-scarthgap-flutter-config.json
 create mode 100644 conf/templates/arago-scarthgap-flutter-config/bblayers.conf.sample
 create mode 100644 conf/templates/arago-scarthgap-flutter-config/conf-notes.txt
 create mode 100644 conf/templates/arago-scarthgap-flutter-config/conf-summary.txt
 create mode 100644 conf/templates/arago-scarthgap-flutter-config/local.conf.sample
 create mode 100644 configs/arago-scarthgap-flutter-config.txt
 create mode 100644 kas/arago-scarthgap-flutter-config.yml
 create mode 100644 src/configs/arago-scarthgap-flutter-config.xml

diff --git a/bitbake-setup/arago-scarthgap-flutter-config.json b/bitbake-setup/arago-scarthgap-flutter-config.json
new file mode 100644
index 0000000..fd31ad6
--- /dev/null
+++ b/bitbake-setup/arago-scarthgap-flutter-config.json
@@ -0,0 +1,147 @@
+{
+  "version": "1.0",
+  "description": "Arago reference distribution for scarthgap",
+  "sources": {
+    "oe-layersetup": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
+          }
+        },
+        "rev": "master"
+      },
+      "path": "oe-layersetup"
+    },
+    "bitbake": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/bitbake"
+          }
+        },
+        "rev": "2.8"
+      },
+      "path": "bitbake"
+    },
+    "meta-arago": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-arago"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-arago"
+    },
+    "meta-qt6": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://code.qt.io/yocto/meta-qt6.git"
+          }
+        },
+        "rev": "6.9"
+      },
+      "path": "meta-qt6"
+    },
+    "meta-virtualization": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-virtualization"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-virtualization"
+    },
+    "meta-openembedded": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/meta-openembedded"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-openembedded"
+    },
+    "meta-lts-mixins": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-lts-mixins"
+          }
+        },
+        "rev": "scarthgap/rust"
+      },
+      "path": "meta-lts-mixins"
+    },
+    "meta-ti": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-ti"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-ti"
+    },
+    "meta-arm": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-arm"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-arm"
+    },
+    "meta-clang": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://github.com/kraj/meta-clang"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-clang"
+    },
+    "meta-flutter": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://github.com/meta-flutter/meta-flutter.git"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-flutter"
+    },
+    "oe-core": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/openembedded-core"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "oe-core"
+    }
+  },
+  "configuration": {
+    "bitbake-setup": {
+      "default": {
+        "description": "Default build configuration",
+         "template": "oe-layersetup-arago-scarthgap-flutter-config",
+         "targets": [ "bitbake -k tisdk-default-image" ]
+      }
+    }
+  }
+}
diff --git a/conf/templates/arago-scarthgap-flutter-config/bblayers.conf.sample b/conf/templates/arago-scarthgap-flutter-config/bblayers.conf.sample
new file mode 100644
index 0000000..c5a9753
--- /dev/null
+++ b/conf/templates/arago-scarthgap-flutter-config/bblayers.conf.sample
@@ -0,0 +1,34 @@
+# This template file was created by taking the oe-core/meta/conf/bblayers.conf
+# file and removing the BBLAYERS section at the end.
+
+# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
+# changes incompatibly
+LCONF_VERSION = "5"
+
+BBPATH = "${TOPDIR}"
+BBFILES ?= ""
+
+BBLAYERS ?= " \
+    ##OEROOT##/../meta-arago/meta-arago-distro
+    ##OEROOT##/../meta-arago/meta-arago-extras
+    ##OEROOT##/../meta-arago/meta-arago-test
+    ##OEROOT##/../meta-qt6
+    ##OEROOT##/../meta-virtualization
+    ##OEROOT##/../meta-openembedded/meta-networking
+    ##OEROOT##/../meta-openembedded/meta-python
+    ##OEROOT##/../meta-openembedded/meta-oe
+    ##OEROOT##/../meta-openembedded/meta-gnome
+    ##OEROOT##/../meta-openembedded/meta-filesystems
+    ##OEROOT##/../meta-openembedded/meta-multimedia
+    ##OEROOT##/../meta-lts-mixins
+    ##OEROOT##/../meta-ti/meta-ti-extras
+    ##OEROOT##/../meta-ti/meta-beagle
+    ##OEROOT##/../meta-ti/meta-ti-bsp
+    ##OEROOT##/../meta-arm/meta-arm
+    ##OEROOT##/../meta-arm/meta-arm-toolchain
+    ##OEROOT##/../meta-clang
+    ##OEROOT##/../meta-flutter/.
+    ##OEROOT##/../meta-flutter/meta-flutter-apps
+    ##OEROOT##/../oe-core/meta
+    ##OEROOT##/../oe-layersetup
+"
diff --git a/conf/templates/arago-scarthgap-flutter-config/conf-notes.txt b/conf/templates/arago-scarthgap-flutter-config/conf-notes.txt
new file mode 100644
index 0000000..1880460
--- /dev/null
+++ b/conf/templates/arago-scarthgap-flutter-config/conf-notes.txt
@@ -0,0 +1,22 @@
+
+### Shell environment set up for builds. ###
+
+You can now run 'bitbake <target>'
+
+If you have not set MACHINE in your local.conf you can run
+'MACHINE=xxxxx bitbake <target>'
+
+Common targets are:
+    tisdk-default-image
+    tisdk-base-image
+    tisdk-bootstrap-base-image
+    tisdk-bootstrap-image
+    tisdk-thinlinux-image
+    tisdk-tiny-image
+
+You can also run generated qemu images with a command like 'runqemu qemux86-64'.
+
+Other commonly useful commands are:
+ - 'devtool' and 'recipetool' handle common recipe tasks
+ - 'bitbake-layers' handles common layer tasks
+ - 'oe-pkgdata-util' handles common target package tasks
diff --git a/conf/templates/arago-scarthgap-flutter-config/conf-summary.txt b/conf/templates/arago-scarthgap-flutter-config/conf-summary.txt
new file mode 100644
index 0000000..2f60f0c
--- /dev/null
+++ b/conf/templates/arago-scarthgap-flutter-config/conf-summary.txt
@@ -0,0 +1 @@
+Arago reference distribution for scarthgap
diff --git a/conf/templates/arago-scarthgap-flutter-config/local.conf.sample b/conf/templates/arago-scarthgap-flutter-config/local.conf.sample
new file mode 100644
index 0000000..8ad6f26
--- /dev/null
+++ b/conf/templates/arago-scarthgap-flutter-config/local.conf.sample
@@ -0,0 +1,175 @@
+# CONF_VERSION is increased each time build/conf/ changes incompatibly
+CONF_VERSION = "2"
+
+#
+# Where to place downloads
+#
+# During a first build the system will download many different source code
+# tarballs from various upstream projects. This can take a while, particularly
+# if your network connection is slow. These are all stored in DL_DIR. When
+# wiping and rebuilding you can preserve this directory to speed up this part
+# of subsequent builds. This directory is safe to share between multiple builds
+# on the same machine too.
+DL_DIR = "${TOPDIR}/../downloads"
+
+#
+# Where to place shared-state files
+#
+# BitBake has the capability to accelerate builds based on previously built
+# output. This is done using "shared state" files which can be thought of as
+# cache objects and this option determines where those files are placed.
+#
+# You can wipe out TMPDIR leaving this directory intact and the build would
+# regenerate from these files if no changes were made to the configuration.
+# If changes were made to the configuration, only shared state files where the
+# state was still valid would be used (done using checksums).
+SSTATE_DIR = "${TOPDIR}/sstate-cache"
+
+#
+# Shared-state files from other locations
+#
+# As mentioned above, shared state files are prebuilt cache data objects which
+# can be used to accelerate build time. This variable can be used to configure
+# the system to search other mirror locations for these objects before it
+# builds the data itself.
+#
+# This can be a filesystem directory, or a remote url such as http or ftp.
+# These would contain the sstate-cache results from previous builds (possibly
+# from other machines). This variable works like fetcher MIRRORS/PREMIRRORS
+# and points to the cache locations to check for the shared objects.
+#SSTATE_MIRRORS ?= "\
+#file://.* http://someserver.tld/share/sstate/ \n \
+#file://.* file:///some/local/dir/sstate/"
+
+#
+# Where to place the build output
+#
+# This option specifies where the bulk of the building work should be done and
+# where BitBake should place its temporary files and output. Keep in mind that
+# this includes the extraction and compilation of many applications and the toolchain
+# which can use Gigabytes of hard disk space.
+TMPDIR = "${TOPDIR}/arago-tmp"
+
+# By default, DEPLOY_DIR is inside TMPDIR, but can be changed here to be outside
+#DEPLOY_DIR = "${TOPDIR}/deploy"
+
+#
+# Machine Selection
+#
+# You need to select a specific machine to target the build with. There are a selection
+# of emulated machines available which can boot and run in the QEMU emulator:
+#
+#MACHINE ?= "arago"
+
+#
+# Package Management configuration
+#
+# This variable lists which packaging formats to enable. Multiple package backends
+# can be enabled at once and the first item listed in the variable will be used
+# to generate the root filesystems.
+# Options are:
+#  - 'package_deb' for debian style deb files
+#  - 'package_ipk' for ipk files are used by opkg (a debian style embedded package manager)
+#  - 'package_rpm' for rpm style packages
+# E.g.: PACKAGE_CLASSES ?= "package_rpm package_deb package_ipk"
+# We default to ipk:
+PACKAGE_CLASSES ?= "package_ipk"
+
+#
+# SDK/ADT target architecture
+#
+# This variable specified the architecture to build SDK/ADT items for and means
+# you can build the SDK packages for architectures other than the machine you are
+# running the build on (i.e. building i686 packages on an x86_64 host._
+# Supported values are i686 and x86_64
+SDKMACHINE ?= "x86_64"
+
+#
+# Extra image configuration defaults
+#
+# The EXTRA_IMAGE_FEATURES variable allows extra packages to be added to the generated
+# images. Some of these options are added to certain image types automatically. The
+# variable can contain the following options:
+#  "dbg-pkgs"       - add -dbg packages for all installed packages
+#                     (adds symbol information for debugging/profiling)
+#  "dev-pkgs"       - add -dev packages for all installed packages
+#                     (useful if you want to develop against libs in the image)
+#  "tools-sdk"      - add development tools (gcc, make, pkgconfig etc.)
+#  "tools-debug"    - add debugging tools (gdb, strace)
+#  "tools-profile"  - add profiling tools (oprofile, exmap, lttng valgrind (x86 only))
+#  "tools-testapps" - add useful testing tools (ts_print, aplay, arecord etc.)
+#  "debug-tweaks"   - make an image suitable for development
+#                     e.g. ssh root access has a blank password
+# There are other application targets that can be used here too, see
+# meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.
+# We default to enabling the debugging tweaks.
+EXTRA_IMAGE_FEATURES = "debug-tweaks"
+
+#
+# Additional image features
+#
+# The following is a list of additional classes to use when building images which
+# enable extra features. Some available options which can be included in this variable
+# are:
+#   - 'buildstats' collect build statistics
+#   - 'image-swab' to perform host system intrusion detection
+# NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
+USER_CLASSES ?= "buildstats"
+
+# By default disable interactive patch resolution (tasks will just fail instead):
+PATCHRESOLVE = "noop"
+
+# By default the machine configuration file sets the IMAGE_FSTYPES.  But if you
+# would like to add additional file system types you can uncomment the
+# following line and add the additional IMAGE_FSTYPES you want created
+# as part of the build flow.  Some common types are listed below and you
+# can remove the ones you do not want.
+# IMAGE_FSTYPES += "jffs2 cramfs ext2.gz ext3.gz squashfs ubi tar.gz tar.bz2 cpio"
+
+#
+# Parallelism Options
+#
+# These two options control how much parallelism BitBake should use. The first
+# option determines how many tasks bitbake should run in parallel:
+#
+# BB_NUMBER_THREADS ?= "1"
+#
+# The second option controls how many processes make should run in parallel when
+# running compile tasks:
+#
+# PARALLEL_MAKE ?= "-j 1"
+#
+# For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
+# be appropriate for example
+#
+# NOTE: By default, bitbake will choose the number of processeors on your host
+# so you should not need to set this unless you are wanting to lower the number
+# allowed.
+#
+
+DISTRO   = "arago"
+
+# Set terminal types by default it expects gnome-terminal
+# but we chose xterm
+TERMCMD = "${XTERM_TERMCMD}"
+TERMCMDRUN = "${XTERM_TERMCMDRUN}"
+
+# Don't generate the mirror tarball for SCM repos, the snapshot is enough
+BB_GENERATE_MIRROR_TARBALLS = "0"
+
+# Uncomment this to remove work directory after packaging to save disk space
+#INHERIT += "rm_work"
+
+# Keep one set of images by default
+RM_OLD_IMAGE = "1"
+
+# Enable local PR service for binary feeds
+PRSERV_HOST = "localhost:0"
+
+# Enable hash equiv server
+BB_SIGNATURE_HANDLER = "OEEquivHash"
+BB_HASHSERVE = "auto"
+
+# It is recommended to activate "buildhistory" for testing the PR service
+INHERIT += "buildhistory"
+BUILDHISTORY_COMMIT = "1"
diff --git a/configs/arago-scarthgap-chromium-config.txt b/configs/arago-scarthgap-chromium-config.txt
index d95b9a3..f54363f 100644
--- a/configs/arago-scarthgap-chromium-config.txt
+++ b/configs/arago-scarthgap-chromium-config.txt
@@ -12,6 +12,7 @@ meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rust,a804
 meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,HEAD,layers=meta-arm:meta-arm-toolchain
 meta-clang,https://github.com/kraj/meta-clang,scarthgap,HEAD,layers=
+#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,scarthgap,HEAD,layers=.:meta-flutter-apps
 oe-core,https://git.openembedded.org/openembedded-core,scarthgap,HEAD,layers=meta
 
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
diff --git a/configs/arago-scarthgap-config.txt b/configs/arago-scarthgap-config.txt
index 7cdff80..8d8879d 100644
--- a/configs/arago-scarthgap-config.txt
+++ b/configs/arago-scarthgap-config.txt
@@ -12,6 +12,7 @@ meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rust,a804
 meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,HEAD,layers=meta-arm:meta-arm-toolchain
 meta-clang,https://github.com/kraj/meta-clang,scarthgap,HEAD,layers=
+#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,scarthgap,HEAD,layers=.:meta-flutter-apps
 oe-core,https://git.openembedded.org/openembedded-core,scarthgap,HEAD,layers=meta
 
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
diff --git a/configs/arago-scarthgap-flutter-config.txt b/configs/arago-scarthgap-flutter-config.txt
new file mode 100644
index 0000000..d7f7675
--- /dev/null
+++ b/configs/arago-scarthgap-flutter-config.txt
@@ -0,0 +1,20 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
+meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,27ca52f635a31f5f9762813a8527dd31323549b7,layers=meta-chromium
+#meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
+meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,HEAD,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rust,a8046d5ec53b1856169ac795aa87cb0d5db84c04,layers=
+meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,HEAD,layers=meta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,scarthgap,HEAD,layers=
+meta-flutter,https://github.com/meta-flutter/meta-flutter.git,scarthgap,HEAD,layers=.:meta-flutter-apps
+oe-core,https://git.openembedded.org/openembedded-core,scarthgap,HEAD,layers=meta
+
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
diff --git a/configs/arago-scarthgap-next-config.txt b/configs/arago-scarthgap-next-config.txt
index d0fd785..84cd875 100644
--- a/configs/arago-scarthgap-next-config.txt
+++ b/configs/arago-scarthgap-next-config.txt
@@ -20,6 +20,7 @@ meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rust,a804
 meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap-next,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,HEAD,layers=meta-arm:meta-arm-toolchain
 meta-clang,https://github.com/kraj/meta-clang,scarthgap,HEAD,layers=
+#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,scarthgap,HEAD,layers=.:meta-flutter-apps
 oe-core,https://git.openembedded.org/openembedded-core,scarthgap,HEAD,layers=meta
 
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
diff --git a/configs/arago-scarthgap-selinux-config.txt b/configs/arago-scarthgap-selinux-config.txt
index 9c37fdc..f8e2ca2 100644
--- a/configs/arago-scarthgap-selinux-config.txt
+++ b/configs/arago-scarthgap-selinux-config.txt
@@ -12,6 +12,7 @@ meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rust,a804
 meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,HEAD,layers=meta-arm:meta-arm-toolchain
 meta-clang,https://github.com/kraj/meta-clang,scarthgap,HEAD,layers=
+#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,scarthgap,HEAD,layers=.:meta-flutter-apps
 oe-core,https://git.openembedded.org/openembedded-core,scarthgap,HEAD,layers=meta
 
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
diff --git a/configs/arago-scarthgap-wip-config.txt b/configs/arago-scarthgap-wip-config.txt
index a19645b..2e7bb67 100644
--- a/configs/arago-scarthgap-wip-config.txt
+++ b/configs/arago-scarthgap-wip-config.txt
@@ -12,6 +12,7 @@ meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rust,a804
 meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap-wip,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,HEAD,layers=meta-arm:meta-arm-toolchain
 meta-clang,https://github.com/kraj/meta-clang,scarthgap,HEAD,layers=
+#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,scarthgap,HEAD,layers=.:meta-flutter-apps
 oe-core,https://git.openembedded.org/openembedded-core,scarthgap,HEAD,layers=meta
 
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
diff --git a/kas/arago-scarthgap-flutter-config.yml b/kas/arago-scarthgap-flutter-config.yml
new file mode 100644
index 0000000..e5f901b
--- /dev/null
+++ b/kas/arago-scarthgap-flutter-config.yml
@@ -0,0 +1,79 @@
+header:
+  version: 17
+  includes:
+    - ./templates/bblayers.conf.yml
+    - ./templates/local-arago64-v2.conf.yml
+
+target: tisdk-default-image
+
+repos:
+  bitbake:
+    url: "https://git.openembedded.org/bitbake"
+    branch: "2.8"
+    layers:
+      .: disabled
+
+  meta-arago:
+    url: "https://git.yoctoproject.org/meta-arago"
+    branch: "scarthgap"
+    layers:
+      meta-arago-distro:
+      meta-arago-extras:
+      meta-arago-test:
+
+  meta-qt6:
+    url: "https://code.qt.io/yocto/meta-qt6.git"
+    branch: "6.9"
+
+  meta-virtualization:
+    url: "https://git.yoctoproject.org/meta-virtualization"
+    branch: "scarthgap"
+
+  meta-openembedded:
+    url: "https://git.openembedded.org/meta-openembedded"
+    branch: "scarthgap"
+    layers:
+      meta-networking:
+      meta-python:
+      meta-oe:
+      meta-gnome:
+      meta-filesystems:
+      meta-multimedia:
+
+  meta-lts-mixins:
+    url: "https://git.yoctoproject.org/meta-lts-mixins"
+    branch: "scarthgap/rust"
+    commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
+
+  meta-ti:
+    url: "https://git.yoctoproject.org/meta-ti"
+    branch: "scarthgap"
+    layers:
+      meta-ti-extras:
+      meta-beagle:
+      meta-ti-bsp:
+
+  meta-arm:
+    url: "https://git.yoctoproject.org/meta-arm"
+    branch: "scarthgap"
+    layers:
+      meta-arm:
+      meta-arm-toolchain:
+
+  meta-clang:
+    url: "https://github.com/kraj/meta-clang"
+    branch: "scarthgap"
+
+  meta-flutter:
+    url: "https://github.com/meta-flutter/meta-flutter.git"
+    branch: "scarthgap"
+    layers:
+      .:
+      meta-flutter-apps:
+
+  oe-core:
+    url: "https://git.openembedded.org/openembedded-core"
+    branch: "scarthgap"
+    layers:
+      meta:
+
diff --git a/src/configs/arago-scarthgap-chromium-config.xml b/src/configs/arago-scarthgap-chromium-config.xml
index 84f4a6a..5ed35b4 100644
--- a/src/configs/arago-scarthgap-chromium-config.xml
+++ b/src/configs/arago-scarthgap-chromium-config.xml
@@ -59,6 +59,12 @@
         <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='scarthgap' commit='HEAD'>
             <layers/>
         </repo>
+        <repo name='meta-flutter' url='https://github.com/meta-flutter/meta-flutter.git' branch='scarthgap' commit='HEAD' disabled='true'>
+            <layers>
+                <layer>.</layer>
+                <layer>meta-flutter-apps</layer>
+            </layers>
+        </repo>
         <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='scarthgap' commit='HEAD'>
             <layers>
                 <layer>meta</layer>
diff --git a/src/configs/arago-scarthgap-config.xml b/src/configs/arago-scarthgap-config.xml
index 45e5946..d5c571e 100644
--- a/src/configs/arago-scarthgap-config.xml
+++ b/src/configs/arago-scarthgap-config.xml
@@ -59,6 +59,12 @@
         <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='scarthgap' commit='HEAD'>
             <layers/>
         </repo>
+        <repo name='meta-flutter' url='https://github.com/meta-flutter/meta-flutter.git' branch='scarthgap' commit='HEAD' disabled='true'>
+            <layers>
+                <layer>.</layer>
+                <layer>meta-flutter-apps</layer>
+            </layers>
+        </repo>
         <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='scarthgap' commit='HEAD'>
             <layers>
                 <layer>meta</layer>
diff --git a/src/configs/arago-scarthgap-flutter-config.xml b/src/configs/arago-scarthgap-flutter-config.xml
new file mode 100644
index 0000000..8686025
--- /dev/null
+++ b/src/configs/arago-scarthgap-flutter-config.xml
@@ -0,0 +1,80 @@
+<?xml version='1.0'?>
+<config>
+    <description>Arago reference distribution for scarthgap</description>
+
+    <xi:include href='../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.8' commit='HEAD'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='scarthgap' commit='HEAD'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='27ca52f635a31f5f9762813a8527dd31323549b7' disabled='true'>
+            <layers>
+                <layer>meta-chromium</layer>
+            </layers>
+        </repo>
+        <repo name='meta-selinux' url='https://git.yoctoproject.org/meta-selinux' branch='scarthgap' commit='HEAD' disabled='true'>
+            <layers/>
+        </repo>
+        <repo name='meta-qt6' url='https://code.qt.io/yocto/meta-qt6.git' branch='6.9' commit='HEAD'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='scarthgap' commit='HEAD'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='scarthgap' commit='HEAD'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name='meta-lts-mixins' url='https://git.yoctoproject.org/meta-lts-mixins' branch='scarthgap/rust' commit='a8046d5ec53b1856169ac795aa87cb0d5db84c04'>
+            <layers/>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap' commit='HEAD'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-beagle</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='scarthgap' commit='HEAD'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='scarthgap' commit='HEAD'>
+            <layers/>
+        </repo>
+        <repo name='meta-flutter' url='https://github.com/meta-flutter/meta-flutter.git' branch='scarthgap' commit='HEAD'>
+            <layers>
+                <layer>.</layer>
+                <layer>meta-flutter-apps</layer>
+            </layers>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='scarthgap' commit='HEAD'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/arago-scarthgap-next-config.xml b/src/configs/arago-scarthgap-next-config.xml
index 73fd7f7..d88cfe8 100644
--- a/src/configs/arago-scarthgap-next-config.xml
+++ b/src/configs/arago-scarthgap-next-config.xml
@@ -60,6 +60,12 @@
         <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='scarthgap' commit='HEAD'>
             <layers/>
         </repo>
+        <repo name='meta-flutter' url='https://github.com/meta-flutter/meta-flutter.git' branch='scarthgap' commit='HEAD' disabled='true'>
+            <layers>
+                <layer>.</layer>
+                <layer>meta-flutter-apps</layer>
+            </layers>
+        </repo>
         <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='scarthgap' commit='HEAD'>
             <layers>
                 <layer>meta</layer>
diff --git a/src/configs/arago-scarthgap-selinux-config.xml b/src/configs/arago-scarthgap-selinux-config.xml
index eb3152a..1096683 100644
--- a/src/configs/arago-scarthgap-selinux-config.xml
+++ b/src/configs/arago-scarthgap-selinux-config.xml
@@ -59,6 +59,12 @@
         <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='scarthgap' commit='HEAD'>
             <layers/>
         </repo>
+        <repo name='meta-flutter' url='https://github.com/meta-flutter/meta-flutter.git' branch='scarthgap' commit='HEAD' disabled='true'>
+            <layers>
+                <layer>.</layer>
+                <layer>meta-flutter-apps</layer>
+            </layers>
+        </repo>
         <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='scarthgap' commit='HEAD'>
             <layers>
                 <layer>meta</layer>
diff --git a/src/configs/arago-scarthgap-wip-config.xml b/src/configs/arago-scarthgap-wip-config.xml
index c26baf3..cdb4a29 100644
--- a/src/configs/arago-scarthgap-wip-config.xml
+++ b/src/configs/arago-scarthgap-wip-config.xml
@@ -59,6 +59,12 @@
         <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='scarthgap' commit='HEAD'>
             <layers/>
         </repo>
+        <repo name='meta-flutter' url='https://github.com/meta-flutter/meta-flutter.git' branch='scarthgap' commit='HEAD' disabled='true'>
+            <layers>
+                <layer>.</layer>
+                <layer>meta-flutter-apps</layer>
+            </layers>
+        </repo>
         <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='scarthgap' commit='HEAD'>
             <layers>
                 <layer>meta</layer>
-- 
2.34.1


