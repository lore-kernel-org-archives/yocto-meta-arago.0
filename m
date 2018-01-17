Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id EB26E52A90
	for <meta-arago@arago-project.org>;
	Wed, 17 Jan 2018 14:17:42 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w0HEHRQE025110
	for <meta-arago@arago-project.org>; Wed, 17 Jan 2018 08:17:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1516198647;
	bh=yFiH295uuSmswybiK4BbSjC0oefnc3X2SFQ355LkpLg=;
	h=From:To:Subject:Date;
	b=hVa1aY1LboXzZK8WAcEcP4w8qyA7A/rDGuhK/UYOGLnjR/kR09G0BK06ic7eNnYtz
	FGWrmcujk3PfFGUkVq3P/qOqMT6GxElJcVYKKChqlcCY4yj8d2UySxVL3iDJwiF9A+
	0ZBAhWRH3FWBFjgLB3hVLs+xYp1WYK05J6EtyfIQ=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0HEHRfY008057
	for <meta-arago@arago-project.org>; Wed, 17 Jan 2018 08:17:27 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 17 Jan 2018 08:17:26 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Wed, 17 Jan 2018 08:17:26 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0HEHQ0O031640
	for <meta-arago@arago-project.org>; Wed, 17 Jan 2018 08:17:26 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 17 Jan 2018 09:17:18 -0500
Message-ID: <1516198638-17156-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH v2] branding-processor-sdk.inc: Excluding am57x SOC targets for dra7xx PDK
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
X-List-Received-Date: Wed, 17 Jan 2018 14:17:43 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

 v2 - Fixed TI_LIMIT_SOCS change to apply only for dra7xx-evm

 conf/distro/include/branding-processor-sdk.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/distro/include/branding-processor-sdk.inc b/conf/distro/include/branding-processor-sdk.inc
index ff127d4..0803ba1 100644
--- a/conf/distro/include/branding-processor-sdk.inc
+++ b/conf/distro/include/branding-processor-sdk.inc
@@ -106,5 +106,5 @@ SRCIPK_CUSTOM_GIT_MESSAGE_pn-u-boot-ti-staging = "${SRCIPK_GIT_COMMIT_MESSAGE}"
 TI_PDK_LIMIT_SOCS_append_am57xx-evm = " am574x"
 TI_PDK_LIMIT_BOARDS_append_am57xx-evm = " idkAM574x"
 
-TI_PDK_LIMIT_SOCS = "dra72x dra75x dra78x"
+TI_PDK_LIMIT_SOCS_dra7xx-evm = "dra72x dra75x dra78x"
 
-- 
1.9.1


