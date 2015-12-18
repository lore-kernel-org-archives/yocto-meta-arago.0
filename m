Return-Path: <sam.nelson@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 7E01852995
	for <meta-arago@arago-project.org>;
	Fri, 18 Dec 2015 23:01:07 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id tBIN16rA006099
	for <meta-arago@arago-project.org>; Fri, 18 Dec 2015 17:01:06 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tBIN16lw001930
	for <meta-arago@arago-project.org>; Fri, 18 Dec 2015 17:01:06 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 18 Dec 2015 17:01:06 -0600
Received: from ares-ubuntu2.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tBIN16KL004054;	Fri, 18 Dec 2015 17:01:06 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 18 Dec 2015 18:01:04 -0500
Message-ID: <1450479664-21212-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] tisdk-server-extra: Add parse-ip module
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
X-List-Received-Date: Fri, 18 Dec 2015 23:01:07 -0000
Content-Type: text/plain

- Parse-ip module parses the ip address during boot and make it
available for the host system to use.

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../packagegroups/packagegroup-arago-base-tisdk-server-extra.bb          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
index 122b13f..336665e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
@@ -166,4 +166,5 @@ RDEPENDS_${PN} = "\
     libbz2 \
     boost \
     recovery-kernel \
+    parse-ip \
     "
-- 
1.9.1


