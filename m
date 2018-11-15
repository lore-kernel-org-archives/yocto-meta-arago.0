Return-Path: <h-gou@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 5FA0552968
	for <meta-arago@arago-project.org>;
	Thu, 15 Nov 2018 20:31:34 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wAFKVO2g031242
	for <meta-arago@arago-project.org>; Thu, 15 Nov 2018 14:31:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1542313884;
	bh=nclrMqh2FpIvh6MIWX6AhUfoZHjwA9Qu6SWGeMDKSp8=;
	h=From:To:CC:Subject:Date;
	b=l2AvywoVfk0poPZHFm/JT/2Mdwe3h0aRo5xnLRBuhCZDz1JGvKt/637KqZQxgkO8w
	ufJ4TAiaoekURzJzDYd/WrSVS5Syoe5NmjLPJXjn+0DiN9s4zDDPzeUrYOIyc44owr
	MLjGmDGnNBMjIYI/1j8wFTJkgb9bdnYfq5QZpeUQ=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wAFKVOn1028250
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 15 Nov 2018 14:31:24 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 15 Nov 2018 14:31:23 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 15 Nov 2018 14:31:23 -0600
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wAFKVNwO002189;
	Thu, 15 Nov 2018 14:31:23 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 15 Nov 2018 15:31:18 -0500
Message-ID: <1542313879-30144-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [tisdk-build-scripts] [PATCH 1/2] package-sdks: restructure the binary package and add scripts to support OOB usage
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
X-List-Received-Date: Thu, 15 Nov 2018 20:31:35 -0000
Content-Type: text/plain

* rename the top-level folder with the same name as the full installer,
  but with "-bin" added before the version number for differentiation
* restructure filesystem to the top-level, following structure of the full installer
* add bin folder and setup.sh to the binary package

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 lib/oesdk/package-sdks | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/lib/oesdk/package-sdks b/lib/oesdk/package-sdks
index 720b62a..1e5ee00 100644
--- a/lib/oesdk/package-sdks
+++ b/lib/oesdk/package-sdks
@@ -239,9 +239,11 @@ package_web_content() {
 
     # Now Create the pre-built binaries tarball.  Make a temporary directory
     # to copy contents to here so that we can get the right extraction name.
-    tmp_dir="$exports_root/board-support-bin"
-    mkdir -p $tmp_dir
-    cp -rf board-support/prebuilt-images $tmp_dir/
+    tmp_dir="$exports_root/${INSTALLER_PREFIX}-$m-bin-${TISDK_VERSION}"
+    tmp_dir_bs="$tmp_dir/board-support"
+    mkdir -p $tmp_dir_bs
+
+    cp -rf board-support/prebuilt-images $tmp_dir_bs
     if [ "$?" != 0 ]
     then
         echo "Could not copy prebuilt-images"
@@ -257,8 +259,24 @@ package_web_content() {
         return 1
     fi
 
+    cp -rf bin $tmp_dir/
+    if [ "$?" != 0 ]
+    then
+        echo "Could not copy bin folder"
+        echo "FAILED" > $LOG_DIR/$m-web-results.txt
+        return 1
+    fi
+
+    cp -f setup.sh $tmp_dir/
+    if [ "$?" != 0 ]
+    then
+        echo "Could not copy setup.sh"
+        echo "FAILED" > $LOG_DIR/$m-web-results.txt
+        return 1
+    fi
+
     cd $exports_root
-    tar cJf $m-sdk-bin-$TISDK_VERSION.tar.xz board-support-bin/*
+    tar cJf $m-sdk-bin-$TISDK_VERSION.tar.xz ${INSTALLER_PREFIX}-$m-bin-${TISDK_VERSION}/*
     if [ "$?" != 0 ]
     then
         echo "Could not create SDK binaries tarball"
@@ -266,7 +284,7 @@ package_web_content() {
         return 1
     fi
 
-    rm -rf board-support-bin
+    rm -rf ${INSTALLER_PREFIX}-$m-bin-${TISDK_VERSION}
 
     if [ "$EXPORT_ARAGO_SRC" == "1" ]
     then
-- 
1.9.1


