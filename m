Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 74677529F6
	for <meta-arago@arago-project.org>;
	Sat, 11 Apr 2020 22:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 35ED140C3D;
	Sat, 11 Apr 2020 22:32:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 2rdNYOiBG06w; Sat, 11 Apr 2020 22:32:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 21A6940C30;
	Sat, 11 Apr 2020 22:32:53 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 708C8172127;
	Sat, 11 Apr 2020 18:32:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sat, 11 Apr 2020 18:32:42 -0400
Message-Id: <1586644369-16268-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586644369-16268-1-git-send-email-denis@denix.org>
References: <1586644369-16268-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 03/10] packagegroup-*-opencl-sdk*: require opencl distro feature, plus openmp for openmpacc, linalg
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
X-List-Received-Date: Sat, 11 Apr 2020 22:35:10 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-opencl-sdk-host.bb | 10 ++++++----
 .../packagegroup-arago-tisdk-opencl-sdk-target.bb             | 11 ++++++-----
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-host.bb
index 321af12..f1accc0 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-host.bb
@@ -4,19 +4,21 @@ PR = "r1"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-inherit packagegroup
+inherit packagegroup features_check
+
+REQUIRED_DISTRO_FEATURES = "opencl"
 
 UTILS = " \
     opencl-examples-src \
-    openmpacc-examples-src \
+    ${@oe.utils.all_distro_features(d, 'openmp', 'openmpacc-examples-src')} \
 "
 
 UTILS_append_k2hk = " \
-    linalg-examples-src \
+    ${@oe.utils.all_distro_features(d, 'openmp', 'linalg-examples-src')} \
 "
 
 UTILS_append_dra7xx = " \
-    linalg-examples-src \
+    ${@oe.utils.all_distro_features(d, 'openmp', 'linalg-examples-src')} \
 "
 
 RDEPENDS_${PN} = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bb
index b103315..550e5b9 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bb
@@ -4,20 +4,21 @@ PR = "r2"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-inherit packagegroup
+inherit packagegroup features_check
+
+REQUIRED_DISTRO_FEATURES = "opencl"
 
 UTILS = " \
     opencl-staticdev \
-    openmpacc-dev \
-    python-pyopencl-dev \
+    ${@oe.utils.all_distro_features(d, 'openmp', 'openmpacc-dev')} \
 "
 
 UTILS_append_k2hk = " \
-    linalg-dev \
+    ${@oe.utils.all_distro_features(d, 'openmp', 'linalg-dev')} \
 "
 
 UTILS_append_dra7xx = " \
-    linalg-dev \
+    ${@oe.utils.all_distro_features(d, 'openmp', 'linalg-dev')} \
 "
 
 RDEPENDS_${PN} = "\
-- 
2.7.4


