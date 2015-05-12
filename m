Return-Path: <sam.nelson@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 7214E529AE
	for <meta-arago@arago-project.org>;
	Tue, 12 May 2015 00:05:35 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4C05XXY019350
	for <meta-arago@arago-project.org>; Mon, 11 May 2015 19:05:33 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4C05XB9030880
	for <meta-arago@arago-project.org>; Mon, 11 May 2015 19:05:33 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 11 May 2015 19:05:33 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t4C05X1j025567;	Mon, 11 May 2015 19:05:33 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 11 May 2015 20:05:30 -0400
Message-ID: <1431389130-22291-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2] ipsecmgr: Add run time dependency on ipsecmgr-mod
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
X-List-Received-Date: Tue, 12 May 2015 00:05:35 -0000
Content-Type: text/plain

- ipsecmgr depends on kernel module loaded during run time

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Change from previous version
- Added _${PN}
---
---
 .../recipes-support/ipsecmgr/ipsecmgr_git.bb       |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr_git.bb b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr_git.bb
index 75187fa..c9c3af9 100644
--- a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr_git.bb
+++ b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr_git.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://../ipsecmgr_snoop.h;beginline=1;endline=33;md5=f7eadc
 include ipsecmgr.inc
 
 DEPENDS = "libnl-xfrm"
+RDEPENDS_${PN} = "ipsecmgr-mod"
 
 CFLAGS += "-I${STAGING_INCDIR}/libnl3"
 
-- 
1.7.9.5


