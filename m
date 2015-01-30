Return-Path: <sam.nelson@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 5FEB952090
	for <meta-arago@arago-project.org>;
	Fri, 30 Jan 2015 02:45:55 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0U2jstP023555
	for <meta-arago@arago-project.org>; Thu, 29 Jan 2015 20:45:54 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0U2jrD5032214
	for <meta-arago@arago-project.org>; Thu, 29 Jan 2015 20:45:53 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 29 Jan 2015 20:45:52 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0U2jqZ8030183;	Thu, 29 Jan 2015 20:45:52 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 29 Jan 2015 21:45:47 -0500
Message-ID: <1422585948-19345-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2 1/2] strongswan: Add append recipe for strongswan v5.1.1 to remove GPLV3 dependency
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
X-List-Received-Date: Fri, 30 Jan 2015 02:45:56 -0000
Content-Type: text/plain

- Remove GMP dependency which has GPLV3 content

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Changes from previous version
- Used _remove to remove gmp dependancy and flags
---
---
 .../strongswan/strongswan_5.1.1.bbappend           |    7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/strongswan/strongswan_5.1.1.bbappend

diff --git a/meta-arago-extras/recipes-support/strongswan/strongswan_5.1.1.bbappend b/meta-arago-extras/recipes-support/strongswan/strongswan_5.1.1.bbappend
new file mode 100644
index 0000000..9dbc509
--- /dev/null
+++ b/meta-arago-extras/recipes-support/strongswan/strongswan_5.1.1.bbappend
@@ -0,0 +1,7 @@
+PR_append = "-arago0"
+
+DEPENDS_remove = "gmp"
+
+EXTRA_OECONF_remove = "--enable-gmp"
+
+EXTRA_OECONF += "--disable-gmp"
-- 
1.7.9.5


