Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 7DB0852B00
	for <meta-arago@arago-project.org>;
	Tue, 21 Aug 2018 19:25:59 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7LJPpAo054635
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 14:25:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534879551;
	bh=dPccJI42oKVoOqwaIEqBej7zDlF7ZEavqCh+TQdAebk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=KB5kUMp1wlnvKUF/eebhPmuPQJEmejFVhK6A78tW6cK//3byw2/GWi3ezbVM0hOgU
	Hln1Kyx/IvVQV1CtYVCU7yU9fTqROyHwDEaaGYT30R7yHtrQ4ULL8tEztMHb2oS34w
	fn/yYVq4MW04dG6U3Z+mmu0Y3MKNMofUd1IhXXKo=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LJPpY0008128
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 14:25:51 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 21 Aug 2018 14:25:50 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 21 Aug 2018 14:25:50 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LJPn9K026051;
	Tue, 21 Aug 2018 14:25:50 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 21 Aug 2018 15:13:57 -0400
Message-ID: <1534878837-20469-4-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534878837-20469-1-git-send-email-j-stiffler@ti.com>
References: <1534878837-20469-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 3/3] toolchain-linaro: enable SECONDARY_TOOLCHAIN
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
X-List-Received-Date: Tue, 21 Aug 2018 19:26:01 -0000
Content-Type: text/plain

* disable SECONDARY_TOOLCHAIN by default
* For k3, configure the secondary toolchain as armv7a for the R5
  cores.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/conf/distro/include/toolchain-linaro.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
index 9836e5c..06de680 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
@@ -10,6 +10,9 @@ ELT_TARGET_SYS_arm = "${ELT_TARGET_SYS_ARMV5}"
 ELT_TARGET_SYS_armv7a = "${ELT_TARGET_SYS_ARMV7}"
 ELT_TARGET_SYS_aarch64 = "${ELT_TARGET_SYS_ARMV8}"
 
+SECONDARY_TARGET_ARCH = ""
+SECONDARY_TARGET_ARCH_k3 = "armv7a"
+
 TARGET_VENDOR = ""
 
 TOOLCHAIN_BASE ?= "/opt"
-- 
2.7.4


