Return-Path: <nm@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 17CEB52A6B
	for <meta-arago@arago-project.org>;
	Sat, 27 Mar 2021 01:35:55 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12R1aDFp114847;
	Fri, 26 Mar 2021 20:36:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1616808973;
	bh=mP+aAt4UW0YXpI4ls/N0h2BjIPql9WVaLKWFdtTFDGo=;
	h=From:To:CC:Subject:Date;
	b=NJ2SfwOdq6qQL/XFMvguhiQnkE0/AsHJC8PlfwIaSjMuEH+anHdsl1QhvBQBfaUzG
	dqhXVBvaUsVi5ysA0DxkiOv/VkV7PwNpj1TGfhB+dBttbcgs+xhI9bpWHsNTO8A/ad
	P/4x/BuvACWP257F6hngYyK8/FNfuF2hhcIc+djw=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12R1aD92120862
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 Mar 2021 20:36:13 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Fri, 26 Mar 2021 20:36:13 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Fri, 26 Mar 2021 20:36:13 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12R1aDI0063308;
	Fri, 26 Mar 2021 20:36:13 -0500
From: Nishanth Menon <nm@ti.com>
To: <praneeth@ti.com>, <denis@denix.org>
Date: Fri, 26 Mar 2021 20:36:11 -0500
Message-ID: <20210327013611.4686-1-nm@ti.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [dunfell/master][PATCH] omapconf: Bump to v1.75 release
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
X-List-Received-Date: Sat, 27 Mar 2021 01:35:55 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Lets move to v1.75.. finally..

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb b/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb
index 6d11ce1ed29a..7216f05c4394 100644
--- a/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb
+++ b/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb
@@ -4,12 +4,12 @@ HOMEPAGE = "https://github.com/omapconf/omapconf"
 LICENSE = "GPLv2 | BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=205c83c4e2242a765acb923fc766e914"
 
-PV = "1.74+git${SRCPV}"
+PV = "1.75+git${SRCPV}"
 
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|omap4"
 
 BRANCH ?= "master"
-SRCREV = "40ab0a2a57dffcf7e2813fc7a526d6cde3755347"
+SRCREV = "ff07b6992bacb1e1586c72b7d2be469caee4a347"
 
 SRC_URI = "git://github.com/omapconf/omapconf.git;protocol=git;branch=${BRANCH}"
 
-- 
2.31.0


