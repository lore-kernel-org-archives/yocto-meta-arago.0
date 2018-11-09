Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 639CC52992
	for <meta-arago@arago-project.org>;
	Fri,  9 Nov 2018 17:09:03 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wA9H8rHh028787
	for <meta-arago@arago-project.org>; Fri, 9 Nov 2018 11:08:53 -0600
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wA9H8rFO008520
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 9 Nov 2018 11:08:53 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 9 Nov 2018 11:08:53 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 9 Nov 2018 11:08:53 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wA9H8qoC029532;
	Fri, 9 Nov 2018 11:08:53 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 9 Nov 2018 11:56:24 -0500
Message-ID: <1541782587-24044-4-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1541782587-24044-1-git-send-email-j-stiffler@ti.com>
References: <1541782587-24044-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 3/6] arago-source-ipk: enable srcipk of sysfw-image-gen
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
X-List-Received-Date: Fri, 09 Nov 2018 17:09:06 -0000
Content-Type: text/plain

* This is is onyl provided within the k3 recipe, so only enable for
  k3.
* This will be used to rebuild the sysfw.itb

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-source-ipk.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
index 30a4739..0ec3138 100644
--- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
+++ b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
@@ -375,3 +375,7 @@ SRCIPK_INSTALL_DIR_pn-vlib-c66x = "component-sources/vlib_c66x_${PV}"
 
 CREATE_SRCIPK_pn-big-data-ipc-demo-linux = "1"
 SRCIPK_INSTALL_DIR_pn-big-data-ipc-demo-linux = "example-applications/${PN}-${PV}"
+
+CREATE_SRCIPK_pn-ti-sci-fw_k3 = "1"
+SRCIPK_SRC_DIR_pn-ti-sci-fw_k3 = "${WORKDIR}/imggen"
+SRCIPK_INSTALL_DIR_pn-ti-sci-fw_k3 = "board-support/system-firmware-image-gen-${PV}"
-- 
2.7.4


