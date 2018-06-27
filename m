Return-Path: <jake@udc0866934>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 45D69529F0
	for <meta-arago@arago-project.org>;
	Wed, 27 Jun 2018 18:41:06 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w5RIf0Rh041501
	for <meta-arago@arago-project.org>; Wed, 27 Jun 2018 13:41:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1530124860;
	bh=q2jeB8c/AXz4if0F1Ob3IBRQhmfjB7WeRTFlJmq2UEs=;
	h=From:To:CC:Subject:Date;
	b=xI53XRPEs/arD1LeXpcsT28DOPXDlcc87p/RVua5sB8VKTl4i7pQ7xnaIVYq/lQVn
	wTRmnL6pfA4K6tg+qZsSdp4dgkc6skrbL21aqi9br3kHBUIpj55NXa9+C2bbFgQ+O3
	PKOgobxVGwD6i85MiZZzEA1T3qGgEqtoMPrHM4GM=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5RIf03V021103
	for <meta-arago@arago-project.org>; Wed, 27 Jun 2018 13:41:00 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 27 Jun 2018 13:40:59 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 27 Jun 2018 13:40:59 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5RIexGa031604;
	Wed, 27 Jun 2018 13:40:59 -0500
Received: from jake by udc0866934 with local (Exim 4.82)
	(envelope-from <jake@udc0866934>)
	id 1fYFNC-00029D-Ln; Wed, 27 Jun 2018 14:40:58 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 27 Jun 2018 14:40:56 -0400
Message-ID: <1530124856-8222-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [tisdk-setup-scripts][PATCH] create-sdcard: add support for aarch64
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
X-List-Received-Date: Wed, 27 Jun 2018 18:41:06 -0000
Content-Type: text/plain

* Add A53 and R5 SPL images to the boot partition as expected for
  TI devices.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 create-sdcard.sh | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/create-sdcard.sh b/create-sdcard.sh
index 7ada332..078e258 100644
--- a/create-sdcard.sh
+++ b/create-sdcard.sh
@@ -743,6 +743,8 @@ if [ $FILEPATHOPTION -eq 1 ] ; then
 	#check that files are in SDK
 	BOOTFILEPATH="$PARSEPATH/board-support/prebuilt-images"
 	MLO=`ls $BOOTFILEPATH | grep MLO | awk {'print $1'}`
+	SPL_A53=`ls $BOOTFILEPATH | grep tispl | awk {'print $1'}`
+	SPL_R5=`ls $BOOTFILEPATH | grep tiboot3 | awk {'print $1'}`
 	KERNELIMAGE=`ls $BOOTFILEPATH | grep [uz]Image | awk {'print $1'}`
 	BOOTIMG=`ls $BOOTFILEPATH | grep u-boot | grep .img | awk {'print $1'}`
 	BOOTBIN=`ls $BOOTFILEPATH | grep u-boot | grep .bin | awk {'print $1'}`
@@ -967,6 +969,8 @@ EOM
 		BOOTPATHOPTION=1
 		BOOTFILEPATH=$BOOTUSERFILEPATH
 		MLO=`ls $BOOTFILEPATH | grep MLO | awk {'print $1'}`
+		SPL_A53=`ls $BOOTFILEPATH | grep tispl | awk {'print $1'}`
+		SPL_R5=`ls $BOOTFILEPATH | grep tiboot3 | awk {'print $1'}`
 		BOOTIMG=`ls $BOOTFILEPATH | grep u-boot | grep .img | awk {'print $1'}`
 		BOOTBIN=`ls $BOOTFILEPATH | grep u-boot | grep .bin | awk {'print $1'}`
 		BOOTUENV=`ls $BOOTFILEPATH | grep uEnv.txt | awk {'print $1'}`
@@ -1017,6 +1021,30 @@ if [ $BOOTPATHOPTION -eq 1 ] ; then
 
 	echo ""
 
+	#copy boot files out of board support
+	if [ "$SPL_A53" != "" ] ; then
+		cp $BOOTFILEPATH/$SPL_A53 $PATH_TO_SDBOOT/tispl.bin
+		echo "tispl.bin copied"
+	else
+		echo "tispl.bin file not found"
+	fi
+
+	echo ""
+
+	echo ""
+
+	#copy boot files out of board support
+	if [ "$SPL_R5" != "" ] ; then
+		cp $BOOTFILEPATH/$SPL_R5 $PATH_TO_SDBOOT/tiboot3.bin
+		echo "tiboot3.bin copied"
+	else
+		echo "tiboot3.bin file not found"
+	fi
+
+	echo ""
+
+	echo ""
+
 	if [ "$BOOTIMG" != "" ] ; then
 		cp $BOOTFILEPATH/$BOOTIMG $PATH_TO_SDBOOT/u-boot.img
 		echo "u-boot.img copied"
-- 
1.9.1


