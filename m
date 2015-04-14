Return-Path: <a0866934local@udb0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 109DD52AC0
	for <meta-arago@arago-project.org>;
	Tue, 14 Apr 2015 13:47:20 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3EDlKVs005649
	for <meta-arago@arago-project.org>; Tue, 14 Apr 2015 08:47:20 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3EDlJBj009659
	for <meta-arago@arago-project.org>; Tue, 14 Apr 2015 08:47:19 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 14 Apr 2015 08:47:18 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3EDlI8Z008115;
	Tue, 14 Apr 2015 08:47:19 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1Yi1BO-0003yC-Q7;
	Tue, 14 Apr 2015 09:47:18 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 14 Apr 2015 09:47:10 -0400
Message-ID: <1429019232-15216-4-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1429019232-15216-1-git-send-email-j-stiffler@ti.com>
References: <1429019232-15216-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] arago-source-ipk: Enable cmem-mod source IPK.
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
X-List-Received-Date: Tue, 14 Apr 2015 13:47:21 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../conf/distro/arago-source-ipk.conf              |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index c2a81b7..ea9e37d 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -205,6 +205,10 @@ CREATE_SRCIPK_pn-cryptodev-module = "1"
 SRCIPK_INSTALL_DIR_pn-cryptodev-module = "board-support/extra-drivers/cryptodev-module-${PV}"
 SRCIPK_PACKAGE_ARCH_pn-cryptodev-module = "${MACHINE_ARCH}"
 
+CREATE_SRCIPK_pn-cmem-mod = "1"
+SRCIPK_INSTALL_DIR_pn-cmem-mod = "board-support/extra-drivers/${PN}-${PV}"
+SRCIPK_PACKAGE_ARCH_pn-cmem-mod = "${MACHINE_ARCH}"
+
 CREATE_SRCIPK_pn-ti-linux-driver-examples = "1"
 SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples = "example-applications/linux-driver-examples-${PV}"
 
-- 
1.7.9.5


