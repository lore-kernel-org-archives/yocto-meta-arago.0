Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D579CA1013
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 15:07:44 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.16930.1758208060354645735
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 18 Sep 2025 08:07:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=cH147aoS;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: afd@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58IF7c4X512463;
	Thu, 18 Sep 2025 10:07:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758208058;
	bh=BL22v6vn8m45WX8sAOOnJxbr54DMXXh+c3A9A02jhPc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=cH147aoSnsw0bJl8kXeLQW4VyQKwTHLtmYod2RUN9F7QSPhTKbPUqYNTNibFB+gxW
	 mesWS43IRTacOkRDj5DAK7ef+Gw894ZmoJ42fojpUaSJYoCrO9VBt+sjbnWY/4fHVL
	 Mh/nibcSREI/cObkepoikawE5lZOKgYyWtHbctQc=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58IF7ctr2437973
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 18 Sep 2025 10:07:38 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 18
 Sep 2025 10:07:37 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Sep 2025 10:07:37 -0500
Received: from lelvem-mr05.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58IF7b9o772640;
	Thu, 18 Sep 2025 10:07:37 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][RFC 2/2] meta-arago-distro: Remove tisdk name from Arago packagegroups
Date: Thu, 18 Sep 2025 10:07:36 -0500
Message-ID: <20250918150736.1193684-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250918150736.1193684-1-afd@ti.com>
References: <20250918150736.1193684-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 18 Sep 2025 15:07:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16594

These packagegroups are all "arago" packagegroups, the tisdk in the
name is a leftover from when the TI Core SDK was generated directly
from Arago. Some packagegroups already do not have this in their names
but many still do, update the names to be uniformly "arago".

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-core/images/arago-default-image.bb   | 16 ++++++++--------
 .../recipes-core/images/arago-thinlinux-image.bb |  6 +++---
 ...b => packagegroup-arago-addons-sdk-target.bb} |  0
 ...dk-addons.bb => packagegroup-arago-addons.bb} |  0
 ...ackagegroup-arago-connectivity-sdk-target.bb} |  0
 ...ity.bb => packagegroup-arago-connectivity.bb} |  0
 ...b => packagegroup-arago-crypto-sdk-target.bb} |  0
 ...dk-crypto.bb => packagegroup-arago-crypto.bb} |  0
 ...=> packagegroup-arago-graphics-sdk-target.bb} |  0
 ...raphics.bb => packagegroup-arago-graphics.bb} |  0
 ...t.bb => packagegroup-arago-gtk-sdk-target.bb} |  0
 ...go-tisdk-gtk.bb => packagegroup-arago-gtk.bb} |  0
 ... packagegroup-arago-multimedia-sdk-target.bb} |  0
 ...media.bb => packagegroup-arago-multimedia.bb} |  0
 ...-sysrepo.bb => packagegroup-arago-sysrepo.bb} |  0
 .../packagegroup-arago-toolchain-tisdk-target.bb | 12 ++++++------
 .../recipes-core/packagegroups/ti-world.bb       | 16 ++++++++--------
 17 files changed, 25 insertions(+), 25 deletions(-)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-tisdk-addons-sdk-target.bb => packagegroup-arago-addons-sdk-target.bb} (100%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-tisdk-addons.bb => packagegroup-arago-addons.bb} (100%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-tisdk-connectivity-sdk-target.bb => packagegroup-arago-connectivity-sdk-target.bb} (100%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-tisdk-connectivity.bb => packagegroup-arago-connectivity.bb} (100%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-tisdk-crypto-sdk-target.bb => packagegroup-arago-crypto-sdk-target.bb} (100%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-tisdk-crypto.bb => packagegroup-arago-crypto.bb} (100%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-tisdk-graphics-sdk-target.bb => packagegroup-arago-graphics-sdk-target.bb} (100%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-tisdk-graphics.bb => packagegroup-arago-graphics.bb} (100%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-tisdk-gtk-sdk-target.bb => packagegroup-arago-gtk-sdk-target.bb} (100%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-tisdk-gtk.bb => packagegroup-arago-gtk.bb} (100%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-tisdk-multimedia-sdk-target.bb => packagegroup-arago-multimedia-sdk-target.bb} (100%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-tisdk-multimedia.bb => packagegroup-arago-multimedia.bb} (100%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-tisdk-sysrepo.bb => packagegroup-arago-sysrepo.bb} (100%)

diff --git a/meta-arago-distro/recipes-core/images/arago-default-image.bb b/meta-arago-distro/recipes-core/images/arago-default-image.bb
index a171ab13..22969d4c 100644
--- a/meta-arago-distro/recipes-core/images/arago-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-default-image.bb
@@ -15,17 +15,17 @@ IMAGE_INSTALL += "\
     packagegroup-arago-console \
     ti-test \
     ti-test-extras \
-    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-graphics','',d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-gtk','',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-graphics','',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-gtk','',d)} \
     ${@bb.utils.contains('DISTRO_FEATURES','opencl','packagegroup-arago-opencl','',d)} \
     ${@bb.utils.contains('DISTRO_FEATURES','vulkan','packagegroup-arago-vulkan','',d)} \
-    packagegroup-arago-tisdk-connectivity \
-    packagegroup-arago-tisdk-crypto \
-    packagegroup-arago-tisdk-multimedia \
-    packagegroup-arago-tisdk-addons \
-    packagegroup-arago-tisdk-addons-extra \
+    packagegroup-arago-connectivity \
+    packagegroup-arago-crypto \
+    packagegroup-arago-multimedia \
+    packagegroup-arago-addons \
+    packagegroup-arago-addons-extra \
     ${ARAGO_DEFAULT_IMAGE_EXTRA_INSTALL} \
-    packagegroup-arago-tisdk-sysrepo \
+    packagegroup-arago-sysrepo \
 "
 
 export IMAGE_BASENAME = "arago-default-image${ARAGO_IMAGE_SUFFIX}"
diff --git a/meta-arago-distro/recipes-core/images/arago-thinlinux-image.bb b/meta-arago-distro/recipes-core/images/arago-thinlinux-image.bb
index 18d3ced2..ae55d475 100644
--- a/meta-arago-distro/recipes-core/images/arago-thinlinux-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-thinlinux-image.bb
@@ -14,9 +14,9 @@ SYSTEMD_DEFAULT_TARGET = "${@bb.utils.contains('DISTRO_FEATURES','opengl','graph
 IMAGE_INSTALL += "\
     packagegroup-arago-base \
     packagegroup-arago-console \
-    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-graphics','',d)} \
-    packagegroup-arago-tisdk-connectivity \
-    packagegroup-arago-tisdk-crypto \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-graphics','',d)} \
+    packagegroup-arago-connectivity \
+    packagegroup-arago-crypto \
     docker \
     ${ARAGO_THIN_IMAGE_EXTRA_INSTALL} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-addons-sdk-target.bb
similarity index 100%
rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-addons-sdk-target.bb
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-addons.bb
similarity index 100%
rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-addons.bb
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-connectivity-sdk-target.bb
similarity index 100%
rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-target.bb
rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-connectivity-sdk-target.bb
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-connectivity.bb
similarity index 100%
rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-connectivity.bb
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-crypto-sdk-target.bb
similarity index 100%
rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb
rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-crypto-sdk-target.bb
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-crypto.bb
similarity index 100%
rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-crypto.bb
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-graphics-sdk-target.bb
similarity index 100%
rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-graphics-sdk-target.bb
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-graphics.bb
similarity index 100%
rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-graphics.bb
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gtk-sdk-target.bb
similarity index 100%
rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk-sdk-target.bb
rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gtk-sdk-target.bb
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gtk.bb
similarity index 100%
rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb
rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gtk.bb
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-multimedia-sdk-target.bb
similarity index 100%
rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-multimedia-sdk-target.bb
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-multimedia.bb
similarity index 100%
rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-multimedia.bb
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-sysrepo.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysrepo.bb
similarity index 100%
rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-sysrepo.bb
rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysrepo.bb
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
index d3a90595..2baa1045 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
@@ -8,20 +8,20 @@ inherit packagegroup
 
 TISDK_TOOLCHAIN_BASE_TARGET = "\
     packagegroup-arago-standalone-sdk-target \
-    packagegroup-arago-tisdk-multimedia-sdk-target \
+    packagegroup-arago-multimedia-sdk-target \
 "
 
 TISDK_TOOLCHAIN_EXTRA_TARGET = "\
-    packagegroup-arago-tisdk-connectivity-sdk-target \
-    packagegroup-arago-tisdk-crypto-sdk-target \
+    packagegroup-arago-connectivity-sdk-target \
+    packagegroup-arago-crypto-sdk-target \
 "
 TISDK_TOOLCHAIN_EXTRA_TARGET:omapl138 = ""
 
 RDEPENDS:${PN} = "\
-    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-gtk-sdk-target','',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-gtk-sdk-target','',d)} \
     ${TISDK_TOOLCHAIN_BASE_TARGET} \
     ${TISDK_TOOLCHAIN_EXTRA_TARGET} \
-    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-graphics-sdk-target','',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-graphics-sdk-target','',d)} \
     ${@bb.utils.contains('DISTRO_FEATURES','opencl','packagegroup-arago-opencl-sdk-target','',d)} \
-    packagegroup-arago-tisdk-addons-sdk-target \
+    packagegroup-arago-addons-sdk-target \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
index 64af6d93..f4445747 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
@@ -30,14 +30,14 @@ RDEPENDS:${PN} = "\
     packagegroup-arago-base \
     packagegroup-arago-console \
     ti-test \
-    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-graphics','',d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-gtk','',d)} \
-    packagegroup-arago-tisdk-connectivity \
-    packagegroup-arago-tisdk-crypto \
-    packagegroup-arago-tisdk-multimedia \
-    packagegroup-arago-tisdk-addons \
-    packagegroup-arago-tisdk-addons-extra \
-    ${@bb.utils.contains('DISTRO_FEATURES','opengl','','packagegroup-arago-base-tisdk-server-extra',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-graphics','',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-gtk','',d)} \
+    packagegroup-arago-connectivity \
+    packagegroup-arago-crypto \
+    packagegroup-arago-multimedia \
+    packagegroup-arago-addons \
+    packagegroup-arago-addons-extra \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','','packagegroup-arago-base-server-extra',d)} \
     ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "${PYTHON2APPS}", "", d)} \
     ${DEVTOOLS} \
     ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} \
-- 
2.39.2


