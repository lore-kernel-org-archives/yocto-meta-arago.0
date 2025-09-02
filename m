Return-Path: <s-sinha@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 671C5CA0FFE
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 07:20:06 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.71583.1756797605751822525
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 02 Sep 2025 00:20:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=WUeg1sx5;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: s-sinha@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5827K5Rd2930354
	for <meta-arago@lists.yoctoproject.org>; Tue, 2 Sep 2025 02:20:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756797605;
	bh=d5ornYvmXtHrO7HLTFXdfYKWo/5QOHL0i2HjoWkPVzw=;
	h=From:To:CC:Subject:Date;
	b=WUeg1sx5w9g2n/guCO9Yc9CotSZcG+hnZDq9wobLyo+XlRSNslmTV6YOFZd1sg2V1
	 MKICDf0R+BUO81y2mKq/CWOY5DY6fyDjtn3WH8ikflkb/eTpvK9GN/M+2JX0Ijfc6w
	 rDPwNf9gEHEEPzMkHpj7VyO6Ny5JcEWpLHxrs/es=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5827K5WT3303485
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 2 Sep 2025 02:20:05 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 2
 Sep 2025 02:20:04 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 2 Sep 2025 02:20:04 -0500
Received: from localhost (robotics.dhcp.ti.com [172.24.235.192])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5827K3Cb3404188;
	Tue, 2 Sep 2025 02:20:03 -0500
From: Shreyash Sinha <s-sinha@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, Shreyash Sinha <s-sinha@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] configs: processor-sdk-linux: Add 11.0 release config
Date: Tue, 2 Sep 2025 12:49:59 +0530
Message-ID: <20250902071959.877763-1-s-sinha@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 02 Sep 2025 07:20:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16510

Signed-off-by: Shreyash Sinha <s-sinha@ti.com>
---
 .../processor-sdk-linux-11_00_10_01.json      | 147 ++++++++++++++
 .../bblayers.conf.sample                      |  33 ++++
 .../conf-notes.txt                            |  22 +++
 .../conf-summary.txt                          |   1 +
 .../local.conf.sample                         | 185 ++++++++++++++++++
 .../processor-sdk-linux-11_00_10_01.txt       |  22 +++
 kas/processor-sdk-linux-11_00_10_01.yml       |  87 ++++++++
 .../processor-sdk-linux-11_00_10_01.xml       |  81 ++++++++
 8 files changed, 578 insertions(+)
 create mode 100644 bitbake-setup/processor-sdk-linux-11_00_10_01.json
 create mode 100644 conf/templates/processor-sdk-linux-11_00_10_01/bblayers.conf.sample
 create mode 100644 conf/templates/processor-sdk-linux-11_00_10_01/conf-notes.txt
 create mode 100644 conf/templates/processor-sdk-linux-11_00_10_01/conf-summary.txt
 create mode 100644 conf/templates/processor-sdk-linux-11_00_10_01/local.conf.sample
 create mode 100644 configs/processor-sdk-linux/processor-sdk-linux-11_00_10_01.txt
 create mode 100644 kas/processor-sdk-linux-11_00_10_01.yml
 create mode 100644 src/configs/processor-sdk-linux-11_00_10_01.xml

diff --git a/bitbake-setup/processor-sdk-linux-11_00_10_01.json b/bitbake-setup/processor-sdk-linux-11_00_10_01.json
new file mode 100644
index 0000000..b7b0066
--- /dev/null
+++ b/bitbake-setup/processor-sdk-linux-11_00_10_01.json
@@ -0,0 +1,147 @@
+{
+  "version": "1.0",
+  "description": "",
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
+    "meta-browser": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://github.com/OSSystems/meta-browser.git"
+          }
+        },
+        "rev": "master"
+      },
+      "path": "meta-browser"
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
+    },
+    "meta-tisdk": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-tisdk"
+    }
+  },
+  "configuration": {
+    "bitbake-setup": {
+      "default": {
+        "description": "Default build configuration",
+         "template": "oe-layersetup-processor-sdk-linux-11_00_10_01",
+         "targets": [ "bitbake -k tisdk-default-image" ]
+      }
+    }
+  }
+}
diff --git a/conf/templates/processor-sdk-linux-11_00_10_01/bblayers.conf.sample b/conf/templates/processor-sdk-linux-11_00_10_01/bblayers.conf.sample
new file mode 100644
index 0000000..f48ab87
--- /dev/null
+++ b/conf/templates/processor-sdk-linux-11_00_10_01/bblayers.conf.sample
@@ -0,0 +1,33 @@
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
+    ##OEROOT##/../meta-browser/meta-chromium
+    ##OEROOT##/../meta-qt6
+    ##OEROOT##/../meta-virtualization
+    ##OEROOT##/../meta-openembedded/meta-networking
+    ##OEROOT##/../meta-openembedded/meta-python
+    ##OEROOT##/../meta-openembedded/meta-oe
+    ##OEROOT##/../meta-openembedded/meta-gnome
+    ##OEROOT##/../meta-openembedded/meta-filesystems
+    ##OEROOT##/../meta-openembedded/meta-multimedia
+    ##OEROOT##/../meta-ti/meta-ti-extras
+    ##OEROOT##/../meta-ti/meta-beagle
+    ##OEROOT##/../meta-ti/meta-ti-bsp
+    ##OEROOT##/../meta-arm/meta-arm
+    ##OEROOT##/../meta-arm/meta-arm-toolchain
+    ##OEROOT##/../meta-clang
+    ##OEROOT##/../oe-core/meta
+    ##OEROOT##/../meta-tisdk/meta-ti-foundational
+    ##OEROOT##/../oe-layersetup
+"
diff --git a/conf/templates/processor-sdk-linux-11_00_10_01/conf-notes.txt b/conf/templates/processor-sdk-linux-11_00_10_01/conf-notes.txt
new file mode 100644
index 0000000..1880460
--- /dev/null
+++ b/conf/templates/processor-sdk-linux-11_00_10_01/conf-notes.txt
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
diff --git a/conf/templates/processor-sdk-linux-11_00_10_01/conf-summary.txt b/conf/templates/processor-sdk-linux-11_00_10_01/conf-summary.txt
new file mode 100644
index 0000000..8b13789
--- /dev/null
+++ b/conf/templates/processor-sdk-linux-11_00_10_01/conf-summary.txt
@@ -0,0 +1 @@
+
diff --git a/conf/templates/processor-sdk-linux-11_00_10_01/local.conf.sample b/conf/templates/processor-sdk-linux-11_00_10_01/local.conf.sample
new file mode 100644
index 0000000..b973a25
--- /dev/null
+++ b/conf/templates/processor-sdk-linux-11_00_10_01/local.conf.sample
@@ -0,0 +1,185 @@
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
+
+
+#====================================================================
+# Settings from oe-layersetup config file: processor-sdk-linux-11_00_10_01
+#
+# Do not remove.
+#--------------------------------------------------------------------
+DISTRO_FEATURES:append = " virtualization"
+DISTROOVERRIDES:append = ":foundational"
+#====================================================================
diff --git a/configs/processor-sdk-linux/processor-sdk-linux-11_00_10_01.txt b/configs/processor-sdk-linux/processor-sdk-linux-11_00_10_01.txt
new file mode 100644
index 0000000..2a52cd8
--- /dev/null
+++ b/configs/processor-sdk-linux/processor-sdk-linux-11_00_10_01.txt
@@ -0,0 +1,22 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.8,696c2c1ef095f8b11c7d2eff36fae50f58c62e5e
+meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,c04e85dd207dd24387edac10526b9ec971df9496,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4,layers=meta-chromium
+#meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
+meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,338aefa1572bb49e236fc0e2c5a565ffbf6b309f,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,9287a355b338361e42027ce371444111a791d64f,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,67ad83dd7c2485dae0c90eac345007af6195b84d,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,a98a2e1029870b25e117d4c9410e75bfd955f35a,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,f3640941c600d03ea53ce5b9254f0fead18f8bc0,layers=meta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,scarthgap,b9ef02282197380ef05edbd0eb852e1934ceb59b,layers=
+oe-core,https://git.openembedded.org/openembedded-core,scarthgap,4003b5faa1e5acfa025e1d0df4e021e06cf8724c,layers=meta
+
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
+
+meta-tisdk,https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git,scarthgap,73aae47bf953dd4cf06e448367135b1cac0869a1,layers=meta-ti-foundational
+LOCALCONF:DISTRO_FEATURES:append = " virtualization"
+LOCALCONF:DISTROOVERRIDES:append = ":foundational"
diff --git a/kas/processor-sdk-linux-11_00_10_01.yml b/kas/processor-sdk-linux-11_00_10_01.yml
new file mode 100644
index 0000000..f1ad6fc
--- /dev/null
+++ b/kas/processor-sdk-linux-11_00_10_01.yml
@@ -0,0 +1,87 @@
+header:
+  version: 17
+  includes:
+    - ./templates/bblayers.conf.yml
+    - ./templates/local-arago64-v2.conf.yml
+
+target: tisdk-default-image
+
+repos:
+  meta-arago:
+    url: "https://git.yoctoproject.org/meta-arago"
+    branch: "scarthgap"
+    commit: "c04e85dd207dd24387edac10526b9ec971df9496"
+    layers:
+      meta-arago-distro:
+      meta-arago-extras:
+      meta-arago-test:
+
+  meta-browser:
+    url: "https://github.com/OSSystems/meta-browser.git"
+    branch: "master"
+    commit: "68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4"
+    layers:
+      meta-chromium:
+
+  meta-qt6:
+    url: "https://code.qt.io/yocto/meta-qt6.git"
+    branch: "6.9"
+    commit: "338aefa1572bb49e236fc0e2c5a565ffbf6b309f"
+
+  meta-virtualization:
+    url: "https://git.yoctoproject.org/meta-virtualization"
+    branch: "scarthgap"
+    commit: "9287a355b338361e42027ce371444111a791d64f"
+
+  meta-openembedded:
+    url: "https://git.openembedded.org/meta-openembedded"
+    branch: "scarthgap"
+    commit: "67ad83dd7c2485dae0c90eac345007af6195b84d"
+    layers:
+      meta-networking:
+      meta-python:
+      meta-oe:
+      meta-gnome:
+      meta-filesystems:
+      meta-multimedia:
+
+  meta-ti:
+    url: "https://git.yoctoproject.org/meta-ti"
+    branch: "scarthgap"
+    commit: "a98a2e1029870b25e117d4c9410e75bfd955f35a"
+    layers:
+      meta-ti-extras:
+      meta-beagle:
+      meta-ti-bsp:
+
+  meta-arm:
+    url: "https://git.yoctoproject.org/meta-arm"
+    branch: "scarthgap"
+    commit: "f3640941c600d03ea53ce5b9254f0fead18f8bc0"
+    layers:
+      meta-arm:
+      meta-arm-toolchain:
+
+  meta-clang:
+    url: "https://github.com/kraj/meta-clang"
+    branch: "scarthgap"
+    commit: "b9ef02282197380ef05edbd0eb852e1934ceb59b"
+
+  oe-core:
+    url: "https://git.openembedded.org/openembedded-core"
+    branch: "scarthgap"
+    commit: "4003b5faa1e5acfa025e1d0df4e021e06cf8724c"
+    layers:
+      meta:
+
+  meta-tisdk:
+    url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
+    branch: "scarthgap"
+    commit: "73aae47bf953dd4cf06e448367135b1cac0869a1"
+    layers:
+      meta-ti-foundational:
+
+local_conf_header:
+  oe-layersetup-local-conf-config-specific: |
+    DISTRO_FEATURES:append = " virtualization"
+    DISTROOVERRIDES:append = ":foundational"
diff --git a/src/configs/processor-sdk-linux-11_00_10_01.xml b/src/configs/processor-sdk-linux-11_00_10_01.xml
new file mode 100644
index 0000000..1f42cb0
--- /dev/null
+++ b/src/configs/processor-sdk-linux-11_00_10_01.xml
@@ -0,0 +1,81 @@
+<?xml version='1.0'?>
+<config>
+    <description></description>
+
+    <xi:include href='../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.8' commit='696c2c1ef095f8b11c7d2eff36fae50f58c62e5e'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='scarthgap' commit='c04e85dd207dd24387edac10526b9ec971df9496'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4'>
+            <layers>
+                <layer>meta-chromium</layer>
+            </layers>
+        </repo>
+        <repo name='meta-selinux' url='https://git.yoctoproject.org/meta-selinux' branch='scarthgap' commit='HEAD' disabled='true'>
+            <layers/>
+        </repo>
+        <repo name='meta-qt6' url='https://code.qt.io/yocto/meta-qt6.git' branch='6.9' commit='338aefa1572bb49e236fc0e2c5a565ffbf6b309f'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='scarthgap' commit='9287a355b338361e42027ce371444111a791d64f'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='scarthgap' commit='67ad83dd7c2485dae0c90eac345007af6195b84d'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap' commit='a98a2e1029870b25e117d4c9410e75bfd955f35a'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-beagle</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='scarthgap' commit='f3640941c600d03ea53ce5b9254f0fead18f8bc0'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='scarthgap' commit='b9ef02282197380ef05edbd0eb852e1934ceb59b'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='scarthgap' commit='4003b5faa1e5acfa025e1d0df4e021e06cf8724c'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name='meta-tisdk' url='https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git' branch='scarthgap' commit='73aae47bf953dd4cf06e448367135b1cac0869a1'>
+            <layers>
+                <layer>meta-ti-foundational</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <local-conf>
+        <line>DISTRO_FEATURES:append = " virtualization"</line>
+        <line>DISTROOVERRIDES:append = ":foundational"</line>
+    </local-conf>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
-- 
2.34.1


