Return-Path: <jake@udd0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 0EF27529E7
	for <meta-arago@arago-project.org>;
	Tue,  2 Feb 2016 15:14:39 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u12FEc1c022082
	for <meta-arago@arago-project.org>; Tue, 2 Feb 2016 09:14:38 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u12FEcTI013875
	for <meta-arago@arago-project.org>; Tue, 2 Feb 2016 09:14:38 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 2 Feb 2016 09:14:37 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u12FEbYU027054;
	Tue, 2 Feb 2016 09:14:37 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aQcf7-0007ep-CQ; Tue, 02 Feb 2016 10:14:37 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 2 Feb 2016 10:14:35 -0500
Message-ID: <1454426075-29401-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] ti-tisdk-setup: Updates for k2g-evm
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
X-List-Received-Date: Tue, 02 Feb 2016 15:14:39 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
index 701346b..0afeb48 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "Package containing scripts to setup the development host and targ
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://setup.sh;beginline=3;endline=31;md5=fc4b04a33df6d892c9f4d4a9d92b945e"
 
-PR = "r27"
+PR = "r28"
 
 BRANCH ?= "master"
-SRCREV = "9ba9b0c10634d71aa4685aedc4ce9990534586ea"
+SRCREV = "b391f655577f8dc56ba63abfbfe9eac4ab11e8b6"
 SRC_URI = "git://arago-project.org/git/projects/tisdk-setup-scripts.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git/"
@@ -14,6 +14,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 SDCARD_SCRIPT = " create-sdcard.sh"
 SDCARD_SCRIPT_keystone = ""
+SDCARD_SCRIPT_k2g-evm = " create-sdcard.sh"
 
 SETUP_SCRIPTS = " common.sh \
                   setup-host-check.sh \
@@ -34,6 +35,7 @@ UBOOT_ENV_ti43x = "setup-uboot-env-am43x.sh"
 UBOOT_ENV_omap5-evm = "setup-uboot-env-omap5.sh"
 UBOOT_ENV_am57xx-evm = "setup-uboot-env-am57xx-evm.sh"
 UBOOT_ENV_keystone = "setup-uboot-env-keystone.sh"
+UBOOT_ENV_k2g-evm = "setup-uboot-env-k2g-evm.sh"
 UBOOT_ENV = "setup-uboot-unknown.sh"
 
 do_install () {
-- 
1.9.1


