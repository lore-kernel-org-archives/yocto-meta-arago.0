Return-Path: <h-gou@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 2E3E252A65
	for <meta-arago@arago-project.org>;
	Fri, 22 Sep 2017 16:34:20 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8MGYAXX011675
	for <meta-arago@arago-project.org>; Fri, 22 Sep 2017 11:34:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506098050;
	bh=uqswuG8GiScFw9wW8DmdSWciAKfF7oSiNhfP8vnpVr8=;
	h=From:To:CC:Subject:Date;
	b=g5RoodwfKd/0NCJmF7Gh5ejP+QWdLSx/WkG1vnIEoHTIQpb93D19QMaVZ+xtY3i1L
	joCz3hgciqfAvTIFzBK/Bc2xf6aC5YaBcLOdWwZZSIihXitAEPNPMqOGHq2O9b5G3k
	R5ryq2EUEzs50CJfporVw5HglM4xaVNhJUQIIbrA=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8MGY5Wh015429
	for <meta-arago@arago-project.org>; Fri, 22 Sep 2017 11:34:05 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 22 Sep 2017 11:34:04 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 22 Sep 2017 11:34:04 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8MGY4af017370;
	Fri, 22 Sep 2017 11:34:04 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 22 Sep 2017 12:34:01 -0400
Message-ID: <1506098041-19036-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processsor-sdk] [PATCH] prueth-fw: update the firmwares to 5.1.4
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
X-List-Received-Date: Fri, 22 Sep 2017 16:34:20 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-bsp/prueth-fw/prueth-fw_git.bbappend | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 recipes-bsp/prueth-fw/prueth-fw_git.bbappend

diff --git a/recipes-bsp/prueth-fw/prueth-fw_git.bbappend b/recipes-bsp/prueth-fw/prueth-fw_git.bbappend
new file mode 100644
index 0000000..6e8ca3e
--- /dev/null
+++ b/recipes-bsp/prueth-fw/prueth-fw_git.bbappend
@@ -0,0 +1,4 @@
+PV = "5.1.4"
+PR = "r0"
+
+SRCREV = "b9d9e4bef2f32d4b55a63ecfec2e21f7b1eaaa34"
-- 
1.9.1


