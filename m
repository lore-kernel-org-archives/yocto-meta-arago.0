Return-Path: <h-gou@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id D874D52A0D
	for <meta-arago@arago-project.org>;
	Tue, 18 Sep 2018 20:13:53 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8IKDjRl078831
	for <meta-arago@arago-project.org>; Tue, 18 Sep 2018 15:13:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537301625;
	bh=rW0nG02yQKo8LkSQSyz9xs3niPdu3cmNyn48dGnIWrM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=sGx6b4/1gRofwzqC/MjUoJx6Nr+IfmnWetaNhppTT/UJAzngOlYpuL84Bl4NP73XK
	ri4Hwql7R1Vwj/t0cZu2sNJKQxqxWesZ1YSjJj9io4KQ7dNozqCfe1PNZeCtW7SlzL
	WjZWRygfObpWKWkHJfOatb2ykqIXEPikpjH9xdec=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8IKDjtP028224
	for <meta-arago@arago-project.org>; Tue, 18 Sep 2018 15:13:45 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 18 Sep 2018 15:13:45 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 18 Sep 2018 15:13:45 -0500
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8IKDit8002786;
	Tue, 18 Sep 2018 15:13:45 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 18 Sep 2018 16:13:38 -0400
Message-ID: <1537301622-8988-4-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1537301622-8988-1-git-send-email-a0271529@ti.com>
References: <1537301622-8988-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 3/7] packagegroup-ros-world: add hector* packages
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
X-List-Received-Date: Tue, 18 Sep 2018 20:13:55 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-ros/packagegroups/packagegroup-ros-world.bbappend | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 recipes-ros/packagegroups/packagegroup-ros-world.bbappend

diff --git a/recipes-ros/packagegroups/packagegroup-ros-world.bbappend b/recipes-ros/packagegroups/packagegroup-ros-world.bbappend
new file mode 100644
index 0000000..57d255c
--- /dev/null
+++ b/recipes-ros/packagegroups/packagegroup-ros-world.bbappend
@@ -0,0 +1,7 @@
+PR_append = ".tisdk0"
+
+RDEPENDS_${PN} += "\
+    hector-map-tools \
+    hector-nav-msgs \
+    hector-trajectory-server \
+"
-- 
1.9.1


