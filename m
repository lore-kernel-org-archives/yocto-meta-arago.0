Return-Path: <g-tammana@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 7A719520EA
	for <meta-arago@arago-project.org>;
	Fri, 30 Oct 2020 19:09:26 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09UJ6JcT082737
	for <meta-arago@arago-project.org>; Fri, 30 Oct 2020 14:06:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1604084779;
	bh=HVqmywE5YYs0UqlTEFQ1fQKm8pmpi976c/psH2KZ4H4=;
	h=From:To:CC:Subject:Date;
	b=NHjZg5XhJJUTSb2BnalF26FKPH2Czoefmr+hNNfoBNsRjVLXSw+09iIvxCP5oGs+O
	raXkNmUz2Kjh2CrFBANF4a0G2KQ3Aj4MQiAoSO92ZLPeNmLOOut2xAVYn07gMmQfBC
	6w9rseWtRPK3lV7LxKLlIELdAGxBTbCEwLVlGnfI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09UJ6Jlr092950
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 30 Oct 2020 14:06:19 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Fri, 30 Oct 2020 14:06:19 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Fri, 30 Oct 2020 14:06:18 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09UJ6IUq031054;
	Fri, 30 Oct 2020 14:06:18 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.81.224] (may be forged))
	by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 09UJ6Iki122717;
	Fri, 30 Oct 2020 14:06:18 -0500
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Dan Murphy <dmurphy@ti.com>, Denys
	Dmytriyenko <denys@ti.com>
Date: Fri, 30 Oct 2020 14:06:16 -0500
Message-ID: <20201030190616.1037-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [dunfell/master][PATCH] layer.conf: add socket to the hosttools
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
X-List-Received-Date: Fri, 30 Oct 2020 19:09:26 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

`socket` can be used in proxy scripts, add it to the nonfatal host
tools.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 meta-arago-distro/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
index 9281ceb5..2931bf9d 100644
--- a/meta-arago-distro/conf/layer.conf
+++ b/meta-arago-distro/conf/layer.conf
@@ -39,4 +39,4 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
     cryptodev-module \
 "
 
-HOSTTOOLS_NONFATAL += "corkscrew getent"
+HOSTTOOLS_NONFATAL += "corkscrew getent socket"
-- 
2.17.1


