Return-Path: <g-tammana@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 2EBBC52C90
	for <meta-arago@arago-project.org>;
	Mon, 19 Apr 2021 21:15:31 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13JLFu9G041699;
	Mon, 19 Apr 2021 16:15:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618866956;
	bh=npI5cMnxjGnGTzl8XhDC8KzK+VZ0H9g1CwxvOiaN/7M=;
	h=From:To:CC:Subject:Date;
	b=MMLnqWBFy0MoXOuazn1fBbXam3WoPu4/CnXjmX8UewiQ8L9NOj8DuSUoQpHjCETua
	PGHP+lS8o1Fem2D1XhIAnUbGg9fV0OpuajS37epKIz/dukcTwdTl1HZndwpwiNakBP
	buH7eWRCwJn9AAM9gH5UN1J/kVZq6T1cv2oxHtqg=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13JLFuR8030301
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Apr 2021 16:15:56 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Mon, 19 Apr 2021 16:15:56 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Mon, 19 Apr 2021 16:15:56 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com
	[10.247.120.73])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13JLFu5l066478;
	Mon, 19 Apr 2021 16:15:56 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.81.224] (may be forged))
	by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id
	13JLFuMe015640; Mon, 19 Apr 2021 16:15:56 -0500
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Praneeth Bajjuri <praneeth@ti.com>,
	<denys@konsulko.com>
Date: Mon, 19 Apr 2021 16:15:50 -0500
Message-ID: <20210419211551.15216-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [dunfell/master][PATCH v2 1/2] packagegroups: remove jailhouse package for k3 platforms
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
X-List-Received-Date: Mon, 19 Apr 2021 21:15:31 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

jailhouse is not yet updated for kernel 5.10, remove the package for all
k3 platforms for now.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
v2:
  - remove it from the sdk-host package as well for tisdk-core-bundle image

 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb    | 1 -
 .../packagegroups/packagegroup-arago-tisdk-addons.bb             | 1 -
 2 files changed, 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index 46817f99..34cb619e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -37,7 +37,6 @@ UTILS_append_k2g = " \
 "
 
 UTILS_append_k3 = " \
-    jailhouse-src \
     ti-sci-fw-source \
     trusted-firmware-a-src \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index f92367d0..287cba63 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -59,7 +59,6 @@ UTILS_append_omap-a15 = " mmc-utils \
 UTILS_append_k3 = " mmc-utils \
                     switch-config \
                     irqbalance \
-                    jailhouse \
                     ti-rpmsg-char \
                     ti-rpmsg-char-examples \
                     statcol \
-- 
2.31.1


