Return-Path: <d-senicic1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 5666C529AE
	for <meta-arago@arago-project.org>;
	Mon, 23 Jul 2018 18:38:54 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6NIclH8033967
	for <meta-arago@arago-project.org>; Mon, 23 Jul 2018 13:38:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532371127;
	bh=5lNXxYx8vc1LWd5yUpJUI312+yAtbJnS0Z5b3+Aw1c8=;
	h=From:To:CC:Subject:Date;
	b=zEUIqsNwvxrY9QlpHpAzzKVmuhc3FK7R3MYqHaDmus576BmuH+M8K1sOQ34+95EcP
	OZOng/fquo+YKhskOo5SN4U17PzA8RxhJYRsNg4nDxU2H+Oh6QOMSNmTOjAI3ROh+v
	5zPSI0YXXCIaz1kO3LnTX58GpHWd3vCPuzH22zyw=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6NIclJj007117
	for <meta-arago@arago-project.org>; Mon, 23 Jul 2018 13:38:47 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 23 Jul 2018 13:38:47 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 23 Jul 2018 13:38:47 -0500
Received: from UDA0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6NIckvg000825;
	Mon, 23 Jul 2018 13:38:46 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 23 Jul 2018 14:38:44 -0400
Message-ID: <1532371124-500-1-git-send-email-x0157990@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [meta-processor-sdk][PATCH] tidl-utils: Add tidl-utils to devkit
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
X-List-Received-Date: Mon, 23 Jul 2018 18:38:54 -0000
Content-Type: text/plain

* Include tidl-utils package along with tidl-viewer into devkit

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 .../packagegroups/nativesdk-packagegroup-arago-sdk-host.bbappend      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bbappend b/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bbappend
index 514d125..b0fafee 100644
--- a/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bbappend
+++ b/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bbappend
@@ -1,3 +1,3 @@
-PR_append = ".tisdk0"
+PR_append = ".tisdk1"
 
-EXTRA_TI_TOOLS_append = " nativesdk-tidl-viewer"
+EXTRA_TI_TOOLS_append = " nativesdk-tidl-viewer nativesdk-tidl-utils "
-- 
1.9.1


