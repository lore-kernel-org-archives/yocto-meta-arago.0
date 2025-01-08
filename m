Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A6DFE77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 14:47:32 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.13792.1736320476742967948
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 07 Jan 2025 23:14:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=gKUQmWL/;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: s-sinha@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5087EZPS2767173
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Wed, 8 Jan 2025 01:14:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736320475;
	bh=aeGU9Vtb71iV0f7Ck5VrmKMir0MuJH+aLFpZ7/iCRGQ=;
	h=From:To:CC:Subject:Date;
	b=gKUQmWL/Ga54vheO4yTCQHuiJjfKncs+CIQj4GL50LgbDIaC+BkTV45se7dmhbHWd
	 LmzFFLWyMC7X5j/29AuDp/mSzunVFlD8Gl6Ou7X3a6r1pXiWlqIggIkucgW+6OmNMv
	 CsLeNR6xwwxBNodG8UUqHKVMa1Zxy9FNUQ5eydiw=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5087EZsC017920
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 8 Jan 2025 01:14:35 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Jan 2025 01:14:35 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Jan 2025 01:14:35 -0600
Received: from localhost (robotics.dhcp.ti.com [172.24.227.214])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5087EYhZ040258;
	Wed, 8 Jan 2025 01:14:35 -0600
From: Shreyash Sinha <s-sinha@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <r-ravikumar@ti.com>, Shreyash Sinha <s-sinha@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH v2] configs: processor-sdk-analytics: Add 10.1 release config
Date: Wed, 8 Jan 2025 12:44:32 +0530
Message-ID: <20250108071432.1661552-1-s-sinha@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 08 Jan 2025 14:47:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15687

Signed-off-by: Shreyash Sinha <s-sinha@ti.com>
---

Notes:
    v2: Add processor-sdk-analytics-10.01.00-config for kas and bitbake-setup

 ...ocessor-sdk-analytics-10.01.00-config.json | 147 +++++++++++++++
 .../bblayers.conf.sample                      |  33 ++++
 .../conf-notes.txt                            |  22 +++
 .../conf-summary.txt                          |   1 +
 .../local.conf.sample                         | 175 ++++++++++++++++++
 ...rocessor-sdk-analytics-10.01.00-config.txt |  18 ++
 ...rocessor-sdk-analytics-10.01.00-config.yml |  79 ++++++++
 ...rocessor-sdk-analytics-10.01.00-config.xml |  69 +++++++
 8 files changed, 544 insertions(+)
 create mode 100644 bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-10.01.00-config.json
 create mode 100644 conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.01.00-config/bblayers.conf.sample
 create mode 100644 conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.01.00-config/conf-notes.txt
 create mode 100644 conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.01.00-config/conf-summary.txt
 create mode 100644 conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.01.00-config/local.conf.sample
 create mode 100644 configs/processor-sdk-analytics/processor-sdk-analytics-10.01.00-config.txt
 create mode 100644 kas/processor-sdk-analytics/processor-sdk-analytics-10.01.00-config.yml
 create mode 100644 src/configs/processor-sdk-analytics/processor-sdk-analytics-10.01.00-config.xml

diff --git a/bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-10.01.00-config.json b/bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-10.01.00-config.json
new file mode 100644
index 0000000..0eb3867
--- /dev/null
+++ b/bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-10.01.00-config.json
@@ -0,0 +1,147 @@
+{
+  "version": "1.0",
+  "description": "TI Processor SDK Analytics v10.01.00",
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
+    "meta-qt5": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://github.com/meta-qt5/meta-qt5.git"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-qt5"
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
+    },
+    "meta-edgeai": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.ti.com/git/edgeai/meta-edgeai.git"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-edgeai"
+    }
+  },
+  "configuration": {
+    "bitbake-setup": {
+      "default": {
+        "description": "Default build configuration",
+         "template": "oe-layersetup-processor-sdk-analytics_processor-sdk-analytics-10.01.00-config",
+         "targets": [ "bitbake -k tisdk-default-image" ]
+      }
+    }
+  }
+}
diff --git a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.01.00-config/bblayers.conf.sample b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.01.00-config/bblayers.conf.sample
new file mode 100644
index 0000000..049782f
--- /dev/null
+++ b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.01.00-config/bblayers.conf.sample
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
+    ##OEROOT##/../meta-arago/meta-arago-demos
+    ##OEROOT##/../meta-arago/meta-arago-test
+    ##OEROOT##/../meta-qt5
+    ##OEROOT##/../meta-virtualization
+    ##OEROOT##/../meta-openembedded/meta-networking
+    ##OEROOT##/../meta-openembedded/meta-python
+    ##OEROOT##/../meta-openembedded/meta-oe
+    ##OEROOT##/../meta-openembedded/meta-gnome
+    ##OEROOT##/../meta-openembedded/meta-filesystems
+    ##OEROOT##/../meta-openembedded/meta-multimedia
+    ##OEROOT##/../meta-ti/meta-ti-extras
+    ##OEROOT##/../meta-ti/meta-ti-bsp
+    ##OEROOT##/../meta-arm/meta-arm
+    ##OEROOT##/../meta-arm/meta-arm-toolchain
+    ##OEROOT##/../meta-clang
+    ##OEROOT##/../oe-core/meta
+    ##OEROOT##/../meta-tisdk
+    ##OEROOT##/../meta-edgeai
+    ##OEROOT##/../oe-layersetup
+"
diff --git a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.01.00-config/conf-notes.txt b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.01.00-config/conf-notes.txt
new file mode 100644
index 0000000..1880460
--- /dev/null
+++ b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.01.00-config/conf-notes.txt
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
diff --git a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.01.00-config/conf-summary.txt b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.01.00-config/conf-summary.txt
new file mode 100644
index 0000000..ab78823
--- /dev/null
+++ b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.01.00-config/conf-summary.txt
@@ -0,0 +1 @@
+TI Processor SDK Analytics v10.01.00
diff --git a/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.01.00-config/local.conf.sample b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.01.00-config/local.conf.sample
new file mode 100644
index 0000000..7575b4b
--- /dev/null
+++ b/conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.01.00-config/local.conf.sample
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
+DL_DIR = "${TOPDIR}/downloads"
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
+SSTATE_DIR = "${TOPDIR}/build/sstate-cache"
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
diff --git a/configs/processor-sdk-analytics/processor-sdk-analytics-10.01.00-config.txt b/configs/processor-sdk-analytics/processor-sdk-analytics-10.01.00-config.txt
new file mode 100644
index 0000000..46cf7e3
--- /dev/null
+++ b/configs/processor-sdk-analytics/processor-sdk-analytics-10.01.00-config.txt
@@ -0,0 +1,18 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.8,f40a3a477d5241b697bf2fb030dd804c1ff5839f
+meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,b6349e47760397add572cc27468e0f30b40474c1,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,a1af9bdf2bcf06df85aeac997bfbdcb414d8e0e0,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,450941a1b6df96285691e8c23d4f332d3c88a994,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,b8d1a14f7f3b76457c36752202ea7ae5881b6654,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,f06324bc1649e4f437686560cbd66f973ba920f5,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,7088279c0ab00c7dabefdd4544951b4746b48476,layers=meta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,scarthgap,9fbfa9db33131abdf3870a94f00199eb53e276e5,layers=
+oe-core,https://git.openembedded.org/openembedded-core,scarthgap,92cb4641ff4ec8c1f681bca21cfeaf2ba6923ab7,layers=meta
+meta-tisdk,https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git,scarthgap,fcd7661087b0dd5b5b57d30ba0d45f2698e962f8,layers=
+meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,scarthgap,41499d7bcc8d37862b93c0d56cf782f9182d0be1,layers=
+
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-10.01.00-config.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-10.01.00-config.yml
new file mode 100644
index 0000000..0db4a01
--- /dev/null
+++ b/kas/processor-sdk-analytics/processor-sdk-analytics-10.01.00-config.yml
@@ -0,0 +1,79 @@
+header:
+  version: 17
+  includes:
+    - ../templates/bblayers.conf.yml
+    - ../templates/local-arago64-v2.conf.yml
+
+target: tisdk-default-image
+
+repos:
+  meta-arago:
+    url: "https://git.yoctoproject.org/meta-arago"
+    branch: "scarthgap"
+    commit: "b6349e47760397add572cc27468e0f30b40474c1"
+    layers:
+      meta-arago-distro:
+      meta-arago-extras:
+      meta-arago-demos:
+      meta-arago-test:
+
+  meta-qt5:
+    url: "https://github.com/meta-qt5/meta-qt5.git"
+    branch: "scarthgap"
+    commit: "a1af9bdf2bcf06df85aeac997bfbdcb414d8e0e0"
+
+  meta-virtualization:
+    url: "https://git.yoctoproject.org/meta-virtualization"
+    branch: "scarthgap"
+    commit: "450941a1b6df96285691e8c23d4f332d3c88a994"
+
+  meta-openembedded:
+    url: "https://git.openembedded.org/meta-openembedded"
+    branch: "scarthgap"
+    commit: "b8d1a14f7f3b76457c36752202ea7ae5881b6654"
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
+    commit: "f06324bc1649e4f437686560cbd66f973ba920f5"
+    layers:
+      meta-ti-extras:
+      meta-ti-bsp:
+
+  meta-arm:
+    url: "https://git.yoctoproject.org/meta-arm"
+    branch: "scarthgap"
+    commit: "7088279c0ab00c7dabefdd4544951b4746b48476"
+    layers:
+      meta-arm:
+      meta-arm-toolchain:
+
+  meta-clang:
+    url: "https://github.com/kraj/meta-clang"
+    branch: "scarthgap"
+    commit: "9fbfa9db33131abdf3870a94f00199eb53e276e5"
+
+  oe-core:
+    url: "https://git.openembedded.org/openembedded-core"
+    branch: "scarthgap"
+    commit: "92cb4641ff4ec8c1f681bca21cfeaf2ba6923ab7"
+    layers:
+      meta:
+
+  meta-tisdk:
+    url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
+    branch: "scarthgap"
+    commit: "fcd7661087b0dd5b5b57d30ba0d45f2698e962f8"
+
+  meta-edgeai:
+    url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
+    branch: "scarthgap"
+    commit: "41499d7bcc8d37862b93c0d56cf782f9182d0be1"
+
diff --git a/src/configs/processor-sdk-analytics/processor-sdk-analytics-10.01.00-config.xml b/src/configs/processor-sdk-analytics/processor-sdk-analytics-10.01.00-config.xml
new file mode 100644
index 0000000..7308167
--- /dev/null
+++ b/src/configs/processor-sdk-analytics/processor-sdk-analytics-10.01.00-config.xml
@@ -0,0 +1,69 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI Processor SDK Analytics v10.01.00</description>
+
+    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.8' commit='f40a3a477d5241b697bf2fb030dd804c1ff5839f'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='scarthgap' commit='b6349e47760397add572cc27468e0f30b40474c1'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='scarthgap' commit='a1af9bdf2bcf06df85aeac997bfbdcb414d8e0e0'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='scarthgap' commit='450941a1b6df96285691e8c23d4f332d3c88a994'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='scarthgap' commit='b8d1a14f7f3b76457c36752202ea7ae5881b6654'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap' commit='f06324bc1649e4f437686560cbd66f973ba920f5'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='scarthgap' commit='7088279c0ab00c7dabefdd4544951b4746b48476'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='scarthgap' commit='9fbfa9db33131abdf3870a94f00199eb53e276e5'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='scarthgap' commit='92cb4641ff4ec8c1f681bca21cfeaf2ba6923ab7'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name='meta-tisdk' url='https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git' branch='scarthgap' commit='fcd7661087b0dd5b5b57d30ba0d45f2698e962f8'>
+            <layers/>
+        </repo>
+        <repo name='meta-edgeai' url='https://git.ti.com/git/edgeai/meta-edgeai.git' branch='scarthgap' commit='41499d7bcc8d37862b93c0d56cf782f9182d0be1'>
+            <layers/>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
-- 
2.34.1


