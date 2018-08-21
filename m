Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 79C6A529F1
	for <meta-arago@arago-project.org>;
	Tue, 21 Aug 2018 22:35:40 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7LMZXf6086360
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 17:35:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534890933;
	bh=VcYKTya1fUkna0graGZ+pZmgx5pWrLzpda+xaAcoiQU=;
	h=From:To:CC:Subject:Date;
	b=IpQY7yOZWWxvQJhdf5C1wNvxdt3w+V+BEnTI8/TOHqOZdb5UHbSwj08yjaeuWYfVL
	qKZrHbozYsKwALzPihIjIP7KIqEPIduna5YD6luLZfh5T44pPf+V+p7/jIzoI2cp7Q
	HBcoVsKISEWRgHzZ/sT2tiJGdMb0QBO9d6FkZL6c=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LMZWgZ008296
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 17:35:32 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 21 Aug 2018 17:35:32 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 21 Aug 2018 17:35:32 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LMZWkY019327;
	Tue, 21 Aug 2018 17:35:32 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 21 Aug 2018 18:23:36 -0400
Message-ID: <1534890218-32621-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v3 1/3] external-linaro-secondary-sdk-toolchain: secondary toolchain for devkit
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
X-List-Received-Date: Tue, 21 Aug 2018 22:35:40 -0000
Content-Type: text/plain

* Add a method to install an secondary toolchain in the devkit.
* The architecture for this toolchain can be configured by setting
  "SECONDARY_TARGET_ARCH" in some top-level config file.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v3 changes:
* fix "SECONDARY_*TARGET*_ARCH" in commit message

 .../recipes-core/meta/external-linaro-secondary-sdk-toolchain.bb      | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/meta/external-linaro-secondary-sdk-toolchain.bb

diff --git a/meta-arago-distro/recipes-core/meta/external-linaro-secondary-sdk-toolchain.bb b/meta-arago-distro/recipes-core/meta/external-linaro-secondary-sdk-toolchain.bb
new file mode 100644
index 0000000..d94070e
--- /dev/null
+++ b/meta-arago-distro/recipes-core/meta/external-linaro-secondary-sdk-toolchain.bb
@@ -0,0 +1,4 @@
+TARGET_ARCH := "${SECONDARY_TARGET_ARCH}"
+MACHINEOVERRIDES := "${SECONDARY_TARGET_ARCH}"
+
+require recipes-core/meta/external-linaro-sdk-toolchain.bb
-- 
2.7.4


