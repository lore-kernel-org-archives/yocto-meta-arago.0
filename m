Return-Path: <nikhil.nd@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id EAD4052A21
	for <meta-arago@arago-project.org>;
	Wed,  3 Mar 2021 18:21:30 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 123ILhxw129208
	for <meta-arago@arago-project.org>; Wed, 3 Mar 2021 12:21:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1614795704;
	bh=cz+Fg0cqqYVHLUpUFaYAYjSB577V5MoLjsvzZJp4lyU=;
	h=From:To:CC:Subject:Date;
	b=PlZIt2xJNcxKihnBB2M4uONpFLKpbaY0ZObamDCLIZNDIZ641pRhVM1m25Bs+Wdkc
	xGgERMHL22t9Tsq6PWdZwYCmBa/VDgpqT+MZerGGRinjNhbj2rWwzsHGtwOIhDNmsP
	Nt5Q74b3sM5yBUHw01Xva4Fif9vTHd0fxeoa5NIU=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 123ILhtc119747
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 3 Mar 2021 12:21:43 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Wed, 3 Mar 2021 12:21:43 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Wed, 3 Mar 2021 12:21:43 -0600
Received: from swubn03.india.englab.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 123ILeEj054807;
	Wed, 3 Mar 2021 12:21:41 -0600
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <meta-arago@arago-project.org>, <praneeth@ti.com>
Date: Wed, 3 Mar 2021 23:51:36 +0530
Message-ID: <20210303182136.31765-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: saurabhnarang@ti.com, lokeshvutla@ti.com, nsekhar@ti.com, kishon@ti.com,
	hnagalla@ti.com
Subject: [meta-ti][dunfell/master][PATCH v2] packagegroups: tisdk-connectivity: Include TI wlan packages for k3 platforms
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
X-List-Received-Date: Wed, 03 Mar 2021 18:21:32 -0000
Content-Type: text/plain

Currently, the K3 platforms do not include the TI wlan related packages.
Add in the tisdk-connectivity packagegroup.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Suggested-by: Hari Nagalla <hnagalla@gmail.com>
Reviewed-by: Lokesh Vutla <lokeshvutla@ti.com>
---

Notes:
    changes from v1:
    
    * Drop the new recipe and simply include the existing packages for wilink
      This way, all the platforms are using the same recipes and we don't
      have to maintain any new recipe just for the am64xx-sk
      The firmare will get picked from the repo
      git://git.ti.com/wilink8-wlan/wl18xx_fw.git

 .../packagegroups/packagegroup-arago-tisdk-connectivity.bb       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index 11109432..ab632924 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -89,6 +89,7 @@ CONNECTIVITY_RDEPENDS_append_dra7xx = "\
 CONNECTIVITY_RDEPENDS_append_k3 = "\
     ${WLAN_COMMON} \
     ${BT_COMMON} \
+    ${WLAN_TI} \
 "
 
 RDEPENDS_${PN} = "\
-- 
2.17.1


