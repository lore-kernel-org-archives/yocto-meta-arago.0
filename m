Return-Path: <yogeshs@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 735F652B11
	for <meta-arago@arago-project.org>;
	Thu, 27 May 2021 07:47:36 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14R7mDcA124131;
	Thu, 27 May 2021 02:48:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1622101693;
	bh=hox7jWnds3+hW+oq8GtXXuhfdB/TJRqjWvVU39R+LMs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=W3bxBWuSDzbmipgiwXb+VgT1mBW3VnXUq4FXdgUoQkzo2bJtRMHr7XvyJaCyGk9hM
	66w10d4Jzq+TsZ0+1Y6y3OBPAPpNWW7qEjCYE8at9SY5KXy5OE6E7L1UIXP5a8gXtw
	F1Uh78s8mdOoTcb5RsWyvTSaK3lDJck26Le2XOYg=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14R7mDqP001231
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 May 2021 02:48:13 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Thu, 27 May 2021 02:48:13 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Thu, 27 May 2021 02:48:13 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14R7mDjb118588;
	Thu, 27 May 2021 02:48:13 -0500
From: Yogesh Siraswar <yogeshs@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Praneeth Bajjuri
	<praneeth@ti.com>, Nishant Menon <nm@ti.com>
Date: Thu, 27 May 2021 02:48:12 -0500
Message-ID: <20210527074813.31042-3-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210527074813.31042-1-yogeshs@ti.com>
References: <20210527074813.31042-1-yogeshs@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [dunfell][PATCH 2/3] switch-config: update to the latest version for kernel 5.10 fixes
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
X-List-Received-Date: Thu, 27 May 2021 07:47:37 -0000
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

update to the latest version to fix build for kernel without switchioctl

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
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


