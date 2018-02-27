Return-Path: <d-senicic1@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 56B9752976
	for <meta-arago@arago-project.org>;
	Tue, 27 Feb 2018 18:51:24 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w1RIooFa023073
	for <meta-arago@arago-project.org>; Tue, 27 Feb 2018 12:50:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1519757450;
	bh=w5oOPOFtAlotLTznAvuOxec6/qo9rm4jZjii4wFzXwQ=;
	h=From:To:CC:Subject:Date;
	b=IoE5O4aRir8aJr1gObheQ12DQMUKsgrEjcypGzvkWEtDSGxzREJ6+Ni9aSudawSfQ
	QIrJiHu/evQwomrOUNf8AF+aO1MS3QmdJAfTqVxiRXmCuKdgvqWl95kQNtcVjY5qg6
	jENRqqqFjf7ShSP4QP69oTEw1lilSisDCVTsdbRw=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1RIoo2V017402
	for <meta-arago@arago-project.org>; Tue, 27 Feb 2018 12:50:50 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 27 Feb 2018 12:50:49 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 27 Feb 2018 12:50:49 -0600
Received: from UDA0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1RIomRf032195;
	Tue, 27 Feb 2018 12:50:49 -0600
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 27 Feb 2018 13:50:40 -0500
Message-ID: <1519757440-25574-1-git-send-email-x0157990@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [meta-processor-sdk] [PATCH] tiovx-app: Fix memory map for DSP firmware
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
X-List-Received-Date: Tue, 27 Feb 2018 18:51:26 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 recipes-ti/tiovx/tiovx-sys.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-ti/tiovx/tiovx-sys.inc b/recipes-ti/tiovx/tiovx-sys.inc
index fc24947..43c4e1d 100644
--- a/recipes-ti/tiovx/tiovx-sys.inc
+++ b/recipes-ti/tiovx/tiovx-sys.inc
@@ -1,5 +1,5 @@
 PV = "01.00.00.00"
 
 BRANCH="master"
-SRCREV = "c208217c5c3788c78d10ff0d25e5db9782e00be9"
+SRCREV = "375fa639773970e433171686f01f360a9a5b2ad4"
 SRC_URI = "git://git.ti.com/processor-sdk/tiovx-app.git;protocol=git;branch=${BRANCH}"
-- 
1.9.1


