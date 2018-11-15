Return-Path: <h-gou@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 82E645298A
	for <meta-arago@arago-project.org>;
	Thu, 15 Nov 2018 20:31:34 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wAFKVOcM111462
	for <meta-arago@arago-project.org>; Thu, 15 Nov 2018 14:31:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1542313884;
	bh=ay7uNKfjs4FDA/mmOc8sFgBehF+/J81KtvFoW8lh3Vg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=qxrkOmP0Oi3jPfBaH1mQwWb8SF8rLIAIE9HyDxJpXb09JePkNW3X/Yt0Xtw6yIII0
	hHHTr5r+RyLd7T1OvzTDjrChsmRZaPKrioAbuxCDIZC4NTllhTEBuhbUvSJD8XN435
	9Cna2B/dlW0NENXSO2SMu7+6ABt/X0+hJ2VhZJNA=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wAFKVOUv011247
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 15 Nov 2018 14:31:24 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Thu, 15 Nov 2018 14:31:24 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 15 Nov 2018 14:31:23 -0600
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wAFKVNwP002189;
	Thu, 15 Nov 2018 14:31:23 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 15 Nov 2018 15:31:19 -0500
Message-ID: <1542313879-30144-2-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1542313879-30144-1-git-send-email-a0271529@ti.com>
References: <1542313879-30144-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [tisdk-build-scripts] [PATCH 2/2] package-sdks: patching scripts of the binary package to allow OOB usage
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

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 lib/oesdk/package-sdks | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/lib/oesdk/package-sdks b/lib/oesdk/package-sdks
index 1e5ee00..2316d40 100644
--- a/lib/oesdk/package-sdks
+++ b/lib/oesdk/package-sdks
@@ -267,6 +267,44 @@ package_web_content() {
         return 1
     fi
 
+    # remove scripts which have dependency on devkit
+    rm  $tmp_dir/bin/unshallow-repositories.sh
+    rm  $tmp_dir/bin/create-ubifs.sh
+
+    # modify create-sdcard.sh to use the tarball extraction directory
+    sed -i -e "s|ti-sdk.*\[0-9\]|${tmp_dir##*/}|g" $tmp_dir/bin/create-sdcard.sh
+
+    # modify setup-target-nfs.sh to get the absolute path when running the scripts
+    # 1. remove the line to set up "SDKinstall" with TI_SDK_PATH
+    sed -i -e '/^SDKinstall/d' $tmp_dir/bin/setup-targetfs-nfs.sh
+
+    # 2. add the lines before setting dstdefault to get the absolute path of the scripts and SDKinstall,
+    #    using the same way as in create-sdcard.sh: PWD=`pwd`; EXE=`echo $0 | sed s=$PWD==`;
+    #    EXEPATH="$PWD"/"$EXE"; SDKinstall=`echo $EXEPATH | grep -o .*ti-sdk.*.[0-9]`
+    sed -i -e '/dstdefault=$SDKinstall\/targetNFS/i\PWD=`pwd`\nEXE=`echo $0 | sed s=$PWD==`\nEXEPATH="$PWD"/"$EXE"\nSDKinstall=`echo $EXEPATH | grep -o '.*ti-sdk.*.[0-9]'`\n' $tmp_dir/bin/setup-targetfs-nfs.sh
+
+    # 3. use the tarball extraction directory for SDKinstall
+    sed -i -e "s|ti-sdk.*\[0-9\]|${tmp_dir##*/}|g" $tmp_dir/bin/setup-targetfs-nfs.sh
+
+    # create Rules.make with variables to be used from the binary package
+    echo "#platform" >> $tmp_dir/Rules.make
+    echo "PLATFORM=$m" >> $tmp_dir/Rules.make
+    echo >> $tmp_dir/Rules.make
+
+    echo "#root of the target file system for installing applications" >> $tmp_dir/Rules.make
+    echo "DESTDIR=__DESTDIR__" >> $tmp_dir/Rules.make
+    echo >> $tmp_dir/Rules.make
+
+    echo "# Set EXEC_DIR to install example binaries" >> $tmp_dir/Rules.make
+    echo "EXEC_DIR=__EXEC_DIR__" >> $tmp_dir/Rules.make
+
+    if [ "$?" != 0 ]
+    then
+        echo "Could not create Rules.make"
+        echo "FAILED" > $LOG_DIR/$m-web-results.txt
+        return 1
+    fi
+
     cp -f setup.sh $tmp_dir/
     if [ "$?" != 0 ]
     then
-- 
1.9.1


