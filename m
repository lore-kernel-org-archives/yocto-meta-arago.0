Return-Path: <e-ruei1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 84725529AF
	for <meta-arago@arago-project.org>;
	Mon, 17 Sep 2018 13:00:31 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8HD0NMM012984
	for <meta-arago@arago-project.org>; Mon, 17 Sep 2018 08:00:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537189223;
	bh=IFUP9LnyifjlJNNCdCqjv65T/LkphJJ9BAMjWNMUjao=;
	h=From:To:Subject:Date;
	b=di5GlaA8saTBevdjJBflWog0L01DdXJHZ2FSnXBPQUx6lTUzNkkXJ4kNbuVxR1W5u
	MW4FEXvihzRJ2VRUpD9vDAVK6BrmWX3PkuvEfd7ByktOiXRXc5DbUGWADBsodm0GNU
	eAP1245eRw0mwTiFl7E9UrqCX2nCvDXaHApy/CXU=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8HD0NBE018721
	for <meta-arago@arago-project.org>; Mon, 17 Sep 2018 08:00:23 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 17 Sep 2018 08:00:23 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 17 Sep 2018 08:00:23 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8HD0Mbf017036
	for <meta-arago@arago-project.org>; Mon, 17 Sep 2018 08:00:22 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 17 Sep 2018 09:00:19 -0400
Message-ID: <1537189219-10536-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH] ti-tisdk-makefile: add evse-hmi for k3 devices
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
X-List-Received-Date: Mon, 17 Sep 2018 13:00:31 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
index 171c531..29e0e76 100644
--- a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
+++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk58"
+PR_append = ".tisdk59"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -45,6 +45,8 @@ MAKEFILES_append_ti33x = " evse-hmi \
 			   protection-relays-hmi \
 "
 
+MAKEFILES_append_k3 = " evse-hmi"
+
 MAKEFILES_append_am335x-evm = " pru-adc"
 
 MAKEFILES_append_am57xx-evm = " jailhouse \
-- 
1.9.1


