Return-Path: <heroor@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 4BDC9529E4
	for <meta-arago@arago-project.org>;
	Mon,  1 Jul 2013 15:43:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r61Fh2m7032524
	for <meta-arago@arago-project.org>; Mon, 1 Jul 2013 10:43:02 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r61Fh1FQ006489
	for <meta-arago@arago-project.org>; Mon, 1 Jul 2013 10:43:01 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 1 Jul 2013 10:43:01 -0500
Received: from ti.com (swubn01.india.ti.com [172.24.162.214])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with SMTP id r61FgxhD015774;
	Mon, 1 Jul 2013 10:43:00 -0500
Date: Mon, 1 Jul 2013 21:12:59 +0530
From: Siddharth Heroor <heroor@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20130701154259.GA1207@ti.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCH] branding-glsdk: update perferences
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
X-List-Received-Date: Mon, 01 Jul 2013 15:43:03 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Set Preferred Provider for Bootloader to use the GLSDK
  U-Boot Staging tree.
* Set Preferred Provider for libgbm to use the GLSDK libgbm
  and set corresponding version to 9.0.0.

Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 .../conf/distro/include/branding-glsdk.inc         |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-glsdk.inc b/meta-arago-distro/conf/distro/include/branding-glsdk.inc
index d1c30f3..2111d81 100644
--- a/meta-arago-distro/conf/distro/include/branding-glsdk.inc
+++ b/meta-arago-distro/conf/distro/include/branding-glsdk.inc
@@ -2,3 +2,6 @@
 
 # Use the SDK supported kernel and kernel version
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti-glsdk"
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot-glsdk-staging"
+PREFERRED_PROVIDER_libgbm = "libgbm-glsdk"
+PREFERRED_VERSION_libgbm = "9.0.0"
-- 
1.7.0.4


