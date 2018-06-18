Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id E0E4B52987
	for <meta-arago@arago-project.org>;
	Mon, 18 Jun 2018 23:15:29 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w5INFOnO001468
	for <meta-arago@arago-project.org>; Mon, 18 Jun 2018 18:15:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1529363724;
	bh=afLEtpXz+8FDPclKXAIliHYiXkxnHES1aFcnBpHepBQ=;
	h=From:To:CC:Subject:Date;
	b=rDc5mUIaEoQ9hI8MJJ17wtH8Y82NsEc0O8MBWGovVz+C8VqsZLzSU/aOitS1fAUu2
	qvuZKR+vpRL7RrmybcurCYJCrG5NpM151MT7FoEDJBaqoh1aprznCI9GO6lemLAI/n
	m8C7flphUROBKztTthlHQWsN6pGQHhoj8kVc86ts=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5INFO2K004626
	for <meta-arago@arago-project.org>; Mon, 18 Jun 2018 18:15:24 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 18 Jun 2018 18:15:23 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 18 Jun 2018 18:15:23 -0500
Received: from puget.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5INFNg9022777;
	Mon, 18 Jun 2018 18:15:23 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 18 Jun 2018 23:14:44 +0000
Message-ID: <20180618231444.8671-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko][PATCH] arago.conf: switch to rocko package feed
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
X-List-Received-Date: Mon, 18 Jun 2018 23:15:31 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 108bebba..616c440c 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -3,7 +3,7 @@ DISTRO_NAME = "Arago"
 DISTRO_VERSION = "2018.06"
 DISTRO_FEED_URI ?= "http://lcpd.gt.design.ti.com"
 BUILD_VARIANT = "${@['prod','rt','systest'][int(d.getVar('ARAGO_RT_ENABLE'))+int(d.getVar('ARAGO_SYSTEST_ENABLE'))*2]}"
-FEEDURIPREFIX ?= "packages/${DISTRO}-master/${BUILD_VARIANT}/"
+FEEDURIPREFIX ?= "packages/${DISTRO}-rocko/${BUILD_VARIANT}/"
 
 OPKG_ARGS_remove = "--prefer-arch-to-version"
 
-- 
2.17.1


