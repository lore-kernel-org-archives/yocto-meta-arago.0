Return-Path: <praneeth@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 34DC052A7E
	for <meta-arago@arago-project.org>;
	Fri, 14 May 2021 06:51:21 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14E6psdR051435;
	Fri, 14 May 2021 01:51:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1620975114;
	bh=xGMjAALaumkvegV4dFAI/wkuzHfEvNZVlgTO7wcyasE=;
	h=From:To:CC:Subject:Date;
	b=LMc9iA0b9xY2+okUFzIGcz68jINy4PDeTbqhtI/Pa03Fs7u6emYVzrsvoGlwC6Wqu
	1plB4jxjbGI9Kq59Yg8A4hBSwKV2kG4YNLoHxct2/3GsojpSrgB+pXZ379UnyPqgGn
	9ZTWYuqtRm2iKbV+AzUtfJCDmTieuw4VsaS4ImR8=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14E6psis018985
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 14 May 2021 01:51:54 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Fri, 14 May 2021 01:51:53 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Fri, 14 May 2021 01:51:53 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14E6prv5130796;
	Fri, 14 May 2021 01:51:53 -0500
From: <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
Date: Fri, 14 May 2021 01:51:53 -0500
Message-ID: <20210514065153.12655-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell/master PATCH] switch-config: update to the latest version for kernel 5.10 fixes
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
X-List-Received-Date: Fri, 14 May 2021 06:51:21 -0000
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

update to the latest version to fix build for kernel without switchioctl

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 .../recipes-bsp/switch-config/switch-config_git.bb          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb b/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb
index 07368461..dca4bfe1 100644
--- a/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb
+++ b/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb
@@ -3,13 +3,13 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://switch-config.c;beginline=1;endline=14;md5=659ff9658cbaba3110b81804af60de75"
 
 PV = "2.0"
-PR = "r4"
+PR = "r5"
 
 BRANCH ?= "v4.1"
 BRANCH_aarch64 ?= "am65x-v1.0"
 
-SRCREV = "15e8be3b1249ac4193031127565eec5b64ecaff1"
-SRCREV_aarch64 = "3b31ce5fe8bd5a3560b89f2a709fb3e3b877326d"
+SRCREV = "412dce4e65cfe5af729be38fd1b4c1d59e9a8828"
+SRCREV_aarch64 = "0f52dcb3c4e3678e96427d546d6c2e1fabc2ad91"
 
 SRC_URI = "git://git.ti.com/switch-config/switch-config.git;protocol=git;branch=${BRANCH}"
 
-- 
2.17.1


