Return-Path: <karthik.ramanan@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id B51C352A5D
	for <meta-arago@arago-project.org>;
	Wed, 26 Nov 2014 08:36:34 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id sAQ8aXsl018703
	for <meta-arago@arago-project.org>; Wed, 26 Nov 2014 02:36:33 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id sAQ8aX1F022828
	for <meta-arago@arago-project.org>; Wed, 26 Nov 2014 02:36:33 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 26 Nov 2014 02:36:33 -0600
Received: from zubuntu.apr.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	sAQ8aVmv009779;	Wed, 26 Nov 2014 02:36:32 -0600
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 26 Nov 2014 14:01:28 +0530
Message-ID: <1416990689-13265-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [for master PATCH] gstreamer: Add missing FILES_PN to populate rootfs
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
X-List-Received-Date: Wed, 26 Nov 2014 08:36:35 -0000
Content-Type: text/plain

All the libraries and binaries from GST, base-plugins,
good-plugins and bad-plugins need to be populated into
the target filesystem.

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../gstreamer/gst-plugins-package-mm-accel.inc     |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-package-mm-accel.inc b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-package-mm-accel.inc
index a1c81f3..68f643c 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-package-mm-accel.inc
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-package-mm-accel.inc
@@ -15,3 +15,5 @@ python split_gstreamer10_packages () {
     do_split_packages(d, gst_libdir, 'libgst(.*)\.la$', d.expand('${PN}-%s-dev'), 'GStreamer plugin for %s (development files)', extra_depends=d.expand('${PN}-dev'))
     do_split_packages(d, gst_libdir, 'libgst(.*)\.a$', d.expand('${PN}-%s-staticdev'), 'GStreamer plugin for %s (static development files)', extra_depends=d.expand('${PN}-staticdev'))
 }
+
+FILES_${PN} += "${libdir}/gstreamer-0.10/*"
-- 
1.7.9.5


