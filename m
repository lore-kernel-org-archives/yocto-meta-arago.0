Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.18956.1638574202412258478
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 03 Dec 2021 15:30:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=FMdw7p7A;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1B3NTu92061869;
	Fri, 3 Dec 2021 17:29:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1638574196;
	bh=btk9732iesERVxVn2TvUtk2dCyyhgnuNVKibxQpHunA=;
	h=From:To:CC:Subject:Date;
	b=FMdw7p7AXVv95zje2wz6auwusnjBkbSNXLjMwSQIoEEuSp2CauIOG9WHOkR3RSBKT
	 w1Knkld4Fl+2xZWMtvOmCv9tlQHaNu9GeDJLJFVPP60u4B2XxXDBOhzlwiZqymYnWr
	 NFSqHWV/SVBh1s0Et+hpFudr2EyGvpOzZZcxWdSg=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1B3NTuOJ064602
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Dec 2021 17:29:56 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 3
 Dec 2021 17:29:56 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 3 Dec 2021 17:29:56 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1B3NTuVO034210;
	Fri, 3 Dec 2021 17:29:56 -0600
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
CC: <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
Subject: [dunfell/master PATCH] ltp-ddt: Update to latest srcrev for 08.01.00.005
Date: Fri, 3 Dec 2021 17:29:56 -0600
Message-ID: <20211203232956.16907-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

Update the ltp-ddt to latest for 08.01.00.005

This has the following test fixes

b57f35f47 testcases: ipc: Add support for PRU_ECHO test to be run on AM65 and AM64
31ee44622 Crypto: change logic for interrupt grep for different platforms
87afb0add testcases:ddt:scripts:common:get_active_eth_interfaces.sh
19775282c ti_codecs: modprobe fails to locate the modules
15a7adca3 Crypto: add more channel in arr for interrupt grep
3a5456b1d Add platform name for j721e to get max width
b3fcb8346 ipc: runtest/ddt/ipc_rpmsg_char: add m4f remote proc tests
ff06ec671 runtest/ddt/eth_icssg: add speed/duplex tests

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 .../recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
index 4a1f8d74..8a86f139 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
@@ -11,10 +11,10 @@ PROVIDES += "ltp"
 DEPENDS += "alsa-lib"
 
 PE = "1"
-PR = "r4"
+PR = "r5"
 PV_append = "+git${SRCPV}"
 
-SRCREV = "b6c5b174837a9ba0a743addbe58735ce6cf56b4a"
+SRCREV = "cfff0a2c889f29c03b9a3ee547a147b1c6727e2c"
 BRANCH ?= "master"
 
 SRC_URI_remove = "git://github.com/linux-test-project/ltp.git"
-- 
2.17.1

