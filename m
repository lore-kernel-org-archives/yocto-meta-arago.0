Return-Path: <manishalocal@uda0393239>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 60A1652AC5
	for <meta-arago@arago-project.org>;
	Tue, 29 Aug 2017 16:38:44 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7TGcYUr010287
	for <meta-arago@arago-project.org>; Tue, 29 Aug 2017 11:38:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504024714;
	bh=HGd8aQMA6+1FF922mMAiCcuZbWhg5RDn6rMJw66NexQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=VQszeXmgfMmW60fRYmVnETWfz5mGWzIVmhAwMz73eAnfnaAqHiaeKOofrHY+mZzaz
	njeeb7FRsrrNqh1qPoAvXpspV2I6cnfeP90xsf4pqb3SxmPRS6LdJTMhnkHbSAC6HH
	yIebeJUyybKmx5otpKZUqc3oV78q7kaI/CwziWcM=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7TGcTHv003063
	for <meta-arago@arago-project.org>; Tue, 29 Aug 2017 11:38:29 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 29 Aug 2017 11:38:29 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 29 Aug 2017 11:38:29 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7TGcTPg003665;
	Tue, 29 Aug 2017 11:38:29 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dmjX2-00047V-Vg; Tue, 29 Aug 2017 11:38:29 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 29 Aug 2017 11:38:26 -0500
Message-ID: <20170829163826.15777-6-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170829163826.15777-1-manisha.agrawal@ti.com>
References: <20170829163826.15777-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][PATCH v2 6/6] arago-distro : recipes-core : tisdk-rootfs-image
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
X-List-Received-Date: Tue, 29 Aug 2017 16:38:44 -0000
Content-Type: text/plain

Add evse-hmi image to the rootfs.

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
index 1a477d1..e40dc1f 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
@@ -20,6 +20,7 @@ IMAGE_INSTALL += "\
     packagegroup-arago-tisdk-amsdk \
     packagegroup-arago-tisdk-addons \
     packagegroup-arago-tisdk-addons-extra \
+    packagegroup-arago-tisdk-hmi \
     "
 
 export IMAGE_BASENAME = "tisdk-rootfs-image"
-- 
2.13.0


