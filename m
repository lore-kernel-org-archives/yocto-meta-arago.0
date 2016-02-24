Return-Path: <h-gou@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 52B0552A4F
	for <meta-arago@arago-project.org>;
	Wed, 24 Feb 2016 21:12:57 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1OLCuga002346
	for <meta-arago@arago-project.org>; Wed, 24 Feb 2016 15:12:56 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1OLCu5C019896
	for <meta-arago@arago-project.org>; Wed, 24 Feb 2016 15:12:56 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 24 Feb 2016 15:12:56 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u1OLCtBo006188;	Wed, 24 Feb 2016 15:12:56 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 24 Feb 2016 16:12:54 -0500
Message-ID: <1456348374-7911-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] arago-source-ipk: add SRCIPK for vlib-c66x
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
X-List-Received-Date: Wed, 24 Feb 2016 21:12:57 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 meta-arago-distro/conf/distro/arago-source-ipk.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index aec669e..605df2f 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -367,3 +367,6 @@ SRCIPK_INSTALL_DIR_pn-mathlib-c66x = "component-sources/mathlib_c66x_${PV}"
 
 CREATE_SRCIPK_pn-imglib-c66x = "1"
 SRCIPK_INSTALL_DIR_pn-imglib-c66x = "component-sources/imglib_c66x_${PV}"
+
+CREATE_SRCIPK_pn-vlib-c66x = "1"
+SRCIPK_INSTALL_DIR_pn-vlib-c66x = "component-sources/vlib_c66x_${PV}"
-- 
1.9.1


