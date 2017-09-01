Return-Path: <manishalocal@uda0393239>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 12AAC52A27
	for <meta-arago@arago-project.org>;
	Fri,  1 Sep 2017 20:32:40 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v81KWUhq011075
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 15:32:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504297950;
	bh=2ggzPY2DPrZ0ufMD9uTOoGfOVe8XzH+Y8gNopBfrQHc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=DDHYOhWMtVVnkl4X9Ay8gOswel/tA211ytIONWDT09EWDr38NxeZ2LpaLT+9FUuzq
	HHI48GO+XhQssMEOfJNPS/TXNXNL293hEY0yK9dAfF6VjKi7kqI1/awlmT6ZgU7yb+
	PoBoqUFd59MC1/QlWfHtQZjN7hJkP4jXpFwZ1uNE=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81KWPN5018643
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 15:32:25 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 1 Sep 2017 15:32:24 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 1 Sep 2017 15:32:24 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81KWOvf029364;
	Fri, 1 Sep 2017 15:32:24 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dnsc4-0006Vt-NS; Fri, 01 Sep 2017 15:32:24 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 1 Sep 2017 15:32:22 -0500
Message-ID: <20170901203222.24972-7-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170901203222.24972-1-manisha.agrawal@ti.com>
References: <20170901203222.24972-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v2 7/7] arago-core-tisdk-image : add hmi specific packagegroup
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
X-List-Received-Date: Fri, 01 Sep 2017 20:32:40 -0000
Content-Type: text/plain

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 recipes-core/images/arago-core-tisdk-image.bbappend | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-core/images/arago-core-tisdk-image.bbappend b/recipes-core/images/arago-core-tisdk-image.bbappend
index 2857178..2c804f0 100644
--- a/recipes-core/images/arago-core-tisdk-image.bbappend
+++ b/recipes-core/images/arago-core-tisdk-image.bbappend
@@ -1,5 +1,9 @@
 PR_append = ".tisdk13"
 
+IMAGE_INSTALL_append = " \                                                                                                                   
+      packagegroup-arago-tisdk-hmi-sdk-host \ 
+ "
+
 # The following FITIMAGE vars are copied from kernel-fitimage.bbclass.
 #
 # We need to get these into the prebuilt-images. We don't want to inherit the
-- 
2.13.0


