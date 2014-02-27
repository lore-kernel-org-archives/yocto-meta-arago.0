Return-Path: <sam.nelson@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 88B5B52A20
	for <meta-arago@arago-project.org>;
	Thu, 27 Feb 2014 18:19:07 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1RIJ65k032070
	for <meta-arago@arago-project.org>; Thu, 27 Feb 2014 12:19:06 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1RIJ6Uj013104
	for <meta-arago@arago-project.org>; Thu, 27 Feb 2014 12:19:06 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 27 Feb 2014 12:19:06 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s1RIJ6ix009005;	Thu, 27 Feb 2014 12:19:06 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 27 Feb 2014 13:19:04 -0500
Message-ID: <1393525144-18094-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] iproute2: Add 3.11 version recipe for iproute2
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
X-List-Received-Date: Thu, 27 Feb 2014 18:19:07 -0000
Content-Type: text/plain

- Patches used earler for 3.8 removed

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../iproute2/iproute2_3.11.0.bb                    |    8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-arago-extras/recipes-connectivity/iproute2/iproute2_3.11.0.bb

diff --git a/meta-arago-extras/recipes-connectivity/iproute2/iproute2_3.11.0.bb b/meta-arago-extras/recipes-connectivity/iproute2/iproute2_3.11.0.bb
new file mode 100644
index 0000000..406d216
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/iproute2/iproute2_3.11.0.bb
@@ -0,0 +1,8 @@
+require recipes-connectivity/iproute2/iproute2.inc
+
+PR = "r0"
+
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BPN}-${PV}.tar.xz"
+
+SRC_URI[md5sum] = "d7ffb27bc9f0d80577b1f3fb9d1a7689"
+SRC_URI[sha256sum] = "0ab31b52b5fd5ff0d3cf03f2068f05eeb4f0b37d107070fbbaacac94df5e88b7"
-- 
1.7.9.5


