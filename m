Return-Path: <dmurphy@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id E0857529AB
	for <meta-arago@arago-project.org>;
	Mon,  7 Aug 2017 20:06:30 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v77K6KZG012634
	for <meta-arago@arago-project.org>; Mon, 7 Aug 2017 15:06:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1502136380;
	bh=Xwy9XPUBci3WjQz8w7Hy6QENgrtM/iago+4CpJ17s0E=;
	h=From:To:CC:Subject:Date;
	b=GrunnPDxWHvoOsTr9d/ii4GPtkgk0qak3oyMnJ7BLVlYt+wKWH/9jKEPGH72Jz7Ly
	Wwbu+Zs1drdmXLu+6YHw43QpUawmtJ0sRSuJoC0tHXULPbNikWjGwFz2EvOFV3CC5f
	9b3K7Qoll1xAjuFyuxM+G7wNpCjr4rME9k5P5y1k=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v77K6FNU023248
	for <meta-arago@arago-project.org>; Mon, 7 Aug 2017 15:06:15 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 7 Aug 2017 15:06:14 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v77K6FBg012168;	Mon, 7 Aug 2017 15:06:15 -0500
Received: from localhost ([172.22.137.197])	by legion.dal.design.ti.com
	(8.11.7p1+Sun/8.11.7) with ESMTP id v77K6E311869;
	Mon, 7 Aug 2017 15:06:14 -0500 (CDT)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 7 Aug 2017 15:06:11 -0500
Message-ID: <20170807200611.18993-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.12.2
MIME-Version: 1.0
Subject: [PATCH] optee-os: Temporarily force am4 to use SW RNG
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
X-List-Received-Date: Mon, 07 Aug 2017 20:06:31 -0000
Content-Type: text/plain

Temporarily force AM4 to use a SW RNG

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 meta-arago-distro/recipes-security/optee/optee-os_git.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
index 2cf36564..07eb088e 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
@@ -10,7 +10,7 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
            file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
 "
 BRANCH = "ti_optee_os"
-SRCREV = "a73053f395996f649da278cbec361aa01c02befa"
+SRCREV = "09fe6fe9099d4479ab6e986f4af78dd9f9215862"
 
 EXTRA_OEMAKE = "CROSS_COMPILE_core=${HOST_PREFIX}  \
                 CROSS_COMPILE_ta_arm32=${HOST_PREFIX}  \
-- 
2.13.2.516.ge629a7d28


