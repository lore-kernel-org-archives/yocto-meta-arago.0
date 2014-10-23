Return-Path: <a0866934local@udb0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id F394D52A64
	for <meta-arago@arago-project.org>;
	Thu, 23 Oct 2014 12:56:09 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s9NCu8WO023172
	for <meta-arago@arago-project.org>; Thu, 23 Oct 2014 07:56:08 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s9NCu8no015647
	for <meta-arago@arago-project.org>; Thu, 23 Oct 2014 07:56:08 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 23 Oct 2014 07:56:07 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s9NCu8XM009587;
	Thu, 23 Oct 2014 07:56:08 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1XhHvz-0005qD-Qb;
	Thu, 23 Oct 2014 08:56:07 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 23 Oct 2014 08:56:06 -0400
Message-ID: <1414068966-22423-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [tisdk-build-scripts][PATCH] bitbake-test-sdk-image: Remove erroneous space in error log name parsing.
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
X-List-Received-Date: Thu, 23 Oct 2014 12:56:11 -0000
Content-Type: text/plain

* In sed command to extract error log name, there was a extra space which
  would cause issues when extracting the error logs.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 lib/oesdk/bitbake-test-sdk-image |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/oesdk/bitbake-test-sdk-image b/lib/oesdk/bitbake-test-sdk-image
index 5ce4ff7..900367f 100644
--- a/lib/oesdk/bitbake-test-sdk-image
+++ b/lib/oesdk/bitbake-test-sdk-image
@@ -394,7 +394,7 @@ bitbake_sdk_images(){
                     mkdir -p ${LOG_DIR}/${m}-error-logs
                     ERR_LOGS=`eval grep \"^ERROR: Logfile\" \"$machine_build_log\" | sed -e 's|^.*:||g'`
                     for err_log in $ERR_LOGS; do
-                        err_log_name=`echo $err_log | sed -e 's|^.*/\(.*\)/\(.*\)/temp/log\.\(.*\)\.\(.*\)|  \1_\2_\3|g'`
+                        err_log_name=`echo $err_log | sed -e 's|^.*/\(.*\)/\(.*\)/temp/log\.\(.*\)\.\(.*\)|\1_\2_\3|g'`
                         cp $err_log ${LOG_DIR}/${m}-error-logs/${err_log_name}.log
                     done
                 fi
-- 
1.7.9.5


