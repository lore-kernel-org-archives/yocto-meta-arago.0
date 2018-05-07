Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 5CEF452090
	for <meta-arago@arago-project.org>;
	Mon,  7 May 2018 18:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 455BF20B38;
	Mon,  7 May 2018 18:01:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 319ylhw9Td7K; Mon,  7 May 2018 18:01:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 210C3208BD;
	Mon,  7 May 2018 18:01:53 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 94C39163457;
	Mon,  7 May 2018 14:01:52 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon,  7 May 2018 14:01:51 -0400
Message-Id: <1525716111-12277-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] packagegroup-*-toolchain-tisdk-target: restructure packagegroup dependencies
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
X-List-Received-Date: Mon, 07 May 2018 18:02:00 -0000

This is to fix omission of standalone-sdk-target packagegroup on omapl138 and
to avoid same mistake in the future.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroup-arago-toolchain-tisdk-target.bb          | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
index 59987fa..5614d3a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to build and install header and libs into the sdk"
 LICENSE = "MIT"
-PR = "r10"
+PR = "r11"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -9,24 +9,25 @@ inherit packagegroup
 QT_TOOLCHAIN_TARGET = "\
     packagegroup-arago-qte-toolchain-target \
 "
-
 QT_TOOLCHAIN_TARGET_keystone = ""
 QT_TOOLCHAIN_TARGET_omapl138 = ""
 
 TISDK_TOOLCHAIN_BASE_TARGET = "\
+    packagegroup-arago-standalone-sdk-target \
     packagegroup-arago-tisdk-multimedia-sdk-target \
-    packagegroup-arago-tisdk-connectivity-sdk-target \
-    packagegroup-arago-tisdk-crypto-sdk-target \
 "
 
-TISDK_TOOLCHAIN_BASE_TARGET_keystone = "\
-    packagegroup-arago-standalone-sdk-target \
-    packagegroup-arago-tisdk-multimedia-sdk-target \
+TISDK_TOOLCHAIN_EXTRA_TARGET = "\
+    packagegroup-arago-tisdk-connectivity-sdk-target \
+    packagegroup-arago-tisdk-crypto-sdk-target \
 "
+TISDK_TOOLCHAIN_EXTRA_TARGET_keystone = ""
+TISDK_TOOLCHAIN_EXTRA_TARGET_omapl138 = ""
 
 RDEPENDS_${PN} = "\
     ${QT_TOOLCHAIN_TARGET} \
     ${TISDK_TOOLCHAIN_BASE_TARGET} \
+    ${TISDK_TOOLCHAIN_EXTRA_TARGET} \
     ${@bb.utils.contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-graphics-sdk-target','',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl-sdk-target','',d)} \
     packagegroup-arago-tisdk-addons-sdk-target \
-- 
2.7.4


