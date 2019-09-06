Return-Path: <nikhil.nd@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id A02C9520DE
	for <meta-arago@arago-project.org>;
	Fri,  6 Sep 2019 09:05:04 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8694080090780
	for <meta-arago@arago-project.org>; Fri, 6 Sep 2019 04:04:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1567760640;
	bh=cqzX6kGIpHCFzJmHsCblp7OO6LLOBidMwYCVH1xV94k=;
	h=From:To:CC:Subject:Date;
	b=gf4WIQrZWZLdweNiRHuUcrUWVjyOBjLlKlhz+AAcmQ/0jg/Fg8Lt1a89WKP9xCQF+
	vlwbWNpjVUF6sRY656QgmGy7GEWAvsJ8slT5qRe3or+1IAmoEn4UuqOKAjlr+rAk0g
	wtYddXxfQtjaro/FZXVdKvpxr6SGyJGHK5i3TIm0=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x86940xd064127
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 6 Sep 2019 04:04:00 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 6 Sep 2019 04:04:00 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 6 Sep 2019 04:04:00 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8693vVA080117; 
	Fri, 6 Sep 2019 04:03:58 -0500
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <meta-arago@arago-project.org>, <denys@ti.com>, <j-stiffler@ti.com>
Date: Fri, 6 Sep 2019 14:33:55 +0530
Message-ID: <1567760635-26943-1-git-send-email-nikhil.nd@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [ [thud/master] PATCH v1] packagegroup: Add ti-sci-src in addons-sdk-host
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
X-List-Received-Date: Fri, 06 Sep 2019 09:05:05 -0000
Content-Type: text/plain

packagegroup-arago-tisdk-addons-sdk-host is for adding sources for components
packagegroup-arago-tisdk-amsdk-sdk-host is for adding scripts

Move the ti-sci-src packge from amsdk-sdk-host to addons-sdk-host

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb           | 1 +
 .../packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb            | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index ec16713..fbdc735 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -38,6 +38,7 @@ UTILS_append_k2g = " \
 
 UTILS_append_k3 = " \
     jailhouse-src \
+    ti-sci-fw-src \
 "
 
 UTILS_append_am65xx = " \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
index b73c63b..ebe129b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
@@ -21,7 +21,7 @@ BOOT_MONITOR_keystone = "boot-monitor-src"
 EXTRA_FILES = ""
 EXTRA_FILES_ti43x = "tisdk-uenv"
 EXTRA_FILES_omap-a15 = "tisdk-readme tisdk-uenv"
-EXTRA_FILES_k3 = "tisdk-readme tisdk-uenv ti-sci-fw-src"
+EXTRA_FILES_k3 = "tisdk-readme tisdk-uenv"
 
 RDEPENDS_${PN} = "\
     ti-tisdk-setup \
-- 
1.9.1


