Return-Path: <jake@udc0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id E148C52A83
	for <meta-arago@arago-project.org>;
	Tue, 22 Sep 2015 14:35:04 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t8MEZ2Hg002824
	for <meta-arago@arago-project.org>; Tue, 22 Sep 2015 09:35:02 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8MEZ1Q5020523
	for <meta-arago@arago-project.org>; Tue, 22 Sep 2015 09:35:02 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 22 Sep 2015 09:35:01 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8MEZ1BD029263;
	Tue, 22 Sep 2015 09:35:01 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1ZeOeq-0003Tw-Q4; Tue, 22 Sep 2015 10:35:00 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 22 Sep 2015 10:34:58 -0400
Message-ID: <1442932499-13350-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/2] arago-source-ipk: Add opencl-examples source ipk.
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
X-List-Received-Date: Tue, 22 Sep 2015 14:35:10 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/conf/distro/arago-source-ipk.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index 54a2536..e84bc0c 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -327,3 +327,6 @@ SRCIPK_INSTALL_DIR_pn-ti-c674x-aaclcdec = "component-sources/c674x-aaclcdec_${PV
 
 CREATE_SRCIPK_pn-oe-layersetup = "1"
 SRCIPK_INSTALL_DIR_pn-oe-layersetup = "bin/oe-layersetup"
+
+CREATE_SRCIPK_pn-opencl-examples = "1"
+SRCIPK_INSTALL_DIR_pn-opencl-examples = "example-applications/${PN}-${PV}"
-- 
1.9.1


