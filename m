Return-Path: <jake@udc0866934>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id BF19C529B5
	for <meta-arago@arago-project.org>;
	Mon, 12 Nov 2018 19:38:44 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wACJcYro035091
	for <meta-arago@arago-project.org>; Mon, 12 Nov 2018 13:38:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1542051514;
	bh=1jppRLUsyEwANmCaw9/hYw247zj8HlptJpeaB3zW6e4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=lGi3+5TvqfjpQFzqPU13/RMCoOwYRzOLroNf9n69ysaOFsNXmFsEH89Mj7gma9H4h
	JbYKQ7GWMHsS2WfMLPGGJk2KIgHLY7cFj5MaPeAcDIXBZB9Nd/lDIO+h9aRJq7+o9k
	YwDK3MshvkHSEAFmDtn/Bbc58zVtJ4UqijQD4UEA=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wACJcYOc029487
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 12 Nov 2018 13:38:34 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 12 Nov 2018 13:38:34 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 12 Nov 2018 13:38:34 -0600
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wACJcYIR004796;
	Mon, 12 Nov 2018 13:38:34 -0600
Received: from jake by udc0866934 with local (Exim 4.82)
	(envelope-from <jake@udc0866934>)
	id 1gMI2c-0001no-71; Mon, 12 Nov 2018 14:38:34 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 12 Nov 2018 14:38:25 -0500
Message-ID: <1542051505-6891-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1542051505-6891-1-git-send-email-j-stiffler@ti.com>
References: <1542051505-6891-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [tisdk-setup-scripts][PATCH 2/2] create-sdcard: copy sysfw.itb to boot partition
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
X-List-Received-Date: Mon, 12 Nov 2018 19:38:45 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 create-sdcard.sh | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/create-sdcard.sh b/create-sdcard.sh
index d7f2c83..39d8af1 100644
--- a/create-sdcard.sh
+++ b/create-sdcard.sh
@@ -745,6 +745,7 @@ if [ $FILEPATHOPTION -eq 1 ] ; then
 	MLO=`ls $BOOTFILEPATH | grep MLO | awk {'print $1'}`
 	SPL_A53=`ls $BOOTFILEPATH | grep tispl | awk {'print $1'}`
 	SPL_R5=`ls $BOOTFILEPATH | grep tiboot3 | awk {'print $1'}`
+	SYSFW=`ls $BOOTFILEPATH | grep sysfw | awk {'print $1'}`
 	KERNELIMAGE=`ls $BOOTFILEPATH | grep [uz]Image | awk {'print $1'}`
 	BOOTIMG=`ls $BOOTFILEPATH | grep u-boot | grep .img | awk {'print $1'}`
 	BOOTBIN=`ls $BOOTFILEPATH | grep u-boot | grep .bin | awk {'print $1'}`
@@ -971,6 +972,7 @@ EOM
 		MLO=`ls $BOOTFILEPATH | grep MLO | awk {'print $1'}`
 		SPL_A53=`ls $BOOTFILEPATH | grep tispl | awk {'print $1'}`
 		SPL_R5=`ls $BOOTFILEPATH | grep tiboot3 | awk {'print $1'}`
+		SYSFW=`ls $BOOTFILEPATH | grep sysfw | awk {'print $1'}`
 		BOOTIMG=`ls $BOOTFILEPATH | grep u-boot | grep .img | awk {'print $1'}`
 		BOOTBIN=`ls $BOOTFILEPATH | grep u-boot | grep .bin | awk {'print $1'}`
 		BOOTUENV=`ls $BOOTFILEPATH | grep uEnv.txt | awk {'print $1'}`
@@ -1010,14 +1012,8 @@ if [ $BOOTPATHOPTION -eq 1 ] ; then
 
 	echo ""
 	#copy boot files out of board support
-	if [ "$MLO" == "" ] && ( [ "$SPL_R5" == "" ] || [ "$SPL_A53" == "" ] ); then
-		if [ "$SPL_R5" != "" ]; then
-			echo "tispl.bin file not found"
-		elif [ "$SPL_A53" != "" ]; then
-			echo "tiboot3.bin file not found"
-		else
-			echo "Boot image not found"
-		fi
+	if [ "$MLO" == "" ] && ( [ "$SPL_R5" == "" ] || [ "$SPL_A53" == "" ] || [ "$SYSFW" == "" ] ); then
+		echo "Boot image not found"
 	fi
 
 	echo ""
@@ -1053,6 +1049,16 @@ if [ $BOOTPATHOPTION -eq 1 ] ; then
 		echo ""
 	fi
 
+	#copy boot files out of board support
+	if [ "$SYSFW" != "" ] ; then
+		cp $BOOTFILEPATH/$SYSFW $PATH_TO_SDBOOT/sysfw.itb
+		echo "sysfw.itb copied"
+
+		echo ""
+
+		echo ""
+	fi
+
 	if [ "$BOOTIMG" != "" ] ; then
 		cp $BOOTFILEPATH/$BOOTIMG $PATH_TO_SDBOOT/u-boot.img
 		echo "u-boot.img copied"
-- 
1.9.1


