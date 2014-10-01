Return-Path: <a0866934local@udb0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 7293C5298E
	for <meta-arago@arago-project.org>;
	Wed,  1 Oct 2014 17:57:40 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s91HvdNF009090
	for <meta-arago@arago-project.org>; Wed, 1 Oct 2014 12:57:39 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s91HvdrY025723
	for <meta-arago@arago-project.org>; Wed, 1 Oct 2014 12:57:39 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 1 Oct 2014 12:57:39 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s91HvcrJ003570;
	Wed, 1 Oct 2014 12:57:39 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1XZO9i-0008Fp-NK;
	Wed, 01 Oct 2014 13:57:38 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 1 Oct 2014 13:57:28 -0400
Message-ID: <1412186248-31698-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [tisdk-build-scripts][PATCH] bitbake-test-sdk-image: Fix issue with parsing build_log
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
X-List-Received-Date: Wed, 01 Oct 2014 17:57:40 -0000
Content-Type: text/plain

* In "eval grep" command, double quotes need to be escaped around the pattern.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 lib/oesdk/bitbake-test-sdk-image |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/oesdk/bitbake-test-sdk-image b/lib/oesdk/bitbake-test-sdk-image
index f12d5b7..5ce4ff7 100644
--- a/lib/oesdk/bitbake-test-sdk-image
+++ b/lib/oesdk/bitbake-test-sdk-image
@@ -392,7 +392,7 @@ bitbake_sdk_images(){
                 if [ "$BUILD_LOG_VERBOSE" = "true" ]; then
                     # Parse the build_log to obtain the individual recipe error logs.
                     mkdir -p ${LOG_DIR}/${m}-error-logs
-                    ERR_LOGS=`eval grep "^ERROR: Logfile" "$machine_build_log" | sed -e 's|^.*:||g'`
+                    ERR_LOGS=`eval grep \"^ERROR: Logfile\" \"$machine_build_log\" | sed -e 's|^.*:||g'`
                     for err_log in $ERR_LOGS; do
                         err_log_name=`echo $err_log | sed -e 's|^.*/\(.*\)/\(.*\)/temp/log\.\(.*\)\.\(.*\)|  \1_\2_\3|g'`
                         cp $err_log ${LOG_DIR}/${m}-error-logs/${err_log_name}.log
-- 
1.7.9.5


