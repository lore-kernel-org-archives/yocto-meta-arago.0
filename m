Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 5797552A86
	for <meta-arago@arago-project.org>;
	Thu, 25 May 2017 19:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1F7A020BFE;
	Thu, 25 May 2017 19:01:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 0E7xMEs2Fbar; Thu, 25 May 2017 19:01:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EFD8920BF6;
	Thu, 25 May 2017 19:01:41 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 6815F1624CA;
	Thu, 25 May 2017 15:01:41 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 25 May 2017 15:01:32 -0400
Message-Id: <1495738892-4367-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1495738892-4367-1-git-send-email-denis@denix.org>
References: <1495738892-4367-1-git-send-email-denis@denix.org>
Subject: [morty/master][PATCH 3/3] nativesdk-packagegroup-arago-sdk-host: add auto-tools, shadow, makedevs and clean up recipe
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
X-List-Received-Date: Thu, 25 May 2017 19:01:44 -0000

From: Denys Dmytriyenko <denys@ti.com>

Add autoconf, automake, shadow and makedevs nativesdk tools.
Clean up recipe.
Rename EXTRA_TOOLS into EXTRA_TI_TOOLS to list TI specific tools.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../nativesdk-packagegroup-arago-sdk-host.bb       | 25 ++++++++++++++--------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
index bb0e4f1..4f8e62b 100644
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
@@ -1,22 +1,29 @@
-DESCRIPTION = "Host packages for a standalone Arago SDK or external toolchain"
-PR = "r15"
+SUMMARY = "Host packages for a standalone Arago SDK or external toolchain"
+PR = "r16"
 LICENSE = "MIT"
 
 inherit packagegroup nativesdk
 
-EXTRA_TOOLS = "nativesdk-ti-cgt6x \
-               nativesdk-ti-cgt-pru \
-               nativesdk-clocl \
-               nativesdk-clacc \
-               nativesdk-mtd-utils-ubifs \
+PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
+
+EXTRA_TI_TOOLS = " \
+    nativesdk-ti-cgt6x \
+    nativesdk-ti-cgt-pru \
+    nativesdk-clocl \
+    nativesdk-clacc \
 "
 
 RDEPENDS_${PN} = "\
     nativesdk-pkgconfig \
     nativesdk-opkg \
     nativesdk-libtool \
+    nativesdk-autoconf \
+    nativesdk-automake \
+    nativesdk-shadow \
+    nativesdk-makedevs \
     nativesdk-python-distutils \
     nativesdk-git \
     nativesdk-cmake \
-    ${EXTRA_TOOLS} \
-    "
+    nativesdk-mtd-utils-ubifs \
+    ${EXTRA_TI_TOOLS} \
+"
-- 
2.7.4


