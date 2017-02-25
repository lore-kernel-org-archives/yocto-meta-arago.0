Return-Path: <karthik.ramanan@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id F2DA152A60
	for <meta-arago@arago-project.org>;
	Sun, 26 Feb 2017 16:55:05 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v1P3nZM5027309
	for <meta-arago@arago-project.org>; Fri, 24 Feb 2017 21:49:35 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1P3nZZT006125
	for <meta-arago@arago-project.org>; Fri, 24 Feb 2017 21:49:35 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 24 Feb 2017 21:49:34 -0600
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1P3nXl5010656;
	Fri, 24 Feb 2017 21:49:34 -0600
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Sat, 25 Feb 2017 09:19:31 +0530
Message-ID: <1487994571-79911-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [master, krogoth] packagegroup-arago-gst*: remove gstreamer1.0-plugins-dsp66 for dra7xx-evm
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
X-List-Received-Date: Sun, 26 Feb 2017 16:55:06 -0000
Content-Type: text/plain

This is causing an issue with gst-inspect and gst-launch

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
index 4fc0255..ad1fada 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
@@ -19,7 +19,6 @@ GSTREAMER_DEPS = " \
 
 GSTREAMER_DEPS_append_dra7xx = " \
     gstreamer1.0-plugins-hevc \
-    gstreamer1.0-plugins-dsp66 \
 "
 
 GSTREAMER_DEPS_append_keystone = " \
-- 
1.9.1


