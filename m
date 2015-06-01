Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 7833452A3F
	for <meta-arago@arago-project.org>;
	Mon,  1 Jun 2015 18:55:57 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t51ItthV021701
	for <meta-arago@arago-project.org>; Mon, 1 Jun 2015 13:55:55 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t51IttPs002947
	for <meta-arago@arago-project.org>; Mon, 1 Jun 2015 13:55:55 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 1 Jun 2015 13:55:55 -0500
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t51Itt1U001013;	Mon, 1 Jun 2015 13:55:55 -0500
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1YzUsN-0005d9-2o;
	Mon, 01 Jun 2015 14:55:55 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 1 Jun 2015 14:55:48 -0400
Message-ID: <1433184950-16151-4-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1433184950-16151-1-git-send-email-j-stiffler@ti.com>
References: <1433184950-16151-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] arago-source-ipk: Enable gdbserverproxy-module-drv source ipk
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
X-List-Received-Date: Mon, 01 Jun 2015 18:55:58 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../conf/distro/arago-source-ipk.conf              |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index ab12e09..91b1d48 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -214,6 +214,10 @@ CREATE_SRCIPK_pn-debugss-module-drv = "1"
 SRCIPK_INSTALL_DIR_pn-debugss-module-drv = "board-support/extra-drivers/${PN}-${PV}"
 SRCIPK_PACKAGE_ARCH_pn-debugss-module-drv = "${MACHINE_ARCH}"
 
+CREATE_SRCIPK_pn-gdbserverproxy-module-drv = "1"
+SRCIPK_INSTALL_DIR_pn-gdbserverproxy-module-drv = "board-support/extra-drivers/${PN}-${PV}"
+SRCIPK_PACKAGE_ARCH_pn-gdbserverproxy-module-drv = "${MACHINE_ARCH}"
+
 CREATE_SRCIPK_pn-ti-linux-driver-examples = "1"
 SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples = "example-applications/linux-driver-examples-${PV}"
 
-- 
1.7.9.5


