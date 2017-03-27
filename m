Return-Path: <e-ruei1@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 6911552090
	for <meta-arago@arago-project.org>;
	Mon, 27 Mar 2017 21:26:44 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2RLQigJ020771
	for <meta-arago@arago-project.org>; Mon, 27 Mar 2017 16:26:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1490650004;
	bh=w3czAhAtIeVZdD1k5DWo6Pu0ry3SHtEe/CKIOdOXUQo=;
	h=From:To:Subject:Date;
	b=N0C2iteHvLEl9uQOiPlbTcK0KPicrIWO0D4K9pRQ6M3O2l0CKw5ujN7wvtWi34DC3
	0wuvq2Iuxwyj1yD3eVe+wRSabGPT4g6+/Uc/F3PGTw2HxhPbWbW/sIDrCI6sUNgkSD
	plnqbHFeI4hjvmyQSOSDdcFUM30eSLg34DIrhyc8=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2RLQiS7026219
	for <meta-arago@arago-project.org>; Mon, 27 Mar 2017 16:26:44 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 27 Mar 2017 16:26:43 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v2RLQhnO013807	for <meta-arago@arago-project.org>;
	Mon, 27 Mar 2017 16:26:43 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 27 Mar 2017 17:26:39 -0400
Message-ID: <1490649999-28776-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [krogoth][PATCH] omapdrmtest: Update tests to handle disabled HDMI
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
X-List-Received-Date: Mon, 27 Mar 2017 21:26:45 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
index e08e8e3..d4b42a8 100644
--- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
@@ -7,7 +7,7 @@ DEPENDS += "libav libdce libdrm libgbm ti-sgx-ddk-um wayland"
 inherit autotools pkgconfig
 
 PR = "r19"
-SRCREV = "47bbb6b2ec48bbee35f9dc7192c05e48fd1a2589"
+SRCREV = "116c940c2b06b221c13be28bb79af49233ba462a"
 
 SRC_URI = "git://git.ti.com/glsdk/omapdrmtest.git;protocol=git \
 "
-- 
1.9.1


