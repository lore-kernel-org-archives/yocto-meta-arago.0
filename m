Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 18B6C529B8
	for <meta-arago@arago-project.org>;
	Tue, 11 Jun 2019 16:23:31 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5BGMqks063727
	for <meta-arago@arago-project.org>; Tue, 11 Jun 2019 11:22:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560270172;
	bh=NH/0HqzCnqXcsG/s1+qbt2Q4XJBEO1fE9G6zyMVKJ/k=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=KmyEA6GGsRYhymxpsEWoEESRIX6eb+UKQbMi363iPYYi5/2BbTpY4PG+iCt2HIQAe
	50Pz90JkZbcqdWlE+xMNIJegBDauleaTBuIz8bh4SSTO56wxFqu6W+3bR42uyMxuby
	zV5SfYapb01Wk5yGXwjgetqTHsns/03E7VhYLYzE=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5BGMqv6074567
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 11 Jun 2019 11:22:52 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 11 Jun 2019 11:22:51 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 11 Jun 2019 11:22:51 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5BGMo1A091888;
	Tue, 11 Jun 2019 11:22:51 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 11 Jun 2019 12:06:50 -0400
Message-ID: <1560269210-18241-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560269210-18241-1-git-send-email-j-stiffler@ti.com>
References: <1560269210-18241-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 2/2] tidl-utils: skip file-rdeps check
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
X-List-Received-Date: Tue, 11 Jun 2019 16:23:33 -0000
Content-Type: text/plain

* tidl-utils provides pre-built binaries, so skip file-rdeps.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
index 69b6e29..2d3d7ee 100644
--- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
+++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
@@ -36,4 +36,4 @@ FILES_${PN} += "${datadir}/ti/tidl/utils \
 
 BBCLASSEXTEND = "native nativesdk"
 
-INSANE_SKIP_${PN} += "build-deps ldflags already-stripped"
+INSANE_SKIP_${PN} += "build-deps ldflags already-stripped file-rdeps"
-- 
2.7.4


