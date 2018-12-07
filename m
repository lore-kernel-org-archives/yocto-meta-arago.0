Return-Path: <qsu@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 2C44D52997
	for <meta-arago@arago-project.org>;
	Fri,  7 Dec 2018 19:28:57 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wB7JSjf5122092
	for <meta-arago@arago-project.org>; Fri, 7 Dec 2018 13:28:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544210925;
	bh=6YfdESpM5FzYk9Fvv2kwIp0P4CPbEDWkbYXNmspS/6w=;
	h=From:To:Subject:Date;
	b=SKnJBBftWoij9uR02/dXngVGOtd42kqZpOcXw5GQVBzv+epGoE7GfDL+Oa9+MD6VK
	/f+GmnexzPV1bpNGCIQtR9TPojgem448JQwCxV/8u9j8HiNB5n43CBuQ9M5IGpSsgv
	2sKjIoLSFq8EPTyCqQHeIdFdhRKWOhrsP/KYhDOU=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wB7JSj67041325
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 7 Dec 2018 13:28:45 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 7 Dec 2018 13:28:45 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 7 Dec 2018 13:28:45 -0600
Received: from UDA0216595.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wB7JSiJj021043
	for <meta-arago@arago-project.org>; Fri, 7 Dec 2018 13:28:45 -0600
From: Qin Su <qsu@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 7 Dec 2018 14:28:37 -0500
Message-ID: <1544210919-14906-1-git-send-email-qsu@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 1/3] matrix-gui-apps-git: bump SRCREV
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
X-List-Received-Date: Fri, 07 Dec 2018 19:28:58 -0000
Content-Type: text/plain

Added Arm NN Matrix GUI demo examples
Detect AM571x, to invoke TIDL classification demo with only one DSP

Signed-off-by: Qin Su <qsu@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index cc98aa2..e63b007 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
 
 SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
-SRCREV = "a40f814c5321964861b5d837278943a3c8eefcd9"
+SRCREV = "cde4f1895dc3b42354488e9927773a976cc38a4e"
 BRANCH = "master"
-INC_PR = "r62"
+INC_PR = "r63"
 
 # Pull in the base package for installing matrix applications
 require matrix-gui-apps.inc
-- 
1.9.1


