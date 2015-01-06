Return-Path: <a0866934local@udb0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id BD31A529E0
	for <meta-arago@arago-project.org>;
	Tue,  6 Jan 2015 14:44:44 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t06EiiJs006686
	for <meta-arago@arago-project.org>; Tue, 6 Jan 2015 08:44:44 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t06EihHE020461
	for <meta-arago@arago-project.org>; Tue, 6 Jan 2015 08:44:44 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 6 Jan 2015 08:44:43 -0600
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t06EihlW021232;
	Tue, 6 Jan 2015 08:44:43 -0600
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1Y8VND-0005Dk-4X;
	Tue, 06 Jan 2015 09:44:43 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 6 Jan 2015 09:44:40 -0500
Message-ID: <1420555480-20038-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] tisdk-image: Hide lib directory in image.
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
X-List-Received-Date: Tue, 06 Jan 2015 14:44:44 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/classes/tisdk-image.bbclass |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index 6023d6b..3030a38 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -481,6 +481,7 @@ tisdk_image_setup () {
 
     mkdir -p ${IMAGE_ROOTFS}/etc
     mkdir -p ${IMAGE_ROOTFS}/var/lib/opkg
+    mkdir -p ${IMAGE_ROOTFS}/lib
 
     chmod 755 ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-tisdk*
 
@@ -614,6 +615,7 @@ tisdk_image_cleanup () {
     # manifest (and maybe one day for online updates) to a hidden directory.
     mv ${IMAGE_ROOTFS}/var ${IMAGE_ROOTFS}/.var
     mv ${IMAGE_ROOTFS}/etc ${IMAGE_ROOTFS}/.etc
+    mv ${IMAGE_ROOTFS}/lib ${IMAGE_ROOTFS}/.lib
 }
 
 license_create_manifest() {
-- 
1.7.9.5


