Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 2F8B752090
	for <meta-arago@arago-project.org>;
	Mon, 27 Mar 2017 21:15:21 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2RLFBnr027574
	for <meta-arago@arago-project.org>; Mon, 27 Mar 2017 16:15:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1490649311;
	bh=2iYSHtZWPRWeGtXWnzWStErnBvmPwownCGhal1yhnbU=;
	h=From:To:Subject:Date;
	b=oV82l2fjF13vv7iUIz7Zfgiv6DWQz/5PIwJQHjGUEOIfKfLWrnJ17DoHlUX6X1G+c
	UwhFLymBpQEqJF7LM2wzxC3186lYh8R9vI+b8Vopdcj+vNM7vf62MSbGYM7/GQkt4s
	9VVcm5ltWN6Id443NBkgn7VEhvKQE7+vj00uCDgk=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2RLF47X012933
	for <meta-arago@arago-project.org>; Mon, 27 Mar 2017 16:15:06 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 27 Mar 2017 16:15:04 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v2RLF4fj003146	for <meta-arago@arago-project.org>;
	Mon, 27 Mar 2017 16:15:04 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 27 Mar 2017 17:15:01 -0400
Message-ID: <1490649301-28680-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [krogoth][PATCH] glsdk-example-apps: Include fix for HDMI testcases
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
X-List-Received-Date: Mon, 27 Mar 2017 21:15:21 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
index 94c1362..fc1ff46 100644
--- a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
+++ b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
@@ -14,7 +14,7 @@ inherit autotools pkgconfig
 SRC_URI = "git://git.ti.com/glsdk/example-applications.git;protocol=git \
 	 "
 
-SRCREV="8384727bef3368b95b690dd50e6735c9344a8590"
+SRCREV="f7562ecf76c559972205d7faaa3b50bdb43de238"
 
 PR = "r47"
 
-- 
1.9.1


