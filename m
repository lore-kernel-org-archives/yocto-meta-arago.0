Return-Path: <jake@udc0866934>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 1086C529BC
	for <meta-arago@arago-project.org>;
	Wed, 20 May 2020 15:01:51 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04KExNcx040103
	for <meta-arago@arago-project.org>; Wed, 20 May 2020 09:59:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1589986763;
	bh=/vDpQdqNN/2zx11xYn1XY+hoKPpp0oMhJiQ3WnJZ9eY=;
	h=From:To:CC:Subject:Date;
	b=HJLy+EHCUoyYuxtEns1P2Ck1+78I6rmbeE900nNGTehBFXbg9mwlTe9RZH3yUfwGL
	XM+xNB0bxnLVMHIgGBvlw8erBzk/GTuMLOZafB4U3CdQ82+VW0I+HJlDgxwlz7fMF8
	AnM5n9zUsEGZkbBW33KScasaj3d59nrPlYQTYETU=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04KExNuw110066
	for <meta-arago@arago-project.org>; Wed, 20 May 2020 09:59:23 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Wed, 20 May 2020 09:59:23 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Wed, 20 May 2020 09:59:23 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04KExN62091836;
	Wed, 20 May 2020 09:59:23 -0500
Received: from jake by udc0866934 with local (Exim 4.82)
	(envelope-from <jake@udc0866934>)
	id 1jbQBm-00070i-PO; Wed, 20 May 2020 10:59:22 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 20 May 2020 10:59:21 -0400
Message-ID: <1589986761-26916-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/dunfell][PATCH] tisdk-bundle: add wic images by default
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
X-List-Received-Date: Wed, 20 May 2020 15:01:51 -0000
Content-Type: text/plain

* Add wic images to TARGET_IMAGE_TYPES so that they are provided in
  the SDK bundle.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/classes/tisdk-bundle.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-distro/classes/tisdk-bundle.bbclass
index 45de5fc..f180817 100644
--- a/meta-arago-distro/classes/tisdk-bundle.bbclass
+++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
@@ -40,7 +40,7 @@ TISDK_TOOLCHAIN ?= "meta-toolchain-arago"
 TOOLCHAIN_SUFFIX ?= "-sdk"
 
 # List of the type of target file system images we want to include
-TARGET_IMAGE_TYPES ?= "tar.xz tar.gz ubi"
+TARGET_IMAGE_TYPES ?= "tar.xz tar.gz ubi wic.gz wic.xz"
 
 # If EXTRA_TISDK_FILES points to a valid directory then all the contents
 # of that directory will be added to the SDK using the same directory
-- 
1.9.1


