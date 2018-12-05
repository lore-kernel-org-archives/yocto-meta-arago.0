Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 00968520C0
	for <meta-arago@arago-project.org>;
	Wed,  5 Dec 2018 14:34:18 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wB5EY79s007517
	for <meta-arago@arago-project.org>; Wed, 5 Dec 2018 08:34:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544020447;
	bh=Ph8+PSBI/oGMykA90jNRbVdHYQFjj8R7Pdlu1NdtUbY=;
	h=From:To:CC:Subject:Date;
	b=tTzfYqfy7HRCLngws0EVHvWgugHb/VQUdTlnNUxAq4bfg7ldUeC3NGvR6ZrMd1qeY
	H5CVe4pOwXkw4DpH90bNEmRxBBt3MZfZEL1yDyDbnmUKoHOB1ltqxdQsavzMXZNtxQ
	eYdoowD0n14sOMGJ+OFm3KzMgR79wb8jNmPemM80=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wB5EY7vT055695
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 5 Dec 2018 08:34:07 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 5 Dec 2018 08:34:07 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 5 Dec 2018 08:34:07 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wB5EY77j023930;
	Wed, 5 Dec 2018 08:34:07 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 5 Dec 2018 09:21:42 -0500
Message-ID: <1544019704-20384-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 1/3] packagegroup: sysvinit: force sysvinit over systemd
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
X-List-Received-Date: Wed, 05 Dec 2018 14:34:20 -0000
Content-Type: text/plain

* Use packagegroup-core-boot, but force sysvinit by setting the
  appropriate VIRTUAL_RUNTIME.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroups/packagegroup-arago-sysvinit-boot.bb         | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
new file mode 100644
index 0000000..2eb2d77
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
@@ -0,0 +1,11 @@
+require recipes-core/packagegroups/packagegroup-core-boot.bb
+
+PR = "r0"
+
+# Cannot use eudev:
+#   "eudev was skipped: 'systemd' in DISTRO_FEATURES"
+#VIRTUAL-RUNTIME_dev_manager = "eudev"
+VIRTUAL-RUNTIME_dev_manager = ""
+VIRTUAL-RUNTIME_init_manager = "sysvinit"
+VIRTUAL-RUNTIME_initscripts = "initscripts"
+VIRTUAL-RUNTIME_initramfs = "sysvinit-initramfs"
-- 
2.7.4


