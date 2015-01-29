Return-Path: <sam.nelson@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 9FC0D52A23
	for <meta-arago@arago-project.org>;
	Thu, 29 Jan 2015 19:00:51 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0TJ0mjt026846
	for <meta-arago@arago-project.org>; Thu, 29 Jan 2015 13:00:48 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0TJ0loh030058
	for <meta-arago@arago-project.org>; Thu, 29 Jan 2015 13:00:47 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 29 Jan 2015 13:00:47 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0TJ0l4g002469;	Thu, 29 Jan 2015 13:00:47 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 29 Jan 2015 14:00:44 -0500
Message-ID: <1422558045-17124-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 1/2] strongswan: Add append recipe for strongswan v5.1.1 to remove GPLV3 dependency
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
X-List-Received-Date: Thu, 29 Jan 2015 19:00:57 -0000
Content-Type: text/plain

- Remove GMP dependency which has GPLV3 content

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../strongswan/strongswan_5.1.1.bbappend           |    8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/strongswan/strongswan_5.1.1.bbappend

diff --git a/meta-arago-extras/recipes-support/strongswan/strongswan_5.1.1.bbappend b/meta-arago-extras/recipes-support/strongswan/strongswan_5.1.1.bbappend
new file mode 100644
index 0000000..ca19b68
--- /dev/null
+++ b/meta-arago-extras/recipes-support/strongswan/strongswan_5.1.1.bbappend
@@ -0,0 +1,8 @@
+PR_append = "-arago0"
+
+DEPENDS = "openssl flex-native flex bison-native"
+
+EXTRA_OECONF = "--disable-gmp \
+        --enable-openssl \
+        --without-lib-prefix \
+"
-- 
1.7.9.5


