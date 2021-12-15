Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.509.1639585734410267303
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 15 Dec 2021 08:28:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=fQHDWR6Y;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1BFGSqGm122000;
	Wed, 15 Dec 2021 10:28:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1639585732;
	bh=c3NTSHRRzQmckL3ChK7QrHzUbGiqsXD6qO6G4Ixkmr4=;
	h=From:To:Subject:Date;
	b=fQHDWR6Y5qinmXNhRxEF4/MIrQ1D00R6gzRi7sNlmZpN2khbGa6qJxpnRWGm2+ZeD
	 xY9T1IZ/fPFK+fOvtSdFOx2+29iMAsw0tdR/I1uvQDd5Gk7lqDuvayD33BmH8k4lKd
	 G6RhJHl4M+bdZJ5B2v5EgixvIe3QfZLNfTsXnqLM=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1BFGSq10009544
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Dec 2021 10:28:52 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 15
 Dec 2021 10:28:52 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 15 Dec 2021 10:28:52 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1BFGSqZG118665;
	Wed, 15 Dec 2021 10:28:52 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1mxX9A-0001nQ-C9; Wed, 15 Dec 2021 10:28:52 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][PATCH] Moving to latest BitBake 1.46 commit.
Date: Wed, 15 Dec 2021 10:28:52 -0600
Message-ID: <20211215162852.6862-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Moving to the latest commit for the BitBake v1.46 line to fix a compile
error with the 08.01.00.006 release.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 configs/coresdk/coresdk-08.01.00.006-config.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/coresdk/coresdk-08.01.00.006-config.txt b/configs/coresdk/coresdk-08.01.00.006-config.txt
index 78d8bf7..8995410 100644
--- a/configs/coresdk/coresdk-08.01.00.006-config.txt
+++ b/configs/coresdk/coresdk-08.01.00.006-config.txt
@@ -1,7 +1,7 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.46,0e0af15b84e07e6763300dcd092b980086b9b9c4
+bitbake,git://git.openembedded.org/bitbake,1.46,f18b65d0b9a6b983d53bde491e1bf2ca56949444
 meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.01.00.006,layers=meta-arago-distro:meta-arago-extras
 #meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
-- 
2.17.1

