Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id F0FD352A52
	for <meta-arago@arago-project.org>;
	Wed,  4 Mar 2015 11:59:49 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t24BxndJ024663
	for <meta-arago@arago-project.org>; Wed, 4 Mar 2015 05:59:49 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t24BxmKq025513
	for <meta-arago@arago-project.org>; Wed, 4 Mar 2015 05:59:48 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 Mar 2015 05:59:47 -0600
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t24Bxls6031817;	Wed, 4 Mar 2015 05:59:47 -0600
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1YT7xr-0004sl-6P;
	Wed, 04 Mar 2015 06:59:47 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 4 Mar 2015 06:59:44 -0500
Message-ID: <1425470384-18737-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] ti-compat-wireless-wl18xx: Do not configure sources before creating the sourceipk.
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
X-List-Received-Date: Wed, 04 Mar 2015 11:59:50 -0000
Content-Type: text/plain

* Configuring the sources creates an executable with the architecture
  of the build machine, and thus may be incompatible with the SDK
  architecture.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ti-compat-wireless-wl18xx.bb                   |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx.bb b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx.bb
index b21fca4..ec40f9d 100644
--- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx.bb
+++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx.bb
@@ -12,7 +12,7 @@ RDEPENDS_${PN} = "wireless-tools"
 PV = "R8.5"
 inherit module
 
-PR = "${MACHINE_KERNEL_PR}+e+gitr${SRCPV}"
+PR = "${MACHINE_KERNEL_PR}+f+gitr${SRCPV}"
 
 # Tags: R8.5
 SRCREV_wl18xx = "cb51164c672b1ecadef339b9f9b39e29ab706723"
@@ -38,10 +38,11 @@ do_configure() {
     python ./gentree.py --clean  "${WORKDIR}/wl18xx" "${WORKDIR}/compat-wireless"
 
     cd ${S}
-    make defconfig-wl18xx
 
     # Now generate the sourceipk with the properly configured sources
     sourceipk_do_create_srcipk
+
+    make defconfig-wl18xx
 }
 
 do_install() {
-- 
1.7.9.5


