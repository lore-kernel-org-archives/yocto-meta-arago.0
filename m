Return-Path: <a-m1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 6ACDE52E20
	for <meta-arago@arago-project.org>;
	Mon,  4 Oct 2021 20:03:50 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 194K4UTm032322
	for <meta-arago@arago-project.org>; Mon, 4 Oct 2021 15:04:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1633377870;
	bh=L35AYKpRqXi3xPGX9j40vE0Dqx8Oymc7uKh2ruvmXug=;
	h=From:To:CC:Subject:Date;
	b=OxiGvThShjZIDoOCjcj0OoVN/+NsLo7DpZ3bO5isJe0bxP/DsL8WOQLAmZ2hSRfwl
	OiSQ1N3esuPHbY72LSkDlOAXYFVMcw9ooaa9S58Ib5QzoF3L9K3iuCLSkj45l4D2mB
	ac+fW6Ctv76SYMfytxnLwZCTaqTtVXGvXCG+QdVs=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 194K4UvS102483
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 4 Oct 2021 15:04:30 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14;
	Mon, 4 Oct 2021 15:04:30 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
	Frontend Transport; Mon, 4 Oct 2021 15:04:30 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 194K4SuQ023399; 
	Mon, 4 Oct 2021 15:04:29 -0500
From: Aparna M <a-m1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 5 Oct 2021 01:34:26 +0530
Message-ID: <20211004200426.28230-1-a-m1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [tisdk-setup-scripts][master][PATCH] create-sdcard: Install wificfg file in boot partition for am64xx-evm
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
X-List-Received-Date: Mon, 04 Oct 2021 20:03:50 -0000
Content-Type: text/plain

Install wificfg file in boot partition of SD card for am64xx-evm.
This file is required for the WiFi out of board demo in AM64x SK.

Signed-off-by: Aparna M <a-m1@ti.com>
---
 create-sdcard.sh | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/create-sdcard.sh b/create-sdcard.sh
index a647ccd..947d625 100644
--- a/create-sdcard.sh
+++ b/create-sdcard.sh
@@ -782,6 +782,8 @@ if [ $FILEPATHOPTION -eq 1 ] ; then
 	BOOTIMG=`ls $BOOTFILEPATH | grep u-boot | grep .img | awk {'print $1'}`
 	BOOTBIN=`ls $BOOTFILEPATH | grep u-boot | grep .bin | awk {'print $1'}`
 	BOOTUENV=`ls $BOOTFILEPATH | grep uEnv.txt | awk {'print $1'}`
+	WIFICFG=`ls $BOOTFILEPATH | grep wificfg | awk {'print $1'}`
+
 	#rootfs
 	ROOTFILEPARTH="$PARSEPATH/filesystem"
 
@@ -813,6 +815,8 @@ EOM
 		done
 		FOUNDTARFILENAME=`ls --sort=size $ROOTFILEPARTH | grep "image" | grep 'tar.xz' | grep -n '' | grep "${TARNUMBER}:" | cut -c3- | awk {'print$1'}`
 		ROOTFSTAR=$FOUNDTARFILENAME
+		TARDEVICENAME=`ls $ROOTFILEPARTH | grep "tisdk-default-image" | grep 'tar.xz' | awk -F - {'print $4'}`
+		TARIMAGETYPE=`ls $ROOTFILEPARTH | grep "tisdk-default-image" | grep 'tar.xz' | awk -F - {'print $2'}`
 
 	else
 		ROOTFSTAR=`ls  $ROOTFILEPARTH | grep "tisdk.*image" | grep 'tar.xz' | awk {'print $1'}`
@@ -1016,6 +1020,7 @@ EOM
 		BOOTIMG=`ls $BOOTFILEPATH | grep u-boot | grep .img | awk {'print $1'}`
 		BOOTBIN=`ls $BOOTFILEPATH | grep u-boot | grep .bin | awk {'print $1'}`
 		BOOTUENV=`ls $BOOTFILEPATH | grep uEnv.txt | awk {'print $1'}`
+	        WIFICFG=`ls $BOOTFILEPATH | grep wificfg | awk {'print $1'}`
 	fi
 
 
@@ -1116,6 +1121,18 @@ if [ $BOOTPATHOPTION -eq 1 ] ; then
 		echo "uEnv.txt copied"
 	fi
 
+	echo ""
+
+	if [ "$TARIMAGETYPE" == "default" ] && [ "$TARDEVICENAME" == "am64xx" ] ; then
+	       	if [ "$WIFICFG" != "" ] ; then
+			cp $BOOTFILEPATH/$WIFICFG $PATH_TO_SDBOOT/wificfg
+	                echo "wificfg copied"
+		else
+	                echo "wificfg file not found"
+	        fi
+
+	fi
+
 elif [ $BOOTPATHOPTION -eq 2  ] ; then
 	untar_progress $BOOTUSERFILEPATH $PATH_TO_TMP_DIR
 	cp -rf $PATH_TO_TMP_DIR/* $PATH_TO_SDBOOT
-- 
2.17.1


