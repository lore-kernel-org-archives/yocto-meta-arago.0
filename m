Return-Path: <sam.nelson@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 6EB11529CB
	for <meta-arago@arago-project.org>;
	Wed, 25 Feb 2015 20:56:04 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1PKu3Vg027877
	for <meta-arago@arago-project.org>; Wed, 25 Feb 2015 14:56:03 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1PKu2wu012544
	for <meta-arago@arago-project.org>; Wed, 25 Feb 2015 14:56:02 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 25 Feb 2015 14:56:02 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t1PKu18C011449;	Wed, 25 Feb 2015 14:56:02 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 25 Feb 2015 15:55:59 -0500
Message-ID: <1424897759-23944-2-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1424897759-23944-1-git-send-email-sam.nelson@ti.com>
References: <1424897759-23944-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] meta-toolchain_arago-mcsdk: Add toolchain build for MCSDK
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
X-List-Received-Date: Wed, 25 Feb 2015 20:56:04 -0000
Content-Type: text/plain

-Uses package group mcsdk-toolchain-target

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../meta/meta-toolchain-arago-mcsdk.bb             |    7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 meta-arago-extras/recipes-core/meta/meta-toolchain-arago-mcsdk.bb

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-mcsdk.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-mcsdk.bb
new file mode 100644
index 0000000..70543f4
--- /dev/null
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-mcsdk.bb
@@ -0,0 +1,7 @@
+# MCSDK Embedded toolchain
+TOOLCHAIN_TARGET_TASK = "packagegroup-arago-mcsdk-toolchain-target"
+TOOLCHAIN_OUTPUTNAME = "${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-mcsdk-sdk-${SDK_ARCH}"
+
+require recipes-core/meta/meta-toolchain-arago.bb
+
+PR = "r0"
-- 
1.7.9.5


