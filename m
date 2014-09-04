Return-Path: <a0866934local@udb0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id B68E952A78
	for <meta-arago@arago-project.org>;
	Thu,  4 Sep 2014 17:31:13 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s84HVCKk019616
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 12:31:13 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84HVCxq029484
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 12:31:12 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 4 Sep 2014 12:31:12 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84HVCfd005964;
	Thu, 4 Sep 2014 12:31:12 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1XPasK-0001vm-GU;
	Thu, 04 Sep 2014 13:31:12 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 4 Sep 2014 13:31:06 -0400
Message-ID: <1409851868-7389-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1409851868-7389-1-git-send-email-j-stiffler@ti.com>
References: <1409851868-7389-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [tisdk-build-scripts][PATCH 2/4] package-sdks: Add configuration parameter to specify the installer prefix.
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
X-List-Received-Date: Thu, 04 Sep 2014 17:31:14 -0000
Content-Type: text/plain

* The configuration parameter INSTALLER_PREFIX is used to set the prefix of the i
  installer filename and the default installation directory.
* This parameter must be set when PRODUCTIZE_SDK="true"

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 lib/oesdk/package-sdks |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/oesdk/package-sdks b/lib/oesdk/package-sdks
index d6b01f7..9bfd887 100644
--- a/lib/oesdk/package-sdks
+++ b/lib/oesdk/package-sdks
@@ -109,7 +109,7 @@ create_sd_card_content() {
     cd $start_here_root
 
     # Copy the installer
-    cp $DEPLOY_ROOT/$m/$BUILD_ID/ti-sdk-$m* $start_here_root/
+    cp $DEPLOY_ROOT/$m/$BUILD_ID/${INSTALLER_PREFIX}-$m* $start_here_root/
 
     if [ "$?" != "0" ]
     then
@@ -184,7 +184,7 @@ create_sdk_installer() {
 
     $INSTALL_BUILDER/builder build $INSTALL_BUILDER_PROJECT linux --setvars \
         sdk_loc="$installer_root/" \
-        sdk_name_prefix="ti-sdk"                  \
+        sdk_name_prefix="${INSTALLER_PREFIX}"                  \
         sdk_tar_name=$sdk_tar                     \
         output_dir="$deploy_root"                 \
         platform="$m"                             \
@@ -277,7 +277,7 @@ package_web_content() {
     fi
 
     # Move the installer into the exports directory
-    mv $deploy_root/ti-sdk-$m* $exports_root/
+    mv $deploy_root/${INSTALLER_PREFIX}-$m* $exports_root/
 
     # Create the md5sum file
     cd $exports_root
-- 
1.7.9.5


