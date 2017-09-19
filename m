Return-Path: <sam.nelson@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 8E37C529BF
	for <meta-arago@arago-project.org>;
	Tue, 19 Sep 2017 17:39:04 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8JHcsFB023860
	for <meta-arago@arago-project.org>; Tue, 19 Sep 2017 12:38:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505842734;
	bh=wXYuKLJUw1C1P5YL5cxz6r/XJ5Asb6ttrIXSdlg2RC4=;
	h=From:To:CC:Subject:Date;
	b=qJxZ2+EpSmm9VOZ9Cmr8kO2nEROhwu6T0Me83vEPk4QUXLCb267YO4226+022TLQS
	dz2zGdRP99WAPOxBdM3OKrpUgOtJrw5WW+eKDkx7yJW5YWAxhGIQoAk/mvRsa6WLdp
	Z4QnH70dEtWohuzfGb963C2C928UJfSkhnloBK6k=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8JHcnhf018727
	for <meta-arago@arago-project.org>; Tue, 19 Sep 2017 12:38:49 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 19 Sep 2017 12:38:49 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 19 Sep 2017 12:38:49 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8JHcmxc020949;
	Tue, 19 Sep 2017 12:38:49 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Sep 2017 13:38:47 -0400
Message-ID: <1505842727-12297-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH] uio-test-pruss: Update to new version 1.0.2.0
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
X-List-Received-Date: Tue, 19 Sep 2017 17:39:04 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Patch also sent to meta-ti
Will also be needed here for processor sdk release
---
---
 recipes-ti/uio-test-pruss/uio-test-pruss_git.bbappend | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 recipes-ti/uio-test-pruss/uio-test-pruss_git.bbappend

diff --git a/recipes-ti/uio-test-pruss/uio-test-pruss_git.bbappend b/recipes-ti/uio-test-pruss/uio-test-pruss_git.bbappend
new file mode 100644
index 0000000..7297c8b
--- /dev/null
+++ b/recipes-ti/uio-test-pruss/uio-test-pruss_git.bbappend
@@ -0,0 +1,6 @@
+PR_append = ".tisdk0"
+
+PV = "1.0.2.0"
+
+# Corresponds to version 01.00.02.00
+UIO_TEST_PRUSS_SRCREV = "e52a7b099d7203ca52519650df51419e9fef7e0c"
-- 
1.9.1


