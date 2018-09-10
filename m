Return-Path: <h-gou@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 1EC0A52985
	for <meta-arago@arago-project.org>;
	Mon, 10 Sep 2018 19:08:56 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8AJ8mq3016959
	for <meta-arago@arago-project.org>; Mon, 10 Sep 2018 14:08:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536606528;
	bh=uDY4WfOLYHfhvc9quw+lE0OfnH+v9qnq2cGKQh3cmpM=;
	h=From:To:CC:Subject:Date;
	b=A57D6rrF8nUrYchwEij7SHc+10loVDpvK1z9TAILFa50iFhs8ZBrwGnFiFNgLWATq
	DNRK3v8L8cMQO/feSclNlcE4HBZQC7pc6fvhIM2za385hhye72XeqL5lZIXyAi2ZNS
	eNQmDsEauIiy/dOyOo+zCx6xu/69I4+x8dQfMiOc=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8AJ8mPX018862
	for <meta-arago@arago-project.org>; Mon, 10 Sep 2018 14:08:48 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 10 Sep 2018 14:08:47 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 10 Sep 2018 14:08:47 -0500
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8AJ8lQe031584;
	Mon, 10 Sep 2018 14:08:47 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 10 Sep 2018 15:08:44 -0400
Message-ID: <1536606525-450-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 1/2] [PATCH] pru-icss: add header files and lib to dev packages
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
X-List-Received-Date: Mon, 10 Sep 2018 19:08:56 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-bsp/pru/pru-icss_git.bbappend | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/recipes-bsp/pru/pru-icss_git.bbappend b/recipes-bsp/pru/pru-icss_git.bbappend
index cb56e38..88d5290 100644
--- a/recipes-bsp/pru/pru-icss_git.bbappend
+++ b/recipes-bsp/pru/pru-icss_git.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk0"
+PR_append = ".tisdk1"
 
 do_install_append() {
     install -d ${D}${includedir}
@@ -6,3 +6,6 @@ do_install_append() {
     install -d ${D}${libdir}
     cp ${S}/lib/rpmsg_lib.lib ${D}${libdir}
 }
+
+FILES_${PN}-staticdev = "${libdir}"
+FILES_${PN}-dev = "${includedir}"
-- 
1.9.1


