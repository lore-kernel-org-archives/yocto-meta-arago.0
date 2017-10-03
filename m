Return-Path: <e-ruei1@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id B3C7052A33
	for <meta-arago@arago-project.org>;
	Tue,  3 Oct 2017 15:54:17 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v93FsHfd005798
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507046057;
	bh=9U/9yTP0PVJi66xxek2TJjpQgyeEhrl2DmV7chykk6U=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=fpSMC84glUk4wAfSXge1V7JvU5SGrgSVReNbu8CToAElL9G9gdKVg8GDzMD8kBxXg
	LD3WNAoJF39SaY5oO2Dpj991SUiTxNQbkL51fEpsT87q1RmiKJyRcD2mlEvsZx7rqJ
	aFtPWjE5rhhuh/lL/jAWEEmv3+NpPrbxwwk1/yuI=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93FsHC3013479
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:17 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 3 Oct 2017 10:54:17 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 3 Oct 2017 10:54:17 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93FsFS7013524
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:17 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 3 Oct 2017 11:53:58 -0400
Message-ID: <1507046051-57949-11-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1507046051-57949-1-git-send-email-e-ruei1@ti.com>
References: <1507046051-57949-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v2 10/23] qtwebbrowser: add additional include/lib search path for X11 build
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
X-List-Received-Date: Tue, 03 Oct 2017 15:54:18 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-qt/examples/qtwebbrowser_1.0.bbappend | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 recipes-qt/examples/qtwebbrowser_1.0.bbappend

diff --git a/recipes-qt/examples/qtwebbrowser_1.0.bbappend b/recipes-qt/examples/qtwebbrowser_1.0.bbappend
new file mode 100644
index 0000000..1ba79f3
--- /dev/null
+++ b/recipes-qt/examples/qtwebbrowser_1.0.bbappend
@@ -0,0 +1,4 @@
+PR_append = ".tisdk0"
+
+CXXFLAGS_append = " -I${STAGING_DIR_HOST}/usr/local/XSGX/include"
+LDFLAGS_append = " -L${STAGING_DIR_HOST}/usr/local/XSGX/lib -Wl,-rpath-link,${STAGING_DIR_HOST}/usr/local/XSGX/lib"
-- 
1.9.1


