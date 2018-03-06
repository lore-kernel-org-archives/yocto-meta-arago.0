Return-Path: <e-ruei1@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 39208529F8
	for <meta-arago@arago-project.org>;
	Tue,  6 Mar 2018 15:06:56 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w26F6Emc018182
	for <meta-arago@arago-project.org>; Tue, 6 Mar 2018 09:06:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520348774;
	bh=X34Je/NCnupMTnABAzsraVEa2OoAmAs4Y1XrWXw3qhU=;
	h=From:To:Subject:Date;
	b=RozoD6aFnP8HjYbrN604AYXNteA51FGcZD0VXl1PbGaMY0t6lVGf76mVscDI/XeFQ
	lFV+hzI1e5g5GdsD5nXFoPn5hrk5NMIRDz4zm2HCo+vFnadH07Y3YmWMWyg/3dFPJY
	bIRASeQeq43zrsJf/ZWqTFFdPCaP27I0D3dUBGWM=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w26F6EOF025567
	for <meta-arago@arago-project.org>; Tue, 6 Mar 2018 09:06:14 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 6 Mar 2018 09:06:14 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 6 Mar 2018 09:06:14 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w26F6DQU000319
	for <meta-arago@arago-project.org>; Tue, 6 Mar 2018 09:06:14 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 6 Mar 2018 10:06:09 -0500
Message-ID: <1520348769-6194-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] video-graphics-test: bump SRCREV to pick up the latest version
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
X-List-Received-Date: Tue, 06 Mar 2018 15:06:56 -0000
Content-Type: text/plain

- include gc320
- QPA interface changes
- dual-screen support

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb b/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb
index 28aacdf..ec676e7 100644
--- a/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb
+++ b/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb
@@ -4,12 +4,12 @@ SECTION = "multimedia"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c7ca707704d3354a64feeb4f19f52eb5"
 
-DEPENDS += "libdrm"
+DEPENDS += "libdrm ti-gc320-libs"
 
-PR = "r0"
+PR = "r1"
 
 BRANCH = "master"
-SRCREV = "ebc7ab44d05fc726b0ddc7f4b45d71d7509313f5"
+SRCREV = "bdfbc4179d8d176feec1df148728b1882fca7416"
 
 SRC_URI = "git://git.ti.com/sitara-linux/video-graphics-test.git;protocol=git;branch=${BRANCH} \
 "
-- 
1.9.1


