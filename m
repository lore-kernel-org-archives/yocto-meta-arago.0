Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 55DCA52A29
	for <meta-arago@arago-project.org>;
	Wed,  8 Apr 2020 00:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id ECD4540A6E;
	Wed,  8 Apr 2020 00:45:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id trVcvd8iYz8A; Wed,  8 Apr 2020 00:45:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D5E0B40C1D;
	Wed,  8 Apr 2020 00:45:08 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 94D391718E9;
	Tue,  7 Apr 2020 20:45:08 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue,  7 Apr 2020 20:44:40 -0400
Message-Id: <1586306702-7953-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586306702-7953-1-git-send-email-denis@denix.org>
References: <1586306702-7953-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 02/24] tensorflow-lite-demo: require dsp machine feature and opencl, opencv distro features
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
X-List-Received-Date: Wed, 08 Apr 2020 00:47:25 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb  | 11 +++++++++--
 .../tensorflow-lite/tensorflow-lite-demo_git.bb               |  5 +++++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb b/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
index ffed472..994179c 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
@@ -8,9 +8,16 @@ inherit packagegroup
 ARMNN_PACKAGES = ""
 #ARMNN_PACKAGES = "${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'armnn', '', d)}"
 
-ANALYTICS = "\
+TENSORFLOW_DEMO = " \
+    ${@oe.utils.all_distro_features(d, 'opencv', 'tensorflow-lite-demo', '')} \
+"
+TENSORFLOW_DEMO_dra7xx = " \
+    ${@['','tensorflow-lite-demo'][oe.utils.all_distro_features(d, 'opencl opencv', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, False, d)]} \
+"
+
+ANALYTICS = " \
     ${ARMNN_PACKAGES} \
-    tensorflow-lite-demo \
+    ${TENSORFLOW_DEMO} \
 "
 ANALYTICS_keystone = ""
 ANALYTICS_j7-evm = ""
diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-demo_git.bb b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-demo_git.bb
index c8417e1..c45acf4 100644
--- a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-demo_git.bb
+++ b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-demo_git.bb
@@ -2,6 +2,11 @@ SUMMARY = "Tensorflow Lite Demo with input and display via OpenCV and TIDL accel
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d8927f3331d2b3e321b7dd1925166d25"
 
+inherit features_check
+
+REQUIRED_DISTRO_FEATURES = "opencv"
+REQUIRED_DISTRO_FEATURES_append_dra7xx = " opencl"
+
 DEPENDS = "tensorflow-lite flatbuffers opencv"
 DEPENDS_append_dra7xx = " tidl-api"
 
-- 
2.7.4


