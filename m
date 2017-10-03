Return-Path: <e-ruei1@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 4F69A52A99
	for <meta-arago@arago-project.org>;
	Tue,  3 Oct 2017 15:54:18 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v93FsInX012296
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507046058;
	bh=+Nd1l+O8Qsw142j7TOeZCghZkG9pAFZHCMN5XmizfMg=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Y9kNty15S+a3pvovPjPHmU37EEOyaGG6mLq8JDoONmFfPQdtIzmrGtsDfHl3tPTMe
	djs3GAK5oxbfdLj0huglt0evJ1f6dWmzDTuBS5mP1wMmdZnMINo+Sx5TIhJY8AttIi
	SXL7P4Jrvx67Hh7rXOm3Q12wFXxtai0bOpg6AexA=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93FsI3W018687
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:18 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 3 Oct 2017 10:54:17 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 3 Oct 2017 10:54:17 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93FsFS9013524
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:17 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 3 Oct 2017 11:54:00 -0400
Message-ID: <1507046051-57949-13-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1507046051-57949-1-git-send-email-e-ruei1@ti.com>
References: <1507046051-57949-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v2 12/23] matrix-gui-browser: add additional include/lib search path for X11 build
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
X-List-Received-Date: Tue, 03 Oct 2017 15:54:19 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-core/matrix/matrix-gui-browser_2.0.bbappend | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 recipes-core/matrix/matrix-gui-browser_2.0.bbappend

diff --git a/recipes-core/matrix/matrix-gui-browser_2.0.bbappend b/recipes-core/matrix/matrix-gui-browser_2.0.bbappend
new file mode 100644
index 0000000..1ba79f3
--- /dev/null
+++ b/recipes-core/matrix/matrix-gui-browser_2.0.bbappend
@@ -0,0 +1,4 @@
+PR_append = ".tisdk0"
+
+CXXFLAGS_append = " -I${STAGING_DIR_HOST}/usr/local/XSGX/include"
+LDFLAGS_append = " -L${STAGING_DIR_HOST}/usr/local/XSGX/lib -Wl,-rpath-link,${STAGING_DIR_HOST}/usr/local/XSGX/lib"
-- 
1.9.1


