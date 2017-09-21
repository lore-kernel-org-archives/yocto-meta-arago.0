Return-Path: <d-senicic1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 1FF34529CC
	for <meta-arago@arago-project.org>;
	Thu, 21 Sep 2017 22:34:33 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8LMYNHc004907
	for <meta-arago@arago-project.org>; Thu, 21 Sep 2017 17:34:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506033263;
	bh=wD4zB1/zM5GXK5fEkeCKzPOH9/oijBxbOrsgPAo/Ku8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=sNz4H3kw/1jumMSvqLg8hYPxq9GvcXJVMRtGt/tB6KAP1e1H91ASZZnboMCoPXUlS
	bdMfuQEpOgahPfmjw1F7CH/nrmTDC6VszgXfpyXVBqsZqBOtWW17CmaP3h2WrWU0JO
	w/fu/o6RWWX3cYU4SN6F69QvTKeWfnK7JdQRF5xA=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8LMYIm3024002
	for <meta-arago@arago-project.org>; Thu, 21 Sep 2017 17:34:18 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 21 Sep 2017 17:34:18 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 21 Sep 2017 17:34:17 -0500
Received: from UDA0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8LMYBor020956;
	Thu, 21 Sep 2017 17:34:17 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 21 Sep 2017 18:34:06 -0400
Message-ID: <1506033246-18916-6-git-send-email-x0157990@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1506033246-18916-1-git-send-email-x0157990@ti.com>
References: <1506033246-18916-1-git-send-email-x0157990@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [meta-processor-sdk][PATCH v2 5/5] packagegroup-arago-tisdk-addons: add tiovx-app
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
X-List-Received-Date: Thu, 21 Sep 2017 22:34:33 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
index 91e92ff..30b6eb6 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
@@ -34,3 +34,5 @@ UTILS_append_k2g = " uio-test-pruss"
 EXTRA_PACKAGES_append_omap-a15 = " big-data-ipc-demo-linux \
                                    big-data-ipc-demo-linux-firmware \
 "
+
+EXTRA_PACKAGES_append_dra7xx = " tiovx-app-host "
-- 
1.9.1


