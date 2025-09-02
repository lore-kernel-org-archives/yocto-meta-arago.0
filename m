Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42996CA1005
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 19:03:20 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.85876.1756839794202893188
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 02 Sep 2025 12:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jea5m7+u;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: a-christidis@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 582J3D342594539
	for <meta-arago@lists.yoctoproject.org>; Tue, 2 Sep 2025 14:03:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756839793;
	bh=8P9l9RA3qAAaarD6ai1l62DMeGgS9zGm5Bn5DKTaujc=;
	h=From:To:Subject:Date;
	b=jea5m7+uj7f1JXqb3rjCmFnJd1GmvKIxnhO7v5/9Y9MKKsNBTI440r1r/UvUe1hIP
	 8YdRvy49U/byu0uzDsG/Mx876kOdomTY9dNsXl0ogHfc/LXFNa1F89dXOSCgaCXgod
	 nAsFPggQNU+s21uUkGtcakhp2Tl0DZWt1hE2/I58=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 582J3DPR3697257
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 2 Sep 2025 14:03:13 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 2
 Sep 2025 14:03:12 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 2 Sep 2025 14:03:13 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 582J3Dq9077388;
	Tue, 2 Sep 2025 14:03:13 -0500
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH] configs/arago-master-*: Add master flutter configs
Date: Tue, 2 Sep 2025 14:03:13 -0500
Message-ID: <20250902190313.836520-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 02 Sep 2025 19:03:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16514

From: Antonios Christidis <a-christidis@ti.com>

Since scarthgap-flutter configs exist, add master-flutter configs as well.
Include the flutter layer in other master configs, but disabled.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 .../arago-master-flutter-config.json          | 136 ++++++++++++++
 .../bblayers.conf.sample                      |  33 ++++
 .../conf-notes.txt                            |  22 +++
 .../conf-summary.txt                          |   1 +
 .../local.conf.sample                         | 177 ++++++++++++++++++
 configs/arago-master-chromium-config.txt      |   1 +
 configs/arago-master-config.txt               |   1 +
 configs/arago-master-flutter-config.txt       |  18 ++
 configs/arago-master-next-config.txt          |   1 +
 configs/arago-master-selinux-config.txt       |   1 +
 configs/arago-master-wip-config.txt           |   1 +
 kas/arago-master-flutter-config.yml           |  74 ++++++++
 src/configs/arago-master-chromium-config.xml  |   6 +
 src/configs/arago-master-config.xml           |   6 +
 src/configs/arago-master-flutter-config.xml   |  72 +++++++
 src/configs/arago-master-next-config.xml      |   6 +
 src/configs/arago-master-selinux-config.xml   |   6 +
 src/configs/arago-master-wip-config.xml       |   6 +
 18 files changed, 568 insertions(+)
 create mode 100644 bitbake-setup/arago-master-flutter-config.json
 create mode 100644 conf/templates/arago-master-flutter-config/bblayers.conf.sample
 create mode 100644 conf/templates/arago-master-flutter-config/conf-notes.txt
 create mode 100644 conf/templates/arago-master-flutter-config/conf-summary.txt
 create mode 100644 conf/templates/arago-master-flutter-config/local.conf.sample
 create mode 100644 configs/arago-master-flutter-config.txt
 create mode 100644 kas/arago-master-flutter-config.yml
 create mode 100644 src/configs/arago-master-flutter-config.xml

diff --git a/bitbake-setup/arago-master-flutter-config.json b/bitbake-setup/arago-master-flutter-config.json
new file mode 100644
index 0000000..98b9810
--- /dev/null
+++ b/bitbake-setup/arago-master-flutter-config.json
@@ -0,0 +1,136 @@
+{
+  "version": "1.0",
+  "description": "Arago reference distribution for master-flutter",
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
+        "rev": "master"
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
+        "rev": "master"
+      },
+      "path": "meta-arago"
+    },
+    "meta-flutter": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://github.com/meta-flutter/meta-flutter.git"
+          }
+        },
+        "rev": "master"
+      },
+      "path": "meta-flutter"
+    },
+    "meta-qt6": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://code.qt.io/yocto/meta-qt6.git"
+          }
+        },
+        "rev": "dev"
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
+        "rev": "master"
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
+        "rev": "master"
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
+        "rev": "master"
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
+        "rev": "master"
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
+        "rev": "master"
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
+        "rev": "master"
+      },
+      "path": "oe-core"
+    }
+  },
+  "configuration": {
+    "bitbake-setup": {
+      "default": {
+        "description": "Default build configuration",
+         "template": "oe-layersetup-arago-master-flutter-config",
+         "targets": [ "bitbake -k tisdk-default-image" ]
+      }
+    }
+  }
+}
diff --git a/conf/templates/arago-master-flutter-config/bblayers.conf.sample b/conf/templates/arago-master-flutter-config/bblayers.conf.sample
new file mode 100644
index 0000000..7cd557f
--- /dev/null
+++ b/conf/templates/arago-master-flutter-config/bblayers.conf.sample
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
+    ##OEROOT##/../meta-flutter/.
+    ##OEROOT##/../meta-flutter/meta-flutter-apps
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
+    ##OEROOT##/../oe-layersetup
+"
diff --git a/conf/templates/arago-master-flutter-config/conf-notes.txt b/conf/templates/arago-master-flutter-config/conf-notes.txt
new file mode 100644
index 0000000..1880460
--- /dev/null
+++ b/conf/templates/arago-master-flutter-config/conf-notes.txt
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
diff --git a/conf/templates/arago-master-flutter-config/conf-summary.txt b/conf/templates/arago-master-flutter-config/conf-summary.txt
new file mode 100644
index 0000000..638d992
--- /dev/null
+++ b/conf/templates/arago-master-flutter-config/conf-summary.txt
@@ -0,0 +1 @@
+Arago reference distribution for master-flutter
diff --git a/conf/templates/arago-master-flutter-config/local.conf.sample b/conf/templates/arago-master-flutter-config/local.conf.sample
new file mode 100644
index 0000000..720ce11
--- /dev/null
+++ b/conf/templates/arago-master-flutter-config/local.conf.sample
@@ -0,0 +1,177 @@
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
+#  "dbg-pkgs"             - add -dbg packages for all installed packages
+#                           (adds symbol information for debugging/profiling)
+#  "dev-pkgs"             - add -dev packages for all installed packages
+#                           (useful if you want to develop against libs in the image)
+#  "tools-sdk"            - add development tools (gcc, make, pkgconfig etc.)
+#  "tools-debug"          - add debugging tools (gdb, strace)
+#  "tools-profile"        - add profiling tools (oprofile, exmap, lttng valgrind (x86 only))
+#  "tools-testapps"       - add useful testing tools (ts_print, aplay, arecord etc.)
+#  "empty-root-password"  - the root user has no password set
+#  "allow-empty-password" - users can have an empty password
+#  "allow-root-login"     - the root user can login
+#  "post-install-logging" - log the output of postinstall scriptlets
+# There are other application targets that can be used here too, see
+# meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.
+# We default to enabling the empty root login settings for debugging/testing.
+EXTRA_IMAGE_FEATURES = "empty-root-password allow-empty-password allow-root-login post-install-logging"
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
diff --git a/configs/arago-master-chromium-config.txt b/configs/arago-master-chromium-config.txt
index a64fbda..4c46f8c 100644
--- a/configs/arago-master-chromium-config.txt
+++ b/configs/arago-master-chromium-config.txt
@@ -3,6 +3,7 @@
 
 bitbake,https://git.openembedded.org/bitbake,master,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
+#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD,layers=.:meta-flutter-apps
 meta-browser,https://github.com/OSSystems/meta-browser.git,master,HEAD,layers=meta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=
diff --git a/configs/arago-master-config.txt b/configs/arago-master-config.txt
index 17d92cd..5364178 100644
--- a/configs/arago-master-config.txt
+++ b/configs/arago-master-config.txt
@@ -3,6 +3,7 @@
 
 bitbake,https://git.openembedded.org/bitbake,master,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
+#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD,layers=.:meta-flutter-apps
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,HEAD,layers=meta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=
diff --git a/configs/arago-master-flutter-config.txt b/configs/arago-master-flutter-config.txt
new file mode 100644
index 0000000..0abfab1
--- /dev/null
+++ b/configs/arago-master-flutter-config.txt
@@ -0,0 +1,18 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,master,HEAD
+meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
+meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD,layers=.:meta-flutter-apps
+#meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
+meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,master,HEAD,layers=
+oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
+
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v3.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
diff --git a/configs/arago-master-next-config.txt b/configs/arago-master-next-config.txt
index 4076923..de67189 100644
--- a/configs/arago-master-next-config.txt
+++ b/configs/arago-master-next-config.txt
@@ -11,6 +11,7 @@ MOTD: NOTE:
 
 bitbake,https://git.openembedded.org/bitbake,master,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,master-next,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
+#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD,layers=.:meta-flutter-apps
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,HEAD,layers=meta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=
diff --git a/configs/arago-master-selinux-config.txt b/configs/arago-master-selinux-config.txt
index 3ba46b2..6d53193 100644
--- a/configs/arago-master-selinux-config.txt
+++ b/configs/arago-master-selinux-config.txt
@@ -3,6 +3,7 @@
 
 bitbake,https://git.openembedded.org/bitbake,master,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
+#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD,layers=.:meta-flutter-apps
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,HEAD,layers=meta-chromium
 meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=
diff --git a/configs/arago-master-wip-config.txt b/configs/arago-master-wip-config.txt
index 165a3d1..de143bd 100644
--- a/configs/arago-master-wip-config.txt
+++ b/configs/arago-master-wip-config.txt
@@ -3,6 +3,7 @@
 
 bitbake,https://git.openembedded.org/bitbake,master,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,master-wip,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
+#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD,layers=.:meta-flutter-apps
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,HEAD,layers=meta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=
diff --git a/kas/arago-master-flutter-config.yml b/kas/arago-master-flutter-config.yml
new file mode 100644
index 0000000..58ff2bc
--- /dev/null
+++ b/kas/arago-master-flutter-config.yml
@@ -0,0 +1,74 @@
+---
+header:
+  version: 17
+  includes:
+    - ./templates/bblayers.conf.yml
+    - ./templates/local-arago64-v3.conf.yml
+
+target: tisdk-default-image
+
+repos:
+  bitbake:
+    url: "https://git.openembedded.org/bitbake"
+    branch: "master"
+    layers:
+      .: disabled
+
+  meta-arago:
+    url: "https://git.yoctoproject.org/meta-arago"
+    branch: "master"
+    layers:
+      meta-arago-distro:
+      meta-arago-extras:
+      meta-arago-test:
+
+  meta-flutter:
+    url: "https://github.com/meta-flutter/meta-flutter.git"
+    branch: "master"
+    layers:
+      .:
+      meta-flutter-apps:
+
+  meta-qt6:
+    url: "https://code.qt.io/yocto/meta-qt6.git"
+    branch: "dev"
+
+  meta-virtualization:
+    url: "https://git.yoctoproject.org/meta-virtualization"
+    branch: "master"
+
+  meta-openembedded:
+    url: "https://git.openembedded.org/meta-openembedded"
+    branch: "master"
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
+    branch: "master"
+    layers:
+      meta-ti-extras:
+      meta-beagle:
+      meta-ti-bsp:
+
+  meta-arm:
+    url: "https://git.yoctoproject.org/meta-arm"
+    branch: "master"
+    layers:
+      meta-arm:
+      meta-arm-toolchain:
+
+  meta-clang:
+    url: "https://github.com/kraj/meta-clang"
+    branch: "master"
+
+  oe-core:
+    url: "https://git.openembedded.org/openembedded-core"
+    branch: "master"
+    layers:
+      meta:
diff --git a/src/configs/arago-master-chromium-config.xml b/src/configs/arago-master-chromium-config.xml
index acc5a51..5ac01ba 100644
--- a/src/configs/arago-master-chromium-config.xml
+++ b/src/configs/arago-master-chromium-config.xml
@@ -16,6 +16,12 @@
                 <layer>meta-arago-test</layer>
             </layers>
         </repo>
+        <repo name='meta-flutter' url='https://github.com/meta-flutter/meta-flutter.git' branch='master' commit='HEAD' disabled='true'>
+            <layers>
+                <layer>.</layer>
+                <layer>meta-flutter-apps</layer>
+            </layers>
+        </repo>
         <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='HEAD'>
             <layers>
                 <layer>meta-chromium</layer>
diff --git a/src/configs/arago-master-config.xml b/src/configs/arago-master-config.xml
index d56ec9a..a7eeb4d 100644
--- a/src/configs/arago-master-config.xml
+++ b/src/configs/arago-master-config.xml
@@ -16,6 +16,12 @@
                 <layer>meta-arago-test</layer>
             </layers>
         </repo>
+        <repo name='meta-flutter' url='https://github.com/meta-flutter/meta-flutter.git' branch='master' commit='HEAD' disabled='true'>
+            <layers>
+                <layer>.</layer>
+                <layer>meta-flutter-apps</layer>
+            </layers>
+        </repo>
         <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='HEAD' disabled='true'>
             <layers>
                 <layer>meta-chromium</layer>
diff --git a/src/configs/arago-master-flutter-config.xml b/src/configs/arago-master-flutter-config.xml
new file mode 100644
index 0000000..3fdcbe7
--- /dev/null
+++ b/src/configs/arago-master-flutter-config.xml
@@ -0,0 +1,72 @@
+<?xml version='1.0'?>
+<config>
+    <description>Arago reference distribution for master-flutter</description>
+
+    <xi:include href='../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/local-arago64-v3.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='master' commit='HEAD'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='master' commit='HEAD'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-flutter' url='https://github.com/meta-flutter/meta-flutter.git' branch='master' commit='HEAD'>
+            <layers>
+                <layer>.</layer>
+		<layer>meta-flutter-apps</layer>
+            </layers>
+        </repo>
+        <repo name='meta-selinux' url='https://git.yoctoproject.org/meta-selinux' branch='master' commit='HEAD' disabled='true'>
+            <layers/>
+        </repo>
+        <repo name='meta-qt6' url='https://code.qt.io/yocto/meta-qt6.git' branch='dev' commit='HEAD'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='master' commit='HEAD'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='master' commit='HEAD'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='master' commit='HEAD'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-beagle</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='master' commit='HEAD'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='master' commit='HEAD'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='master' commit='HEAD'>
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
diff --git a/src/configs/arago-master-next-config.xml b/src/configs/arago-master-next-config.xml
index 415236f..c4ec0f5 100644
--- a/src/configs/arago-master-next-config.xml
+++ b/src/configs/arago-master-next-config.xml
@@ -17,6 +17,12 @@
                 <layer>meta-arago-test</layer>
             </layers>
         </repo>
+        <repo name='meta-flutter' url='https://github.com/meta-flutter/meta-flutter.git' branch='master' commit='HEAD' disabled='true'>
+            <layers>
+                <layer>.</layer>
+                <layer>meta-flutter-apps</layer>
+            </layers>
+        </repo>
         <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='HEAD' disabled='true'>
             <layers>
                 <layer>meta-chromium</layer>
diff --git a/src/configs/arago-master-selinux-config.xml b/src/configs/arago-master-selinux-config.xml
index 5041fba..59d05d7 100644
--- a/src/configs/arago-master-selinux-config.xml
+++ b/src/configs/arago-master-selinux-config.xml
@@ -16,6 +16,12 @@
                 <layer>meta-arago-test</layer>
             </layers>
         </repo>
+        <repo name='meta-flutter' url='https://github.com/meta-flutter/meta-flutter.git' branch='master' commit='HEAD' disabled='true'>
+            <layers>
+                <layer>.</layer>
+                <layer>meta-flutter-apps</layer>
+            </layers>
+        </repo>
         <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='HEAD' disabled='true'>
             <layers>
                 <layer>meta-chromium</layer>
diff --git a/src/configs/arago-master-wip-config.xml b/src/configs/arago-master-wip-config.xml
index 8a2d7f5..e8a8407 100644
--- a/src/configs/arago-master-wip-config.xml
+++ b/src/configs/arago-master-wip-config.xml
@@ -16,6 +16,12 @@
                 <layer>meta-arago-test</layer>
             </layers>
         </repo>
+        <repo name='meta-flutter' url='https://github.com/meta-flutter/meta-flutter.git' branch='master' commit='HEAD' disabled='true'>
+            <layers>
+                <layer>.</layer>
+                <layer>meta-flutter-apps</layer>
+            </layers>
+        </repo>
         <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='HEAD' disabled='true'>
             <layers>
                 <layer>meta-chromium</layer>
-- 
2.34.1


