Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 25E39529F3
	for <meta-arago@arago-project.org>;
	Wed, 20 Nov 2019 00:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DA3C040BFE;
	Wed, 20 Nov 2019 00:17:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 8IgZlU1nPdFk; Wed, 20 Nov 2019 00:17:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C19B640BCC;
	Wed, 20 Nov 2019 00:17:46 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 78618174317;
	Tue, 19 Nov 2019 19:17:45 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 19 Nov 2019 19:17:45 -0500
Message-Id: <1574209065-24444-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] packagegroups: disable Keystone secure storage packages based on openssl 1.0
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
X-List-Received-Date: Wed, 20 Nov 2019 00:19:15 -0000

From: Denys Dmytriyenko <denys@ti.com>

Need to be migrated to openssl 1.1, as 1.0 is deprecated now.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroup-arago-base-tisdk-server-extra.bb       | 17 +++++++++--------
 .../packagegroup-arago-tisdk-addons-sdk-target.bb       | 12 +++++++-----
 2 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
index 564a799..1c68ba9 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
@@ -75,11 +75,13 @@ ARAGO_PYTHON = "\
     python \
     "
 
-ARAGO_SECURE_STORAGE = "\
-    ti-softhsmv2 \
-    libp11 \
-    engine-pkcs11 \
-    "
+ARAGO_SECURE_STORAGE = ""
+# All these secure storage packages need to be
+# migrated to openssl 1.1
+#    ti-softhsmv2 \
+#    libp11 \
+#    engine-pkcs11 \
+#    "
 
 # ipsecmgr has been disabled for a while
 # disable ipsecmgr-mod,hplib-mod due to K4.14 API changes
@@ -153,9 +155,8 @@ ARAGO_TI_PKGS_append_k2e = "\
     hyplnk-lld \
     "
 
-ARAGO_VTUN = "\
-    vtun \
-"
+# vtun does not build against openssl 1.1
+ARAGO_VTUN = ""
 # vtun does not support aarch64
 ARAGO_VTUN_aarch64 = ""
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 2b69b82..088468c 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -25,11 +25,13 @@ UTILS_append_keystone = "\
 	libsdl-dev \
 	"
 
-TI_SECURE_STORAGE_DEV = "\
-	ti-softhsmv2-dev \
-	libp11-dev \
-	libp11-staticdev \
-	"
+TI_SECURE_STORAGE_DEV = ""
+# All these secure storage packages need to be
+# migrated to openssl 1.1
+#	ti-softhsmv2-dev \
+#	libp11-dev \
+#	libp11-staticdev \
+#	"
 
 # Disable ipsecmgr due to libnl and xfrm conflict
 #	ipsecmgr-dev
-- 
2.7.4


