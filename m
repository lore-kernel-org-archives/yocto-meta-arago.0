Return-Path: <karthik.ramanan@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 934AF529A7
	for <meta-arago@arago-project.org>;
	Mon,  6 Jul 2015 14:03:54 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t66E3qs0013961
	for <meta-arago@arago-project.org>; Mon, 6 Jul 2015 09:03:52 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t66E3qDU003981
	for <meta-arago@arago-project.org>; Mon, 6 Jul 2015 09:03:52 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 6 Jul 2015 09:03:40 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t66E3p6E002731;
	Mon, 6 Jul 2015 09:03:51 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 6 Jul 2015 19:33:46 +0530
Message-ID: <1436191426-792-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [for daisy, master] glsdk-example-apps: Feature additions and bug fixes
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
X-List-Received-Date: Mon, 06 Jul 2015 14:03:56 -0000
Content-Type: text/plain

 * Update SRCREV for support for more demuxes in gsttestplayer
 * Add support for fractional frame rates

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../glsdk-example-apps/glsdk-example-apps.bb       |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
index fb59d6a..887450f 100644
--- a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
+++ b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
@@ -12,6 +12,6 @@ S = "${WORKDIR}/git"
 inherit autotools pkgconfig
 
 SRC_URI = "git://git.ti.com/glsdk/example-applications.git;protocol=git"
-SRCREV = "ac71e62ec2bd4c94cd73f24fcf0fc8f4f2876dc8"
+SRCREV = "adae69a898c21bf6a905d4fb32a977713149bbd8"
 
-PR = "r3"
+PR = "r11"
-- 
1.7.9.5


