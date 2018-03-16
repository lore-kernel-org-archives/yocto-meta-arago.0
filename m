Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 92EC052986
	for <meta-arago@arago-project.org>;
	Fri, 16 Mar 2018 16:45:47 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2GGirjP023655
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 11:44:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521218693;
	bh=NBJ9Z4QZ5ytMHaREcUvH/4KrNNS6cLgzHh1mXPeAF94=;
	h=From:To:Subject:Date;
	b=kwTFLUvVd2dv67F5WGtD1ba6UwwrFGqExRvurOQDouHG19ipLypmJIQjghPycO/6E
	Qt8g++0FBTLmyr6Cw57KsuYLs9P8lHuVaH3X+gXCHNAlJwOX8CK2iiK6ahPBNbxbYS
	M7iUoqNXxuIj4mRjQMH9B0k/ejL2NYZag1fsxreg=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GGirAv021705
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 11:44:53 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 16 Mar 2018 11:44:53 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 16 Mar 2018 11:44:52 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GGiqX7030878
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 11:44:52 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 16 Mar 2018 12:44:51 -0400
Message-ID: <1521218691-28840-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] mmcsd-lld-rtos: Update to versin 01.00.00.11
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
X-List-Received-Date: Fri, 16 Mar 2018 16:45:47 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bbappend | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bbappend

diff --git a/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bbappend b/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bbappend
new file mode 100644
index 0000000..8ac0ac3
--- /dev/null
+++ b/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bbappend
@@ -0,0 +1,5 @@
+# Below commit ID corresponds to "DEV.MMCSD_LLD.01.00.00.11"
+MMCSD_LLD_SRCREV = "0fdb39f60ad82385b8f7e0cba8c33fe3883b4320"
+
+PV = "01.00.00.11"
+PR = "r0"
-- 
1.9.1


