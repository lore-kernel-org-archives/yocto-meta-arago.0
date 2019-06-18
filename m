Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id AE41E529E7
	for <meta-arago@arago-project.org>;
	Tue, 18 Jun 2019 15:01:53 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5IF1C56035617
	for <meta-arago@arago-project.org>; Tue, 18 Jun 2019 10:01:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560870072;
	bh=nIO53zcXCEtOGk3TvcU9rHHnS2tPQFal2wQ3kHZx4Ds=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=OsBLJxEz/7y8PDSOAE5KM5LyHoyzy/bIn2NhVxYytL8/1sLAMDYGJrK65oBIWYE0H
	o6NjhLoWYf7TDJfWSc57xCJ3XSZRV0Vp8Ct4pXylkxR16FH3IvJkgcAyyPqUiWcQsW
	QEIEgqQmg/V7F0c9ZazmRHSDcG8VgjS0s62+feNY=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5IF1CTa011594
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 18 Jun 2019 10:01:12 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 18 Jun 2019 10:01:12 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 18 Jun 2019 10:01:12 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5IF18On067158;
	Tue, 18 Jun 2019 10:01:12 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 18 Jun 2019 10:45:02 -0400
Message-ID: <1560869103-4803-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560869103-4803-1-git-send-email-j-stiffler@ti.com>
References: <1560869103-4803-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: a-kramer@ti.com
Subject: [meta-processor-sdk][PATCH 3/4] net-snmp: use openssl 1.0
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
X-List-Received-Date: Tue, 18 Jun 2019 15:01:54 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-protocols/net-snmp/net-snmp_5.7.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-protocols/net-snmp/net-snmp_5.7.3.bb b/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
index 0a41b6d..d9d1740 100644
--- a/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
+++ b/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD"
 
 LIC_FILES_CHKSUM = "file://README;beginline=3;endline=8;md5=7f7f00ba639ac8e8deb5a622ea24634e"
 
-DEPENDS = "openssl libnl pciutils"
+DEPENDS = "openssl10 libnl pciutils"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.zip \
            file://init \
-- 
2.7.4


