Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 19CAE52988
	for <meta-arago@arago-project.org>;
	Mon, 22 Oct 2012 14:20:26 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9MEKN0C025649
	for <meta-arago@arago-project.org>; Mon, 22 Oct 2012 09:20:24 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9MEKM2D013796
	for <meta-arago@arago-project.org>;
	Mon, 22 Oct 2012 19:50:23 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 22 Oct 2012 19:50:22 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9MEKJqW017855;
	Mon, 22 Oct 2012 19:50:21 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 22 Oct 2012 09:20:17 -0500
Message-ID: <1350915617-32674-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] arago: set PREFERRED_PROVIDER for jpeg
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
X-List-Received-Date: Mon, 22 Oct 2012 14:20:26 -0000
Content-Type: text/plain

* Set the PREFERRED_PROVIDER for jpeg for armv5te devices and
  libjpeg-turbo for all other devices.
* The avoids the multiple providers error which causes the build
  to return a non-zero return value.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index dbb9671..17270a0 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -45,6 +45,12 @@ PREFERRED_VERSION_hostap-daemon = "0.7.3+0.8.0-rc-ti"
 # Pin down udev version from oe-core, as meta-oe pulls in newer systemd-enhanced version
 PREFERRED_VERSION_udev = "164"
 
+# Set the PREFERRED_PROVIDER for jpeg functionality based on the MACHINE
+# architecture.  For armv7a devices libjpeg-turbo should be used to take
+# advantage of the SIMD instructions.
+PREFERRED_PROVIDER_jpeg = "libjpeg-turbo"
+PREFERRED_PROVIDER_jpeg_armv5te = "jpeg"
+
 # Disable polkit's systemd configuration from meta-oe
 POLKITAUTH = ""
 
-- 
1.7.0.4


