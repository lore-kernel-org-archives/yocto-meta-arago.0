Return-Path: <e-ruei1@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id E430152A3C
	for <meta-arago@arago-project.org>;
	Tue,  6 Jun 2017 21:38:00 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v56Lc0L0021377
	for <meta-arago@arago-project.org>; Tue, 6 Jun 2017 16:38:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1496785080;
	bh=uGKwYY+ZnnXhG3yHPQH2/gBCf1/oWQHKPMrM1ip6Mqg=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=eQh9PYcdqAiTT6AFGj+5lHojN61ljPU/wche71SQH3hlIr9SpCG+3NIZpxnSkqAlN
	5Npdn5JYhcDvNJcp1BR+fSgUtAU0xIA84FLdHn5Ez1V6qVls9yEKN7nUUtyAcAv6dD
	LVNhY4GuR1vG8MvizdJIoDE82ytVYP5mwwenmn8c=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v56Lc0K8031676
	for <meta-arago@arago-project.org>; Tue, 6 Jun 2017 16:38:00 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 6 Jun 2017 16:38:00 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v56Lc01N030429	for <meta-arago@arago-project.org>;
	Tue, 6 Jun 2017 16:38:00 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 6 Jun 2017 17:37:54 -0400
Message-ID: <1496785075-26743-2-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1496785075-26743-1-git-send-email-e-ruei1@ti.com>
References: <1496785075-26743-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
Subject: [morty/master][PATCH v2 2/3] packagegroup-arago-tisdk-qte: add qtwebbrowser demo application to the list and sort it
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
X-List-Received-Date: Tue, 06 Jun 2017 21:38:02 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb           | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
index f2f87be..530d93d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
@@ -24,6 +24,7 @@ QT5_DEMOS = "\
     qtscript-examples \
     qtsvg-examples \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'qtwayland-examples', '', d)} \
+    qtwebbrowser \
     qtwebengine-examples \
     qtwebkit-examples-examples \
 "
-- 
1.9.1


