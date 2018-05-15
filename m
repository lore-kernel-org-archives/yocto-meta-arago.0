Return-Path: <yan-liu@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 5FEE752987
	for <meta-arago@arago-project.org>;
	Tue, 15 May 2018 16:13:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w4FGCwTb017017
	for <meta-arago@arago-project.org>; Tue, 15 May 2018 11:12:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1526400778;
	bh=8UILaXBjCOGkd7gwbM8aegYoQGm4WY1mm/RYX4/8LiA=;
	h=From:To:CC:Subject:Date;
	b=XACHq4KsR/epVPhuXluKrtwbUMw2l6PpI+rAGu+SNebfSycTj5gFuDOiafEYTk44z
	oESQU4AookFnGjTxGv6ukWz0MMnT310vPWQvqMlAPShKBxtu+345Z1MIvDLMjOz2D6
	f/fkHSZv0TEdEdOK/I1kHzZOcY9g1R0t0JAWRUdg=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4FGCwCm025952
	for <meta-arago@arago-project.org>; Tue, 15 May 2018 11:12:58 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 15 May 2018 11:12:41 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 15 May 2018 11:12:42 -0500
Received: from yan-ubuntu-1204.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4FGCfRY014726;
	Tue, 15 May 2018 11:12:41 -0500
From: <yan-liu@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 15 May 2018 12:05:01 -0400
Message-ID: <1526400301-7008-1-git-send-email-yan-liu@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v1] ltp-ddt: Update to latest
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
X-List-Received-Date: Tue, 15 May 2018 16:13:03 -0000
Content-Type: text/plain

From: Yan Liu <yan-liu@ti.com>

Signed-off-by: Yan Liu <yan-liu@ti.com>
---
 .../recipes-devtools/ltp-ddt/ltp-ddt_20180118.bb   |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20180118.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20180118.bb
index 393d5f3..74e2e8e 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20180118.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20180118.bb
@@ -4,7 +4,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-PR = "r6"
+PR = "r7"
 PV_append = "+git${SRCPV}"
 
 PROVIDES += "ltp"
@@ -39,7 +39,7 @@ RDEPENDS_${PN} = "\
 
 inherit autotools-brokensep
 
-SRCREV = "32ab2dc391e16c92f7a7e8354d4369c3d6c5f8c3"
+SRCREV = "f7fc06c290333ce08a7d4fba104eee0f0f1d942b"
 BRANCH ?= "master"
 
 SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH} \
-- 
1.7.9.5


