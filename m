Return-Path: <e-ruei1@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 4A3AD52A93
	for <meta-arago@arago-project.org>;
	Tue,  3 Oct 2017 15:54:17 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v93FsH9k012292
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507046057;
	bh=MKR4jQNztnY93hjnnVZI0kbSYESfYlXfoXXHOi1eW9Y=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=fmdGKX8dEMq2HpcozhimugydDfSVpWXGS1f0OAewiHJ4VZtsO5woum5s9xTpwE5D3
	1+tN1sl1C1MxzF75Bfn7QH0nw6eG8FwT002zSHIYrJdMYSqRYvI+mAUAZmfb4cR9Fn
	UvnL94u4PaC/SZMTTOWoxhavh3gCvjpKi5m/LSNU=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93FsHOr018672
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:17 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 3 Oct 2017 10:54:16 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 3 Oct 2017 10:54:16 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93FsFS4013524
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:16 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 3 Oct 2017 11:53:55 -0400
Message-ID: <1507046051-57949-8-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1507046051-57949-1-git-send-email-e-ruei1@ti.com>
References: <1507046051-57949-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v2 07/23] img-pvr-sdk: add X11 demo programs for X11 build
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
X-List-Received-Date: Tue, 03 Oct 2017 15:54:18 -0000
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


