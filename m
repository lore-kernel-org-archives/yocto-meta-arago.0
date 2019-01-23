Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id AFF31529F3
	for <meta-arago@arago-project.org>;
	Wed, 23 Jan 2019 04:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9FACC40AF8;
	Wed, 23 Jan 2019 04:52:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id x5G8ZbOY5l7C; Wed, 23 Jan 2019 04:52:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3978540B5C;
	Wed, 23 Jan 2019 04:52:14 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 34E59169B4A;
	Tue, 22 Jan 2019 23:52:10 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 22 Jan 2019 23:52:08 -0500
Message-Id: <1548219129-12459-8-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1548219129-12459-1-git-send-email-denis@denix.org>
References: <1548219129-12459-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 8/9] packagegroup-*-gst*: make gstreamer1.0-plugins-dsp66 conditional on 'dsp' machine feature
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
X-List-Received-Date: Wed, 23 Jan 2019 04:52:31 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-gst-sdk-target.bb         | 10 +++++++---
 .../recipes-core/packagegroups/packagegroup-arago-gst.bb       | 10 +++++++---
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb
index 739371f..c606f70 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to build and install header and libs in sdk"
 LICENSE = "MIT"
-PR = "r14"
+PR = "r15"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -14,14 +14,18 @@ GSTREAMER_DEPS = " \
     gstreamer1.0-libav-dev \
 "
 
+GSTREAMER_DSP = " \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'gstreamer1.0-plugins-dsp66-dev', '', d)} \
+"
+
 GSTREAMER_DEPS_append_dra7xx = " \
     gstreamer1.0-plugins-hevc-dev \
-    gstreamer1.0-plugins-dsp66-dev \
+    ${GSTREAMER_DSP} \
 "
 
 GSTREAMER_DEPS_append_keystone = " \
     gstreamer1.0-plugins-hevc-dev \
-    gstreamer1.0-plugins-dsp66-dev \
+    ${GSTREAMER_DSP} \
 "
 
 RDEPENDS_${PN} = " \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
index 4fc0255..b2f117f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add gstreamer and gstreamer plugins"
 LICENSE = "MIT"
-PR = "r17"
+PR = "r18"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -17,14 +17,18 @@ GSTREAMER_DEPS = " \
     gstreamer1.0-libav \
 "
 
+GSTREAMER_DSP = " \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'gstreamer1.0-plugins-dsp66', '', d)} \
+"
+
 GSTREAMER_DEPS_append_dra7xx = " \
     gstreamer1.0-plugins-hevc \
-    gstreamer1.0-plugins-dsp66 \
+    ${GSTREAMER_DSP} \
 "
 
 GSTREAMER_DEPS_append_keystone = " \
     gstreamer1.0-plugins-hevc \
-    gstreamer1.0-plugins-dsp66 \
+    ${GSTREAMER_DSP} \
 "
 
 GSTREAMER_ACCEL_MM = ""
-- 
2.7.4


