Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 47411529B6
	for <meta-arago@arago-project.org>;
	Mon, 17 Sep 2018 16:54:31 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8HGsNTZ032419
	for <meta-arago@arago-project.org>; Mon, 17 Sep 2018 11:54:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537203263;
	bh=3Rk6kL+i9nZY7S7x9IfZ0bjUOkoWp5fBTRBsYEUCezM=;
	h=From:To:CC:Subject:Date;
	b=rIN+ycRXqwa3CZ8N2vJTbivj0CJLF0D8avkCDw4YJtMDEZdiriWGE/XgddHik5M/R
	jhonWeveUvXrurW9TRkdctYZybsIcbKuaB6EudxOGVUj6P+d45GSdi7KShZILje5VI
	dJ03NC6Lt9nPHP/Ko9WvwxomlBPMzlWg1G5FZzpY=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8HGsNIB024105
	for <meta-arago@arago-project.org>; Mon, 17 Sep 2018 11:54:23 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 17 Sep 2018 11:54:23 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 17 Sep 2018 11:54:22 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8HGsMxJ005763;
	Mon, 17 Sep 2018 11:54:22 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 17 Sep 2018 12:41:52 -0400
Message-ID: <1537202512-20914-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] packagegroup-arago-base-tisdk: add iperf3
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
X-List-Received-Date: Mon, 17 Sep 2018 16:54:31 -0000
Content-Type: text/plain

* Add iperf3 in addition to iperf as each have benefits

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
index 113b7ad..57f6707 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
@@ -19,6 +19,7 @@ RDEPENDS_${PN} = "\
     libpcre \
     iptables \
     iperf \
+    iperf3 \
     arago-gpl-notice \
     arago-feed-config \
     nfs-utils-client \
-- 
2.7.4


