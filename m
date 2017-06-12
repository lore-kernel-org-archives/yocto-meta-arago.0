Return-Path: <yan-liu@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id DF4A3529EE
	for <meta-arago@arago-project.org>;
	Mon, 12 Jun 2017 16:33:10 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5CGXAok011162
	for <meta-arago@arago-project.org>; Mon, 12 Jun 2017 11:33:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1497285190;
	bh=wdLkzrgpKKBNT81zG+2UvMSXuZjlRakHst6e4/osjpU=;
	h=From:To:CC:Subject:Date;
	b=JsOWCf83hCdDtmcjRLb+pjG2tU6zIqJ213oFSbedaT/ccnVxYrYhV2T9QUYlLscJT
	p0xhD6oQK+seLZjhWhJaYfxXjphSil9nmlaGqa9r1B32alniNVzDhwySpIHfZW6o4n
	VGnhDIKL8r0QoFcJpNumfdRkz7iQmYdc6WF0MF14=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5CGXA9Z015356
	for <meta-arago@arago-project.org>; Mon, 12 Jun 2017 11:33:10 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 12 Jun 2017 11:33:10 -0500
Received: from yan-ubuntu-1204.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v5CGXANg029941;	Mon, 12 Jun 2017 11:33:10 -0500
From: <yan-liu@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 12 Jun 2017 12:28:43 -0400
Message-ID: <1497284923-23714-1-git-send-email-yan-liu@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v1] ltp-ddt: Update to latest
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
X-List-Received-Date: Mon, 12 Jun 2017 16:33:12 -0000
Content-Type: text/plain

From: Yan Liu <yan-liu@ti.com>

Signed-off-by: Yan Liu <yan-liu@ti.com>
---
 .../recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb   |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb
index 8aac782..819d6f3 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb
@@ -4,7 +4,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-PR = "r17"
+PR = "r18"
 PV_append = "+git${SRCPV}"
 
 PROVIDES += "ltp"
@@ -14,7 +14,7 @@ RDEPENDS_${PN} += "pm-qa serialcheck"
 
 inherit autotools-brokensep
 
-SRCREV = "a0112c2b2ab82285dcdc49b675d8efe4e470d2e0"
+SRCREV = "2b3d35ac8bfe3158779a9795cd32dfbb8feebdb8"
 BRANCH ?= "master"
 
 SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH}"
-- 
1.7.9.5


