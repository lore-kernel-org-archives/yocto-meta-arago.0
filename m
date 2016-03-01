Return-Path: <jake@udd0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 6B78352A35
	for <meta-arago@arago-project.org>;
	Tue,  1 Mar 2016 13:31:32 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u21DVVro026953
	for <meta-arago@arago-project.org>; Tue, 1 Mar 2016 07:31:31 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u21DVVAu005717
	for <meta-arago@arago-project.org>; Tue, 1 Mar 2016 07:31:31 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 1 Mar 2016 07:31:30 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u21DVUKm010294;
	Tue, 1 Mar 2016 07:31:30 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aakOf-0003zm-L5; Tue, 01 Mar 2016 08:31:29 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 1 Mar 2016 08:31:26 -0500
Message-ID: <1456839087-15323-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/2] ti-tisdk-setup: Add support for create_ubifs script
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
X-List-Received-Date: Tue, 01 Mar 2016 13:31:33 -0000
Content-Type: text/plain

* Bump SRCREV to get create_ubifs.sh
* Use machine-specific variables to populate the UBI parameters

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
index 0afeb48..ebf4080 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "Package containing scripts to setup the development host and targ
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://setup.sh;beginline=3;endline=31;md5=fc4b04a33df6d892c9f4d4a9d92b945e"
 
-PR = "r28"
+PR = "r29"
 
 BRANCH ?= "master"
-SRCREV = "b391f655577f8dc56ba63abfbfe9eac4ab11e8b6"
+SRCREV = "6e4af301f7524546545f5b2b0bb46d7993c07ba8"
 SRC_URI = "git://arago-project.org/git/projects/tisdk-setup-scripts.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git/"
@@ -23,6 +23,7 @@ SETUP_SCRIPTS = " common.sh \
                   setup-targetfs-nfs.sh \
                   setup-tftp.sh \
                   add-to-group.sh \
+                  create-ubifs.sh \
                   ${SDCARD_SCRIPT} \
 "
 
@@ -48,6 +49,10 @@ do_install () {
     done
 
     install -m 0755 ${S}/${UBOOT_ENV} ${D}/bin/setup-uboot-env.sh
+
+    sed -i -e "s|__MKUBIFS_ARGS__|${MKUBIFS_ARGS}|" \
+           -e "s|__UBINIZE_ARGS__|${UBINIZE_ARGS}|" \
+              "${D}/bin/create-ubifs.sh"
 }
 
 FILES_${PN} += "setup.sh"
-- 
1.9.1


