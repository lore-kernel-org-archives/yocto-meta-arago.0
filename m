Return-Path: <manishalocal@uda0393239>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id CEE5652A3E
	for <meta-arago@arago-project.org>;
	Fri,  1 Sep 2017 20:28:33 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v81KSXv2013475
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 15:28:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504297714;
	bh=N8WXpwMizTEpkQm1AW7RvjFV2GT9gDhbIW6XACpD7XY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=RvAFR3l6Fj3GexUnqwe223TEfXDSKyT6QIYvtshBeAWa5QopTfSvm0DvMGwEY66wY
	zwQvz31DIXcRIq6cBE7Qmx78H8mftp5dDhdGsuGut63hxsN+pGsTvuNAD4H+QvEFhG
	005awdnO82VJGBeOutnjDCXX2d1lSwL79k1K2a3w=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81KSXUQ028841
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 15:28:33 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 1 Sep 2017 15:28:33 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 1 Sep 2017 15:28:33 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81KSXHR023821;
	Fri, 1 Sep 2017 15:28:33 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dnsYL-0006UL-GX; Fri, 01 Sep 2017 15:28:33 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 1 Sep 2017 15:28:30 -0500
Message-ID: <20170901202830.24876-7-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170901202830.24876-1-manisha.agrawal@ti.com>
References: <20170901202830.24876-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v1 7/7] arago-core-tisdk-image : add hmi specific packagegroup
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
X-List-Received-Date: Fri, 01 Sep 2017 20:28:34 -0000
Content-Type: text/plain

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 recipes-core/images/arago-core-tisdk-image.bbappend | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-core/images/arago-core-tisdk-image.bbappend b/recipes-core/images/arago-core-tisdk-image.bbappend
index 2857178..b97da07 100644
--- a/recipes-core/images/arago-core-tisdk-image.bbappend
+++ b/recipes-core/images/arago-core-tisdk-image.bbappend
@@ -1,5 +1,9 @@
 PR_append = ".tisdk13"
 
+IMAGE_INSTALL_append = " \                                                                                                                   
+      packagegroup-arago-tisdk-hmi-sdk-host 
+ "
+
 # The following FITIMAGE vars are copied from kernel-fitimage.bbclass.
 #
 # We need to get these into the prebuilt-images. We don't want to inherit the
-- 
2.13.0


