Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id D911B5298F
	for <meta-arago@arago-project.org>;
	Fri, 31 Jan 2014 19:48:29 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0VJmSm2012035
	for <meta-arago@arago-project.org>; Fri, 31 Jan 2014 13:48:29 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0VJmSfO015162
	for <meta-arago@arago-project.org>; Fri, 31 Jan 2014 13:48:28 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 31 Jan 2014 13:48:28 -0600
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s0VJmPS4024302;	Fri, 31 Jan 2014 13:48:26 -0600
From: Chase Maupin <chase.maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 31 Jan 2014 13:48:22 -0600
Message-ID: <1391197703-29424-1-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 1/2] branding-glsdk: pin to GLSDK libdrm version
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
X-List-Received-Date: Fri, 31 Jan 2014 19:48:30 -0000
Content-Type: text/plain

* The GLSDK prefers to use the 2.4.41 version of libdrm from
  meta-ti so pin that version in the branding file.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 .../conf/distro/include/branding-glsdk.inc         |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/branding-glsdk.inc b/meta-arago-distro/conf/distro/include/branding-glsdk.inc
index d1c30f3..b33b21d 100644
--- a/meta-arago-distro/conf/distro/include/branding-glsdk.inc
+++ b/meta-arago-distro/conf/distro/include/branding-glsdk.inc
@@ -2,3 +2,7 @@
 
 # Use the SDK supported kernel and kernel version
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti-glsdk"
+
+# Set the PREFERRED_VERSION of libdrm to the glsdk version for the 
+# glsdk branded builds
+PREFERRED_VERSION_libdrm = "2.4.41"
-- 
1.7.9.5


