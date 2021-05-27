Return-Path: <yogeshs@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 849B752B6B
	for <meta-arago@arago-project.org>;
	Thu, 27 May 2021 07:47:36 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14R7mDY0068118;
	Thu, 27 May 2021 02:48:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1622101693;
	bh=0zPmIxGfucy/xpxa9qEY0OXC3y4BdCN/YPpzfwc5mYs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=jjMf9uBAnC2EJTqIIco9pylCTT0Av1D+37Wli5+BjdEaEi27rx/0roEvC1jOzxNq6
	rGMacoxKNKbj3ugsKAz91ABQ4YsjX8IFFrJYUPV/95gxE/+xVqp2gf53EhIht1GgjV
	ZqgS18vjnpAvTsC3F7G5HCvOc96BZ5CwEOgJhXhE=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14R7mDJM001228
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 May 2021 02:48:13 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Thu, 27 May 2021 02:48:13 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Thu, 27 May 2021 02:48:13 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14R7mDTt008974;
	Thu, 27 May 2021 02:48:13 -0500
From: Yogesh Siraswar <yogeshs@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Praneeth Bajjuri
	<praneeth@ti.com>, Nishant Menon <nm@ti.com>
Date: Thu, 27 May 2021 02:48:11 -0500
Message-ID: <20210527074813.31042-2-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210527074813.31042-1-yogeshs@ti.com>
References: <20210527074813.31042-1-yogeshs@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [dunfell][PATCH 1/3] external-arm-toolchain: update linux-libc-headers to 5.10
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
X-List-Received-Date: Thu, 27 May 2021 07:47:37 -0000
Content-Type: text/plain

From: Gowtham Tammana <g-tammana@ti.com>

Update linux libc version from 5.4 to 5.10 

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 meta-arago-distro/conf/distro/include/toolchain-arm.inc   | 2 +-
 .../recipes-core/meta/external-arm-toolchain.bbappend     | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-arm.inc b/meta-arago-distro/conf/distro/include/toolchain-arm.inc
index 58efc004..dba14dcf 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-arm.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-arm.inc
@@ -50,7 +50,7 @@ SDKGCCVERSION ?= "arm-9.2%"
 SDKGDBVERSION ?= "9.1%"
 SDKBINUVERSION ?= "2.34%"
 SDKGLIBCVERSION ?= "2.31%"
-SDKLINUXLIBCVERSION ?= "5.4%"
+SDKLINUXLIBCVERSION ?= "5.10%"
 
 PREFERRED_VERSION_gcc-crosssdk-${SDK_SYS} ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_gcc-crosssdk-initial-${SDK_SYS} ?= "${SDKGCCVERSION}"
diff --git a/meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend b/meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend
index 0dfb3f52..5716ea13 100644
--- a/meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend
+++ b/meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend
@@ -3,15 +3,15 @@
 # on linux-libc-headers creates circular dependencies now. Mostly
 # duplication of code from corresponding recipe.
 
-BRANCH = "ti-linux-5.4.y"
-SRCREV = "1661da3fddf4cc3f62796ecfb5c572f1e5361bdf"
+BRANCH = "ti-linux-5.10.y"
+SRCREV = "bdfd5b0c1ee5617c9a94bacad0d818920d95b486"
 
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
 KERNEL_GIT_PROTOCOL = "git"
 SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH}"
 
-PKGV_linux-libc-headers-dev = "5.4"
-PKGV_linux-libc-headers = "5.4"
+PKGV_linux-libc-headers-dev = "5.10"
+PKGV_linux-libc-headers = "5.10"
 
 inherit kernel-arch pkgconfig multilib_header
 
-- 
2.17.1


