Return-Path: <jjhiblot@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 8327B52990
	for <meta-arago@arago-project.org>;
	Wed, 20 Sep 2017 19:22:08 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8KJM7N3008681
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 14:22:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505935327;
	bh=ARgTBigsCJ2dV1/RTiJgkaAG3Zz68LwQavQYmtg2lfc=;
	h=From:To:CC:Subject:Date;
	b=cWxJLynqqLdRXwvYkwOxZHLFAjz7XCmu5MAbs4AjtYSx95/o7exI31ylYu6yits5o
	zhwXZ2UeTbudRBkYpWi7HHBEjc82mJL3x326e1Ad0RtPp2E4CFK3miaf82Aycdotqv
	/Nxgg1vNGwEVSG8EhGxU+CZmLo5m2PJpXkFm0I8Q=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KJM7wo010878
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 14:22:07 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 20 Sep 2017 14:22:06 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 20 Sep 2017 14:22:07 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KJM5Gd002233;
	Wed, 20 Sep 2017 14:22:06 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <meta-arago@arago-project.org>, <denys@ti.com>
Date: Wed, 20 Sep 2017 21:22:06 +0200
Message-ID: <1505935326-14390-1-git-send-email-jjhiblot@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk] [PATCH] linux-libc-headers (4.4 kernel): update to include dma-buf.h export fix
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
X-List-Received-Date: Wed, 20 Sep 2017 19:22:12 -0000
Content-Type: text/plain

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
---
 .../recipes-kernel/linux-libc-headers/linux-libc-headers_4.4.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.4.bbappend b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.4.bbappend
index 7d0537d..c1d8fd1 100644
--- a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.4.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.4.bbappend
@@ -1,7 +1,7 @@
-PR_append = ".arago0"
+PR_append = ".arago1"
 
 BRANCH = "ti-lsk-linux-4.4.y"
-SRCREV = "6580f85400b48d55d06f11d6b75c056399123a72"
+SRCREV = "2612ef5805db717f9818f06786e863d3b1a7f87e"
 
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
 KERNEL_GIT_PROTOCOL = "git"
-- 
1.9.1


