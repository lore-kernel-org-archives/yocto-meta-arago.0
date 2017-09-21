Return-Path: <jjhiblot@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 2636452A9D
	for <meta-arago@arago-project.org>;
	Thu, 21 Sep 2017 13:31:12 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8LDV145021289
	for <meta-arago@arago-project.org>; Thu, 21 Sep 2017 08:31:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506000661;
	bh=ARgTBigsCJ2dV1/RTiJgkaAG3Zz68LwQavQYmtg2lfc=;
	h=From:To:CC:Subject:Date;
	b=ePfMqZupkAop5/DcPLXdCktdyPObK6DGFJdJjek/6YeLLJnG4Frn3LAqb0+eZGFFG
	3jYrssRwipvjSL5EGZ763jF+H/42n8SA56kLcnaqjpadJuP5GNN2/mivce7Up/+R2c
	6XPixV5toL8WSLBAjVvoqrCPnYHBV/qOq9XNkjRo=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8LDUucp000456
	for <meta-arago@arago-project.org>; Thu, 21 Sep 2017 08:30:56 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 21 Sep 2017 08:30:56 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 21 Sep 2017 08:30:56 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8LDUtNq010666;
	Thu, 21 Sep 2017 08:30:56 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <meta-arago@arago-project.org>, <denys@ti.com>
Date: Thu, 21 Sep 2017 15:30:53 +0200
Message-ID: <1506000653-15572-1-git-send-email-jjhiblot@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty] linux-libc-headers (4.4 kernel): update to include dma-buf.h export fix
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
X-List-Received-Date: Thu, 21 Sep 2017 13:31:12 -0000
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


