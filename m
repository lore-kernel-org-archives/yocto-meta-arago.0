Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 0C5B45298D
	for <meta-arago@arago-project.org>;
	Tue,  2 Jul 2013 17:01:00 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r62H0xKP031606
	for <meta-arago@arago-project.org>; Tue, 2 Jul 2013 12:00:59 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r62H0xb0023866
	for <meta-arago@arago-project.org>; Tue, 2 Jul 2013 12:00:59 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 2 Jul 2013 12:00:58 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r62H0ooC021236;
	Tue, 2 Jul 2013 12:00:57 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 2 Jul 2013 12:15:51 -0500
Message-ID: <1372785354-1920-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1372785354-1920-1-git-send-email-fcooper@ti.com>
References: <1372785354-1920-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [master & danny][PATCH 3/6] arago-source-ipk: Enable sourceipk for oprofile-example
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
X-List-Received-Date: Tue, 02 Jul 2013 17:01:00 -0000
Content-Type: text/plain

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../conf/distro/arago-source-ipk.conf              |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index 11a66ca..63cad0d 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -73,6 +73,9 @@ SRCIPK_INSTALL_DIR_pn-refresh-screen = "example-applications/${PN}-${PV}"
 CREATE_SRCIPK_pn-am-sysinfo = "1"
 SRCIPK_INSTALL_DIR_pn-am-sysinfo = "example-applications/${PN}-${PV}"
 
+CREATE_SRCIPK_pn-oprofile-example = "1"
+SRCIPK_INSTALL_DIR_pn-oprofile-example = "example-applications/${PN}"
+
 CREATE_SRCIPK_pn-arm-benchmarks = "1"
 SRCIPK_INSTALL_DIR_pn-arm-benchmarks = "example-applications/${PN}-${PV}"
 
-- 
1.7.0.4


