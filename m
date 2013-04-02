Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id C00CC52961
	for <meta-arago@arago-project.org>;
	Tue,  2 Apr 2013 15:09:46 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r32F9hAA024745
	for <meta-arago@arago-project.org>; Tue, 2 Apr 2013 10:09:44 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r32F9h3P009076
	for <meta-arago@arago-project.org>; Tue, 2 Apr 2013 20:39:43 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 2 Apr 2013 20:39:43 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r32F9fWA009548;
	Tue, 2 Apr 2013 20:39:42 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 2 Apr 2013 10:09:39 -0500
Message-ID: <1364915379-32133-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] ti-tisdk-setup: Add missing script and update SRCREV
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
X-List-Received-Date: Tue, 02 Apr 2013 15:09:47 -0000
Content-Type: text/plain

* Update to the latest SRCREV to get a clearer message about
  when u-boot is being copied to the SD card. Currently you would
  get a message about not finding either u-boot.bin or u-boot.img
  since there would only ever be one or the other.
* Install the add-to-group.sh script to the list of files to be
  installed.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
index 1799700..a5a89ac 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "Package containing scripts to setup the development host and targ
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://setup.sh;beginline=3;endline=31;md5=fc4b04a33df6d892c9f4d4a9d92b945e"
 
-PR = "r7"
+PR = "r8"
 
 BRANCH ?= "master"
-SRCREV = "7dd655d0724e67c702060aea133f88843fc123b0"
+SRCREV = "4b1ccd075df5e722b1cb11c0798d030786a6d536"
 SRC_URI = "git://arago-project.org/git/projects/tisdk-setup-scripts.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git/"
@@ -29,6 +29,7 @@ do_install () {
     install -m 0755 ${S}/setup-targetfs-nfs.sh ${D}/bin
     install -m 0755 ${S}/setup-tftp.sh ${D}/bin
     install -m 0755 ${S}/create-sdcard.sh ${D}/bin
+    install -m 0755 ${S}/add-to-group.sh ${D}/bin
     install -m 0755 ${S}/${UBOOT_ENV} ${D}/bin/setup-uboot-env.sh
 }
 
-- 
1.7.0.4


