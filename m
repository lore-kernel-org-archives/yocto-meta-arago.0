Return-Path: <e-ruei1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 1462952A52
	for <meta-arago@arago-project.org>;
	Thu, 16 Aug 2018 20:46:42 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7GKkYcI082099
	for <meta-arago@arago-project.org>; Thu, 16 Aug 2018 15:46:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534452394;
	bh=07Qf32qNMpj4TH+CSuzEGRlwN1KIaxJPqJd7QcUqYFw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=J0A7hjGKMkgH2pOTsxh2OYUyzeyVCrx01m22PejirSbcVB45QGQHH5tcsvltdOVUs
	Q8K3fLYCBENRD+NhmAS35FG2p+M3g/h5MawD3+ikp9z77W7V/xUJ2X3gerq1kKCILT
	iEAmxFT+BdkFso3TbJhUsixl710dgbF4dNcbsRQQ=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7GKkY9x025140
	for <meta-arago@arago-project.org>; Thu, 16 Aug 2018 15:46:34 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 16 Aug 2018 15:46:34 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 16 Aug 2018 15:46:34 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7GKkXVF028251
	for <meta-arago@arago-project.org>; Thu, 16 Aug 2018 15:46:33 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 16 Aug 2018 16:46:27 -0400
Message-ID: <1534452389-38475-2-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1534452389-38475-1-git-send-email-e-ruei1@ti.com>
References: <1534452389-38475-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 1/3] matrix-gui-apps: bump SRCREV to pick up multimedia k3 support
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
X-List-Received-Date: Thu, 16 Aug 2018 20:46:43 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index 591ff34..3204af2 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
 
 SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
-SRCREV = "66f586896ba8e5fdea7a0f6280d0a871fddd841a"
+SRCREV = "5e96e80aa929508d4c096cc387183d83852f0450"
 BRANCH = "master"
-INC_PR = "r54"
+INC_PR = "r55"
 
 # Pull in the base package for installing matrix applications
 require matrix-gui-apps.inc
-- 
1.9.1


