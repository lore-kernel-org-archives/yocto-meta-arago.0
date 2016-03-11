Return-Path: <h-gou@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id A715C529C7
	for <meta-arago@arago-project.org>;
	Fri, 11 Mar 2016 22:02:19 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2BM2JeW026655
	for <meta-arago@arago-project.org>; Fri, 11 Mar 2016 16:02:19 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2BM2JKb007018
	for <meta-arago@arago-project.org>; Fri, 11 Mar 2016 16:02:19 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 11 Mar 2016 16:02:19 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u2BM2I6I011570;	Fri, 11 Mar 2016 16:02:19 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 11 Mar 2016 17:02:11 -0500
Message-ID: <1457733732-18531-3-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1457733732-18531-1-git-send-email-h-gou@ti.com>
References: <1457733732-18531-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] gstreamer1.0-plugins-hevc: add support for keystone platforms
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
X-List-Received-Date: Fri, 11 Mar 2016 22:02:20 -0000
Content-Type: text/plain

* Bump SRCREV to get Makefile fix
* Remove non-necessary DEPENDS gstreamer1.0-plugins-bad
* Remove PACKAGE_ARCH as the plugin is common for compatible machines

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb              | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb
index d32ad20..cd93955 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb
@@ -3,19 +3,18 @@ HOMEPAGE = "https://git.ti.com/processor-sdk/gst-plugin-hevc"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2827f94fc0a1adeff4d9702e97ce2979"
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE = "dra7xx"
+COMPATIBLE_MACHINE = "dra7xx|keystone"
 
 SRC_URI = "git://git.ti.com/processor-sdk/gst-plugin-hevc.git;protocol=git"
-SRCREV = "5e2658b71536dffac6fc09e14ca91114795cfc7a"
+SRCREV = "e4ea007d0ddeb95ae01742293454ef3c87a6e84c"
 
 S = "${WORKDIR}/git"
 
-DEPENDS += "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad hevc-arm-decoder"
+DEPENDS += "gstreamer1.0 gstreamer1.0-plugins-base hevc-arm-decoder"
 
 inherit autotools-brokensep pkgconfig gettext
 
-PR = "r4"
+PR = "r5"
 
 do_configure() {
         cd ${S}
-- 
1.9.1


