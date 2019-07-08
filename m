Return-Path: <nikhil.nd@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 133C4520E0
	for <meta-arago@arago-project.org>;
	Mon,  8 Jul 2019 18:51:43 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x68IoutZ113346
	for <meta-arago@arago-project.org>; Mon, 8 Jul 2019 13:50:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562611856;
	bh=5wqZS7HuNgjx439r0x74qE9gII2OEHAI27PPKI/KksE=;
	h=From:To:CC:Subject:Date;
	b=C6jwLK55aIoi8xIZVW+cQu40Qe5h3cYlmrsN4DPRjaTkj85bVX36tcbFBdKN8o2nA
	ZHagueyi4qW6yNiBpd9JJMTd00tBcagvAS219YGyZtgXpP7gs0IOU4JD/TUISD3Lv9
	AgmhWR+jJkiwOqbO+0caLVGB8PJDvilR3hl8VK64=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x68Ioubc024791
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 8 Jul 2019 13:50:56 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 8 Jul 2019 13:50:56 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 8 Jul 2019 13:50:56 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x68IosHG125123; 
	Mon, 8 Jul 2019 13:50:55 -0500
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <meta-arago@arago-project.org>, <denys@ti.com>
Date: Tue, 9 Jul 2019 00:20:52 +0530
Message-ID: <1562611852-87316-1-git-send-email-nikhil.nd@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: karthik.ramanan@ti.com
Subject: [thud PATCH v1] packagegroup-arago-tisdk-addons: add jailhouse for j7-evm
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
X-List-Received-Date: Mon, 08 Jul 2019 18:51:44 -0000
Content-Type: text/plain

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index be3ada6..21aa724 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -76,7 +76,7 @@ UTILS_append_k3 = " mmc-utils \
 "
 
 UTILS_append_am65xx = " ti-ipc-rtos-fw pru-icss"
-UTILS_append_j7-evm = " ipc-lld-fw ti-display-sharing-fw"
+UTILS_append_j7-evm = " ipc-lld-fw ti-display-sharing-fw jailhouse"
 
 UTILS_append_omapl138 = " ti-ipc-rtos-fw"
 
-- 
1.9.1


