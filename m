Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 559AE529AE
	for <meta-arago@arago-project.org>;
	Tue, 10 Jul 2018 01:09:31 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6A19OkC117581
	for <meta-arago@arago-project.org>; Mon, 9 Jul 2018 20:09:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531184964;
	bh=dexXDrNumKklAiK+6bmLSrjEJX9uoXJC9kFsitAJ+k8=;
	h=From:To:CC:Subject:Date;
	b=eBEPByHeT1cJXwcNLSgYnqE74rceqpVgL+aLOWdzcS3xvH5afUloxMITHYM8VOOhr
	nqbGyWrkCEXFWlNYrdrQDiQTV9/gTtMh+NSj+8mQx62/LhLWa7WGopIKO+n3dRsIDl
	B80A2YSCpl5UAFcifnnJ+kV4tjimjUz/A70HibSs=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6A19OFF015050
	for <meta-arago@arago-project.org>; Mon, 9 Jul 2018 20:09:24 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 9 Jul 2018 20:09:24 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 9 Jul 2018 20:09:24 -0500
Received: from puget.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6A19OQF023083;
	Mon, 9 Jul 2018 20:09:24 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 10 Jul 2018 01:07:59 +0000
Message-ID: <20180710010759.8797-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] meta-arago: cleanup use of d.getVar()
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
X-List-Received-Date: Tue, 10 Jul 2018 01:09:31 -0000
Content-Type: text/plain

1. drop use of True as second parameter, which is default, to align with master
2. there were instances of incorrectly passing 'd' as second parameter from
previous conversion from bb.data.getVar() usage

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../classes/kernel-fitimage.bbclass              | 16 ++++++++--------
 meta-arago-distro/classes/tisdk-image.bbclass    |  8 ++++----
 meta-arago-distro/classes/uboot-config.bbclass   | 14 +++++++-------
 meta-arago-distro/classes/uboot-sign.bbclass     |  6 +++---
 meta-arago-distro/conf/distro/arago.conf         |  4 ++--
 .../conf/distro/include/toolchain-gcc.inc        |  2 +-
 .../netboot-initrd/netboot-initrd_0.0.1.bb       |  3 +--
 .../recipes-devtools/gcc/gcc_%.bbappend          |  2 +-
 .../wayland/wayland-ivi-extension_2.1.0.bb       |  2 +-
 .../examples/qtwebbrowser_1.0.bbappend           |  0
 .../recipes-qt/qt5/qtbase_%.bbappend             |  4 ++--
 .../include/tclibc-external-linaro-toolchain.inc |  6 +++---
 meta-arago-extras/recipes-core/llvm/llvm.inc     |  2 +-
 .../meta/external-linaro-bfd-version.inc         |  4 ++--
 .../ocl-rtos/opencl-examples-rtos_git.bb         |  4 ++--
 .../recipes-ti/ocl/opencl-examples_git.bb        |  4 ++--
 .../openmpacc/openmpacc-examples_git.bb          |  4 ++--
 17 files changed, 42 insertions(+), 43 deletions(-)
 mode change 100755 => 100644 meta-arago-distro/recipes-qt/examples/qtwebbrowser_1.0.bbappend

diff --git a/meta-arago-distro/classes/kernel-fitimage.bbclass b/meta-arago-distro/classes/kernel-fitimage.bbclass
index 52399fe6..a3b85ad3 100644
--- a/meta-arago-distro/classes/kernel-fitimage.bbclass
+++ b/meta-arago-distro/classes/kernel-fitimage.bbclass
@@ -10,13 +10,13 @@ XZ_INTEGRITY_CHECK ?= "crc32"
 XZ_THREADS ?= "-T 0"
 
 python __anonymous () {
-    kerneltypes = d.getVar('KERNEL_IMAGETYPES', True) or ""
+    kerneltypes = d.getVar('KERNEL_IMAGETYPES') or ""
     if 'fitImage' in kerneltypes.split():
-        depends = d.getVar("DEPENDS", True)
+        depends = d.getVar("DEPENDS")
         depends = "%s u-boot-mkimage-native dtc-native" % depends
         d.setVar("DEPENDS", depends)
 
-        if d.getVar("UBOOT_ARCH", True) == "x86":
+        if d.getVar("UBOOT_ARCH") == "x86":
             replacementtype = "bzImage"
         else:
             replacementtype = "zImage"
@@ -24,22 +24,22 @@ python __anonymous () {
 	# Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
 	# to kernel.bbclass . We have to override it, since we pack zImage
 	# (at least for now) into the fitImage .
-        typeformake = d.getVar("KERNEL_IMAGETYPE_FOR_MAKE", True) or ""
+        typeformake = d.getVar("KERNEL_IMAGETYPE_FOR_MAKE") or ""
         if 'fitImage' in typeformake.split():
             d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake.replace('fitImage', replacementtype))
 
-        image = d.getVar('INITRAMFS_IMAGE', True)
+        image = d.getVar('INITRAMFS_IMAGE')
         if image:
             d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
 
         # Verified boot will sign the fitImage and append the public key to
         # U-boot dtb. We ensure the U-Boot dtb is deployed before assembling
         # the fitImage:
-        if d.getVar('UBOOT_SIGN_ENABLE', True):
-            uboot_pn = d.getVar('PREFERRED_PROVIDER_u-boot', True) or 'u-boot'
+        if d.getVar('UBOOT_SIGN_ENABLE'):
+            uboot_pn = d.getVar('PREFERRED_PROVIDER_u-boot') or 'u-boot'
             d.appendVarFlag('do_assemble_fitimage', 'depends', ' %s:do_deploy' % uboot_pn)
 
-        if d.getVar('OPTEEMACHINE', True):
+        if d.getVar('OPTEEMACHINE'):
             d.appendVarFlag('do_assemble_fitimage', 'depends', ' optee-os:do_deploy')
 }
 
diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index d38166d4..7bc3ca06 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -81,12 +81,12 @@ def string_set(iterable):
 
 # Add a dependency for the do_rootfs function that will force us to build
 # the TARGET_IMAGES first so that they will be available for packaging.
-do_rootfs[depends] += "${@string_set('%s:do_image_complete' % pn for pn in (d.getVar("TARGET_IMAGES", True) or "").split())}"
+do_rootfs[depends] += "${@string_set('%s:do_image_complete' % pn for pn in (d.getVar("TARGET_IMAGES") or "").split())}"
 
 # Add a dependency for the do_populate_sdk function of the TIDSK_TOOLCHAIN
 # variable which will force us to build the toolchain first so that it will be
 # available for packaging
-do_rootfs[depends] += "${@string_set('%s:do_populate_sdk' % pn for pn in (d.getVar("TISDK_TOOLCHAIN", True) or "").split())}"
+do_rootfs[depends] += "${@string_set('%s:do_populate_sdk' % pn for pn in (d.getVar("TISDK_TOOLCHAIN") or "").split())}"
 
 do_rootfs[nostamp] = "1"
 do_rootfs[lockfiles] += "${IMAGE_ROOTFS}.lock"
@@ -670,7 +670,7 @@ fakeroot python do_rootfs () {
 fakeroot python do_image () {
     from oe.utils import execute_pre_post_process
 
-    pre_process_cmds = d.getVar("IMAGE_PREPROCESS_COMMAND", True)
+    pre_process_cmds = d.getVar("IMAGE_PREPROCESS_COMMAND")
 
     execute_pre_post_process(d, pre_process_cmds)
 }
@@ -681,7 +681,7 @@ addtask do_image after do_rootfs before do_build
 fakeroot python do_image_complete () {
     from oe.utils import execute_pre_post_process
 
-    post_process_cmds = d.getVar("IMAGE_POSTPROCESS_COMMAND", True)
+    post_process_cmds = d.getVar("IMAGE_POSTPROCESS_COMMAND")
 
     execute_pre_post_process(d, post_process_cmds)
 }
diff --git a/meta-arago-distro/classes/uboot-config.bbclass b/meta-arago-distro/classes/uboot-config.bbclass
index 71177019..8f1ded48 100644
--- a/meta-arago-distro/classes/uboot-config.bbclass
+++ b/meta-arago-distro/classes/uboot-config.bbclass
@@ -14,20 +14,20 @@
 UBOOT_BINARY ?= "u-boot.${UBOOT_SUFFIX}"
 
 python () {
-    ubootmachine = d.getVar("UBOOT_MACHINE", True)
+    ubootmachine = d.getVar("UBOOT_MACHINE")
     ubootconfigflags = d.getVarFlags('UBOOT_CONFIG')
-    ubootbinary = d.getVar('UBOOT_BINARY', True)
-    ubootbinaries = d.getVar('UBOOT_BINARIES', True)
+    ubootbinary = d.getVar('UBOOT_BINARY')
+    ubootbinaries = d.getVar('UBOOT_BINARIES')
     # The "doc" varflag is special, we don't want to see it here
     ubootconfigflags.pop('doc', None)
-    ubootconfig = (d.getVar('UBOOT_CONFIG', True) or "").split()
+    ubootconfig = (d.getVar('UBOOT_CONFIG') or "").split()
 
     if not ubootmachine and len(ubootconfig) == 0:
-        PN = d.getVar("PN", True)
-        FILE = os.path.basename(d.getVar("FILE", True))
+        PN = d.getVar("PN")
+        FILE = os.path.basename(d.getVar("FILE"))
         bb.debug(1, "To build %s, see %s for instructions on \
                  setting up your machine config" % (PN, FILE))
-        raise bb.parse.SkipPackage("Either UBOOT_MACHINE or UBOOT_CONFIG must be set in the %s machine configuration." % d.getVar("MACHINE", True))
+        raise bb.parse.SkipPackage("Either UBOOT_MACHINE or UBOOT_CONFIG must be set in the %s machine configuration." % d.getVar("MACHINE"))
 
     if ubootmachine and len(ubootconfig) > 0:
         raise bb.parse.SkipPackage("You cannot use UBOOT_MACHINE and UBOOT_CONFIG at the same time.")
diff --git a/meta-arago-distro/classes/uboot-sign.bbclass b/meta-arago-distro/classes/uboot-sign.bbclass
index 3c56db88..dbe29335 100644
--- a/meta-arago-distro/classes/uboot-sign.bbclass
+++ b/meta-arago-distro/classes/uboot-sign.bbclass
@@ -80,9 +80,9 @@ do_concat_dtb () {
 }
 
 python () {
-	uboot_pn = d.getVar('PREFERRED_PROVIDER_u-boot', True) or 'u-boot'
-	if d.getVar('UBOOT_SIGN_ENABLE', True) == '1' and d.getVar('PN', True) == uboot_pn:
-		kernel_pn = d.getVar('PREFERRED_PROVIDER_virtual/kernel', True)
+	uboot_pn = d.getVar('PREFERRED_PROVIDER_u-boot') or 'u-boot'
+	if d.getVar('UBOOT_SIGN_ENABLE') == '1' and d.getVar('PN') == uboot_pn:
+		kernel_pn = d.getVar('PREFERRED_PROVIDER_virtual/kernel')
 
 		# u-boot.dtb and u-boot-nodtb.bin are deployed _before_ do_deploy
 		# Thus, do_deploy_setscene will also populate them in DEPLOY_IMAGE_DIR
diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 616c440c..7f7baef8 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -132,13 +132,13 @@ ARAGO_KERNEL_SUFFIX_append = "${@base_conditional("ARAGO_RT_ENABLE", "1", "-rt",
 # Set systest kernel suffix
 ARAGO_SYSTEST_ENABLE ?= "0"
 ARAGO_KERNEL_SUFFIX_append = "${@base_conditional("ARAGO_SYSTEST_ENABLE", "1", "-systest", "", d)}"
-IMAGE_FSTYPES_remove = "${@['','ubi ubifs'][d.getVar('ARAGO_SYSTEST_ENABLE', True) == '1']}"
+IMAGE_FSTYPES_remove = "${@['','ubi ubifs'][d.getVar('ARAGO_SYSTEST_ENABLE') == '1']}"
 
 # Toolchain should be selected by setting TOOLCHAIN_BRAND in local.conf
 # Set some sane defaults, in case someone forgets to set them in local.conf
 TC_SANE_DEFAULT ?= "linaro"
 TOOLCHAIN_TYPE ?= "external"
-TOOLCHAIN_BRAND ?= "${@[d.getVar('TC_SANE_DEFAULT', True),'gcc'][d.getVar('TOOLCHAIN_TYPE', True) == 'internal']}"
+TOOLCHAIN_BRAND ?= "${@[d.getVar('TC_SANE_DEFAULT'),'gcc'][d.getVar('TOOLCHAIN_TYPE') == 'internal']}"
 
 require conf/distro/include/toolchain-${TOOLCHAIN_BRAND}.inc
 require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}.inc
diff --git a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
index 783a6069..8c602330 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
@@ -2,7 +2,7 @@
 TCMODE = "default"
 TCLIBC = "glibc"
 
-LIBCEXTENSION = "${@['', '-gnu'][(d.getVar('ABIEXTENSION', True) or '') != '']}"
+LIBCEXTENSION = "${@['', '-gnu'][(d.getVar('ABIEXTENSION') or '') != '']}"
 
 # Match some of the external vars
 TOOLCHAIN_SYS := "${TARGET_SYS}"
diff --git a/meta-arago-distro/recipes-bsp/netboot-initrd/netboot-initrd_0.0.1.bb b/meta-arago-distro/recipes-bsp/netboot-initrd/netboot-initrd_0.0.1.bb
index e165d9ac..260236e1 100644
--- a/meta-arago-distro/recipes-bsp/netboot-initrd/netboot-initrd_0.0.1.bb
+++ b/meta-arago-distro/recipes-bsp/netboot-initrd/netboot-initrd_0.0.1.bb
@@ -25,8 +25,7 @@ IMAGE_INSTALL = "\
   "
 
 # add the required kernel modules
-IMAGE_INSTALL += "${@' '.join(['kernel-module-'+x for x in d.getVar('NETBOOT_KERNEL_MODULES',d,1).split()])}"
-
+IMAGE_INSTALL += "${@' '.join(['kernel-module-'+x for x in d.getVar('NETBOOT_KERNEL_MODULES').split()])}"
 
 # Reduce the size of the rootfs by removing features
 
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc_%.bbappend b/meta-arago-distro/recipes-devtools/gcc/gcc_%.bbappend
index 92f2874c..4769d63a 100644
--- a/meta-arago-distro/recipes-devtools/gcc/gcc_%.bbappend
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc_%.bbappend
@@ -1,4 +1,4 @@
 DEPENDS =+ "flex-native"
 
-EXTRA_DEPS = "${@['','external-linaro-toolchain-cross-${TARGET_ARCH}'][d.getVar('TOOLCHAIN_TYPE', True) == 'external' and d.getVar('TOOLCHAIN_BRAND', True) == 'linaro']}"
+EXTRA_DEPS = "${@['','external-linaro-toolchain-cross-${TARGET_ARCH}'][d.getVar('TOOLCHAIN_TYPE') == 'external' and d.getVar('TOOLCHAIN_BRAND') == 'linaro']}"
 DEPENDS += "${EXTRA_DEPS}"
diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.1.0.bb b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.1.0.bb
index 894d1b8f..52f9810a 100644
--- a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.1.0.bb
+++ b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.1.0.bb
@@ -22,7 +22,7 @@ EXTRA_OECMAKE := "-DWITH_ILM_INPUT=1"
 FILES_${PN} += "${libdir}/weston/*"
 FILES_${PN}-dbg += "${libdir}/weston/.debug/*"
 
-EXTRA_OECMAKE += "-DLIB_SUFFIX=${@d.getVar('baselib', True).replace('lib', '')}"
+EXTRA_OECMAKE += "-DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
 
 PR = "r1"
 
diff --git a/meta-arago-distro/recipes-qt/examples/qtwebbrowser_1.0.bbappend b/meta-arago-distro/recipes-qt/examples/qtwebbrowser_1.0.bbappend
old mode 100755
new mode 100644
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
index 5d6f5e43..62f49e48 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
@@ -23,8 +23,8 @@ SRC_URI += "\
 python do_patch_append() {
     import shutil
 
-    work_dir = d.getVar("WORKDIR", True)
-    s = d.getVar("S", True)
+    work_dir = d.getVar("WORKDIR")
+    s = d.getVar("S")
 
     if not bb.utils.contains('DISTRO_FEATURES','wayland',True,False,d):
         shutil.copy(os.path.join(work_dir,"quit.png"),os.path.join(s,"examples/widgets/animation/animatedtiles/images/"))
diff --git a/meta-arago-extras/conf/distro/include/tclibc-external-linaro-toolchain.inc b/meta-arago-extras/conf/distro/include/tclibc-external-linaro-toolchain.inc
index 7c149f83..0c74b49a 100644
--- a/meta-arago-extras/conf/distro/include/tclibc-external-linaro-toolchain.inc
+++ b/meta-arago-extras/conf/distro/include/tclibc-external-linaro-toolchain.inc
@@ -2,7 +2,7 @@
 # external Linaro glibc specific configuration
 #
 
-LIBCEXTENSION = "${@['', '-gnu'][(d.getVar('ABIEXTENSION', True) or '') != '']}"
+LIBCEXTENSION = "${@['', '-gnu'][(d.getVar('ABIEXTENSION') or '') != '']}"
 
 # Add glibc overrides to the overrides for glibc.
 LIBCOVERRIDE = ":libc-glibc"
@@ -32,7 +32,7 @@ LIBC_LOCALE_DEPENDENCIES = "\
 	locale-base-en-gb"
 
 def get_libc_locales_dependencies(d):
-    if 'libc-locales' in (d.getVar('DISTRO_FEATURES', True) or '').split() :
-        return d.getVar('LIBC_LOCALE_DEPENDENCIES', True) or ''
+    if 'libc-locales' in (d.getVar('DISTRO_FEATURES') or '').split() :
+        return d.getVar('LIBC_LOCALE_DEPENDENCIES') or ''
     else:
         return ''
diff --git a/meta-arago-extras/recipes-core/llvm/llvm.inc b/meta-arago-extras/recipes-core/llvm/llvm.inc
index fa971f38..f27261fa 100644
--- a/meta-arago-extras/recipes-core/llvm/llvm.inc
+++ b/meta-arago-extras/recipes-core/llvm/llvm.inc
@@ -153,7 +153,7 @@ python llvm_populate_packages() {
     split_packages = do_split_packages(d, libdir, '^lib(.*)\.so$', 'libllvm${LLVM_RELEASE}-%s', 'Split package for %s', allow_dirs=True, allow_links=True, recursive=True)
     split_staticdev_packages = do_split_packages(d, libllvm_libdir, '^lib(.*)\.a$', 'libllvm${LLVM_RELEASE}-%s-staticdev', 'Split staticdev package for %s', allow_dirs=True)
     if split_packages:
-        pn = d.getVar('PN', True)
+        pn = d.getVar('PN')
         d.appendVar('RDEPENDS_' + pn, ' '+' '.join(split_packages))
         d.appendVar('RDEPENDS_' + pn + '-dbg', ' '+' '.join(split_dbg_packages))
         d.appendVar('RDEPENDS_' + pn + '-staticdev', ' '+' '.join(split_staticdev_packages))
diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-bfd-version.inc b/meta-arago-extras/recipes-core/meta/external-linaro-bfd-version.inc
index 47911a2d..bbc36042 100644
--- a/meta-arago-extras/recipes-core/meta/external-linaro-bfd-version.inc
+++ b/meta-arago-extras/recipes-core/meta/external-linaro-bfd-version.inc
@@ -2,7 +2,7 @@ TOOLCHAIN_PATH ??= "${STAGING_BINDIR_TOOLCHAIN}"
 
 def elt_get_bfd_version(d):
 	import subprocess,os,bb
-	if os.path.exists(d.getVar('TOOLCHAIN_PATH', d, 1)+'/bin/'+d.getVar('TARGET_PREFIX', d, 1)+'as'):
-		return subprocess.Popen([d.getVar('TOOLCHAIN_PATH', d, 1)+'/bin/'+d.getVar('TARGET_PREFIX', d, 1)+'as', '-v', '--version'], stderr=subprocess.STDOUT,stdout=subprocess.PIPE).communicate()[0].splitlines()[0].split()[3]
+	if os.path.exists(d.getVar('TOOLCHAIN_PATH')+'/bin/'+d.getVar('TARGET_PREFIX')+'as'):
+		return subprocess.Popen([d.getVar('TOOLCHAIN_PATH')+'/bin/'+d.getVar('TARGET_PREFIX')+'as', '-v', '--version'], stderr=subprocess.STDOUT,stdout=subprocess.PIPE).communicate()[0].splitlines()[0].split()[3]
 
 ELT_VER_BFD := "${@elt_get_bfd_version(d)}"
diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb
index 29c45faa..42bc0a9b 100644
--- a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb
@@ -47,14 +47,14 @@ python do_unpack_append() {
     import shutil
 
     git_dir = d.expand("${WORKDIR}/git/examples")
-    s = d.getVar("S", True)
+    s = d.getVar("S")
 
     os.makedirs(s)
     shutil.copy(os.path.join(git_dir,"Makefile"),s)
     shutil.copy(os.path.join(git_dir,"make_rtos.inc"),s)
     shutil.copy(os.path.join(git_dir,"rtos_main.c"),s)
     shutil.copy(os.path.join(git_dir,"load_am57_rtos.js"),s)
-    for example in d.getVar("OCL_EXAMPLE_LIST", True).split():
+    for example in d.getVar("OCL_EXAMPLE_LIST").split():
         shutil.copytree(os.path.join(git_dir,example), os.path.join(s,example))
 }
 
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
index 25b01258..f5de598d 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
@@ -68,12 +68,12 @@ python do_unpack_append() {
     import shutil
 
     git_dir = d.expand("${WORKDIR}/git/examples")
-    s = d.getVar("S", True)
+    s = d.getVar("S")
 
     os.makedirs(s)
     shutil.copy(os.path.join(git_dir,"Makefile"),s)
     shutil.copy(os.path.join(git_dir,"make.inc"),s)
-    for example in d.getVar("OCL_EXAMPLE_LIST", True).split():
+    for example in d.getVar("OCL_EXAMPLE_LIST").split():
         shutil.copytree(os.path.join(git_dir,example), os.path.join(s,example))
 }
 
diff --git a/meta-arago-extras/recipes-ti/openmpacc/openmpacc-examples_git.bb b/meta-arago-extras/recipes-ti/openmpacc/openmpacc-examples_git.bb
index 1afff10f..b2f4122c 100644
--- a/meta-arago-extras/recipes-ti/openmpacc/openmpacc-examples_git.bb
+++ b/meta-arago-extras/recipes-ti/openmpacc/openmpacc-examples_git.bb
@@ -30,13 +30,13 @@ python do_unpack_append() {
     import shutil
 
     git_dir = d.expand("${WORKDIR}/git/examples")
-    s = d.getVar("S", True)
+    s = d.getVar("S")
 
     os.makedirs(s)
     shutil.copy(os.path.join(git_dir,"Makefile"),s)
     shutil.copy(os.path.join(git_dir,"make.inc"),s)
     shutil.copy(os.path.join(git_dir,"ompacc_env.sh"),s)
-    for example in d.getVar("OMPACC_EXAMPLE_LIST", True).split():
+    for example in d.getVar("OMPACC_EXAMPLE_LIST").split():
         shutil.copytree(os.path.join(git_dir,example), os.path.join(s,example))
 }
 
-- 
2.17.1


