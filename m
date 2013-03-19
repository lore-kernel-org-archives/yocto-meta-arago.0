Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id AA6B55203A
	for <meta-arago@arago-project.org>;
	Tue, 19 Mar 2013 15:14:10 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2JFE8WS011331
	for <meta-arago@arago-project.org>; Tue, 19 Mar 2013 10:14:09 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2JFE7UV005757
	for <meta-arago@arago-project.org>;
	Tue, 19 Mar 2013 20:44:08 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 19 Mar 2013 20:44:07 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2JFE4lN023952;
	Tue, 19 Mar 2013 20:44:05 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Mar 2013 10:13:56 -0500
Message-ID: <1363706042-10182-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 1/7] ti-tisdk-setup: Add support for unknown devices
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
X-List-Received-Date: Tue, 19 Mar 2013 15:14:11 -0000
Content-Type: text/plain

* Add support for unknown devices to use a generic u-boot script
  that will just point users to the user's guide.
* Remove COMPATIBLE_MACHINE since machines without a specific
  u-boot setup script will use the unknown script.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
index a02747c..1799700 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
@@ -2,12 +2,10 @@ DESCRIPTION = "Package containing scripts to setup the development host and targ
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://setup.sh;beginline=3;endline=31;md5=fc4b04a33df6d892c9f4d4a9d92b945e"
 
-COMPATIBLE_MACHINE = "am37x-evm|am3517-evm|beagleboard|ti33x|am180x-evm"
-
-PR = "r6"
+PR = "r7"
 
 BRANCH ?= "master"
-SRCREV = "708cff4993a472b55fb4bf96579b608bcfac1a5a"
+SRCREV = "7dd655d0724e67c702060aea133f88843fc123b0"
 SRC_URI = "git://arago-project.org/git/projects/tisdk-setup-scripts.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git/"
@@ -19,6 +17,7 @@ UBOOT_ENV_beagleboard = "setup-uboot-env-beagleboard.sh"
 UBOOT_ENV_am3517-evm = "setup-uboot-env-am3517.sh"
 UBOOT_ENV_am180x-evm = "setup-uboot-env-am18x.sh"
 UBOOT_ENV_ti33x = "setup-uboot-env-am335x.sh"
+UBOOT_ENV = "setup-uboot-unknown.sh"
 
 do_install () {
     install -m 0755 ${S}/setup.sh ${D}/
-- 
1.7.0.4


