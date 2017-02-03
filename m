Return-Path: <h-gou@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 3EE7652AF7
	for <meta-arago@arago-project.org>;
	Fri,  3 Feb 2017 22:22:31 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v13MMUnf026227
	for <meta-arago@arago-project.org>; Fri, 3 Feb 2017 16:22:30 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v13MMU3L005391
	for <meta-arago@arago-project.org>; Fri, 3 Feb 2017 16:22:30 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 3 Feb 2017 16:22:30 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v13MMTKx025786;	Fri, 3 Feb 2017 16:22:30 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 3 Feb 2017 17:22:15 -0500
Message-ID: <1486160539-23523-3-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1486160539-23523-1-git-send-email-h-gou@ti.com>
References: <1486160539-23523-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
Subject: [morty/krogoth][PATCH 2/6] arago-source-ipk: add SRCIPK for barcode-roi demo
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
X-List-Received-Date: Fri, 03 Feb 2017 22:22:33 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 meta-arago-distro/conf/distro/arago-source-ipk.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index 96f2db2..5d2796f 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -357,6 +357,9 @@ CREATE_SRCIPK_pn-linalg-examples = "1"
 SRCIPK_INSTALL_DIR_pn-linalg-examples = "example-applications/${PN}-${PV}"
 SRCIPK_SRC_DIR_pn-linalg-examples = "${EXAMPLES_ROOT}"
 
+CREATE_SRCIPK_pn-barcode-roi = "1"
+SRCIPK_INSTALL_DIR_pn-barcode-roi = "example-applications/${PN}-${PV}"
+
 CREATE_SRCIPK_pn-boot-monitor = "1"
 SRCIPK_INSTALL_DIR_pn-boot-monitor = "board-support/${PN}-${PV}"
 
-- 
1.9.1


