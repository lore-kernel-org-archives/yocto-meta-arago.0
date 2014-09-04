Return-Path: <a0866934local@udb0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 5A6A852AB8
	for <meta-arago@arago-project.org>;
	Thu,  4 Sep 2014 17:31:15 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s84HVEA9009010
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 12:31:14 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84HVEnO029516
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 12:31:14 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 4 Sep 2014 12:31:13 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84HVEui007969;
	Thu, 4 Sep 2014 12:31:14 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1XPasL-0001vp-Sn;
	Thu, 04 Sep 2014 13:31:13 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 4 Sep 2014 13:31:07 -0400
Message-ID: <1409851868-7389-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1409851868-7389-1-git-send-email-j-stiffler@ti.com>
References: <1409851868-7389-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [tisdk-build-scripts][PATCH 3/4] bitbake-test-sdk-image: Add support to control verbosity of build logging.
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
X-List-Received-Date: Thu, 04 Sep 2014 17:31:16 -0000
Content-Type: text/plain

* Setting BUILD_LOG_VERBOSE="true" (case sensitive) will enable logging stdout
  and stderr for the bitbake command to the build log.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 lib/oesdk/bitbake-test-sdk-image |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/lib/oesdk/bitbake-test-sdk-image b/lib/oesdk/bitbake-test-sdk-image
index cff86e4..7d8d093 100644
--- a/lib/oesdk/bitbake-test-sdk-image
+++ b/lib/oesdk/bitbake-test-sdk-image
@@ -375,12 +375,16 @@ bitbake_sdk_images(){
         for c in "${bitbake_command_list[@]}"
         do
             log $machine_build_log echo "executing bitbake command $c for machine $m"
-            MACHINE=$m EXTRA_TISDK_FILES="${INSTALLER_EXTRAS_ROOT}/${MACHINE}" TISDK_VERSION="${TISDK_VERSION}" bitbake $c
+            if [ "${BUILD_LOG_VERBOSE}" = "true" ]; then
+                MACHINE=$m EXTRA_TISDK_FILES="${INSTALLER_EXTRAS_ROOT}/${MACHINE}" TISDK_VERSION="${TISDK_VERSION}" bitbake $c 2>&1 | eval tee -a $machine_build_log
+            else
+                MACHINE=$m EXTRA_TISDK_FILES="${INSTALLER_EXTRAS_ROOT}/${MACHINE}" TISDK_VERSION="${TISDK_VERSION}" bitbake $c
+            fi
 
             # Check the return status of the build process.  If the build returned
             # a non-zero exit value then log the failure and continue (without
             # testing).  A lack of a test file will indicate a test skip
-            if [ "$?" != "0" ]
+            if [ "${PIPESTATUS[0]}" != "0" ]
             then
                 echo "FAILED" > $LOG_DIR/$m-build-result.txt
                 build_status="fail"
-- 
1.7.9.5


