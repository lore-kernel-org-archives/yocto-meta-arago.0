Return-Path: <nikhil.nd@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 0E3D952B53
	for <meta-arago@arago-project.org>;
	Wed, 16 Jun 2021 13:19:48 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15GDKX3F055003;
	Wed, 16 Jun 2021 08:20:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1623849633;
	bh=y6/mWKB7a+xh5kfnYPbIZhanzjQ4yD4vVsjOsDTmScI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=zSqfjjYfYvHXQ2ile/Bc31mRMHvyl6sI4tQNu1jtFRFFbeL03fD/a9E4OAYU5EFy6
	gKD3v8DUjd29/1C2nujiVE2xukguen5ePZfWIXP09Mqc85xpwKJUsP4XQhfCOSrlgj
	EOsWiP3ilnazzT3R0JEWApYJUS8euvsAiNIKrjcA=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15GDKXkn079334
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 16 Jun 2021 08:20:33 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Wed, 16 Jun 2021 08:20:32 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Wed, 16 Jun 2021 08:20:32 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15GDKSnq015027; 
	Wed, 16 Jun 2021 08:20:31 -0500
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <praneeth@ti.com>, <denis@denix.org>, <yogeshs@ti.com>
Date: Wed, 16 Jun 2021 18:50:23 +0530
Message-ID: <20210616132024.29566-2-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210616132024.29566-1-nikhil.nd@ti.com>
References: <20210616132024.29566-1-nikhil.nd@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [dunfell/master 1/2] recipes-tisdk: tisdk-makefile: Remove Jailhouse snippet
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
X-List-Received-Date: Wed, 16 Jun 2021 13:19:50 -0000
Content-Type: text/plain

Jailhouse support is dropped for K3 platforms. This will not be
packaged in the SDK any more. Drop the Makefile snippet for Jailhouse.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 .../ti-tisdk-makefile/Makefile_jailhouse      | 44 -------------------
 1 file changed, 44 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_jailhouse

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_jailhouse b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_jailhouse
deleted file mode 100644
index 8e70fd9d..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_jailhouse
+++ /dev/null
@@ -1,44 +0,0 @@
-# jailhouse module
-JH_ARCH = "__KERNEL_ARCH__"
-JH_PLATFORM = "__JH_PLATFORM__"
-
-jailhouse_config:
-	@echo =====================================
-	@echo      Configuring jailhouse
-	@echo =====================================
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "jailhouse*" -type d`; \
-	echo "#define CONFIG_TRACE_ERROR    1" >> include/jailhouse/config.h
-
-jailhouse: linux jailhouse_config
-	@echo =====================================
-	@echo      Building jailhouse
-	@echo =====================================
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "jailhouse*" -type d`; \
-	make ARCH=$(JH_ARCH) KDIR=${LINUXKERNEL_INSTALL_DIR}
-
-jailhouse_clean:
-	@echo =====================================
-	@echo      Cleaning jailhouse
-	@echo =====================================
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "jailhouse*" -type d`; \
-	make ARCH=$(JH_ARCH) KDIR=${LINUXKERNEL_INSTALL_DIR} clean
-
-jailhouse_distclean: jailhouse_clean
-	@echo =====================================
-	@echo      Distclean jailhouse
-	@echo =====================================
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "jailhouse*" -type d`; \
-	rm -vf ./hypervisor/include/jailhouse/config.h
-
-jailhouse_install:
-	@echo ================================
-	@echo      Installing jailhouse
-	@echo ================================
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "jailhouse*" -type d`; \
-	make ARCH=$(JH_ARCH) KDIR=${LINUXKERNEL_INSTALL_DIR} DESTDIR=$(DESTDIR) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) prefix=/usr install
-
-- 
2.17.1


