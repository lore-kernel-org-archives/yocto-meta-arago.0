Return-Path: <e-ruei1@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 43D7952ABD
	for <meta-arago@arago-project.org>;
	Fri, 29 Sep 2017 18:23:35 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8TINYsl007529
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506709414;
	bh=MKR4jQNztnY93hjnnVZI0kbSYESfYlXfoXXHOi1eW9Y=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Qng9Xmwkk+26Q1JHOAz98cZRGMUHCaj74VEq3xZIw+oZ1wQJt0g1XK8PHswpROal7
	BIMObWpFvXIMWbyk6H4orkb2PgF5k6SdekrWcKFMrMCyVe9Y5lwmoJDWogaci31Eff
	2gAEU4ym7HiH1qMuzB8nJVFsbEZ22RCaTI+tSuLk=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8TINY5Q010231
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:34 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 29 Sep 2017 13:23:34 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 29 Sep 2017 13:23:34 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8TINW8W006890
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:34 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Sep 2017 14:23:11 -0400
Message-ID: <1506709407-16448-8-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1506709407-16448-1-git-send-email-e-ruei1@ti.com>
References: <1506709407-16448-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][morty-x11-experimental][PATCH 07/img-pvr-sdk: add X11 demo programs for X11 build
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
X-List-Received-Date: Fri, 29 Sep 2017 18:23:39 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../img-pvr-sdk/img-pvr-sdk_3.3.2.bbappend            | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bbappend

diff --git a/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bbappend b/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bbappend
new file mode 100644
index 0000000..e729d84
--- /dev/null
+++ b/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bbappend
@@ -0,0 +1,19 @@
+PR_append = ".tisdk0"
+
+BRANCH = "${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'experimental', 'master', d)}"
+SRCREV = "${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', '099620ad69301796887f382471208741b4cf831b', 'd19016b30d99973135e03c48978a0b88983b4b0d', d)}"
+
+do_install_append () {
+
+    if [ "${@bb.utils.contains('MACHINE_FEATURES','xsgx','true','false',d)}" = "true" ]; then
+
+       install -d ${D}${bindir}/SGX/demos/X11/
+
+       install -m 755 ${S}/targetfs/Examples/Advanced/X11/OGLES2ChameleonMan ${D}${bindir}/SGX/demos/X11/
+       install -m 755 ${S}/targetfs/Examples/Advanced/X11/OGLES2Coverflow ${D}${bindir}/SGX/demos/X11/
+       install -m 755 ${S}/targetfs/Examples/Advanced/X11/OGLES2ExampleUI ${D}${bindir}/SGX/demos/X11/
+       install -m 755 ${S}/targetfs/Examples/Advanced/X11/OGLES2Navigation ${D}${bindir}/SGX/demos/X11/
+       install -m 755 ${S}/targetfs/Examples/Advanced/X11/OGLES2MagicLantern ${D}${bindir}/SGX/demos/X11/
+       install -m 755 ${S}/targetfs/Examples/Advanced/X11/OGLES2FilmTV ${D}${bindir}/SGX/demos/X11/
+    fi
+}
-- 
1.9.1


