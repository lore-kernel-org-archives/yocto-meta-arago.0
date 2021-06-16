Return-Path: <nikhil.nd@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 8004452B53
	for <meta-arago@arago-project.org>;
	Wed, 16 Jun 2021 13:19:50 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15GDKZG1055017;
	Wed, 16 Jun 2021 08:20:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1623849635;
	bh=WSC4ashm2zUUFyuMgyg6CpHpRIO0dgpDpbxFG6dtDGs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=s7RPhgxC/A9mvFHXhv0DbIXSkML2PvsBTLBErYd4oA73L1+ItgRhzBbeGjmleUjAM
	Tj0RxgJOALpGuZ4dSyK8PviZj+e8If0gdHQxRK9N0CZQDKeHs6vgCrdXkHNjMIzgR6
	IN9oRmWVJJX1F4iQk6+pge91TTBnRFgEKZc1bjjA=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15GDKZ1e112456
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 16 Jun 2021 08:20:35 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Wed, 16 Jun 2021 08:20:34 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Wed, 16 Jun 2021 08:20:35 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15GDKSnr015027; 
	Wed, 16 Jun 2021 08:20:33 -0500
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <praneeth@ti.com>, <denis@denix.org>, <yogeshs@ti.com>
Date: Wed, 16 Jun 2021 18:50:24 +0530
Message-ID: <20210616132024.29566-3-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210616132024.29566-1-nikhil.nd@ti.com>
References: <20210616132024.29566-1-nikhil.nd@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [dunfell/master 2/2] conf: arago: Remove jailhouse references
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
X-List-Received-Date: Wed, 16 Jun 2021 13:19:51 -0000
Content-Type: text/plain

Jailhouse support for K3 platforms is dropped. Remove the
refences to Jailhouse and IVSHMEM in the arago conf files.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf                   | 3 ---
 meta-arago-distro/conf/distro/include/arago-source-ipk.inc | 7 -------
 2 files changed, 10 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 206e65ef..508b636d 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -158,9 +158,6 @@ PACKAGECONFIG_append_pn-openssl = " cryptodev-linux"
 PACKAGECONFIG_remove_pn-alsa-plugins = "pulseaudio"
 RDEPENDS_pulseaudio-server_remove = "alsa-plugins-pulseaudio-conf"
 
-# Configure RAMFS for jailhouse linux-demo
-JH_RAMFS_IMAGE = "tisdk-tiny-image"
-
 # Enable UI and scripting for perf
 PERF_FEATURES_ENABLE ?= "perf-scripting perf-tui"
 
diff --git a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
index 232cd4c3..d4122339 100644
--- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
+++ b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
@@ -373,10 +373,6 @@ SRCIPK_INSTALL_DIR_pn-hplib-mod ?= "board-support/extra-drivers/${PN}-${PV}"
 CREATE_SRCIPK_pn-uio-module-drv ?= "1"
 SRCIPK_INSTALL_DIR_pn-uio-module-drv ?= "board-support/extra-drivers/${PN}-${PV}"
 
-CREATE_SRCIPK_pn-ivshmem-uio-driver ?= "1"
-SRCIPK_INSTALL_DIR_pn-ivshmem-uio-driver ?= "board-support/extra-drivers/${PN}-${PV}"
-SRCIPK_PRESERVE_GIT_pn-ivshmem-uio-driver ?= "true"
-
 CREATE_SRCIPK_pn-ipsecmgr-mod ?= "1"
 SRCIPK_INSTALL_DIR_pn-ipsecmgr-mod ?= "board-support/extra-drivers/${PN}-${PV}"
 
@@ -397,6 +393,3 @@ SRCIPK_INSTALL_DIR_pn-vlib-c66x ?= "component-sources/vlib_c66x_${PV}"
 
 CREATE_SRCIPK_pn-big-data-ipc-demo-linux ?= "1"
 SRCIPK_INSTALL_DIR_pn-big-data-ipc-demo-linux ?= "example-applications/${PN}-${PV}"
-
-CREATE_SRCIPK_pn-jailhouse ?= "1"
-SRCIPK_INSTALL_DIR_pn-jailhouse ?= "board-support/extra-drivers/${PN}-${PV}"
-- 
2.17.1


