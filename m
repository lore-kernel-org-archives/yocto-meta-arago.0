Return-Path: <yan-liu@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 12DFB52986
	for <meta-arago@arago-project.org>;
	Wed, 20 Nov 2019 19:36:04 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAKJYab7085028
	for <meta-arago@arago-project.org>; Wed, 20 Nov 2019 13:34:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1574278476;
	bh=1fIpoTUpOq5B5EeGLgVxGvmIlJm+Yig0fRqbk+Kvgnk=;
	h=From:To:CC:Subject:Date;
	b=F9sH1OgbLv0gmDbsF38KgwXwCDtbXl9ddThYF3SxUiLErX4GMpsGrM8HG2sNvk+yp
	iTBSgW39twSUrLbeC4deLQxCFPv7iRqNCvAD1D9OhjI0gBvH5qy89x+qLkZp0KZPGi
	KQ1Z+iJRcNLX0ZvpRrAMSAbhVE0LahOhEyVa7I58=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAKJYa96090701
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 20 Nov 2019 13:34:36 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 20 Nov 2019 13:34:36 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Wed, 20 Nov 2019 13:34:36 -0600
Received: from yan-ubuntu-1204.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAKJYZDw101304;
	Wed, 20 Nov 2019 13:34:35 -0600
From: <yan-liu@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 20 Nov 2019 14:32:04 -0500
Message-ID: <1574278324-26721-1-git-send-email-yan-liu@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v1] ltp-ddt: Update to latest
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
X-List-Received-Date: Wed, 20 Nov 2019 19:36:04 -0000
Content-Type: text/plain

From: Yan Liu <yan-liu@ti.com>

Signed-off-by: Yan Liu <yan-liu@ti.com>
---
 .../recipes-devtools/ltp-ddt/ltp-ddt_20190305.bb   |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20190305.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20190305.bb
index e58dec1..2f6d432 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20190305.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20190305.bb
@@ -4,7 +4,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-PR = "r18"
+PR = "r19"
 PV_append = "+git${SRCPV}"
 
 PROVIDES += "ltp"
@@ -39,7 +39,7 @@ RDEPENDS_${PN} = "\
 
 inherit autotools-brokensep
 
-SRCREV = "7726ed8fc8814a63c8cd817ce37ad06dcb8bc711"
+SRCREV = "b367a6d09b1c9b307a88b8946c309d05825c4b80"
 BRANCH ?= "master"
 
 SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH} \
-- 
1.7.9.5


