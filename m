Return-Path: <h-gou@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id CD6B852A14
	for <meta-arago@arago-project.org>;
	Tue, 18 Sep 2018 20:13:54 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8IKDku4062691
	for <meta-arago@arago-project.org>; Tue, 18 Sep 2018 15:13:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537301626;
	bh=Vp/8jjatdDebgnfDJA6L9MrW+/e2LO0cFmchB+GRdA0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=jLnG8GeXdLWnUwfALg3RNqsRX9U80rVfL10Z/TX6H/RDNdugqXChAvTU71gFL16rk
	SkOLrnfcckIUa9Kty0mobeFJ9SD9ejWgfEGGqyJGNQwKOqLXOCHMM+Gb+Sjf6TEa18
	e1DJS47GmwvVx+bQzH1HeunDt3vE3hhbsH7ZZZVQ=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8IKDkYL028261
	for <meta-arago@arago-project.org>; Tue, 18 Sep 2018 15:13:46 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 18 Sep 2018 15:13:46 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 18 Sep 2018 15:13:46 -0500
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8IKDitC002786;
	Tue, 18 Sep 2018 15:13:46 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 18 Sep 2018 16:13:42 -0400
Message-ID: <1537301622-8988-8-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1537301622-8988-1-git-send-email-a0271529@ti.com>
References: <1537301622-8988-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 7/7] packagegroup-ros-ti: add mmwave-ros-autonomous-robotics demo
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
X-List-Received-Date: Tue, 18 Sep 2018 20:13:56 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-ros/packagegroups/packagegroup-ros-ti.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-ros/packagegroups/packagegroup-ros-ti.bb b/recipes-ros/packagegroups/packagegroup-ros-ti.bb
index 52d07e7..b3e02f9 100644
--- a/recipes-ros/packagegroups/packagegroup-ros-ti.bb
+++ b/recipes-ros/packagegroups/packagegroup-ros-ti.bb
@@ -3,10 +3,13 @@ LICENSE = "MIT"
 
 inherit packagegroup
 
+PR = "r1"
+
 PACKAGES = "${PN}"
 
 RDEPENDS_${PN} = "\
     mmwave-ros-pkg-master \
     serial-ros \
     octomap-server \
+    mmwave-ros-autonomous-robotics \
 "
-- 
1.9.1


