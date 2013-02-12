Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f54.google.com (mail-oa0-f54.google.com
	[209.85.219.54])
	by arago-project.org (Postfix) with ESMTPS id 8D48852A20
	for <meta-arago@arago-project.org>;
	Tue, 12 Feb 2013 00:46:56 +0000 (UTC)
Received: by mail-oa0-f54.google.com with SMTP id n12so6986819oag.13
	for <meta-arago@arago-project.org>;
	Mon, 11 Feb 2013 16:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=Q253LKgA/+40avpL7XOZAjFx48RZx+7tA8P2DW62Q/c=;
	b=sLTebN5yTZlr0Ze1hH/rKf9IgTLVFaMXiO135sVYejaZ1AzzgwQbDYDxrENKwEC47r
	eutJt0vqquznRDKAlpTG/OW27+tHuJwIEivUMDZCK3DWOVv14U/m9Lmwqnw8T66mP1HS
	dgE+ncu42hQ1q7sk0vE4RA1HGrsTPBk6BLYzWfphJ4UsW3inNNQXV1SaJKarIwADU3fO
	G50fHvt/C5lDabHWKa+iPELlW05ojgpqTm9yjyqOOY9btBbeUPwaoV2uzQkqeavd28nC
	FyULbfMCYLg2tMs7vQPn3+YmykUQM9ht4cFX7Y4VZCYj0cEkIU/NK96ycSkuYiO6xYv8
	YLpA==
X-Received: by 10.60.32.242 with SMTP id m18mr11861679oei.101.1360630015850;
	Mon, 11 Feb 2013 16:46:55 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b6sm52434322oee.3.2013.02.11.16.46.53
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 16:46:54 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 11 Feb 2013 18:46:17 -0600
Message-Id: <1360629979-24789-16-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1360629979-24789-1-git-send-email-fcooper@ti.com>
References: <1360629979-24789-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 16/18] tisdk-image: Remove toolchain cleanup functionality
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
X-List-Received-Date: Tue, 12 Feb 2013 00:46:56 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Removing packages from the toolchain sdk is now handled by
  meta-toolchain-arago.
* Removing that functionality from this class.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/classes/tisdk-image.bbclass |   34 +------------------------
 1 files changed, 1 insertions(+), 33 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index adc6359..c2f93e2 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -75,14 +75,11 @@ do_sdk_image[cleandirs] += "${S}"
 
 # Call the cleanup_host_packes to remove packages that should be removed from
 # the host for various reasons.  This may include licensing issues as well.
-OPKG_POSTPROCESS_COMMANDS = "cleanup_host_packages; cleanup_toolchain_packages; "
+OPKG_POSTPROCESS_COMMANDS = "cleanup_host_packages; "
 
 # List of packages to remove from the SDK host package set
 HOST_CLEANUP_PACKAGES ?= ""
 
-# List of packages to remove from the SDK toolchain package set
-TOOLCHAIN_CLEANUP_PACKAGES ?= ""
-
 # Remove any packages that may have been pulled in by other package installs
 # that are not desired.  This should be used with caution.
 cleanup_host_packages() {
@@ -92,30 +89,6 @@ cleanup_host_packages() {
     fi
 }
 
-# Remove undesired packages that may be pulled into the toolchain by -dev
-# package dependencies.  This is usually GPLv3 components.
-cleanup_toolchain_packages() {
-    if [ "${TOOLCHAIN_CLEANUP_PACKAGES}" != "" ]
-    then
-        # Make sure the TISDK_TOOLCHAIN_PATH is valid
-        if [ ! -d ${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH} ]
-        then
-            echo "Could not find the TISDK_TOOLCHAIN_PATH (${TISDK_TOOLCHAIN_PATH})"
-            return 1
-        fi
-
-        # Clean up the native side of the toolchain
-        opkg_dir="${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}"
-        opkg_conf="${opkg_dir}/etc/opkg-sdk.conf"
-        opkg-cl -o $opkg_dir -f $opkg_conf --force-depends remove ${TOOLCHAIN_CLEANUP_PACKAGES}
-
-        # Clean up the target side of the toolchain
-        opkg_dir="${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}/arm-arago-linux-gnueabi"
-        opkg_conf="${opkg_dir}/etc/opkg.conf"
-        opkg-cl -o $opkg_dir -f $opkg_conf --force-depends remove ${TOOLCHAIN_CLEANUP_PACKAGES}
-    fi
-}
-
 # Copy log_check from image.bbclass since the rootfs_ipk_do_rootfs function
 # uses it, but we are not inheriting the full image class.
 log_check() {
@@ -505,11 +478,6 @@ do_sdk_image () {
 
 	mkdir -p ${IMAGE_ROOTFS}/etc
 
-    # Extract the toolchain SDK here so that it will be available when the
-    # OPKG_POSTPROCESS_COMMANDS are run
-    tar xjf ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-tisdk-${SDK_ARCH}* -C ${IMAGE_ROOTFS}/
-    mv ${IMAGE_ROOTFS}/${SDK_NAME} ${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}
-
     # Creat the base SDK image
 	rootfs_${IMAGE_PKGTYPE}_do_rootfs
 
-- 
1.7.0.4


