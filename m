Return-Path: <sam.nelson@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 9749152A1E
	for <meta-arago@arago-project.org>;
	Sun,  2 Mar 2014 23:18:18 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s22NIIXC009826
	for <meta-arago@arago-project.org>; Sun, 2 Mar 2014 17:18:18 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s22NIHrQ022938
	for <meta-arago@arago-project.org>; Sun, 2 Mar 2014 17:18:17 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 2 Mar 2014 17:18:17 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s22NIHqQ015977;	Sun, 2 Mar 2014 17:18:17 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Sun, 2 Mar 2014 18:18:15 -0500
Message-ID: <1393802295-7212-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] arago.conf: Update preferred version of binutils to 2.23.1
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
X-List-Received-Date: Sun, 02 Mar 2014 23:18:18 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
- 2.23.1 is available in oe-core/meta/recipes-devtools/binutils/binutils_2.23.1.bb
---
---
 meta-arago-distro/conf/distro/arago.conf |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 76254f2..a789e89 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -70,3 +70,5 @@ LICENSE_FLAGS_WHITELIST = "commercial_gst-ffmpeg"
 PACKAGE_ARCH := "${TUNE_PKGARCH}-${PREFERRED_VERSION_linux-libc-headers}"
 # Need to include the new PACKAGE_ARCH to the PACKAGE_ARCHS variable
 PACKAGE_ARCHS += "${TUNE_PKGARCH}-${PREFERRED_VERSION_linux-libc-headers}"
+
+PREFERRED_VERSION_binutils = "2.23.1"
-- 
1.7.9.5


