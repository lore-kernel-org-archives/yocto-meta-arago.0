Return-Path: <jake@udc0866934>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 20D8652970
	for <meta-arago@arago-project.org>;
	Fri, 21 Jun 2019 14:32:26 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5LEVhoK120871
	for <meta-arago@arago-project.org>; Fri, 21 Jun 2019 09:31:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561127503;
	bh=f5gjBH9ko019G2LLNnxuXGFHhLMF0EfkdeNvIQCj+0E=;
	h=From:To:CC:Subject:Date;
	b=B/way7527tnPZaYDas/iIxQObsnGU2l6OKFXbmxUGP52pFU4JTxIOHxhDXYpIWt+5
	PbWPLTSVDAYkV23gK9DXAUMGc5W6/7PHe1NfnTHt2QxDFtL9z4FZUG5Qpm4SqAS2qX
	VDuYEO52PkU1NvOjJSCVsten4b4Z0SseOeZlHozU=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5LEVhuC052138
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 21 Jun 2019 09:31:43 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 21 Jun 2019 09:31:43 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 21 Jun 2019 09:31:43 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5LEVhPd029749;
	Fri, 21 Jun 2019 09:31:43 -0500
Received: from jake by udc0866934 with local (Exim 4.82)
	(envelope-from <jake@udc0866934>)
	id 1heKZr-0006QQ-72; Fri, 21 Jun 2019 10:31:43 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 21 Jun 2019 10:31:38 -0400
Message-ID: <1561127498-24665-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [tisdk-setup-scripts][PATCH] create-sdcard: sort rootfs options by size
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
X-List-Received-Date: Fri, 21 Jun 2019 14:32:27 -0000
Content-Type: text/plain

* List the largest rootfs first based on the assumption that contains
  the most out-of-box experience.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 create-sdcard.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/create-sdcard.sh b/create-sdcard.sh
index 39d8af1..5c02a12 100644
--- a/create-sdcard.sh
+++ b/create-sdcard.sh
@@ -767,11 +767,11 @@ cat << EOM
 ################################################################################
 
 EOM
-		ls $ROOTFILEPARTH | grep "tisdk.*rootfs" | grep 'tar.xz' | grep -n '' | awk {'print "	" , $1'}
+		ls --sort=size $ROOTFILEPARTH | grep "tisdk.*rootfs" | grep 'tar.xz' | grep -n '' | awk {'print "	" , $1'}
 		echo ""
 		read -p "Enter Number of rootfs Tarball: " TARNUMBER
 		echo " "
-		FOUNDTARFILENAME=`ls $ROOTFILEPARTH | grep "rootfs" | grep 'tar.xz' | grep -n '' | grep "${TARNUMBER}:" | cut -c3- | awk {'print$1'}`
+		FOUNDTARFILENAME=`ls --sort=size $ROOTFILEPARTH | grep "rootfs" | grep 'tar.xz' | grep -n '' | grep "${TARNUMBER}:" | cut -c3- | awk {'print$1'}`
 		ROOTFSTAR=$FOUNDTARFILENAME
 
 	else
-- 
1.9.1


