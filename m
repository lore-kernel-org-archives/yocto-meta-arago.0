Return-Path: <praneeth@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 988AA52CA9
	for <meta-arago@arago-project.org>;
	Tue, 13 Apr 2021 04:46:48 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13D4lCSU126850;
	Mon, 12 Apr 2021 23:47:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618289232;
	bh=UkJuT9FnbTa0mZBysq3qVkV+40XVJyR1P4G246qlN9A=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=J6pnhXGWD8rAHBAmk196j4me/F6Xe1wMMuC7z1dnj5AJTGxkDEUeauy9BwM2q6vBh
	cgz5ERctHsRPd6p9FL7Z8ENoUqKuqNn4Ppe/smkabfx7n3gMZEBleb3l9zEoyJWFRR
	Y3fJKnJojAHBkzPeznBFEKYJccuZ8vBSQWqku2jo=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13D4lCnK095336
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 Apr 2021 23:47:12 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Mon, 12 Apr 2021 23:47:12 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Mon, 12 Apr 2021 23:47:12 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13D4lCS2106611;
	Mon, 12 Apr 2021 23:47:12 -0500
From: <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
Date: Mon, 12 Apr 2021 23:47:11 -0500
Message-ID: <20210413044711.12576-3-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210413044711.12576-1-praneeth@ti.com>
References: <20210413044711.12576-1-praneeth@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell/master PATCH 3/3] Revert "branding: Add branding-core-next to aid in migration"
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
X-List-Received-Date: Tue, 13 Apr 2021 04:46:49 -0000
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

This reverts commit 9fb5311581b7730e64a8bffbbee0147eefd4edb7.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 .../conf/distro/include/branding-core-next.inc            | 8 --------
 meta-arago-distro/conf/distro/include/branding-core.inc   | 5 -----
 2 files changed, 13 deletions(-)
 delete mode 100644 meta-arago-distro/conf/distro/include/branding-core-next.inc

diff --git a/meta-arago-distro/conf/distro/include/branding-core-next.inc b/meta-arago-distro/conf/distro/include/branding-core-next.inc
deleted file mode 100644
index 3828a8d7..00000000
--- a/meta-arago-distro/conf/distro/include/branding-core-next.inc
+++ /dev/null
@@ -1,8 +0,0 @@
-# Special "migration" branding for testing components that are to be updated in LTS migration
-
-require branding-core.inc
-
-PREFERRED_VERSION_linux-ti-staging = ""
-PREFERRED_VERSION_linux-ti-staging-rt = ""
-PREFERRED_VERSION_linux-ti-staging-systest = ""
-PREFERRED_VERSION_u-boot-ti-staging = ""
diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
index 2e3759eb..cab9831b 100644
--- a/meta-arago-distro/conf/distro/include/branding-core.inc
+++ b/meta-arago-distro/conf/distro/include/branding-core.inc
@@ -11,8 +11,3 @@ ALTERNATIVE_PRIORITY_pn-opencl-monitor-ipu = "1"
 
 # Raise priority for sample IPC FW images
 ALTERNATIVE_PRIORITY_pn-ti-ipc-rtos = "15"
-
-PREFERRED_VERSION_linux-ti-staging = "5.4%"
-PREFERRED_VERSION_linux-ti-staging-rt = "5.4%"
-PREFERRED_VERSION_linux-ti-staging-systest = "5.4%"
-PREFERRED_VERSION_u-boot-ti-staging = "2020.01%"
-- 
2.17.1


