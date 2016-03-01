Return-Path: <jake@udd0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 6B72152A26
	for <meta-arago@arago-project.org>;
	Tue,  1 Mar 2016 13:31:32 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u21DVVmF026952
	for <meta-arago@arago-project.org>; Tue, 1 Mar 2016 07:31:31 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u21DVVDL005716
	for <meta-arago@arago-project.org>; Tue, 1 Mar 2016 07:31:31 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 1 Mar 2016 07:31:31 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u21DVUqb016679;
	Tue, 1 Mar 2016 07:31:30 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aakOg-0003zq-0w; Tue, 01 Mar 2016 08:31:30 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 1 Mar 2016 08:31:27 -0500
Message-ID: <1456839087-15323-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1456839087-15323-1-git-send-email-j-stiffler@ti.com>
References: <1456839087-15323-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] tisdk-install: Insert SDK path into ubifs script
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

* Insert SDK path into create_ubifs.sh so that the ubifs utilities may
  be found in the devkit.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-tisdk/tisdk-install/tisdk-install/sdk-install.sh         | 5 +++++
 meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb   | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-install.sh b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-install.sh
index 65c5b69..d195d51 100644
--- a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-install.sh
+++ b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-install.sh
@@ -102,6 +102,11 @@ then
     sed -i -e s=__SDK_INSTALL_DIR__=$install_dir= $install_dir/bin/unshallow-repositories.sh
 fi
 
+if [ -f "$install_dir/bin/create-ubifs.sh" ]
+then
+    sed -i -e s=__SDK_INSTALL_DIR__=$install_dir= $install_dir/bin/create-ubifs.sh
+fi
+
 # Modify create-sdcard.sh to have user-supplied installation directory
 if [ -f "${install_dir}/bin/create-sdcard.sh" ]
 then
diff --git a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb
index a3b88d9..e418813 100644
--- a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://../sdk-install.sh;beginline=3;endline=19;md5=4b899037
 
 SRC_URI = "file://sdk-install.sh"
 
-PR = "r5"
+PR = "r6"
 
 do_install () {
     install -d ${D}/
-- 
1.9.1


