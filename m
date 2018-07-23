Return-Path: <d-senicic1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id F065052978
	for <meta-arago@arago-project.org>;
	Mon, 23 Jul 2018 18:46:36 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6NIkTOP120072
	for <meta-arago@arago-project.org>; Mon, 23 Jul 2018 13:46:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532371590;
	bh=7CQhQAeBWxyCGv7nWfSlCtspgUs/0LgT9yq7cCQkSbU=;
	h=From:To:CC:Subject:Date;
	b=UyKmHE/J7lY56T6u3b6u6b1cC/SwJmQtOCbu4OeR1EaZLxPC+YLKnPJsBlmu+AeRt
	c3A0zfYGvaASRugqgYIClRGzHGYgeaIZATl4EmqtECk36xHrsvt9QogbHUALvQ02GS
	yzyohgNFq5/VRe+RqhvIXFQVr8tf/3J0Y4ISwNec=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6NIkTVm018987
	for <meta-arago@arago-project.org>; Mon, 23 Jul 2018 13:46:29 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 23 Jul 2018 13:46:29 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 23 Jul 2018 13:46:29 -0500
Received: from UDA0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6NIkTQg005259;
	Mon, 23 Jul 2018 13:46:29 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 23 Jul 2018 14:46:26 -0400
Message-ID: <1532371586-669-1-git-send-email-x0157990@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [rocko/master][PATCH] tidl-utils: SRCREV bump
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
X-List-Received-Date: Mon, 23 Jul 2018 18:46:37 -0000
Content-Type: text/plain

* SRC rev increase to include fixed paths of configuration files

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
index 264b030..e4fb600 100644
--- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
+++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE.txt;md5=a93aa5af7a3bbbb6fb34c8df59efaa5c
 RDEPENDS_${PN} += " tidl-api tidl-examples "
 
 SRC_URI = "git://git.ti.com/tidl/tidl-utils.git;protocol=git;branch=master"
-SRCREV = "93f66d2c53960b13b7e7f20208ee205f727aaf28"
+SRCREV = "994d90ae583610673d9d39086ca5e84027a9c56e"
 
 PR = "${INC_PR}.0"
 
-- 
1.9.1


