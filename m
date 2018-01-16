Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 7F87552A78
	for <meta-arago@arago-project.org>;
	Tue, 16 Jan 2018 17:16:14 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w0GHFxjH015797
	for <meta-arago@arago-project.org>; Tue, 16 Jan 2018 11:15:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1516122959;
	bh=qm5XI8M0BLkz2ZGneCQ/uDxfifce64HLJ5KtzwOdYCk=;
	h=From:To:Subject:Date;
	b=YyTk7oQH0VEaU+iVPfmWJNRVzLpMaR0SW+R2PNfrKp7HCYwIiVDoKNCR2Jkb3QCym
	k7nM7Rwtw2NEILlyJXQcF0+gVpS+ReCG9C7Qfqn07uCnVFRVL48ZLO9wcjPp/WbpJf
	CU2oyx0D/Znni9or6UOFqdfHGiB4OEGrI9g+EA84=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0GHFxcY022322
	for <meta-arago@arago-project.org>; Tue, 16 Jan 2018 11:15:59 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 16 Jan 2018 11:15:59 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 16 Jan 2018 11:15:59 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0GHFxWe011989
	for <meta-arago@arago-project.org>; Tue, 16 Jan 2018 11:15:59 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 16 Jan 2018 12:15:57 -0500
Message-ID: <1516122957-17975-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] i2c-lld-rtos: Adding dependency to pruss-lld-rtos for am335x, am437x and am57xx
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
X-List-Received-Date: Tue, 16 Jan 2018 17:16:14 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend

diff --git a/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend b/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend
new file mode 100644
index 0000000..f46d2b6
--- /dev/null
+++ b/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend
@@ -0,0 +1,7 @@
+DEPENDS_append_ti33x = " pruss-lld-rtos \
+"
+DEPENDS_append_ti43x = " pruss-lld-rtos \
+"
+DEPENDS_append_am57xx-evm = " pruss-lld-rtos \
+"
+INSANE_SKIP_${PN} = "arch"
-- 
1.9.1


