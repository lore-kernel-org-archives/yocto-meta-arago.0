Return-Path: <g-tammana@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 0573B52B03
	for <meta-arago@arago-project.org>;
	Tue, 27 Apr 2021 22:51:48 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13RMqGx8012214;
	Tue, 27 Apr 2021 17:52:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1619563936;
	bh=Zg+ugyRevta9r7Bvip0Ie/YWU8UEy8eqTiOsstgm8io=;
	h=From:To:CC:Subject:Date;
	b=f5XvVxpZ0kHrXEb1ila1vkNmae1BA0VWHeGxEj8YkCDnBoaGk3JEGbyuhqn+T2jB2
	hgHHjfX5tVbE3QHLyGo2GFSAVZsgpkpy8tKUQm93zkIpPOKBwUeXnY8Ni/4Xrb9xaC
	EpsWTdh4HEBoGi05twiHONJJSc0pcZvLGmHmz/8k=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13RMqGon078046
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Apr 2021 17:52:16 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Tue, 27 Apr 2021 17:52:16 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Tue, 27 Apr 2021 17:52:16 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com
	[10.247.120.73])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13RMqGdA024430;
	Tue, 27 Apr 2021 17:52:16 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.81.224] (may be forged))
	by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id
	13RMqGMm093753; Tue, 27 Apr 2021 17:52:16 -0500
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Praneeth Bajjuri <praneeth@ti.com>,
	<denys@konsulko.com>
Date: Tue, 27 Apr 2021 17:52:15 -0500
Message-ID: <20210427225215.30951-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [dunfell/master][PATCH] external-arm-toolchain: update linux-libc-headers to 5.10
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
X-List-Received-Date: Tue, 27 Apr 2021 22:51:49 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
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
2.31.1


