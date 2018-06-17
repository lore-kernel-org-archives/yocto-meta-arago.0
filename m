Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 59F0C52A42
	for <meta-arago@arago-project.org>;
	Sun, 17 Jun 2018 19:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C0973207AB;
	Sun, 17 Jun 2018 19:37:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id KMlIMYoPKlnO; Sun, 17 Jun 2018 19:37:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9AEA020C15;
	Sun, 17 Jun 2018 19:37:43 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id EC3081634B2;
	Sun, 17 Jun 2018 15:37:41 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Sun, 17 Jun 2018 15:37:38 -0400
Message-Id: <1529264260-41284-7-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1529264260-41284-1-git-send-email-denys@ti.com>
References: <1529264260-41284-1-git-send-email-denys@ti.com>
Subject: [rocko/master][PATCH 7/9] tisdk-image.bbclass: update with ARMv8 support
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
X-List-Received-Date: Sun, 17 Jun 2018 19:37:52 -0000

Don't hardcode toolchain path that is specific to ARMv7.
Kernel binary image is called Image.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/tisdk-image.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index 4470e0e..dc715a6 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -378,7 +378,7 @@ sw_manifest_toolchain_host() {
 # Create the target side toolchain components table.  These are components on
 # the host but intended for the target.
 sw_manifest_toolchain_target() {
-    opkg_dir="${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}/sysroots/*-linux-gnueabi*/var/lib/opkg/info"
+    opkg_dir="${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}/sysroots/${ARMPKGARCH}*-linux*/var/lib/opkg/info"
 
     sw_manifest_table_header "GPLv3 Development Libraries Installed on Host" "This table describes GPLv3 software libraries and headers that are installed on the development host and used during the development of software to run on the target. Customers should be careful when linking against these libraries to make sure they are complying with the license(s) of the library"
 
@@ -746,6 +746,9 @@ tisdk_image_build () {
     elif [ -e ${DEPLOY_DIR_IMAGE}/uImage-${MACHINE}.bin ]
     then
         cp ${DEPLOY_DIR_IMAGE}/uImage-${MACHINE}.bin ${prebuilt_dir}/
+    elif [ -e ${DEPLOY_DIR_IMAGE}/Image-${MACHINE}.bin ]
+    then
+        cp ${DEPLOY_DIR_IMAGE}/Image-${MACHINE}.bin ${prebuilt_dir}/
     else
         echo "Could not find the Kernel image"
         return 1
-- 
2.7.4


