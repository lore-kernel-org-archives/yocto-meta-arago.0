Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.7007.1637640071902056530
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 22 Nov 2021 20:01:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5F97D40CAB;
	Tue, 23 Nov 2021 04:01:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wg2nRk5ibijU; Tue, 23 Nov 2021 04:01:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4BC3F40C82;
	Tue, 23 Nov 2021 04:01:09 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 283801746E8;
	Mon, 22 Nov 2021 23:01:06 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: j-humphreys@ti.com,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: [tisdk-build-scripts][PATCH 08/10] Remove calls to packaging, reporting, testing and copying functionality
Date: Mon, 22 Nov 2021 23:00:57 -0500
Message-Id: <1637640060-31733-21-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637640060-31733-1-git-send-email-denis@denix.org>
References: <1637640060-31733-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@konsulko.com>

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 build-oesdk.sh | 47 -----------------------------------------------
 1 file changed, 47 deletions(-)

diff --git a/build-oesdk.sh b/build-oesdk.sh
index 038a7ab..fb5f725 100755
--- a/build-oesdk.sh
+++ b/build-oesdk.sh
@@ -8,11 +8,8 @@ trap 'test -z "`jobs -p`" || kill `jobs -p` > /dev/null 2>&1; echo "I got a sign
 # script.
 source ./lib/oesdk/config-build-env
 source ./lib/common-functions
-source ./lib/run-opentest
 source ./lib/oesdk/bitbake-test-sdk-image
 source ./lib/oesdk/machine-specific-functions
-source ./lib/oesdk/package-sdks
-source ./lib/oesdk/generate-report
 
 # This variable holds the architectures that are being built based
 # on the machines.
@@ -193,48 +190,4 @@ done
 # Wait for all build and test processes to finish
 wait
 
-# Package the SDKs
-if [ "$PRODUCTIZE_SDK" == "true" ]
-then
-    package_sdks
-fi
-
-# Assemble the build report
-generate_report
-
-# If COPY_TO_WEB is set then copy to the WEB_HOST.  If we did not
-# productize the SDK then there is not much need to copy the files.
-if [ "$COPY_TO_WEB" == "true" ]
-then
-    if [ "$PRODUCTIZE_SDK" == "true" ]
-    then
-        echo "Copying productized images"
-        scp -r $DEPLOY_ROOT $WEB_HOST/
-        # If the copy went well then clean out the DEPLOY_ROOT directory
-        # If the CLEAN_AFTER_COPY variable is true.
-        # TODO: Maybe this should be cleaned by jenkins if I want that.
-        if [ "$?" == "0" ]
-        then
-            if [ "$CLEAN_AFTER_COPY" == "true" ]
-            then
-                rm -rf $DEPLOY_ROOT
-            fi
-        fi
-    fi
-
-    # If COPY_DEPLOY_TO_WEB is set then copy to the WEB_HOST.
-    if [ "$COPY_DEPLOY_TO_WEB" == "true" ]
-    then
-        echo "Copying deploy/ directory"
-        rsync -az --delete $BUILD_ROOT/build-*/arago-tmp*/deploy/ $WEB_HOST/deploy/
-    fi
-
-    # If COPY_GOLDEN_TO_WEB is set then copy to the WEB_HOST.
-    if [ "$COPY_GOLDEN_TO_WEB" == "true" ]
-    then
-        echo "Copying golden/ directory"
-        rsync -az --delete $BUILD_ROOT/build-*/golden/ $WEB_HOST/golden/
-    fi
-fi
-
 echo "Build Finished"
-- 
2.7.4

