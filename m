Return-Path: <sam.nelson@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 0DBA2529CB
	for <meta-arago@arago-project.org>;
	Wed, 25 Feb 2015 20:57:18 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1PKvHPi028924
	for <meta-arago@arago-project.org>; Wed, 25 Feb 2015 14:57:17 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1PKvG58013450
	for <meta-arago@arago-project.org>; Wed, 25 Feb 2015 14:57:16 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 25 Feb 2015 14:57:16 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t1PKvFmQ013533;	Wed, 25 Feb 2015 14:57:15 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 25 Feb 2015 15:57:13 -0500
Message-ID: <1424897833-23994-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] ipsecmgr: Add ALLOW_EMPTY to be set to 1
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
X-List-Received-Date: Wed, 25 Feb 2015 20:57:18 -0000
Content-Type: text/plain

- Package only provides static library and header files

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../recipes-support/ipsecmgr/ipsecmgr_git.bb       |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr_git.bb b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr_git.bb
index d134baf..75187fa 100644
--- a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr_git.bb
+++ b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr_git.bb
@@ -13,6 +13,8 @@ S = "${WORKDIR}/git/build"
 LIB_INC_DIR = "${WORKDIR}/git"
 UTILS_LIB_INC_DIR = "${WORKDIR}/git/utils/iface/"
 
+ALLOW_EMPTY_${PN} = "1"
+
 do_compile() {
 # Compile the library
 	make clean
-- 
1.7.9.5


