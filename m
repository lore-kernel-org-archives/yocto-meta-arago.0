Return-Path: <h-gou@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 211DE529FA
	for <meta-arago@arago-project.org>;
	Thu,  2 Mar 2017 17:23:28 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v22HNQVV019915
	for <meta-arago@arago-project.org>; Thu, 2 Mar 2017 11:23:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1488475406;
	bh=Rl2shmETpRNrp8YbH+zqgcV+V7eTy/fkZetKA/RSE3g=;
	h=From:To:CC:Subject:Date;
	b=nZiAUFC7wc7UekTst3EF4ngtKmUKzrGZCEXQFRQkunc++1MhBZRfMt92mVrfcTYef
	d1xUXb61cGspNJgOdVNjl00WwdgJrYXOxJUFH5pFHycWQUagMCsUqOYeeE7zKl78qU
	ITPDpnWQOuD58CLSmCJckh75kXk0ZmiVhPpK68xw=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v22HNQFY028632
	for <meta-arago@arago-project.org>; Thu, 2 Mar 2017 11:23:26 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 2 Mar 2017 11:23:25 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v22HNPH4016336;	Thu, 2 Mar 2017 11:23:26 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 2 Mar 2017 12:23:24 -0500
Message-ID: <1488475404-24098-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty/krogoth][PATCH] gstreamer1.0-plugins-dsp66: bump SRCREV for oclconv kernel fix
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
X-List-Received-Date: Thu, 02 Mar 2017 17:23:30 -0000
Content-Type: text/plain

* The file scope OpenCL context object (canny_ctx(CL_DEVICE_TYPE_ACCELERATOR))
  resulted in constructor for Context called during g_module_open (g_plugin.c) of
  "/usr/lib/gstreamer-1.0/libgstdsp66.so", leading to OpenCL device initialization
  and subsequent CMEM error (when CMEM is not installed). The fix is to create the
  Context object on the stack, along the lines of oclconv_imgproc.

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../gst-plugins-ti/gstreamer1.0-plugins-dsp66_git.bb                  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-dsp66_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-dsp66_git.bb
index 6977a47..201e221 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-dsp66_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-dsp66_git.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2827f94fc0a1adeff4d9702e97ce2979"
 
 SRC_URI = "git://git.ti.com/processor-sdk/gst-plugin-dsp66.git;protocol=git;branch=master"
-SRCREV = "0db24f44b49ad673bcebce5d25a63ea41551ebec"
+SRCREV = "0abedafadbed693592804f23482a9447d81b2dbf"
 
 S = "${WORKDIR}/git"
 
@@ -14,7 +14,7 @@ DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base opencl ti-cgt6x-native clocl-n
 
 inherit autotools-brokensep pkgconfig gettext
 
-PR = "r0"
+PR = "r1"
 
 RDEPENDS_${PN} += " opencl-runtime"
 
-- 
1.9.1


