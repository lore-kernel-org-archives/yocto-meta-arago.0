Return-Path: <jake@udc0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 1494052961
	for <meta-arago@arago-project.org>;
	Fri,  9 Oct 2015 11:42:06 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t99Bg5f8021790
	for <meta-arago@arago-project.org>; Fri, 9 Oct 2015 06:42:05 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t99Bg50f023247
	for <meta-arago@arago-project.org>; Fri, 9 Oct 2015 06:42:05 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 9 Oct 2015 06:42:05 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t99Bg5qn023350;
	Fri, 9 Oct 2015 06:42:05 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1ZkW3o-0000fY-RA; Fri, 09 Oct 2015 07:42:04 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 9 Oct 2015 07:42:02 -0400
Message-ID: <1444390923-2538-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/2] local-processor-sdk-64.conf.sample: Switch SDK machine to 64 bit
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Oct 2015 11:42:06 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 sample-files/local-processor-sdk-64.conf.sample | 165 ++++++++++++++++++++++++
 1 file changed, 165 insertions(+)
 create mode 100644 sample-files/local-processor-sdk-64.conf.sample

diff --git a/sample-files/local-processor-sdk-64.conf.sample b/sample-files/local-processor-sdk-64.conf.sample
new file mode 100644
index 0000000..726b1ba
--- /dev/null
+++ b/sample-files/local-processor-sdk-64.conf.sample
@@ -0,0 +1,165 @@
+# CONF_VERSION is increased each time build/conf/ changes incompatibly
+CONF_VERSION = "1"
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
+DL_DIR = "${OEBASE}/downloads"
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
+SSTATE_DIR = "${OEBASE}/build/sstate-cache"
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
+TMPDIR = "${OEBASE}/build/arago-tmp"
+
+#
+# Machine Selection
+#
+# You need to select a specific machine to target the build with. There are a selection
+# of emulated machines available which can boot and run in the QEMU emulator:
+#
+MACHINE ?= "arago"
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
+#   - 'image-mklibs' to reduce shared library files size for an image
+#   - 'image-prelink' in order to prelink the filesystem image
+#   - 'image-swab' to perform host system intrusion detection
+# NOTE: if listing mklibs & prelink both, then make sure mklibs is before prelink
+# NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
+USER_CLASSES ?= "buildstats image-mklibs image-prelink"
+
+# By default disable interactive patch resolution (tasks will just fail instead):
+PATCHRESOLVE = "noop"
+
+# Qemu 0.12.x is giving too much problems recently (2010.05), so disable it for users
+ENABLE_BINARY_LOCALE_GENERATION = "0"
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
+BB_NUMBER_THREADS = "1"
+# 
+# The second option controls how many processes make should run in parallel when
+# running compile tasks:
+#
+PARALLEL_MAKE = "-j 1"
+#
+# For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
+# be appropriate for example
+
+DISTRO   = "arago"
+
+# Set branding policy for AM-SDK
+ARAGO_BRAND = "processor-sdk"
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
-- 
1.9.1


