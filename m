Return-Path: <h-gou@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 4E2FF52968
	for <meta-arago@arago-project.org>;
	Mon, 12 Mar 2018 19:51:56 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2CJp6Ba005835
	for <meta-arago@arago-project.org>; Mon, 12 Mar 2018 14:51:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520884266;
	bh=vZ5bS8dMH8L+N6G4J/qUOStyWfuBEg1vifsjzBe/InA=;
	h=From:To:CC:Subject:Date;
	b=DyqBvcJb49YggQa/HMvd3//+fCamv8D7qXsZWswDEd5/RwF4NqcFYXjvDT6mdA7ha
	/rv1ZUvcfDHQ8Tr2ckL+mWVdNt0afpBdSC9KH+bGouHw6EIVrwkrZxP+VAfFbrk6e6
	7s6BgaZFRSM4s4Z0lL30Upid3xPXyKAOG50z3gY4=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2CJp6iM014190
	for <meta-arago@arago-project.org>; Mon, 12 Mar 2018 14:51:06 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 12 Mar 2018 14:51:04 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 12 Mar 2018 14:51:04 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2CJp4fF015297;
	Mon, 12 Mar 2018 14:51:04 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 12 Mar 2018 15:51:02 -0400
Message-ID: <1520884262-25182-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk] [patch] matrix-gui-multimedia-demos: bump SRCREV to get ivahd_multimedia_h264dec script update
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
X-List-Received-Date: Mon, 12 Mar 2018 19:51:57 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bbappend | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bbappend

diff --git a/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bbappend b/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bbappend
new file mode 100644
index 0000000..f1b3758
--- /dev/null
+++ b/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bbappend
@@ -0,0 +1,3 @@
+PR_append = ".tisdk0"
+
+SRCREV = "2ef38ec90f2523f138fb54f11f9a895145d88522"
-- 
1.9.1


