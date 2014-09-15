Return-Path: <a0866934local@udb0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 2C8135298D
	for <meta-arago@arago-project.org>;
	Mon, 15 Sep 2014 12:58:45 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8FCwhcl026615
	for <meta-arago@arago-project.org>; Mon, 15 Sep 2014 07:58:44 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8FCwhW3027093
	for <meta-arago@arago-project.org>; Mon, 15 Sep 2014 07:58:43 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 15 Sep 2014 07:58:43 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8FCwhws002376;
	Mon, 15 Sep 2014 07:58:43 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1XTVrf-0006lJ-C3;
	Mon, 15 Sep 2014 08:58:43 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 15 Sep 2014 08:58:40 -0400
Message-ID: <1410785920-25960-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1410785920-25960-1-git-send-email-j-stiffler@ti.com>
References: <1410785920-25960-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [tisdk-build-scripts][PATCH 2/2] bitbake-test-sdk-image: Extract recipe-specific error logs
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
X-List-Received-Date: Mon, 15 Sep 2014 12:58:45 -0000
Content-Type: text/plain

* If there is an error, parse the verbose bitbake log to get recipe and build
  step which failed.
* Copy the specific error log into the LOG_DIR
* Only applicable if BUILD_LOG_VERBOSE="true"

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 lib/oesdk/bitbake-test-sdk-image |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/lib/oesdk/bitbake-test-sdk-image b/lib/oesdk/bitbake-test-sdk-image
index 7d8d093..f12d5b7 100644
--- a/lib/oesdk/bitbake-test-sdk-image
+++ b/lib/oesdk/bitbake-test-sdk-image
@@ -388,6 +388,16 @@ bitbake_sdk_images(){
             then
                 echo "FAILED" > $LOG_DIR/$m-build-result.txt
                 build_status="fail"
+
+                if [ "$BUILD_LOG_VERBOSE" = "true" ]; then
+                    # Parse the build_log to obtain the individual recipe error logs.
+                    mkdir -p ${LOG_DIR}/${m}-error-logs
+                    ERR_LOGS=`eval grep "^ERROR: Logfile" "$machine_build_log" | sed -e 's|^.*:||g'`
+                    for err_log in $ERR_LOGS; do
+                        err_log_name=`echo $err_log | sed -e 's|^.*/\(.*\)/\(.*\)/temp/log\.\(.*\)\.\(.*\)|  \1_\2_\3|g'`
+                        cp $err_log ${LOG_DIR}/${m}-error-logs/${err_log_name}.log
+                    done
+                fi
                 break;
             else
                 echo "PASSED" > $LOG_DIR/$m-build-result.txt
-- 
1.7.9.5


