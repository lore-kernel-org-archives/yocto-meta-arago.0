Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.5187.1645785543498553754
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 25 Feb 2022 02:39:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=bAlUoia5;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: a-m1@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21PAcwPP100411;
	Fri, 25 Feb 2022 04:38:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1645785538;
	bh=TZxGU/AHUC7sHW02vaF4NDm48N00Qo9P+rI6qbheLB4=;
	h=From:To:CC:Subject:Date;
	b=bAlUoia5Jq44TV1qqeTmHYPNv5lB4a+yugDjElqOsiiroBPuF14ldsp0lZsGdiofg
	 x6BT60yUbTgyoi9gKXKaTAOw/ivu9+jcKaiLZwd7Q8l71RLUmFqd3YOIqowCnEuHYU
	 WT2xcWPcU0sgdmtXWRzlfJs+T5o1l50Ny6jD0tOw=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21PAcwY6060011
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Feb 2022 04:38:58 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 25
 Feb 2022 04:38:58 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 25 Feb 2022 04:38:58 -0600
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21PActV9114692;
	Fri, 25 Feb 2022 04:38:56 -0600
From: "Aparna M" <a-m1@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <denis@denix.org>,
        <reatmon@ti.com>
CC: <devarsht@ti.com>, <nikhil.nd@ti.com>
Subject: [meta-arago][tisdk-setup-scripts][master][PATCH] create-sdcard: Modify condition to check for boot images
Date: Fri, 25 Feb 2022 16:08:51 +0530
Message-ID: <20220225103851.7294-1-a-m1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

sysfw.itb is now required only for am65xx and j7 devicesi. sysfw.itb
is combined with tiboot3.bin for devices using multi-cert boot
binaries.

Modify the condition to check for boot binaries to avoid unnecessary
error message from being printed for devices that use multi-cert boot
binaries.

Signed-off-by: Aparna M <a-m1@ti.com>
---
 create-sdcard.sh | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/create-sdcard.sh b/create-sdcard.sh
index 947d625..fa7dadb 100644
--- a/create-sdcard.sh
+++ b/create-sdcard.sh
@@ -1057,9 +1057,15 @@ if [ $BOOTPATHOPTION -eq 1 ] ; then
 
 	echo ""
 	#copy boot files out of board support
-	if [ "$MLO" == "" ] && ( [ "$SPL_R5" == "" ] || [ "$SPL_A53" == "" ] || [ "$SYSFW" == "" ] ); then
-		echo "Boot image not found"
-	fi
+        if ["$TARDEVICENAME" == "am65xx"] || ["$TARDEVICENAME" == "j7"]; then
+		if [ "$MLO" == "" ] && ( [ "$SPL_R5" == "" ] || [ "$SPL_A53" == "" ] || [ "$SYSFW" == "" ] ); then
+			echo "Boot image not found"
+		fi
+	else
+		if [ "$MLO" == "" ] && ( [ "$SPL_R5" == "" ] || [ "$SPL_A53" == "" ] ) ; then
+			echo "Boot image not found"
+		fi
+        fi
 
 	echo ""
 
-- 
2.17.1

