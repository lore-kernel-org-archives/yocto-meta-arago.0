Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id B849D52A59
	for <meta-arago@arago-project.org>;
	Sat, 11 Apr 2020 22:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3FE6640C1F;
	Sat, 11 Apr 2020 22:32:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id xxsfYHuh_GlO; Sat, 11 Apr 2020 22:32:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 28FFC40C31;
	Sat, 11 Apr 2020 22:32:53 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 7C3981722AA;
	Sat, 11 Apr 2020 18:32:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sat, 11 Apr 2020 18:32:43 -0400
Message-Id: <1586644369-16268-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586644369-16268-1-git-send-email-denis@denix.org>
References: <1586644369-16268-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 04/10] nativesdk-packagegroup*: require opencl, opencv for tidl nativesdk tools
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
X-List-Received-Date: Sat, 11 Apr 2020 22:35:12 -0000

From: Denys Dmytriyenko <denys@ti.com>

Require opencl,openmp for clacc nativesdk tool.
Also switch distutils in devkit from Python2 to Python3.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../nativesdk-packagegroup-arago-tisdk-host.bb             | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
index 314c025..d6a835d 100644
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
@@ -6,22 +6,26 @@ inherit packagegroup nativesdk
 
 PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
 
+TIDL_TOOLS = " \
+    nativesdk-tidl-import \
+    nativesdk-tidl-viewer \
+    nativesdk-tidl-utils \
+"
+
 #    nativesdk-open62541-examples
 #    nativesdk-open62541-tests
 EXTRA_TI_TOOLS = " \
     nativesdk-ti-cgt6x \
     nativesdk-ti-cgt-pru \
     nativesdk-clocl \
-    nativesdk-clacc \
-    nativesdk-tidl-import \
-    nativesdk-tidl-viewer \
-    nativesdk-tidl-utils \
+    ${@oe.utils.all_distro_features(d, "opencl openmp", "nativesdk-clacc")} \
     nativesdk-gcc-arm-none-eabi \
+    ${@oe.utils.all_distro_features(d, "opencl opencv", "${TIDL_TOOLS}")} \
 "
 
 RDEPENDS_${PN} = "\
     nativesdk-packagegroup-sdk-host \
-    nativesdk-python-distutils \
+    nativesdk-python3-distutils \
     nativesdk-git \
     nativesdk-mtd-utils-ubifs \
     ${EXTRA_TI_TOOLS} \
-- 
2.7.4


