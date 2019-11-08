Return-Path: <e-ruei1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 6B49252A44
	for <meta-arago@arago-project.org>;
	Fri,  8 Nov 2019 22:44:11 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA8MgmkP012708
	for <meta-arago@arago-project.org>; Fri, 8 Nov 2019 16:42:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573252968;
	bh=qIaDuB4DzEi9Ic45JFiuAPGaME+JKW/b1oNv0JjVgEI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=OemFQi+/IhRsI46Imb0VkTtGnx//M/fENHN84CC+yJLr74AtPizY11R3KChaXxH0f
	d6ZqCRluKnlbyEYx6qcVlIpUSI+8J7fY1EzQnkeWG+s72GP9cfjrZ+KF76/EyWnlEZ
	0OF7rgcIhk+DyjdWMceqUN0iTveu65u68C3f4nek=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA8Mgmo9037267
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 8 Nov 2019 16:42:48 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 8 Nov 2019 16:42:32 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 8 Nov 2019 16:42:31 -0600
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA8MgkmD115946
	for <meta-arago@arago-project.org>; Fri, 8 Nov 2019 16:42:47 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 8 Nov 2019 17:42:36 -0500
Message-ID: <20191108224236.50548-5-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191108224236.50548-1-e-ruei1@ti.com>
References: <20191108224236.50548-1-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud][PATCH 4/4] glmark2: restrict udev enumeration to card0 only
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
X-List-Received-Date: Fri, 08 Nov 2019 22:44:14 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...-restrict-udev-enumeration-to-card0-.patch | 38 +++++++++++++++++++
 .../glmark2/glmark2_git.bbappend              |  6 +++
 2 files changed, 44 insertions(+)
 create mode 100644 meta-arago-distro/recipes-benchmark/glmark2/glmark2/0001-native-state-drm-restrict-udev-enumeration-to-card0-.patch
 create mode 100644 meta-arago-distro/recipes-benchmark/glmark2/glmark2_git.bbappend

diff --git a/meta-arago-distro/recipes-benchmark/glmark2/glmark2/0001-native-state-drm-restrict-udev-enumeration-to-card0-.patch b/meta-arago-distro/recipes-benchmark/glmark2/glmark2/0001-native-state-drm-restrict-udev-enumeration-to-card0-.patch
new file mode 100644
index 00000000..48c780cd
--- /dev/null
+++ b/meta-arago-distro/recipes-benchmark/glmark2/glmark2/0001-native-state-drm-restrict-udev-enumeration-to-card0-.patch
@@ -0,0 +1,38 @@
+From bdb9181fc9b8ba0e32129e07be0a92a6bce4dc55 Mon Sep 17 00:00:00 2001
+From: Eric Ruei <e-ruei1@ti.com>
+Date: Fri, 8 Nov 2019 11:49:28 -0500
+Subject: [PATCH] native-state-drm: restrict udev enumeration to card0 only
+
+In case of separate GPU and Display devices as found in embedded system,
+there could be modeset node and render node controlled by different
+drivers.  The current udev search algorithm does not verify whether
+the GPU DRM node is able to handle modesetting operation and thus select
+an invalid DRM node and then the DRM initialization will fail.
+
+This patch restricts the udev enumeration to card0 to ensure that the
+DRM device corresponding to dispaly is selected as the primarary DRM
+device.
+
+Upstream-Status: Inappropriate [Tentative workaround only]
+
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
+---
+ src/native-state-drm.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/native-state-drm.cpp b/src/native-state-drm.cpp
+index dc2b323..cf17d88 100644
+--- a/src/native-state-drm.cpp
++++ b/src/native-state-drm.cpp
+@@ -280,7 +280,7 @@ static std::string udev_main_gpu_drm_node_path()
+     auto dev_enumeration = udev_enumerate_new(udev);
+ 
+     udev_enumerate_add_match_subsystem(dev_enumeration, "drm");
+-    udev_enumerate_add_match_sysname(dev_enumeration, "card[0-9]*");
++    udev_enumerate_add_match_sysname(dev_enumeration, "card0");
+     udev_enumerate_scan_devices(dev_enumeration);
+ 
+     Log::debug("Looking for the main GPU DRM node...\n");
+-- 
+2.17.1
+
diff --git a/meta-arago-distro/recipes-benchmark/glmark2/glmark2_git.bbappend b/meta-arago-distro/recipes-benchmark/glmark2/glmark2_git.bbappend
new file mode 100644
index 00000000..9cd8ce77
--- /dev/null
+++ b/meta-arago-distro/recipes-benchmark/glmark2/glmark2_git.bbappend
@@ -0,0 +1,6 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+PR_append = ".arago0"
+
+SRC_URI += "file://0001-native-state-drm-restrict-udev-enumeration-to-card0-.patch"
+
-- 
2.17.1


