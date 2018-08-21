Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 5659A52AFE
	for <meta-arago@arago-project.org>;
	Tue, 21 Aug 2018 19:25:59 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7LJPoET047167
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 14:25:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534879550;
	bh=uZ3R90P97MFL2fsKWd2e1hDdIe36NJp+pmp+IJ9ifLM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=dKWir99kSJeIdtMpJNtv/bmYUpM2jSXFYYZlhOANl3OEf9ccklN7DSTOx5+b7e42I
	WtQk8o/qBV7uDYheOjzQUPdher9E6y7Tc1f7txojF9OFJZX9KsbR4brMXyhab+UQKd
	gQpfvln52eUhx+hh25Pzoqk7YWF4+5yYAxC+vpWU=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LJPoO2008108
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 14:25:50 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 21 Aug 2018 14:25:50 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 21 Aug 2018 14:25:50 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LJPn9I026051;
	Tue, 21 Aug 2018 14:25:50 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 21 Aug 2018 15:13:55 -0400
Message-ID: <1534878837-20469-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534878837-20469-1-git-send-email-j-stiffler@ti.com>
References: <1534878837-20469-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 1/3] external-linaro-secondary-sdk-toolchain: secondary toolchain for devkit
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
X-List-Received-Date: Tue, 21 Aug 2018 19:26:00 -0000
Content-Type: text/plain

* Add a method to install an secondary toolchain in the devkit.
* The architecture for this toolchain can be configured by setting
  "SECONDARY_TOOLCHAIN_ARCH" in some top-level config file.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
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


