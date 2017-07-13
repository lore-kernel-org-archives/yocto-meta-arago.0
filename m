Return-Path: <sam.nelson@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 74F3352A51
	for <meta-arago@arago-project.org>;
	Thu, 13 Jul 2017 00:05:21 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6D05L2s008184
	for <meta-arago@arago-project.org>; Wed, 12 Jul 2017 19:05:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499904321;
	bh=9Ws65h5T4uQd70gNah3JLMcuMjVy1PV151HyYRElZgQ=;
	h=From:To:CC:Subject:Date;
	b=eKZ7hxbh01i9JBDMyY9PB1hq5eVr2CfkPmZUkAiNDKJRKPtomtnP5UL9ItWCdVt6L
	3Gvk+ClljmJq2UMY7KwXUzbBYAEbBYLZx/WfsnvsCHFXh0pbzjPrJjHnKSZMSxqfON
	2nvKi1y/MtWqaof9XGEfkB6RW4+slNHJNuTxqnls=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6D05LtW019997
	for <meta-arago@arago-project.org>; Wed, 12 Jul 2017 19:05:21 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Jul 2017 19:05:20 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6D05KAs013067;	Wed, 12 Jul 2017 19:05:20 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 12 Jul 2017 20:05:19 -0400
Message-ID: <1499904319-17520-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty/master][PATCH] arago-source-ipk: Add big-data-ipc-demo-linux source ipk
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
X-List-Received-Date: Thu, 13 Jul 2017 00:05:21 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-source-ipk.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
index f05acf7..c598d5d 100644
--- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
+++ b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
@@ -362,3 +362,6 @@ SRCIPK_INSTALL_DIR_pn-imglib-c66x = "component-sources/imglib_c66x_${PV}"
 
 CREATE_SRCIPK_pn-vlib-c66x = "1"
 SRCIPK_INSTALL_DIR_pn-vlib-c66x = "component-sources/vlib_c66x_${PV}"
+
+CREATE_SRCIPK_pn-big-data-ipc-demo-linux = "1"
+SRCIPK_INSTALL_DIR_pn-big-data-ipc-demo-linux = "example-applications/${PN}-${PV}"
-- 
1.9.1


