Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.19069.1638575125790955966
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 03 Dec 2021 15:45:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=hWH/VlbN;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1B3NjKNB055231;
	Fri, 3 Dec 2021 17:45:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1638575120;
	bh=m/HbH4X+FNDIlw1xzOokjTOtX4gf2eoTvAVXox+Si2I=;
	h=From:To:CC:Subject:Date;
	b=hWH/VlbNerdN6C4oJcc0IM7XB7xWZoqr+dRToVXzx7YFprM94rctC50nfSSgFYhIG
	 qdhPbavshNg5PVVUtoH58lrVvnKu4dGQAD0wVWLNfQ6VDBy1Jv1EyIeL8vPxDXtZth
	 N3Om+juQ7QC4QXUDubRrG/ATfFUSba3fvQowGORs=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1B3NjKWn130468
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Dec 2021 17:45:20 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 3
 Dec 2021 17:45:20 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 3 Dec 2021 17:45:20 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1B3NjKJG061550;
	Fri, 3 Dec 2021 17:45:20 -0600
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
CC: <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
Subject: [dunfell/master PATCHv2] Update the ltp-ddt to latest
Date: Fri, 3 Dec 2021 17:45:20 -0600
Message-ID: <20211203234520.17790-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

This has the following test fixes from ltp-ddt project

b57f35f47 testcases: ipc: Add support for PRU_ECHO test to be run on AM65 and AM64
31ee44622 Crypto: change logic for interrupt grep for different platforms
87afb0add testcases:ddt:scripts:common:get_active_eth_interfaces.sh
19775282c ti_codecs: modprobe fails to locate the modules
15a7adca3 Crypto: add more channel in arr for interrupt grep

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---

Changes in V2: rebased the patch to dunfell HEAD and updated commitmsg
to point the difference in the fixes between commits

 .../recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
index 1b52f327..e9431796 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
@@ -11,10 +11,10 @@ PROVIDES += "ltp"
 DEPENDS += "alsa-lib"
 
 PE = "1"
-PR = "r4"
+PR = "r5"
 PV_append = "+git${SRCPV}"
 
-SRCREV = "7e4a343637c217f20b39e9862af6d5c4f696bae2"
+SRCREV = "cfff0a2c889f29c03b9a3ee547a147b1c6727e2c"
 BRANCH ?= "master"
 
 SRC_URI_remove = "git://github.com/linux-test-project/ltp.git;protocol=https;branch=master"
-- 
2.17.1

