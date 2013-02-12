Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f43.google.com (mail-oa0-f43.google.com
	[209.85.219.43])
	by arago-project.org (Postfix) with ESMTPS id 5F41952A46
	for <meta-arago@arago-project.org>;
	Tue, 12 Feb 2013 00:46:58 +0000 (UTC)
Received: by mail-oa0-f43.google.com with SMTP id l10so6945428oag.16
	for <meta-arago@arago-project.org>;
	Mon, 11 Feb 2013 16:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=pGHqC1DzscXmfdsx5ICGAnA2zHU7UVej1B8wGnr+WC0=;
	b=0Qf/LinDNXtPxl5tSUk/IzB5ksnEYSgKrmgl0mt74ar7nWBJCQ8JvJChgkisxN5GxK
	rmIPVNIbwHG8yASc3HsG48ar4YQ4VbWyu//GzPrazn4aSX/tWfIDAhDvbnHUm7+Vzo5d
	4ulFolBUBpy/pefaJBB5bkczo8weJ/1I4oYcAwVpm8abzdgAiZmmyrpRAR6mzN199fta
	eFVmq2NFlGYC1iqUVHabtYlPJ3aQGYCTk2UUlgBkXxPSu45IW+QIM49lgqJHqd/WZfCc
	PFgC0epTOsfuFjkCk/ywS950cstwZjcm89R16DlO71X60DfDvmAdgoz2+8d2b/2L8qmg
	qaoQ==
X-Received: by 10.182.118.1 with SMTP id ki1mr12323806obb.2.1360630017884;
	Mon, 11 Feb 2013 16:46:57 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b6sm52434322oee.3.2013.02.11.16.46.55
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 16:46:56 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 11 Feb 2013 18:46:18 -0600
Message-Id: <1360629979-24789-17-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1360629979-24789-1-git-send-email-fcooper@ti.com>
References: <1360629979-24789-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 17/18] tisdk-image: Add support for new toolchain sdk structure
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
X-List-Received-Date: Tue, 12 Feb 2013 00:46:58 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Previous the toolchain sdk was delivered as a simple tar.gz file that
  could be extracted.
* Now the toolchain sdk needs to be installed via a self contained script
  installer that provides alot more flexibility.
* Need to tweak this class to reflect this change.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/classes/tisdk-image.bbclass |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index c2f93e2..b08f93b 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -478,6 +478,11 @@ do_sdk_image () {
 
 	mkdir -p ${IMAGE_ROOTFS}/etc
 
+    chmod 755 ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-tisdk-${SDK_ARCH}*
+
+    # Temporarily extract the toolchain sdk so we can read license information from it.
+    echo "${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}" | ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-tisdk-${SDK_ARCH}*
+
     # Creat the base SDK image
 	rootfs_${IMAGE_PKGTYPE}_do_rootfs
 
@@ -562,6 +567,14 @@ do_sdk_image () {
     # Create the TI software manifest
     generate_sw_manifest
 
+    # Delete installed toolchain sdk since we need the toolchain sdk installer
+    # not the extracted version
+    rm -rf ${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}
+
+    # Copy over the toolchain sdk installer an give it a simple name which
+    # matches the traditional name within the SDK.
+    cp ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-tisdk-${SDK_ARCH}* ${IMAGE_ROOTFS}/linux-devkit.sh
+
     # Copy the opkg.conf used by the image to allow for future updates
     cp ${WORKDIR}/opkg.conf ${IMAGE_ROOTFS}/etc/
 
@@ -574,6 +587,11 @@ do_sdk_image () {
     ${@get_imagecmds(d)}
 }
 
+license_create_manifest() {
+    # Override license_create_manifest and do nothing
+    echo ""
+}
+
 EXPORT_FUNCTIONS do_sdk_image
 addtask sdk_image before do_build after do_install
 
-- 
1.7.0.4


