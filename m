Return-Path: <qsu@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id AA3B752968
	for <meta-arago@arago-project.org>;
	Thu,  6 Dec 2018 21:59:03 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id wB6LwqSS025124
	for <meta-arago@arago-project.org>; Thu, 6 Dec 2018 15:58:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544133532;
	bh=VZeuy6uxLGSFvTsQCPU4tW1sHj9v3bhH56oYCUxhiGU=;
	h=From:To:Subject:Date;
	b=tXPouh6n8+mZ838kpJlorcBLpMs45tjNFX7gbfWB3QQyd6RR9LOUUMgjdDP1NhpeA
	epTlaAfiYG4HHcho0c6ZKLneCSOkE4R7TokRvYjgTm5IwtlGVJTGOvZ+8t4ONnSFvv
	FzkZdLWE115G/q1YFVGjo6xhqXf94HThVkH0hHaA=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wB6LwqqA098628
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 6 Dec 2018 15:58:52 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Thu, 6 Dec 2018 15:58:51 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Thu, 6 Dec 2018 15:58:52 -0600
Received: from UDA0216595.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wB6LwpcB031198
	for <meta-arago@arago-project.org>; Thu, 6 Dec 2018 15:58:51 -0600
From: Qin Su <qsu@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 6 Dec 2018 16:58:35 -0500
Message-ID: <1544133516-24053-1-git-send-email-qsu@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [matrix-gui-v2-apps][PATCH 1/2] tidl_submenu: rename TI Deep Learning to Machine Learning for including Arm NN demo in the group.
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
X-List-Received-Date: Thu, 06 Dec 2018 21:59:04 -0000
Content-Type: text/plain

Signed-off-by: Qin Su <qsu@ti.com>
---
 tidl_submenu/tidl.desktop | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tidl_submenu/tidl.desktop b/tidl_submenu/tidl.desktop
index 467f865..b6198e9 100644
--- a/tidl_submenu/tidl.desktop
+++ b/tidl_submenu/tidl.desktop
@@ -1,7 +1,7 @@
 #!/usr/bin/env xdg-open
 [Desktop Entry]
-Name=TI Deep Learning
-GenericName=Deep Learning Examples
+Name=Machine Learning
+GenericName=Machine Learning Examples
 Icon=/usr/share/matrix-gui-2.0/apps/images/tidl-icon.png
 Type=Directory
 X-MATRIX-CategoryTarget=tidl
-- 
1.9.1


