Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 9B4F652985
	for <meta-arago@arago-project.org>;
	Wed,  1 Aug 2018 19:03:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w71J3gd4102144
	for <meta-arago@arago-project.org>; Wed, 1 Aug 2018 14:03:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1533150222;
	bh=8bELYGC5ZnYxAUZWD2wD8VgSDe9qalMBnRdcEZQy7tw=;
	h=From:To:CC:Subject:Date;
	b=SOIk370D2SucEW6CIfxQFoLAjrPZ9E3/na3MAXHPz+tNuyg3z7uY9tZfO4hUjoIKY
	OpZp2nQzGobPUEr5xHLxkDZ0yIOfu2RGTJpYHf/QqkgwncyX+ve//y0t0UeHBHsFCD
	evE7eR4fYUoTag3pSsgSWsZdIFZt/HQ2MHFSyDnQ=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w71J3g7t001408
	for <meta-arago@arago-project.org>; Wed, 1 Aug 2018 14:03:42 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 1 Aug 2018 14:03:42 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 1 Aug 2018 14:03:42 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w71J3gHq001227;
	Wed, 1 Aug 2018 14:03:42 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 1 Aug 2018 19:01:36 +0000
Message-ID: <20180801190136.10332-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] branding-bleeding: AUTOREV u-boot-k3-r5 for nightlies
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
X-List-Received-Date: Wed, 01 Aug 2018 19:03:49 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/branding-bleeding.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/conf/distro/include/branding-bleeding.inc b/meta-arago-distro/conf/distro/include/branding-bleeding.inc
index 6ecf6286..a1913b11 100644
--- a/meta-arago-distro/conf/distro/include/branding-bleeding.inc
+++ b/meta-arago-distro/conf/distro/include/branding-bleeding.inc
@@ -7,6 +7,7 @@ SRCREV_pn-linux-ti-staging = "${AUTOREV}"
 SRCREV_pn-linux-ti-staging-rt = "${AUTOREV}"
 SRCREV_pn-linux-ti-staging-systest = "${AUTOREV}"
 SRCREV_pn-u-boot-ti-staging = "${AUTOREV}"
+SRCREV_pn-u-boot-k3-r5 = "${AUTOREV}"
 SRCREV_pn-ltp-ddt = "${AUTOREV}"
 
 # Build and assemble TI-SDK, but don't package it
-- 
2.17.1


