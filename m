Return-Path: <h-gou@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id AB9BD52A1C
	for <meta-arago@arago-project.org>;
	Mon,  3 Jun 2019 19:26:40 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x53JQ3A2113947
	for <meta-arago@arago-project.org>; Mon, 3 Jun 2019 14:26:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1559589963;
	bh=P6CGuhtaOaINIJ2uNS20T4EHmcHlHX+FmGx3IVQ+1PE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=hhb/L0SOl9/BN/TTZ7VW+ECNqNggrxLfk+Ny4aYIbRMQR52t5eLQc8LHfpDexmBJG
	5gwPVVSALZJtg4YK/5VPKX2xTrSTBNLQVbDmu/VxMGwG8QPNKLl0gbK6+FR2AGNth2
	abhTPrAO/AWEZGYRaIlEgMG/zAHNpPmX96o3Ad2M=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x53JQ2dA107719
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 3 Jun 2019 14:26:03 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 3 Jun 2019 14:26:02 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 3 Jun 2019 14:26:02 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x53JQ0cA100439;
	Mon, 3 Jun 2019 14:26:02 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 3 Jun 2019 15:24:23 -0400
Message-ID: <20190603192424.23922-6-h-gou@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190603192424.23922-1-h-gou@ti.com>
References: <20190603192424.23922-1-h-gou@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master] [PATCH 5/6] arago-source-ipk: include source for pdm-anomaly-detection
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
X-List-Received-Date: Mon, 03 Jun 2019 19:26:46 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-source-ipk.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
index 7fc3a3a2..2a48dfb3 100644
--- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
+++ b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
@@ -76,6 +76,9 @@ SRCIPK_INSTALL_DIR_pn-protection-relays-hmi = "example-applications/${PN}-${PV}"
 CREATE_SRCIPK_pn-mmwavegesture-hmi = "1"
 SRCIPK_INSTALL_DIR_pn-mmwavegesture-hmi = "example-applications/${PN}-${PV}"
 
+CREATE_SRCIPK_pn-pdm-anomaly-detection = "1"
+SRCIPK_INSTALL_DIR_pn-pdm-anomaly-detection = "example-applications/${PN}-${PV}"
+
 CREATE_SRCIPK_pn-image-gallery = "1"
 SRCIPK_INSTALL_DIR_pn-image-gallery = "example-applications/${PN}"
 
-- 
2.17.1


