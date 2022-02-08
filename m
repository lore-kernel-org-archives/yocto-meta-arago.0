Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.11030.1644326436418792289
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 08 Feb 2022 05:20:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=PI4L0PNL;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 218DKY5i046812;
	Tue, 8 Feb 2022 07:20:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1644326434;
	bh=CYWJoYO/KCMwfgCZjM9Uy45S387d38eQjwFsR3r1/cg=;
	h=From:To:Subject:Date;
	b=PI4L0PNLyabDKeswN3xOK1TwQoFzJpMWRuDkdoZUrHdSa38YvmTAnSmPNEnF/7cuh
	 Df/kwQ28lO7phO5h8qo6Fhp4yFM9icINj4qpnEAG45oFunYesLji/HGyu2tA7TsY2l
	 Ew4C4M0QaHNKsrnNh8YjwSnpsTLtMfnOONJz1eQw=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 218DKY3p011299
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Feb 2022 07:20:34 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 8
 Feb 2022 07:20:34 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 8 Feb 2022 07:20:34 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 218DKYb6127795;
	Tue, 8 Feb 2022 07:20:34 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nHQQ6-0001tK-6d; Tue, 08 Feb 2022 07:20:34 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH] Fix calling path to git_retry.sh
Date: Tue, 8 Feb 2022 07:20:34 -0600
Message-ID: <20220208132034.7231-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Fix the variable that is used to find git_retry.sh.  This fixes
an issue with -b <dir> not working.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 oe-layertool-setup.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index 932ec49..85be8b0 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -336,9 +336,9 @@ clone_repo() {
     if [ -d $sourcedir/$name ]
     then
         cd $sourcedir/$name
-        $oebase/git_retry.sh fetch --all
+        $scriptdir/git_retry.sh fetch --all
     else
-        $oebase/git_retry.sh clone $uri $sourcedir/$name
+        $scriptdir/git_retry.sh clone $uri $sourcedir/$name
         if [ "$?" != "0" ]
         then
             echo "ERROR: Could not clone repository at $uri"
-- 
2.17.1

