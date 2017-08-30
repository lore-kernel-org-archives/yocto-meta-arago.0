Return-Path: <manishalocal@uda0393239>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id C29DF52AD5
	for <meta-arago@arago-project.org>;
	Wed, 30 Aug 2017 17:56:50 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7UHuoHu017567
	for <meta-arago@arago-project.org>; Wed, 30 Aug 2017 12:56:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504115810;
	bh=U/VhSCDmjaqNo/okPv9jQwxSRX8YnjbB3Wu5ssTFZ8s=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=kBZPQa0UhcHUFIIuTWLdmfJ6QfvdcFEZ7eOIsXyyzBpv6rgJED7WxpfB0DBdWoGFj
	KxAg3m22w9i+uiSe+DY8LYbDts4IIh/veRH7QxM0Um1lyBIqoumdQHz41rFRYqR6EI
	sXqdxZm9sD94z7dUG7AxZh709V0alFxXzZTDfDeE=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7UHuouq026792
	for <meta-arago@arago-project.org>; Wed, 30 Aug 2017 12:56:50 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 30 Aug 2017 12:56:50 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 30 Aug 2017 12:56:50 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7UHuouq022460;
	Wed, 30 Aug 2017 12:56:50 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dn7EQ-0002zQ-FE; Wed, 30 Aug 2017 12:56:50 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 30 Aug 2017 12:56:47 -0500
Message-ID: <20170830175647.11427-7-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170830175647.11427-1-manisha.agrawal@ti.com>
References: <20170830175647.11427-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][PATCH v3 7/7] arago-core-tisdk-image : add hmi specific packagegroup
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
X-List-Received-Date: Wed, 30 Aug 2017 17:56:52 -0000
Content-Type: text/plain

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
index fbc31617..63f97a55 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
@@ -59,6 +59,7 @@ IMAGE_INSTALL = "\
     ${@bb.utils.contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-graphics-sdk-host','',d)} \
     packagegroup-arago-tisdk-matrix-sdk-host \
     packagegroup-arago-tisdk-multimedia-sdk-host \
+    packagegroup-arago-tisdk-hmi-sdk-host \
     packagegroup-arago-tisdk-amsdk-sdk-host${ARAGO_KERNEL_SUFFIX} \
     ${IMAGE_INSTALL_QT} \
 "
-- 
2.13.0


