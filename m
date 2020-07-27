Return-Path: <a0389345@dta0389345ub>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id E4E24520C0
	for <meta-arago@arago-project.org>;
	Mon, 27 Jul 2020 22:28:28 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06RMPiq1062500
	for <meta-arago@arago-project.org>; Mon, 27 Jul 2020 17:25:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1595888744;
	bh=mOjvGc747fsbzBPsIH9d/cbZYpoMfigIwVFAsyS47ds=;
	h=From:To:CC:Subject:Date;
	b=TdgXPep3oBcOoBXiijZVlHm81ceIfHIoYRaW5VtiGZkmYZnFGPAgqoyZmh/rLZmx9
	vXO1qZMpYFP1jY0yYeUZO3tlWJp70ztZn1SfeJoGV1TaZVbxhS7UJWo+Pvgcv8oBUU
	qT1LFiqP0l02QhK0wt/ryOWfGNO/3gCqlwQme6XE=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06RMPiVe121305
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 27 Jul 2020 17:25:44 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Mon, 27 Jul 2020 17:25:44 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Mon, 27 Jul 2020 17:25:44 -0500
Received: from dta0389345ub (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06RMPipd025575;
	Mon, 27 Jul 2020 17:25:44 -0500
Received: from a0389345 by dta0389345ub with local (Exim 4.90_1)
	(envelope-from <a0389345@dta0389345ub>)
	id 1k0BZ2-00087W-0q; Mon, 27 Jul 2020 17:25:44 -0500
From: <prao@ti.com>
To: <meta-arago@arago-project.org>, <denys@ti.com>, <j-stiffler@ti.com>
Date: Mon, 27 Jul 2020 17:25:40 -0500
Message-ID: <20200727222541.31167-1-prao@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Praveen Rao <prao@ti.com>
Subject: [tisdk-setup-scripts] create-sdcard: Update the rootfs to default
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
X-List-Received-Date: Mon, 27 Jul 2020 22:28:29 -0000
Content-Type: text/plain

From: Praveen Rao <prao@ti.com>

The filesystem has change to tisdk-default-image.tar.xz

Signed-off-by: Praveen Rao <prao@ti.com>
---
 create-sdcard.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/create-sdcard.sh b/create-sdcard.sh
index 736cd42..8ce79b5 100644
--- a/create-sdcard.sh
+++ b/create-sdcard.sh
@@ -752,10 +752,10 @@ if [ $FILEPATHOPTION -eq 1 ] ; then
 	BOOTUENV=`ls $BOOTFILEPATH | grep uEnv.txt | awk {'print $1'}`
 	#rootfs
 	ROOTFILEPARTH="$PARSEPATH/filesystem"
-	#ROOTFSTAR=`ls  $ROOTFILEPARTH | grep tisdk.*rootfs | awk {'print $1'}`
+	#ROOTFSTAR=`ls  $ROOTFILEPARTH | grep tisdk.*default | awk {'print $1'}`
 
 	#Make sure there is only 1 tar
-	CHECKNUMOFTAR=`ls $ROOTFILEPARTH | grep "tisdk.*rootfs" | grep 'tar.xz' | grep -n '' | grep '2:' | awk {'print $1'}`
+	CHECKNUMOFTAR=`ls $ROOTFILEPARTH | grep "tisdk.*default" | grep 'tar.xz' | grep -n '' | grep '2:' | awk {'print $1'}`
 	if [ -n "$CHECKNUMOFTAR" ]
 	then
 cat << EOM
@@ -767,7 +767,7 @@ cat << EOM
 ################################################################################
 
 EOM
-		ls --sort=size $ROOTFILEPARTH | grep "tisdk.*rootfs" | grep 'tar.xz' | grep -n '' | awk {'print "	" , $1'}
+		ls --sort=size $ROOTFILEPARTH | grep "tisdk.*default" | grep 'tar.xz' | grep -n '' | awk {'print "	" , $1'}
 		echo ""
 		read -p "Enter Number of rootfs Tarball: " TARNUMBER
 		echo " "
@@ -775,7 +775,7 @@ EOM
 		ROOTFSTAR=$FOUNDTARFILENAME
 
 	else
-		ROOTFSTAR=`ls  $ROOTFILEPARTH | grep "tisdk.*rootfs" | grep 'tar.xz' | awk {'print $1'}`
+		ROOTFSTAR=`ls  $ROOTFILEPARTH | grep "tisdk.*default" | grep 'tar.xz' | awk {'print $1'}`
 	fi
 
 	ROOTFSUSERFILEPATH=$ROOTFILEPARTH/$ROOTFSTAR
-- 
2.17.1


