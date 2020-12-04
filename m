Return-Path: <praneeth@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 4FD26529C8
	for <meta-arago@arago-project.org>;
	Mon,  7 Dec 2020 18:19:43 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B4LlcLC112477
	for <meta-arago@arago-project.org>; Fri, 4 Dec 2020 15:47:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607118458;
	bh=h2O+Wa60hl98siOOpeUwbPGtjmRWPhERatRLXRIAS0w=;
	h=From:To:CC:Subject:Date;
	b=dOC5zH5Lma9zcaFustIpVrNBqV5B7ujNaXGMbu4SpAY2nGpDjYxYrHB4WrzXIgrm0
	XfxIsZ9rzQy06enIXLHyNNZ9rT1IsrtjOIFs8w30w6ulmCg3ooTVi+WI/w1iR3yhyD
	MN6SfVUHVkZRhU9uIiA3S3GzZ1BaooEqhTMO1DWU=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B4LlcIv079347
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 4 Dec 2020 15:47:38 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Fri, 4 Dec 2020 15:47:38 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Fri, 4 Dec 2020 15:47:38 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B4LlcaW066829;
	Fri, 4 Dec 2020 15:47:38 -0600
From: <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Dan Murphy <dmurphy@ti.com>,
	<meta-arago@arago-project.org>
Date: Fri, 4 Dec 2020 15:47:38 -0600
Message-ID: <20201204214738.26411-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Mon, 07 Dec 2020 19:37:08 +0000
Subject: [dunfell/master PATCH] optee-os: update SRCREV to pick latest
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
X-List-Received-Date: Mon, 07 Dec 2020 18:19:44 -0000
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

updating SRCREV to pick the latest commit on
repo: ti-optee-os.git
branch: ti-optee-os

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 meta-arago-distro/recipes-security/optee/optee-os_git.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
index 677c6dd0..8a52833e 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
@@ -4,4 +4,4 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
            file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
 "
 BRANCH = "ti-optee-os"
-SRCREV = "199fca17b575d4c748c9c435e908a6ec9618c75a"
+SRCREV = "f414104d552c8ab96ccc3c4182c395c20e3a0a34"
-- 
2.17.1


