Return-Path: <dmurphy@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 636035209B
	for <meta-arago@arago-project.org>;
	Mon, 24 Apr 2017 20:46:21 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3OKkBLn002320
	for <meta-arago@arago-project.org>; Mon, 24 Apr 2017 15:46:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493066771;
	bh=N4no7R16E6WiMe6bs0gF8Fqs/mkKO6s40jB9szjGwDM=;
	h=From:To:CC:Subject:Date;
	b=IZdSGVR3rWTE5ySQxk/vpS8cYxNTciacPc7pIFSJqJZnDdJt03LY6yYOsFxVWfy8u
	JtL2EpozGUiGe91LW9swTO+ueqqEYSjz1EdoMImVI9EJ3uo+zVfKHWo0ralzP66i5y
	LyPeX06omtWYEdZpqG+++x3Ap6CJcTI87MgUwKrA=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3OKk4hv014652
	for <meta-arago@arago-project.org>; Mon, 24 Apr 2017 15:46:06 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 24 Apr 2017 15:46:03 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v3OKk3A7005939;	Mon, 24 Apr 2017 15:46:03 -0500
Received: from localhost (a0272616local-lt.dhcp.ti.com [172.22.92.18])	by
	legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	v3OKk3324811; Mon, 24 Apr 2017 15:46:03 -0500 (CDT)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 24 Apr 2017 15:45:57 -0500
Message-ID: <20170424204557.32143-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.12.2
MIME-Version: 1.0
Subject: [PATCH] optee: Fix optee_os commit sha
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
X-List-Received-Date: Mon, 24 Apr 2017 20:46:22 -0000
Content-Type: text/plain

Recorded the wrong commit sha.  Used the -next
branch commit sha and not the release branch.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 meta-arago-distro/recipes-security/optee/optee-os_git.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
index 8643938f..f92ba01b 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
@@ -9,7 +9,7 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
 "
 BRANCH = "ti_optee_os"
 
-SRCREV = "a92d4a6698b0acc8147fba21b10c7e4473da3b9e"
+SRCREV = "79a8c877a637113b47f3e9fca417d33c5eacf9c9"
 
 EXTRA_OEMAKE = "CROSS_COMPILE_core=${HOST_PREFIX}  \
                 CROSS_COMPILE_ta_arm32=${HOST_PREFIX}  \
-- 
2.12.2


