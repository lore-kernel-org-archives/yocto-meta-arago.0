Return-Path: <nikhil.nd@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 73D41529DC
	for <meta-arago@arago-project.org>;
	Thu, 11 Feb 2021 11:06:04 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 11BB6D2o069458
	for <meta-arago@arago-project.org>; Thu, 11 Feb 2021 05:06:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1613041573;
	bh=s5AMSmmPfr+rGE5mQMt/7AssDGyqk8t1JzwmtRQVCuM=;
	h=From:To:CC:Subject:Date;
	b=McqO5gtFRaoclvKKX2pun8UprCkQH+XOoovTIQKrwLzUWHKNDWDmVB86k1O7xGUiL
	vv+8VfU8c2gABNnn5X15c7RCd1VUWLNSGvD8v2e5j7IRZCDW9cM0UEITQ5dvEY0PqW
	rfjIW1A30V6iB57sEilT4VFcgjse1+9cTHFEPALk=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 11BB6DMI042023
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 11 Feb 2021 05:06:13 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 11 Feb 2021 05:06:12 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 11 Feb 2021 05:06:12 -0600
Received: from swubn03.india.englab.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 11BB6AWb090126;
	Thu, 11 Feb 2021 05:06:10 -0600
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <meta-arago@arago-project.org>, <dmurphy@ti.com>
Date: Thu, 11 Feb 2021 16:35:55 +0530
Message-ID: <20210211110555.25570-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: lokeshvutla@ti.com, nsekhar@ti.com, kishon@ti.com
Subject: [meta-ti][dunfell PATCH] packagegroup: tisdk-connectivity: Include wireless firmware for am64xx-sk
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
X-List-Received-Date: Thu, 11 Feb 2021 11:06:04 -0000
Content-Type: text/plain

Use the new recipe to install the wireless firmwares in the
filesystem for am64xx-sk

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-connectivity.bb    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index 11109432..45d24435 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -91,6 +91,10 @@ CONNECTIVITY_RDEPENDS_append_k3 = "\
     ${BT_COMMON} \
 "
 
+CONNECTIVITY_RDEPENDS_append_am64xx-sk = "\
+    wl-fw \
+"
+
 RDEPENDS_${PN} = "\
     ${CONNECTIVITY_RDEPENDS} \
 "
-- 
2.17.1


