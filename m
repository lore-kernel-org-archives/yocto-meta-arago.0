Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 9684452A38
	for <meta-arago@arago-project.org>;
	Thu,  1 Aug 2013 00:07:23 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7107Mdl001017
	for <meta-arago@arago-project.org>; Wed, 31 Jul 2013 19:07:22 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7107MP7010201
	for <meta-arago@arago-project.org>; Wed, 31 Jul 2013 19:07:22 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 31 Jul 2013 19:07:22 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r71079RB032028;
	Wed, 31 Jul 2013 19:07:21 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 31 Jul 2013 19:31:50 -0500
Message-ID: <1375317112-1690-5-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1375317112-1690-1-git-send-email-fcooper@ti.com>
References: <1375317112-1690-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [master & danny][PATCH 5/7] arago.conf: Separate work directories by linux-libc-headers version
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
X-List-Received-Date: Thu, 01 Aug 2013 00:07:23 -0000
Content-Type: text/plain

* Separate work directories by linux-libc-headers version since different
  devices with common architecture may use different linux-libc-headers.
---
 meta-arago-distro/conf/distro/arago.conf |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index b844846..74f4e82 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -60,3 +60,10 @@ ENTERPRISE_DISTRO = "1"
 # Arago based SDK. No need to prevent gst-ffmpeg from being used since we
 # disable troublesome software.
 LICENSE_FLAGS_WHITELIST = "commercial_gst-ffmpeg"
+
+# Some machines with the same architecture use different kernel versions.
+# Set PACKAGE_ARCH to allow packages to be seperated by both architecture and
+# linux-libc-headers version.
+PACKAGE_ARCH := "${TUNE_PKGARCH}-${PREFERRED_VERSION_linux-libc-headers}"
+# Need to include the new PACKAGE_ARCH to the PACKAGE_ARCHS variable or
+PACKAGE_ARCHS += "${TUNE_PKGARCH}-${PREFERRED_VERSION_linux-libc-headers}"
-- 
1.7.0.4


