Return-Path: <>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 02FDD52A3A
	for <meta-arago@arago-project.org>;
	Thu,  5 Oct 2017 16:41:53 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v95Gfh8I018142
	for <meta-arago@arago-project.org>; Thu, 5 Oct 2017 11:41:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507221703;
	bh=mS7xBLWZevBkOHGzFYQ6+NLfbyUgRh8bXf8aXKU8HTM=;
	h=From:To:CC:Subject:Date;
	b=wfKFYeOdKF7BsuloBGIswXleof0LiiwxcIDKnOZI9ODgwxEyzSejZs7oAaiD+RQ04
	pgPRLZ2eEjb5M5kLFr2wTm8pn9ElsEhyF+tgDdhgGNOReNqhXLpS3UJiKUvIvoivfK
	hPZUXvHdsJoEFZ0h+g5tf4pOiEljBGq5lrgQlOmM=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v95Gfcbd014394
	for <meta-arago@arago-project.org>; Thu, 5 Oct 2017 11:41:38 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 5 Oct 2017 11:41:38 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 5 Oct 2017 11:41:38 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v95Gfc39017991;
	Thu, 5 Oct 2017 11:41:38 -0500
Received: from localhost (uda0226330.dhcp.ti.com [128.247.58.138])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	v95Gfc323124; Thu, 5 Oct 2017 11:41:38 -0500 (CDT)
From: "Andrew F. Davis" <afd@ti.com>
To: Denys Dmytriyenko <denys@ti.com>, Dan Murphy <dmurphy@ti.com>
Date: Thu, 5 Oct 2017 11:41:38 -0500
Message-ID: <20171005164138.6340-1-afd@ti.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [PATCH] optee_os: Sync with upstream support for AM4 PM
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
X-List-Received-Date: Thu, 05 Oct 2017 16:41:54 -0000
Content-Type: text/plain

Merge upstream bug fixes and new support for AM43xx power
management.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 meta-arago-distro/recipes-security/optee/optee-os_git.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
index f765d16a..550d75ca 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
@@ -10,7 +10,7 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
            file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
 "
 BRANCH = "ti_optee_os"
-SRCREV = "e82ac5b65bc789f3f0d1a3668bb5a2ffe2323f77"
+SRCREV = "342a75f64d69fa9a60a2934d56131243d540fe42"
 
 EXTRA_OEMAKE = "CROSS_COMPILE_core=${HOST_PREFIX}  \
                 CROSS_COMPILE_ta_arm32=${HOST_PREFIX}  \
-- 
2.14.1


