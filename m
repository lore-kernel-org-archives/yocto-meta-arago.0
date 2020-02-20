Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 4BAA752A4C
	for <meta-arago@arago-project.org>;
	Thu, 20 Feb 2020 19:18:09 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01KJGA58129874
	for <meta-arago@arago-project.org>; Thu, 20 Feb 2020 13:16:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582226170;
	bh=uUg4i9j7cPhkXkzh1t0WQFm5fAWdr3k5rrTzThnGADM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=daQbJjLFpNF95iOCpdYejEWZek3dpkkgAVdPwj9Hrq8beqe84jeV+dYsx7o1jtMOt
	Rf5xFvsoMsKC7xbXrmgmHF07uF1xNfTHJ/U+ucnFEJo1FF/5HgtpgzrC4wk+CGhSR1
	SmuCSeYA8Y7NJ2tMv8j5PIl2hoB/3/3SV61EhUOc=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01KJGA8e117869
	for <meta-arago@arago-project.org>; Thu, 20 Feb 2020 13:16:10 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 20 Feb 2020 13:16:10 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 20 Feb 2020 13:16:10 -0600
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01KJG7pk017983;
	Thu, 20 Feb 2020 13:16:10 -0600
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 20 Feb 2020 18:54:58 +0000
Message-ID: <20200220185458.26926-9-denys@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200220185458.26926-1-denys@ti.com>
References: <20200220185458.26926-1-denys@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [zeus/master][PATCH 9/9] arago-image.inc: unbreak populate_sdk task
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
X-List-Received-Date: Thu, 20 Feb 2020 19:18:12 -0000
Content-Type: text/plain

We chose not to install nativesdk-perl and its modules, hence ensure
dummy dependencies and archs are configured properly.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-image.inc | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-arago-distro/recipes-core/images/arago-image.inc
index 179c81d1..b197dc27 100644
--- a/meta-arago-distro/recipes-core/images/arago-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-image.inc
@@ -9,17 +9,18 @@ IMAGE_FEATURES += "package-management splash"
 # 4KB per 1 inode should be enough
 EXTRA_IMAGECMD_ext2.gz += "-i 4096"
 
-ARAGO_IMAGE_EXTRA_INSTALL ?= ""
-
-IMAGE_INSTALL += " \
+IMAGE_INSTALL = " \
 	packagegroup-core-boot \
-	${ARAGO_IMAGE_EXTRA_INSTALL} \
+	${CORE_IMAGE_EXTRA_INSTALL} \
 "
 
 export IMAGE_BASENAME = "arago-image"
 
 IMAGE_LINGUAS = ""
 
+TOOLCHAIN_HOST_TASK += "nativesdk-buildtools-perl-dummy"
+SDK_PACKAGE_ARCHS += "buildtools-dummy-${SDKPKGSUFFIX}"
+
 make_bootfiles_symlinks_relative() {
     for f in "${IMAGE_ROOTFS}/boot"/*
     do
-- 
2.17.1


