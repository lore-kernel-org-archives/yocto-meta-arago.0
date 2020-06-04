Return-Path: <g-tammana@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id C47C652A1D
	for <meta-arago@arago-project.org>;
	Thu,  4 Jun 2020 00:08:53 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05406Mre028503
	for <meta-arago@arago-project.org>; Wed, 3 Jun 2020 19:06:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1591229182;
	bh=X9nAV1qXYIVTkKU+m/CammGd375ec+388aWQPmS/dKw=;
	h=From:To:CC:Subject:Date;
	b=iKJAukFYQoAldjVK192Jj/N//FXUwKGgQt8bCLktXCjXREEJyb2Q7YpP3qOgdKrxE
	QBb7Jg2C+n3C32z7sg87MX7o/1OwFIwpYgNFyqzJmAWuQsfjbQ6BNCn+I3PDcD2Ct5
	BiIVDpCK6i1wwxkYLyBYHR5eHC1w/mu9h/hYeeNE=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05406MPd109176
	for <meta-arago@arago-project.org>; Wed, 3 Jun 2020 19:06:22 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Wed, 3 Jun 2020 19:06:22 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Wed, 3 Jun 2020 19:06:22 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com
	[10.247.120.73])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05406M1o091784;
	Wed, 3 Jun 2020 19:06:22 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.77.97])
	by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id
	05406MQI089497; Wed, 3 Jun 2020 19:06:22 -0500
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Denys Dmytriyenko <denys@ti.com>
Date: Wed, 3 Jun 2020 19:06:22 -0500
Message-ID: <20200604000622.4119-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [dunfell][PATCH] wayland-ivi-extension: Update patch to weston-8
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
X-List-Received-Date: Thu, 04 Jun 2020 00:08:54 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

dunfell uses weston-8, update the ivi-id-agent dependencies patch to
use libweston-desktop-8.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 ...i-id-agent-update-dependencies-to-build-on-weston-8.patch} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/{03-ivi-id-agent-update-dependencies-to-build-on-weston-7.patch => 03-ivi-id-agent-update-dependencies-to-build-on-weston-8.patch} (94%)

diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/03-ivi-id-agent-update-dependencies-to-build-on-weston-7.patch b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/03-ivi-id-agent-update-dependencies-to-build-on-weston-8.patch
similarity index 94%
rename from meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/03-ivi-id-agent-update-dependencies-to-build-on-weston-7.patch
rename to meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/03-ivi-id-agent-update-dependencies-to-build-on-weston-8.patch
index 1b5f64e4..1b18d9bf 100644
--- a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/03-ivi-id-agent-update-dependencies-to-build-on-weston-7.patch
+++ b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/03-ivi-id-agent-update-dependencies-to-build-on-weston-8.patch
@@ -1,7 +1,7 @@
 From b99082adfaf250b15f03345cdf1b433fb1575581 Mon Sep 17 00:00:00 2001
 From: Rajendraprasad K J <KarammelJayakumar.Rajendraprasad@in.bosch.com>
 Date: Mon, 6 Jan 2020 06:45:54 -0500
-Subject: [PATCH] ivi-id-agent: update dependencies to build on weston 7
+Subject: [PATCH] ivi-id-agent: update dependencies to build on weston 8
 
 upgrade libweston-desktop version.
 
@@ -22,7 +22,7 @@ index 3e604a5..ff47808 100644
  pkg_check_modules(WESTON weston>=6.0.0 REQUIRED)
  pkg_check_modules(PIXMAN pixman-1 REQUIRED)
 -pkg_check_modules(LIBWESTON_DESKTOP libweston-desktop-6 REQUIRED)
-+pkg_check_modules(LIBWESTON_DESKTOP libweston-desktop-7 REQUIRED)
++pkg_check_modules(LIBWESTON_DESKTOP libweston-desktop-8 REQUIRED)
  
  find_package(Threads REQUIRED)
  
-- 
2.26.2


