Return-Path: <karthik.ramanan@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id B62685299D
	for <meta-arago@arago-project.org>;
	Mon, 31 Jul 2017 11:38:05 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6VBbtkr020317
	for <meta-arago@arago-project.org>; Mon, 31 Jul 2017 06:37:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1501501075;
	bh=SZs9MB+1LPWr9DvPfkYlrTcs5CkAsofzBJZyDJzFqIU=;
	h=From:To:CC:Subject:Date;
	b=Qgm74XdITogCKQ6qAeYi/ayGbpsxR6uOyu3cplE/mJ7GFAAmNyxRDWmEu+mw3XnZQ
	Q5D+7sEzDHCMb+ez0xJOfeNhN7QVniOHKslu/1kZ/uip30JZFilmN60RsWKzyZ6c9J
	mnHyCOymAgYorlmXipv6aTFkEMIHXfjVN4mXMWDc=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6VBboaJ016068
	for <meta-arago@arago-project.org>; Mon, 31 Jul 2017 06:37:50 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 31 Jul 2017 06:37:50 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6VBbmBG021052;
	Mon, 31 Jul 2017 06:37:49 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 31 Jul 2017 17:07:45 +0530
Message-ID: <1501501065-173557-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty] omapdrmtest: Update SRCREV
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
X-List-Received-Date: Mon, 31 Jul 2017 11:38:05 -0000
Content-Type: text/plain

This patch fixes the following:
 * viddec3test: Set correct padding width height for MPEG4
 * capturevpetest: update crop support
 * Compiler warning fixes

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
index 48b1f87..72330fd 100644
--- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
@@ -7,8 +7,8 @@ DEPENDS = "ffmpeg libdce libdrm libgbm ti-sgx-ddk-um wayland"
 
 inherit autotools pkgconfig
 
-PR = "r23"
-SRCREV = "7e63575f149d1a5a4a052d6211131676d4ccc655"
+PR = "r24"
+SRCREV = "6a2c2afc36348421e0d73300151ec675f58a893a"
 
 EXTRA_OEMAKE = "CC="${CC}""
 TARGET_CC_ARCH += "${LDFLAGS}"
-- 
1.9.1


