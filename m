Return-Path: <h-gou@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 00B5F52A1C
	for <meta-arago@arago-project.org>;
	Tue, 20 Nov 2018 22:47:41 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wAKMlVhL051288
	for <meta-arago@arago-project.org>; Tue, 20 Nov 2018 16:47:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1542754051;
	bh=7AuCp6SqHY2+LEsiBM+z9422Fyt/Sye/jY5ArCm+pHc=;
	h=From:To:CC:Subject:Date;
	b=T7slH/nbHgGZMrovNXAdOfya6xNs6wInfVcAxG85e2mMqOqFCOKivllTIAwCguNbM
	L5MBcuTAActDWHkvb1kxaUNrka7/tT2Ej0gfOhCFzbPL8MG+OHN548wVxPU4hX0jIk
	3pxzj7NHw6qL+69YLFnFo0hkp6CRM0V8BOQvavhI=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wAKMlVvS111761
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 20 Nov 2018 16:47:31 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 20 Nov 2018 16:47:31 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 20 Nov 2018 16:47:31 -0600
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wAKMlU4Q014211;
	Tue, 20 Nov 2018 16:47:30 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 20 Nov 2018 17:47:28 -0500
Message-ID: <1542754048-31978-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [tisdk-build-scripts] [PATCH] package-sdks: patching setup.sh to update SDK_PATH for Android
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
X-List-Received-Date: Tue, 20 Nov 2018 22:47:42 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 lib/oesdk/package-sdks | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/oesdk/package-sdks b/lib/oesdk/package-sdks
index 2316d40..809d367 100644
--- a/lib/oesdk/package-sdks
+++ b/lib/oesdk/package-sdks
@@ -313,6 +313,12 @@ package_web_content() {
         return 1
     fi
 
+    # modify setup.sh to get the absolute path when running the scripts,
+    # similar to the patching for setup-target-nfs.sh above
+    sed -i -e '/^SDK_PATH=/d' $tmp_dir/setup.sh
+    sed -i -e '/# Use minicom to enter fastboot/i\PWD=`pwd`\nEXE=`echo $0 | sed s=$PWD==`\nEXEPATH="$PWD"/"$EXE"\nSDK_PATH=`echo $EXEPATH | grep -o '.*ti-sdk.*.[0-9]'`\n' $tmp_dir/setup.sh
+    sed -i -e "s|ti-sdk.*\[0-9\]|${tmp_dir##*/}|g" $tmp_dir/setup.sh
+
     cd $exports_root
     tar cJf $m-sdk-bin-$TISDK_VERSION.tar.xz ${INSTALLER_PREFIX}-$m-bin-${TISDK_VERSION}/*
     if [ "$?" != 0 ]
-- 
1.9.1


