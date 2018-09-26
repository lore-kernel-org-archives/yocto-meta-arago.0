Return-Path: <jake@udc0866934>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id E48375297F
	for <meta-arago@arago-project.org>;
	Wed, 26 Sep 2018 13:23:23 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8QDNFZL017868
	for <meta-arago@arago-project.org>; Wed, 26 Sep 2018 08:23:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537968195;
	bh=y5d+LeIjz+8nhEYeNoInr5Whm8KI5FsUWhwdw1gAslo=;
	h=From:To:CC:Subject:Date;
	b=tH9fH+YvvBFMsj5uefHpRwScg5i2ypTEoodiESdyZgE08udma8VGDmwcCPnlh6VGV
	QuGh9WMVQGm7KEU9nyJPoy5u7qANiflvLhlCodO64wgqz6Q8AlXwp8sgg0TK+VuPCM
	+fYWciWeFan3qjAaDkPukaXnZL8NKNQsB+qkC8M4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8QDNFEk017563
	for <meta-arago@arago-project.org>; Wed, 26 Sep 2018 08:23:15 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 26 Sep 2018 08:23:15 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 26 Sep 2018 08:23:15 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8QDNFpT009400;
	Wed, 26 Sep 2018 08:23:15 -0500
Received: from jake by udc0866934 with local (Exim 4.82)
	(envelope-from <jake@udc0866934>)
	id 1g59mc-0003Ia-Ji; Wed, 26 Sep 2018 09:23:14 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 26 Sep 2018 09:23:11 -0400
Message-ID: <1537968192-12648-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [tisdk-setup-scripts][PATCH 1/2] create-sdcard: k3: fix boot image error messages
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
X-List-Received-Date: Wed, 26 Sep 2018 13:23:24 -0000
Content-Type: text/plain

Carry fix from common script (24aeb6d4dce7236d0f40556d611b704493833e1e).

Instead of printing an error if a certain boot image is not found,
determine which set of boot images are to be used (MLO or tiboot3.bin
and tispl.bin), and only print an error if an incomplete set is found.

While this is not perfect, it allows for a common script that can be
used independent of the SDK.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 k3/create-sdcard.sh | 38 +++++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/k3/create-sdcard.sh b/k3/create-sdcard.sh
index 44b84b6..3bb6e17 100644
--- a/k3/create-sdcard.sh
+++ b/k3/create-sdcard.sh
@@ -1048,40 +1048,48 @@ if [ $BOOTPATHOPTION -eq 1 ] ; then
 
 	echo ""
 	#copy boot files out of board support
-	if [ "$MLO" != "" ] ; then
-		cp $BOOTFILEPATH/$MLO $PATH_TO_SDBOOT/MLO
-		echo "MLO copied"
-	else
-		echo "MLO file not found"
+	if [ "$MLO" == "" ] && ( [ "$SPL_R5" == "" ] || [ "$SPL_A53" == "" ] ); then
+		if [ "$SPL_R5" != "" ]; then
+			echo "tispl.bin file not found"
+		elif [ "$SPL_A53" != "" ]; then
+			echo "tiboot3.bin file not found"
+		else
+			echo "Boot image not found"
+		fi
 	fi
 
 	echo ""
 
 	echo ""
 
+	if [ "$MLO" != "" ] ; then
+		cp $BOOTFILEPATH/$MLO $PATH_TO_SDBOOT/MLO
+		echo "MLO copied"
+
+		echo ""
+
+		echo ""
+	fi
+
 	#copy boot files out of board support
 	if [ "$SPL_A53" != "" ] ; then
 		cp $BOOTFILEPATH/$SPL_A53 $PATH_TO_SDBOOT/tispl.bin
 		echo "tispl.bin copied"
-	else
-		echo "tispl.bin file not found"
-	fi
 
-	echo ""
+		echo ""
 
-	echo ""
+		echo ""
+	fi
 
 	#copy boot files out of board support
 	if [ "$SPL_R5" != "" ] ; then
 		cp $BOOTFILEPATH/$SPL_R5 $PATH_TO_SDBOOT/tiboot3.bin
 		echo "tiboot3.bin copied"
-	else
-		echo "tiboot3.bin file not found"
-	fi
 
-	echo ""
+		echo ""
 
-	echo ""
+		echo ""
+	fi
 
 	if [ "$BOOTIMG" != "" ] ; then
 		cp $BOOTFILEPATH/$BOOTIMG $PATH_TO_SDBOOT/u-boot.img
-- 
1.9.1


