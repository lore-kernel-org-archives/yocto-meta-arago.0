Return-Path: <d-senicic1@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id BD437529CC
	for <meta-arago@arago-project.org>;
	Thu, 21 Sep 2017 22:34:16 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8LMYGEm025490
	for <meta-arago@arago-project.org>; Thu, 21 Sep 2017 17:34:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506033256;
	bh=nvGqd+RZZzKtCe9emLmDNEIcvaDh9j+XSCHDH/AfdDM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=KuWm/2eCMK1wIZ4Li9g3zojJlHzQQrMBeVFYnvjeXXlWVKEY4dATasAhvZhoJKGOS
	G4qHI9sqb6KqJ4TZ8osaILxmS4gUQJAAxKI0BUPc4tviBPaUz/24ND5sGB9YIQFGju
	UlqCilBB2B2FjIDrih+5Fcv7Q3sCeL6HJ92f+ClE=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8LMYGVv001245
	for <meta-arago@arago-project.org>; Thu, 21 Sep 2017 17:34:16 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 21 Sep 2017 17:34:16 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 21 Sep 2017 17:34:16 -0500
Received: from UDA0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8LMYBoq020956;
	Thu, 21 Sep 2017 17:34:16 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 21 Sep 2017 18:34:05 -0400
Message-ID: <1506033246-18916-5-git-send-email-x0157990@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1506033246-18916-1-git-send-email-x0157990@ti.com>
References: <1506033246-18916-1-git-send-email-x0157990@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [meta-processor-sdk][PATCH v2 4/5] packagegroup-arago-tisdk-addons-sdk-target: add tiovx to devkit
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
X-List-Received-Date: Thu, 21 Sep 2017 22:34:17 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 .../packagegroup-arago-tisdk-addons-sdk-target.bbappend             | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
index aeabbc0..8de7992 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
@@ -75,3 +75,9 @@ EXTRA_LIBS_append_ti43x = "\
     cmem-dev \
     cmem-staticdev \
 "
+
+EXTRA_LIBS_append_dra7xx = " \
+    tiovx-lib-host-dev \
+    tiovx-lib-host-staticdev \
+    tiovx-sys-iface \
+"
-- 
1.9.1


