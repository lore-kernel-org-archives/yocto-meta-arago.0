Return-Path: <praneeth@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 5102C529D0
	for <meta-arago@arago-project.org>;
	Thu, 10 Dec 2020 22:32:42 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BAMWaDZ012255
	for <meta-arago@arago-project.org>; Thu, 10 Dec 2020 16:32:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607639556;
	bh=GLNY+q6ejkgVaZHhw+bQIuI7DLJUcdSNUn9ckX+KQeg=;
	h=From:To:CC:Subject:Date;
	b=ayRtEKZmKjmXmkPYXpzkt58rQHsHtDAqmrWPxZQpQDAw1oVvjvO2Y7mt4ZmRDTVrs
	8xdZSiV8z/oHoAAuzKWoxVWn3AiqGDuWWmIhUNixD77y944e8igl7dtUDi7BKfMWwg
	SdVM73066EASosMkVMAANQyVujMnVUoeBah6G/gQ=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BAMWaSg051682
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 10 Dec 2020 16:32:36 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 10 Dec 2020 16:32:35 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 10 Dec 2020 16:32:36 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BAMWZS2046785;
	Thu, 10 Dec 2020 16:32:35 -0600
From: <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
Date: Thu, 10 Dec 2020 16:32:35 -0600
Message-ID: <20201210223235.12724-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
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
X-List-Received-Date: Thu, 10 Dec 2020 22:32:42 -0000
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

updating SRCREV to pick the latest commit on
repo: ti-optee-os.git
branch: ti-optee-os

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 .../recipes-security/optee/optee-os_git.bbappend            | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
index 677c6dd0..28b9b6c5 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
@@ -1,7 +1,9 @@
 PR_append = ".arago0"
 
 SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
-           file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
+	   file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
 "
+
+PV = "3.11"
 BRANCH = "ti-optee-os"
-SRCREV = "199fca17b575d4c748c9c435e908a6ec9618c75a"
+SRCREV = "36905c9566936f7502e3741b48015c1f147b3bd3"
-- 
2.17.1


