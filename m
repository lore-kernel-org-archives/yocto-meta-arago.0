Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id BC210529E7
	for <meta-arago@arago-project.org>;
	Tue, 18 Jun 2019 15:01:52 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5IF1B5g035612
	for <meta-arago@arago-project.org>; Tue, 18 Jun 2019 10:01:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560870071;
	bh=lAL43pp/Pii2pT73s/Bgq5gnwADzSyqguKoTtG9vZxA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Z8Och8CpDXul3V34qrQI37gm10HWJxStdu5EEYTHnHJ+8ru6YNcpaC1pBH85s+vIb
	2hf4Uh1Wd3BC+FxIk96r58THtjxFKwWtrYmL6VVhL5VapT8QroD1Q0azppDMegw1QW
	S6h0zV9HgsAn+kODVw4JPEHDbWusy1QVFxyZvcWk=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5IF1BTP040230
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 18 Jun 2019 10:01:11 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 18 Jun 2019 10:01:10 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 18 Jun 2019 10:01:10 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5IF18Om067158;
	Tue, 18 Jun 2019 10:01:10 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 18 Jun 2019 10:45:01 -0400
Message-ID: <1560869103-4803-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560869103-4803-1-git-send-email-j-stiffler@ti.com>
References: <1560869103-4803-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: a-kramer@ti.com
Subject: [meta-processor-sdk][PATCH 2/4] net-snmp: use bb.utils.contains() instead of base_contains()
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
X-List-Received-Date: Tue, 18 Jun 2019 15:01:53 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-protocols/net-snmp/net-snmp_5.7.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-protocols/net-snmp/net-snmp_5.7.3.bb b/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
index 849ae07..0a41b6d 100644
--- a/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
+++ b/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
@@ -60,7 +60,7 @@ EXTRA_OECONF = "--enable-shared \
                 --with-defaults \
                 --with-install-prefix=${D} \
                 --with-persistent-directory=${localstatedir}/lib/net-snmp \
-                ${@base_conditional('SITEINFO_ENDIANNESS', 'le', '--with-endianness=little', '--with-endianness=big', d)} \
+                ${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', '--with-endianness=little', '--with-endianness=big', d)} \
 "
 
 # net-snmp needs to have mib-modules=smux enabled to enable quagga to support snmp
-- 
2.7.4


