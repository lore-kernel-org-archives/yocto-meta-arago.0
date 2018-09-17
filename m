Return-Path: <jake@udc0866934>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 82B1D529B6
	for <meta-arago@arago-project.org>;
	Mon, 17 Sep 2018 15:13:53 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8HFDjET052043
	for <meta-arago@arago-project.org>; Mon, 17 Sep 2018 10:13:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537197225;
	bh=6JgVQODKXDo/trZmlWbJEPGJVX1LeS9NrDoT03ouxrs=;
	h=From:To:CC:Subject:Date;
	b=IdaDu+OO5bJ0JeRuo7GafWNOthzZRSkT/pimu6WiNvQBpxbWCUYBgGqwyjScik4lh
	MAs3POOjgGprP1FqC1+8lhz49WnK64D9vmkAe0K4JXvTlZaOGNsgCPxKG2Zr2u3EWF
	O9XUjs/KdWTq4sqllODifuI3o9vsCumaQtdGt89Y=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8HFDj9M025854
	for <meta-arago@arago-project.org>; Mon, 17 Sep 2018 10:13:45 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 17 Sep 2018 10:13:44 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 17 Sep 2018 10:13:45 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8HFDi22020135;
	Mon, 17 Sep 2018 10:13:44 -0500
Received: from jake by udc0866934 with local (Exim 4.82)
	(envelope-from <jake@udc0866934>)
	id 1g1vDc-0005VL-E2; Mon, 17 Sep 2018 11:13:44 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 17 Sep 2018 11:13:42 -0400
Message-ID: <1537197222-21127-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [tisdk-setup-scripts][PATCH] create-sdcard: fix boot image error messages
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
X-List-Received-Date: Mon, 17 Sep 2018 15:13:53 -0000
Content-Type: text/plain

Instead of printing an error if a certain boot image is not found,
determine which set of boot images are to be used (MLO or tiboot3.bin
and tispl.bin), and only print an error if an incomplete set is found.

While this is not perfect, it allows for a common script that can be
used independent of the SDK.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 create-sdcard.sh | 38 +++++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/create-sdcard.sh b/create-sdcard.sh
index 078e258..d7f2c83 100644
--- a/create-sdcard.sh
+++ b/create-sdcard.sh
@@ -1010,40 +1010,48 @@ if [ $BOOTPATHOPTION -eq 1 ] ; then
 
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


