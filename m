Return-Path: <g-tammana@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 96B6E5297E
	for <meta-arago@arago-project.org>;
	Sat, 29 Jun 2019 04:38:57 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5T4cDMX087829
	for <meta-arago@arago-project.org>; Fri, 28 Jun 2019 23:38:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561783093;
	bh=OB163peklx1G0md8t3/BGhN04k629/cG4B+gdW5oD6M=;
	h=From:To:CC:Subject:Date;
	b=jxsqfexu78edHpDCk4j/jK7GgSbtNobFt5YE7aOYNW85jh1mB2mguS5VR403JI7cn
	K8rSssz05+Of1TcjZmuBoLFCAxAzZKkp6iwnTHONi1d3TnazeXMijiohpOIuCEd+Ny
	vdXvgDcPYsV4b9wH1jWV0lyHmifrrbk99FQ4VfwQ=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5T4cDA7129554
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 28 Jun 2019 23:38:13 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 28 Jun 2019 23:38:12 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 28 Jun 2019 23:38:12 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5T4cCie081330;
	Fri, 28 Jun 2019 23:38:12 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.77.97])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x5T4cBm25393; Fri, 28 Jun 2019 23:38:11 -0500 (CDT)
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Denys Dmytriyenko <denys@ti.com>
Date: Fri, 28 Jun 2019 23:39:52 -0500
Message-ID: <20190629043954.7786-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud][PATCH 1/3] arago-prefs: Specify gbm provider for J7
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
X-List-Received-Date: Sat, 29 Jun 2019 04:38:58 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 939569c0..0f961322 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -23,8 +23,12 @@ PREFERRED_PROVIDER_virtual/gpudriver_j7-evm = "ti-img-rogue-driver"
 PREFERRED_PROVIDER_virtual/libgl = "mesa-gl"
 
 # GBM (Generic Buffer Management) preferences
-PREFERRED_PROVIDER_libgbm = "libgbm"
-PREFERRED_PROVIDER_libgbm-dev = "libgbm-dev"
+PREFERRED_PROVIDER_virtual/libgbm = "libgbm"
+PREFERRED_PROVIDER_virtual/libgbm-dev = "libgbm-dev"
+
+# J7 gbm provider
+PREFERRED_PROVIDER_virtual/libgbm_j7-evm = "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgbm-dev_j7-evm = "ti-img-rogue-umlibs-dev"
 
 # This is required when using keystone devices with graphical support
 # such as Qt5
-- 
2.22.0


