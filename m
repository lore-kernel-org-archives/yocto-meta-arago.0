Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 53E6B52A58
	for <meta-arago@arago-project.org>;
	Wed,  8 Apr 2020 00:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3D61040C1F;
	Wed,  8 Apr 2020 00:45:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Hf-zO_a0XV-T; Wed,  8 Apr 2020 00:45:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 258B140C35;
	Wed,  8 Apr 2020 00:45:10 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id D160A171902;
	Tue,  7 Apr 2020 20:45:08 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue,  7 Apr 2020 20:44:45 -0400
Message-Id: <1586306702-7953-7-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586306702-7953-1-git-send-email-denis@denix.org>
References: <1586306702-7953-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 07/24] gstreamer1.0-plugins-dsp66: require dsp machine and opencl distro features
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
X-List-Received-Date: Wed, 08 Apr 2020 00:47:29 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-gst.bb              | 2 +-
 .../gst-plugins-ti/gstreamer1.0-plugins-dsp66_git.bb                  | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
index b2f117f..2679251 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
@@ -18,7 +18,7 @@ GSTREAMER_DEPS = " \
 "
 
 GSTREAMER_DSP = " \
-    ${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'gstreamer1.0-plugins-dsp66', '', d)} \
+    ${@['','gstreamer1.0-plugins-dsp66'][oe.utils.all_distro_features(d, 'opencl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, False, d)]} \
 "
 
 GSTREAMER_DEPS_append_dra7xx = " \
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-dsp66_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-dsp66_git.bb
index 6e28891..617fdc9 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-dsp66_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-dsp66_git.bb
@@ -16,6 +16,10 @@ COMPATIBLE_MACHINE = "dra7xx|keystone"
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base opencl ti-cgt6x-native clocl-native imglib-c66x vlib-c66x gettext-native"
 
 inherit autotools-brokensep pkgconfig gettext
+inherit features_check
+
+REQUIRED_MACHINE_FEATURES = "dsp"
+REQUIRED_DISTRO_FEATURES = "opencl"
 
 PR = "r1"
 
-- 
2.7.4


