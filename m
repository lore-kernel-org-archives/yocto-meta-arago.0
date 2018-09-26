Return-Path: <jake@udc0866934>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id DB7755297F
	for <meta-arago@arago-project.org>;
	Wed, 26 Sep 2018 13:23:24 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8QDNGLL063281
	for <meta-arago@arago-project.org>; Wed, 26 Sep 2018 08:23:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537968196;
	bh=rfrwWZ/fIm6u01AVKalm5tGpH2gnl45DdIsphBU/Rvc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=YybWTAXW/McbV+vWShVSxoMSbf1kCVTt1HWkWQDiAqtdkvKKaM9GHZvVsR9M2vBGO
	1a+fuNPdSqGjaD0qW6XyoW3iTi75BFb7/aGVgTAr3v771SmC07BALwM5YFys9CMv+k
	sJlq+2Ulu+yeiQ56bfCTFL9e07xOkZU4COD032fA=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8QDNGJ2016708
	for <meta-arago@arago-project.org>; Wed, 26 Sep 2018 08:23:16 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 26 Sep 2018 08:23:16 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 26 Sep 2018 08:23:16 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8QDNG3L014657;
	Wed, 26 Sep 2018 08:23:16 -0500
Received: from jake by udc0866934 with local (Exim 4.82)
	(envelope-from <jake@udc0866934>)
	id 1g59me-0003Ig-0f; Wed, 26 Sep 2018 09:23:16 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 26 Sep 2018 09:23:12 -0400
Message-ID: <1537968192-12648-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1537968192-12648-1-git-send-email-j-stiffler@ti.com>
References: <1537968192-12648-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [tisdk-setup-scripts][PATCH 2/2] create-sdcard: k3: set def_board_name with 3 partitions
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
X-List-Received-Date: Wed, 26 Sep 2018 13:23:25 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 k3/create-sdcard.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/k3/create-sdcard.sh b/k3/create-sdcard.sh
index 3bb6e17..948ca9a 100644
--- a/k3/create-sdcard.sh
+++ b/k3/create-sdcard.sh
@@ -206,6 +206,10 @@ EOM
         fi
         cp -rf ./tmp/* boot/
 
+        touch ./boot/uEnv.txt
+        sed -i -e '/^def_board_name=.*/d' ./boot/uEnv.txt
+        echo "def_board_name=$board_name" >> ./boot/uEnv.txt
+
 cat << EOM
 
 ################################################################################
-- 
1.9.1


