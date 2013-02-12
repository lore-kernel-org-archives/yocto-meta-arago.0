Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f52.google.com (mail-oa0-f52.google.com
	[209.85.219.52])
	by arago-project.org (Postfix) with ESMTPS id A09AD52A12
	for <meta-arago@arago-project.org>;
	Tue, 12 Feb 2013 00:46:52 +0000 (UTC)
Received: by mail-oa0-f52.google.com with SMTP id k14so6784393oag.25
	for <meta-arago@arago-project.org>;
	Mon, 11 Feb 2013 16:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=8JfHAuTBSwseD6sS8tYUdxLYQFJSN8/VTQ6CzxTWhek=;
	b=W0BjNYOUmCBkiwlpc5KgrR5QpUukS3Inzdl8tdfS5q/Rb+D6Xg6UJYcTQ9kJfTIUoL
	h2mevbSQV5eY6T6vnqPodkA7VdIoDeXkdFzln/3JKCQ2YaNm4N+u3GxQN+TzgZr+NFl9
	ExSyBDGTlPIAYuaBrcfkLwvdFAioziM9VvxxxGCNs2lMw+qNzH4vMCqjfN4gx3Rvbj9l
	XRy3FqfovZk0qdcjv0jvJ+0pwzdnB/WaPEFLCL9c7zeFoMzcPBZsdClucBaa2D7PoPFh
	0ojrMZTkWxcwIH1lW4BPEr2MVNGakKUpNMzIRksFYdeorHU0R0pbMepK41ll2BdpQLR4
	lQDA==
X-Received: by 10.60.170.232 with SMTP id ap8mr12151396oec.29.1360630012074;
	Mon, 11 Feb 2013 16:46:52 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b6sm52434322oee.3.2013.02.11.16.46.50
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 16:46:51 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 11 Feb 2013 18:46:15 -0600
Message-Id: <1360629979-24789-14-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1360629979-24789-1-git-send-email-fcooper@ti.com>
References: <1360629979-24789-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 14/18] meta-toolchain-arago: Add cleanup_toolchain_packages
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
X-List-Received-Date: Tue, 12 Feb 2013 00:46:52 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Move cleanup_toolchain_packages from tisdk-image.bbclass and add it to
  meta-toolchain-arago

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/meta/meta-toolchain-arago.bb      |   26 +++++++++++++++++++-
 1 files changed, 25 insertions(+), 1 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index f32da6a..b75583b 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -1,10 +1,11 @@
 TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-arago-sdk-host packagegroup-arago-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 TOOLCHAIN_TARGET_TASK ?= "packagegroup-arago-standalone-sdk-target"
 TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-sdk-${SDK_ARCH}"
+TOOLCHAIN_CLEANUP_PACKAGES ?= ""
 
 require recipes-core/meta/meta-toolchain.bb
 
-PR = "r18"
+PR = "r19"
 
 SDKTARGETSYSROOT = "${SDKPATH}/${ARAGO_TARGET_SYS}"
 
@@ -61,6 +62,9 @@ populate_sdk_ipk_append () {
 	for i in `find ${SDK_OUTPUT}/${SDKPATH} -name \*.la`; do
 		rm -f $i
 	done
+
+	cleanup_toolchain_packages
+
 	mkdir -p "${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/lib/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
 }
 
@@ -81,6 +85,26 @@ fakeroot create_sdk_files() {
 	sed -i -e "s:##DEFAULT_INSTALL_DIR##:$escaped_sdkpath:" ${SDK_OUTPUT}/${SDKPATH}/relocate_sdk.py
 }
 
+# Remove undesired packages that may be pulled into the toolchain by -dev
+# package dependencies.  This is usually GPLv3 components.
+cleanup_toolchain_packages() {
+	if [ "${TOOLCHAIN_CLEANUP_PACKAGES}" != "" ]
+	then
+		# Clean up the native side of the toolchain
+		opkg_dir="${SDK_OUTPUT}/${SDKPATH}/"
+		opkg_conf="${opkg_dir}/etc/opkg-sdk.conf"
+		opkg-cl -o $opkg_dir -f $opkg_conf --force-depends remove ${TOOLCHAIN_CLEANUP_PACKAGES}
+
+		# Clean up the target side of the toolchain
+		opkg_dir="${SDK_OUTPUT}/${SDKTARGETSYSROOT}"
+		opkg_conf="${opkg_dir}/etc/opkg.conf"
+		opkg-cl -o $opkg_dir -f $opkg_conf --force-depends remove ${TOOLCHAIN_CLEANUP_PACKAGES}
+
+		# Clean up empty directories from cleaned up packages
+		find ${SDK_OUTPUT} -depth -type d -empty -print0 | xargs -r0 /bin/rmdir
+	fi
+}
+
 fakeroot tar_sdk() {
 	# Package it up
 	mkdir -p ${SDK_DEPLOY}
-- 
1.7.0.4


