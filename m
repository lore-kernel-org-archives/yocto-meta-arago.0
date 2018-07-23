Return-Path: <d-senicic1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id DDD8F52A16
	for <meta-arago@arago-project.org>;
	Mon, 23 Jul 2018 19:54:57 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6NJsopr026067
	for <meta-arago@arago-project.org>; Mon, 23 Jul 2018 14:54:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532375690;
	bh=3Zk1jq4upwfDvsNJ+YxIYU36Kjou8ZbzK2GlK/4zMIo=;
	h=From:To:CC:Subject:Date;
	b=ZV8L36KEn3KgChy4uqd+dzsTwZUkrY3xXv/mNOHe2G/VuogI6zjf1BF1nfDvbkv0i
	cn7sbtOUxXepslcLJUNAC6rNJn5UOaVjDb1we+n5j8CgWaVhiysNAck06OPmUzormt
	QoEIA2CwmzjDEKqKW25chZcXWh90iQHyXtRM0T40=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6NJsoZ2003589
	for <meta-arago@arago-project.org>; Mon, 23 Jul 2018 14:54:50 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 23 Jul 2018 14:54:50 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 23 Jul 2018 14:54:50 -0500
Received: from UDA0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6NJso7W021668;
	Mon, 23 Jul 2018 14:54:50 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 23 Jul 2018 15:54:48 -0400
Message-ID: <1532375688-4054-1-git-send-email-x0157990@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [rocko/master][PATCHv2] tidl-utils: SRCREV bump
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
X-List-Received-Date: Mon, 23 Jul 2018 19:54:58 -0000
Content-Type: text/plain

* Get new version of tidl-utils configuration files with fixed path
* RDEPENDS is not needed for x86 target, as executables are statically linked

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
index 264b030..569de5a 100644
--- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
+++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
@@ -8,10 +8,10 @@ INC_PR = "r0"
 
 LIC_FILES_CHKSUM = "file://docs/LICENSE.txt;md5=a93aa5af7a3bbbb6fb34c8df59efaa5c"
 
-RDEPENDS_${PN} += " tidl-api tidl-examples "
+RDEPENDS_${PN}_class-target += " tidl-api tidl-examples "
 
 SRC_URI = "git://git.ti.com/tidl/tidl-utils.git;protocol=git;branch=master"
-SRCREV = "93f66d2c53960b13b7e7f20208ee205f727aaf28"
+SRCREV = "994d90ae583610673d9d39086ca5e84027a9c56e"
 
 PR = "${INC_PR}.0"
 
-- 
1.9.1


