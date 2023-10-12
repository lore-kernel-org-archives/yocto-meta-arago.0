Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED313C46CA1
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 17:49:43 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.19182.1697132980793877655
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 12 Oct 2023 10:49:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tk69dQZW;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39CHndWJ120424;
	Thu, 12 Oct 2023 12:49:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697132979;
	bh=7ThYJE3IoxHWvIYkSv6JLiZBki9DJUCcpKGwL4xQRfI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=tk69dQZWwcE7Qtki49DsOlB1fSahN71GLjSmOz2IQE1Gfp/JDv0FNGL6cQFwNBjep
	 m02+m7m+tSwppLXUnVGPqVonHYMYOYbp/+DwXbHyh41sBO7j6XiDWq039uPxozxsFg
	 NzFfO1oYS/VMM0R9tNZcrj3r6b6LWMWUV2ygFozQ=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39CHnduP007914
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 Oct 2023 12:49:39 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 12
 Oct 2023 12:49:39 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 12 Oct 2023 12:49:39 -0500
Received: from fllv0039.itg.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39CHnc5X013359;
	Thu, 12 Oct 2023 12:49:39 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH 2/2] packagegroups: base: Merge base-tisdk into base
Date: Thu, 12 Oct 2023 12:49:37 -0500
Message-ID: <20231012174937.2047374-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012174937.2047374-1-afd@ti.com>
References: <20231012174937.2047374-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 12 Oct 2023 17:49:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14931

Both contain packages for similar reasons, and every image using
one also includes the other. Merge these two packagegroups.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-core/images/tisdk-base-image.bb   |  1 -
 .../images/tisdk-default-image.bb             |  1 -
 .../images/tisdk-thinlinux-image.bb           |  1 -
 .../packagegroup-arago-base-tisdk.bb          | 33 -------------------
 .../packagegroups/packagegroup-arago-base.bb  | 25 +++++++++++++-
 .../recipes-core/packagegroups/ti-world.bb    |  1 -
 6 files changed, 24 insertions(+), 38 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb

diff --git a/meta-arago-distro/recipes-core/images/tisdk-base-image.bb b/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
index a70a0201..83f1899b 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
@@ -12,7 +12,6 @@ ARAGO_BASE_IMAGE_EXTRA_INSTALL ?= ""
 IMAGE_INSTALL += "\
     packagegroup-arago-base \
     packagegroup-arago-console \
-    packagegroup-arago-base-tisdk \
     ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', 'ti-test', '', d)} \
     ${ARAGO_BASE_IMAGE_EXTRA_INSTALL} \
 "
diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index 787fac95..33ed0f57 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -15,7 +15,6 @@ SYSTEMD_DEFAULT_TARGET = " \
 IMAGE_INSTALL += "\
     packagegroup-arago-base \
     packagegroup-arago-console \
-    packagegroup-arago-base-tisdk \
     ti-test \
     ti-test-extras \
     ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-graphics','',d)} \
diff --git a/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb b/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
index a840b7a0..f266b14a 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
@@ -16,7 +16,6 @@ SYSTEMD_DEFAULT_TARGET = " \
 IMAGE_INSTALL += "\
     packagegroup-arago-base \
     packagegroup-arago-console \
-    packagegroup-arago-base-tisdk \
     ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-graphics','',d)} \
     packagegroup-arago-tisdk-connectivity \
     packagegroup-arago-tisdk-crypto \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
deleted file mode 100644
index 65fc015b..00000000
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-DESCRIPTION = "Additional packages beyond console packages shared by TI SDKs"
-LICENSE = "MIT"
-PR = "r24"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-inherit packagegroup
-
-OPTEE_PKGS = " \
-    optee-os \
-    optee-client \
-    optee-test \
-    optee-examples \
-"
-
-RDEPENDS:${PN} = "\
-    dbus-broker \
-    expat \
-    glib-2.0 \
-    libxml2 \
-    libpcre \
-    iptables \
-    iperf3 \
-    netperf \
-    arago-gpl-notice \
-    arago-feed-config \
-    nfs-utils-client \
-    cifs-utils \
-    phytool \
-    ${@bb.utils.contains_any('OPTEEOUTPUTMACHINE', 'ti', "${OPTEE_PKGS}", "", d)} \
-"
-
-RDEPENDS:${PN}:append:k3 = " ${OPTEE_PKGS}"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
index 1f63a7d0..d143f4f3 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Base tools that are recommended for most images"
 LICENSE = "MIT"
-PR = "r9"
+PR = "r10"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -36,6 +36,26 @@ ARAGO_EXTRA = "\
     kms++-python \
     can-utils \
     docker \
+    dbus-broker \
+    expat \
+    glib-2.0 \
+    libxml2 \
+    libpcre \
+    iptables \
+    iperf3 \
+    netperf \
+    arago-gpl-notice \
+    arago-feed-config \
+    nfs-utils-client \
+    cifs-utils \
+    phytool \
+"
+
+OPTEE_PKGS = " \
+    optee-os \
+    optee-client \
+    optee-test \
+    optee-examples \
 "
 
 # minimal set of packages - needed to boot
@@ -44,4 +64,7 @@ RDEPENDS:${PN} = "\
     ${@bb.utils.contains('MACHINE_FEATURES', 'alsa', '${ARAGO_ALSA_BASE}', '',d)} \
     ${ARAGO_BASE} \
     ${ARAGO_EXTRA} \
+    ${@bb.utils.contains_any('OPTEEOUTPUTMACHINE', 'ti', "${OPTEE_PKGS}", "", d)} \
 "
+
+RDEPENDS:${PN}:append:k3 = " ${OPTEE_PKGS}"
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
index 4a7a5e3f..50cf2552 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
@@ -41,7 +41,6 @@ OPENCL = " \
 RDEPENDS:${PN} = "\
     packagegroup-arago-base \
     packagegroup-arago-console \
-    packagegroup-arago-base-tisdk \
     ti-test \
     ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-graphics','',d)} \
     ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-gtk','',d)} \
-- 
2.39.2


