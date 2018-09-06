Return-Path: <h-gou@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 65F16529A0
	for <meta-arago@arago-project.org>;
	Thu,  6 Sep 2018 21:04:23 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w86L4FSv124852
	for <meta-arago@arago-project.org>; Thu, 6 Sep 2018 16:04:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536267855;
	bh=9hOMamEbIxvxHKnRaDRGyuXhKXQ+Zru/KHlCLcGkX8s=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ypDYIJMJfqnBe8gaI3imrLW5GoJEE9BuLHxi58X3WItdIb3vLbsu4K/YAe9t81FiS
	m+N3c12sY3AJW5egX7QdH8qjsHrZY5CJnTJoWtPHmlfbR6hPmep3Fc2ud27R3Ltt3K
	sl7PzW6axYp/rmg9rCF9d5ziiCeNjM1LipFee/V8=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w86L4FTm005040
	for <meta-arago@arago-project.org>; Thu, 6 Sep 2018 16:04:15 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 6 Sep 2018 16:04:15 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 6 Sep 2018 16:04:15 -0500
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w86L4Ehf009473;
	Thu, 6 Sep 2018 16:04:14 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 6 Sep 2018 17:04:07 -0400
Message-ID: <1536267851-5510-2-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1536267851-5510-1-git-send-email-a0271529@ti.com>
References: <1536267851-5510-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 1/5] pru-icss: install header files and rpmsg_lib
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
X-List-Received-Date: Thu, 06 Sep 2018 21:04:24 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-bsp/pru/pru-icss_git.bbappend | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 recipes-bsp/pru/pru-icss_git.bbappend

diff --git a/recipes-bsp/pru/pru-icss_git.bbappend b/recipes-bsp/pru/pru-icss_git.bbappend
new file mode 100644
index 0000000..cb56e38
--- /dev/null
+++ b/recipes-bsp/pru/pru-icss_git.bbappend
@@ -0,0 +1,8 @@
+PR_append = ".tisdk0"
+
+do_install_append() {
+    install -d ${D}${includedir}
+    cp -r ${S}/include/* ${D}${includedir}
+    install -d ${D}${libdir}
+    cp ${S}/lib/rpmsg_lib.lib ${D}${libdir}
+}
-- 
1.9.1


