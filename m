Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id DB5AA529BC
	for <meta-arago@arago-project.org>;
	Tue,  1 Jul 2014 19:20:34 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N8100HTESDDNTR0@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 01 Jul 2014 14:20:11 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 27C2C20101; Tue,
	01 Jul 2014 15:20:01 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 01 Jul 2014 15:19:59 -0400
Message-id: <1404242399-15206-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
Subject: [PATCH] tisdk-image.bbclass: update for the new rootfs/image infrastructure
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
X-List-Received-Date: Tue, 01 Jul 2014 19:20:35 -0000

From: Denys Dmytriyenko <denys@ti.com>

The entire rootfs/image processing infrastructure was rewritten in Python for
Daisy release. Since tisdk_image class is based on rootfs/image base classes
and uses their APIs, some adjustments are required in order for it to work.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/tisdk-image.bbclass | 83 +++++++++++++--------------
 1 file changed, 39 insertions(+), 44 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index b100261..6023d6b 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -65,18 +65,18 @@ def string_set(iterable):
 
 # Add a dependency for the do_rootfs function that will force us to build
 # the TARGET_IMAGES first so that they will be available for packaging.
-do_sdk_image[depends] += "${@string_set('%s:do_rootfs' % pn for pn in (d.getVar("TARGET_IMAGES", True) or "").split())}"
+do_rootfs[depends] += "${@string_set('%s:do_rootfs' % pn for pn in (d.getVar("TARGET_IMAGES", True) or "").split())}"
 
 # Add a dependency for the do_populate_sdk function of the TIDSK_TOOLCHAIN
 # variable which will force us to build the toolchain first so that it will be
 # available for packaging
-do_sdk_image[depends] += "${@string_set('%s:do_populate_sdk' % pn for pn in (d.getVar("TISDK_TOOLCHAIN", True) or "").split())}"
+do_rootfs[depends] += "${@string_set('%s:do_populate_sdk' % pn for pn in (d.getVar("TISDK_TOOLCHAIN", True) or "").split())}"
 
-do_sdk_image[nostamp] = "1"
-do_sdk_image[lockfiles] += "${IMAGE_ROOTFS}.lock"
-do_sdk_image[cleandirs] += "${S}"
+do_rootfs[nostamp] = "1"
+do_rootfs[lockfiles] += "${IMAGE_ROOTFS}.lock"
+do_rootfs[cleandirs] += "${S}"
 
-# Call the cleanup_host_packes to remove packages that should be removed from
+# Call the cleanup_host_packages to remove packages that should be removed from
 # the host for various reasons.  This may include licensing issues as well.
 OPKG_POSTPROCESS_COMMANDS = "cleanup_host_packages; "
 
@@ -92,25 +92,6 @@ cleanup_host_packages() {
     fi
 }
 
-# Copy log_check from image.bbclass since the rootfs_ipk_do_rootfs function
-# uses it, but we are not inheriting the full image class.
-log_check() {
-	for target in $*
-	do
-		lf_path="${WORKDIR}/temp/log.do_$target.${PID}"
-		
-		echo "log_check: Using $lf_path as logfile"
-		
-		if test -e "$lf_path"
-		then
-			${IMAGE_PKGTYPE}_log_check $target $lf_path
-		else
-			echo "Cannot find logfile [$lf_path]"
-		fi
-		echo "Logfile is clean"
-	done
-}
-
 # Generate the header for a TI style software manifest
 sw_manifest_header() {
 echo "
@@ -235,7 +216,7 @@ echo "
 
 # Create the host side toolchain components table
 sw_manifest_toolchain_host() {
-    opkg_dir="${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}/sysroots/i686-*-linux/var/lib/opkg/info"
+    opkg_dir="${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}/sysroots/i686-*-linux/var/lib/opkg"
 
 echo "
 <h2><u>GPLv3 Development Host Content</u></h2>
@@ -471,24 +452,43 @@ generate_sw_manifest() {
     sw_manifest_footer
 }
 
+ROOTFS_PREPROCESS_COMMAND += "tisdk_image_setup; "
+ROOTFS_POSTPROCESS_COMMAND += "tisdk_image_build; "
+IMAGE_PREPROCESS_COMMAND += "tisdk_image_cleanup; "
+
 # Create the SDK image.  We will re-use the rootfs_ipk_do_rootfs functionality
 # to install a given list of packages using opkg.
-do_sdk_image () {
-	set -x
-	rm -rf ${IMAGE_ROOTFS}
-	mkdir -p ${IMAGE_ROOTFS}
-	mkdir -p ${DEPLOY_DIR_IMAGE}
+fakeroot python do_rootfs () {
+    from oe.rootfs import create_rootfs
+    from oe.image import create_image
+    from oe.manifest import create_manifest
+
+    # generate the initial manifest
+    create_manifest(d)
+
+    # generate rootfs
+    create_rootfs(d)
+
+    # generate final images
+    create_image(d)
+}
+
+tisdk_image_setup () {
+    set -x
+    rm -rf ${IMAGE_ROOTFS}
+    mkdir -p ${IMAGE_ROOTFS}
+    mkdir -p ${DEPLOY_DIR_IMAGE}
 
-	mkdir -p ${IMAGE_ROOTFS}/etc
+    mkdir -p ${IMAGE_ROOTFS}/etc
+    mkdir -p ${IMAGE_ROOTFS}/var/lib/opkg
 
     chmod 755 ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-tisdk*
 
     # Temporarily extract the toolchain sdk so we can read license information from it.
     echo "${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}" | ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-tisdk*
+}
 
-    # Creat the base SDK image
-	rootfs_${IMAGE_PKGTYPE}_do_rootfs
-
+tisdk_image_build () {
     mkdir -p ${IMAGE_ROOTFS}/filesystem
 
     # Copy the TARGET_IMAGES to the sdk image before packaging
@@ -607,23 +607,18 @@ do_sdk_image () {
 
     # Copy the opkg.conf used by the image to allow for future updates
     cp ${WORKDIR}/opkg.conf ${IMAGE_ROOTFS}/etc/
+}
 
+tisdk_image_cleanup () {
     # Move the var/etc directories which contains the opkg data used for the
     # manifest (and maybe one day for online updates) to a hidden directory.
     mv ${IMAGE_ROOTFS}/var ${IMAGE_ROOTFS}/.var
     mv ${IMAGE_ROOTFS}/etc ${IMAGE_ROOTFS}/.etc
-
-    # Create the image directory symlinks
-    # $ { @ get_imagecmds(d) }
 }
 
 license_create_manifest() {
     :
 }
 
-rootfs_install_complementary() {
-    :
-}
-
-EXPORT_FUNCTIONS do_sdk_image
-addtask sdk_image before do_build after do_install
+EXPORT_FUNCTIONS do_rootfs
+addtask rootfs before do_build after do_install
-- 
2.0.0


