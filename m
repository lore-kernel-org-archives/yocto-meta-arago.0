Return-Path: <h-gou@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 7C343529A0
	for <meta-arago@arago-project.org>;
	Mon, 19 Mar 2018 18:37:04 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2JIa5cG026076
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 13:36:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521484565;
	bh=HYGXFPeyajYPN6yX3SwAfHcD3XIfw6TxDqmImYSFNtM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=aMM6JJ6yDePw6wQnF7twM5D4JR6Ofp6oy35PIK2WLFtiwH2URl2ybcwtLZIhmtNwr
	XSXZFYeF4KtCRBd58Y/sAGckTnfGl+ZnXXf2bpsrSEpV8T4XNf69jqeQl+iyvVNqvS
	8m/P4QkYV6LvlHTwM/LkX51LlU+8AtNOYHfknR5w=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JIa5kR010003
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 13:36:05 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 19 Mar 2018 13:36:05 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 19 Mar 2018 13:36:05 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JIa4S9009580;
	Mon, 19 Mar 2018 13:36:05 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 Mar 2018 14:35:37 -0400
Message-ID: <1521484541-8104-3-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521484541-8104-1-git-send-email-a0271529@ti.com>
References: <1521484541-8104-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 2/6] [PATHC] tiovx-app-host: create SRCIPK
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
X-List-Received-Date: Mon, 19 Mar 2018 18:37:05 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-ti/tiovx/tiovx-app-host.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/recipes-ti/tiovx/tiovx-app-host.bb b/recipes-ti/tiovx/tiovx-app-host.bb
index c45c4b8..eb312b3 100644
--- a/recipes-ti/tiovx/tiovx-app-host.bb
+++ b/recipes-ti/tiovx/tiovx-app-host.bb
@@ -10,7 +10,7 @@ require tiovx-sys.inc
 DEPENDS = " tiovx-sys-iface tiovx-lib-host ti-ipc cmem opencv"
 RDEPENDS_${PN} = " tiovx-sys-iface tiovx-sys-iface-firmware tiovx-lib-host ti-ipc cmem "
 
-PR = "r0"
+PR = "r1"
 
 COMPATIBLE_MACHINE = "dra7xx"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -30,5 +30,8 @@ do_install () {
     install -m 0755 ${S}/khronos_example/bin/debug/opticalflow ${D}${bindir}/tiovx-opticalflow
 }
 
+CREATE_SRCIPK = "1"
+SRCIPK_INSTALL_DIR = "example-applications/${PN}-${PV}"
+
 FILES_${PN} += "${bindir}/*"
 INSANE_SKIP_${PN} = "ldflags"
-- 
1.9.1


