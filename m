Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 6C70A52991
	for <meta-arago@arago-project.org>;
	Fri, 29 Mar 2013 13:50:43 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2TDoe9F021326
	for <meta-arago@arago-project.org>; Fri, 29 Mar 2013 08:50:41 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2TDoeeU024233
	for <meta-arago@arago-project.org>;
	Fri, 29 Mar 2013 19:20:40 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 29 Mar 2013 19:20:39 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2TDoZ22006191;
	Fri, 29 Mar 2013 19:20:38 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Mar 2013 08:50:31 -0500
Message-ID: <1364565033-29017-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1364565033-29017-1-git-send-email-Chase.Maupin@ti.com>
References: <1364565033-29017-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] arago-source-ipk: Add sourceipk for omapconf
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
X-List-Received-Date: Fri, 29 Mar 2013 13:50:45 -0000
Content-Type: text/plain

* Install omapconf into the example-applications directory.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../conf/distro/arago-source-ipk.conf              |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index 2fc8cbb..b65eb1b 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -76,6 +76,9 @@ SRCIPK_INSTALL_DIR_pn-am-sysinfo = "example-applications/${PN}-${PV}"
 CREATE_SRCIPK_pn-arm-benchmarks = "1"
 SRCIPK_INSTALL_DIR_pn-arm-benchmarks = "example-applications/${PN}-${PV}"
 
+CREATE_SRCIPK_pn-omapconf = "1"
+SRCIPK_INSTALL_DIR_pn-omapconf = "example-applications/${PN}-${PV}"
+
 CREATE_SRCIPK_pn-ti-pru-sw-examples = "1"
 SRCIPK_INSTALL_DIR_pn-ti-pru-sw-examples = "example-applications/pru-${PV}"
 
-- 
1.7.0.4


