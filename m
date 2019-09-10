Return-Path: <e-ruei1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 5357C5299C
	for <meta-arago@arago-project.org>;
	Tue, 10 Sep 2019 18:15:04 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8AIDx1f098036
	for <meta-arago@arago-project.org>; Tue, 10 Sep 2019 13:13:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568139239;
	bh=AEQmJp4qJUT09dsr0y2G7o6EB6KjFki9dEb44NKrwMo=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ePfGayMEzWyqW5gS2lyx2MR+k2iT02rRBSUCYhUKT330nr29zmQ7fUy646JQHyere
	2PVCml8xxmBZKpIwJ7d5vFwAn3460+e2khlk8QpJR0OeWZDTbinRu4BYLYLh8sFSJX
	VxxLHWOs42PQi3MqqgQXdFX/zVnuuUarDsc7dAv8=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8AIDxVW046519
	for <meta-arago@arago-project.org>; Tue, 10 Sep 2019 13:13:59 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 10 Sep 2019 13:13:58 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 10 Sep 2019 13:13:58 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8AIDuo3035961
	for <meta-arago@arago-project.org>; Tue, 10 Sep 2019 13:13:58 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 10 Sep 2019 14:11:31 -0400
Message-ID: <20190910181131.8808-10-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190910181131.8808-1-e-ruei1@ti.com>
References: <20190910181131.8808-1-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH 9/9] HACK: ti-sgx-ddk-um: take AM5 binaries from mesa-egl based experimental branch
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
X-List-Received-Date: Tue, 10 Sep 2019 18:15:08 -0000
Content-Type: text/plain

Take AM5 binaries from mesa-egl based experimental branch for early
engineering integration.

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../ti-sgx-ddk-um_1.17.4948957.bbappend       | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bbappend

diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bbappend b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bbappend
new file mode 100644
index 0000000..313f9c4
--- /dev/null
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bbappend
@@ -0,0 +1,21 @@
+PR_append = ".tisdk1"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+BRANCH = "dev/thud/${PV}-egl-experimental"
+SRCREV = "0f76ac03750a4f6c09290abf6b9fced696ca192d"
+
+RPROVIDES_${PN} += "libGLES_CM.so.1"
+
+S = "${WORKDIR}/git"
+
+do_install_append () {
+    ln -sf libGLESv2.so.2 ${D}${libdir}/libGLESv2.so.1
+    ln -sf libGLESv1_CM.so ${D}${libdir}/libGLES_CM.so.1
+    ln -sf libGLESv1_CM.so ${D}${libdir}/libGLES_CM.so
+
+    rm -rf ${D}${includedir}/GL
+}
+
+FILES_${PN}-plugins = "${libdir}/libsrv_init.so ${libdir}/libsrv_um.so ${libdir}/libglslcompiler.so ${libdir}/libPVRScopeServices.so ${libdir}/libGLESv2.so ${libdir}/libEGL.so ${libdir}/libGLESv1_CM.so ${libdir}/libGLES_CM.so ${libdir}/libGLESv1_PVR_MESA.so ${libdir}/libGLESv2_PVR_MESA.so"
+
-- 
2.17.1


