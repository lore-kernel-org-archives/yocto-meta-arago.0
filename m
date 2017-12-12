Return-Path: <h-gou@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id CA4AC52093
	for <meta-arago@arago-project.org>;
	Tue, 12 Dec 2017 00:13:53 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBC0DrDH007257
	for <meta-arago@arago-project.org>; Mon, 11 Dec 2017 18:13:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513037633;
	bh=mweWG+fIsR9TKM1Z5MDDKngSxmdpeE5mRAcLq5Zy+k0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Un/I6f+x9N83Nng+9NjSpNq5JhQkx43vFqzv+suwY7VEZZqvIY0bM004sHH/373+M
	QHPdtpCjpN83W1TFaL/WnjEikBi4dom1HJFShfBBboneaAkRJ1O+x70dS1jEJLq61S
	ZPWM+ks44vx6WXaRtGTZVPbN6dcYqTGTTy1ALKsY=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBC0DrWL012669
	for <meta-arago@arago-project.org>; Mon, 11 Dec 2017 18:13:53 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 11 Dec 2017 18:13:52 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 11 Dec 2017 18:13:52 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBC0Dner019263;
	Mon, 11 Dec 2017 18:13:52 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 11 Dec 2017 19:13:43 -0500
Message-ID: <1513037623-6080-2-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1513037623-6080-1-git-send-email-a0271529@ti.com>
References: <1513037623-6080-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk] [PATCH 2/2] matrix-gui-browser: build Matrix browser upon QtWebKit (instead of QtWebEngine) for non-sgx
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
X-List-Received-Date: Tue, 12 Dec 2017 00:13:54 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-core/matrix/matrix-gui-browser_2.0.bbappend | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 recipes-core/matrix/matrix-gui-browser_2.0.bbappend

diff --git a/recipes-core/matrix/matrix-gui-browser_2.0.bbappend b/recipes-core/matrix/matrix-gui-browser_2.0.bbappend
new file mode 100644
index 0000000..75e76a8
--- /dev/null
+++ b/recipes-core/matrix/matrix-gui-browser_2.0.bbappend
@@ -0,0 +1,14 @@
+PR_append = ".tisdk0"
+
+DEPENDS_remove = "\
+    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', "${QT_DEPENDS_WEBENGINE}", d)} \
+"
+
+DEPENDS_append = "\
+    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', " ${QT_DEPENDS_WEBKIT}", d)} \
+"
+
+QT5_WEBENGINE_SRCREV = "d3ecf8d0dff3e4f901d588ea0dfe485733dfc9dc"
+QT5_WEBKIT_SRCREV = "78ad5db716d1abc4c05abfe435f066b6b88454d5"
+
+QT5_SRCREV = "${@bb.utils.contains('MACHINE_FEATURES', 'sgx', "${QT5_WEBENGINE_SRCREV}", "${QT5_WEBKIT_SRCREV}", d)}"
-- 
1.9.1


