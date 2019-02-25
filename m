Return-Path: <e-ruei1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 7A5C352974
	for <meta-arago@arago-project.org>;
	Mon, 25 Feb 2019 23:52:41 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x1PNqb3t024259
	for <meta-arago@arago-project.org>; Mon, 25 Feb 2019 17:52:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551138757;
	bh=A2O0ov7aSBja/qihJTQ+4ULNsaSJO5zqufc8DccIm00=;
	h=From:To:Subject:Date;
	b=MT23XPkkwTR1M4X/F6CXodP4BSLyEUjFZgjyRTFuWpqJwwegOntRsRRKg0NTVwbQj
	9rfpFrbQr7RpYd0piJvqfoRYTFKD5G1hiovEcyFVpQbszTJMhxpdhIDvCpVO4B5F4e
	EEZft4sb5GH8mLyARzqAV2339aYqtfhiXsUu4NZ0=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x1PNqbSE119877
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 25 Feb 2019 17:52:37 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 25 Feb 2019 17:52:37 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 25 Feb 2019 17:52:37 -0600
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x1PNqaSf001039
	for <meta-arago@arago-project.org>; Mon, 25 Feb 2019 17:52:36 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 25 Feb 2019 18:52:34 -0500
Message-ID: <1551138754-60905-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] matrix-gui-apps: bump SRCREV to get multimedia script changes
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
X-List-Received-Date: Mon, 25 Feb 2019 23:52:42 -0000
Content-Type: text/plain

- multimedia pipeline enhancements: enable kmssink for AM4/6

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index 49e9e74..e8fed13 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
 
 SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
-SRCREV = "94e9f17332065fa838d9334efdab8451c8119b8d"
+SRCREV = "22d15489ed9e0fcd0b8734a87cf23db47d13aa46"
 BRANCH = "master"
-INC_PR = "r65"
+INC_PR = "r66"
 
 # Pull in the base package for installing matrix applications
 require matrix-gui-apps.inc
-- 
1.9.1


