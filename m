Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 944FA520DF
	for <meta-arago@arago-project.org>;
	Wed, 21 Aug 2019 18:49:21 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7LImLnX044378
	for <meta-arago@arago-project.org>; Wed, 21 Aug 2019 13:48:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1566413301;
	bh=1D6+/p4fjXCTtwy3MZ+0HNLqZqThOy+2tOqmofBUqCE=;
	h=From:To:CC:Subject:Date;
	b=S6Z1HL4NMGbyDTvsnEAT6dnJw+8WPMPo3wvSzk9VFhX7N2eD2GCOnJZMOutFH4BxG
	T/emVYwQNHGFXHWOYSvak8+jiMC66CqdpEBH5SO0zycPYCjdtEEaduqfl1WAFZitHd
	5iK/1UeTofxTCFyIOi0XI9mVZ4P0AVmZlfvYqyYo=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7LImL6E065398
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 21 Aug 2019 13:48:21 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 21 Aug 2019 13:48:21 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 21 Aug 2019 13:48:21 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7LImK3R110312;
	Wed, 21 Aug 2019 13:48:21 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 21 Aug 2019 14:31:41 -0400
Message-ID: <1566412303-27982-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH 1/3] arago-src-ipkd: configure jailhouse sourceipk
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
X-List-Received-Date: Wed, 21 Aug 2019 18:49:22 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-source-ipk.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
index fd60d55..6e56c77 100644
--- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
+++ b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
@@ -388,3 +388,6 @@ SRCIPK_INSTALL_DIR_pn-big-data-ipc-demo-linux = "example-applications/${PN}-${PV
 CREATE_SRCIPK_pn-ti-sci-fw_k3 = "1"
 SRCIPK_SRC_DIR_pn-ti-sci-fw_k3 = "${WORKDIR}/imggen"
 SRCIPK_INSTALL_DIR_pn-ti-sci-fw_k3 = "board-support/system-firmware-image-gen-${PV}"
+
+CREATE_SRCIPK_pn-jailhouse = "1"
+SRCIPK_INSTALL_DIR_pn-jailhouse = "board-support/extra-drivers/${PN}-${PV}"
-- 
2.7.4


