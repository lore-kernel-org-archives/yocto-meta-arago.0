Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 1222C529F8
	for <meta-arago@arago-project.org>;
	Tue,  6 Mar 2018 16:39:22 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w26Gcebn032597
	for <meta-arago@arago-project.org>; Tue, 6 Mar 2018 10:38:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520354320;
	bh=McWJx4yTzyZgaw5uQMF2Wf9S6s2sRWaPXB3/my2seT4=;
	h=From:To:Subject:Date;
	b=HHd+TIXAqmP+zN+S0njr3R1Jr8PHW0xVfPYboxxHZuTQCaBWE4yfLHjtXmeUH7VOG
	AI4bX4rYc7YW3Atvo7L0IIm0ZwC4mh0V/+yBlXhvaLzjCFQgBqsBNNrNY/0MevYqBa
	BBp3vwjC7MKudhhxXqef3K7/q89qNLBZjTOfysXg=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w26GceML010344
	for <meta-arago@arago-project.org>; Tue, 6 Mar 2018 10:38:40 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 6 Mar 2018 10:38:39 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 6 Mar 2018 10:38:39 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w26GcdMW031579
	for <meta-arago@arago-project.org>; Tue, 6 Mar 2018 10:38:39 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 6 Mar 2018 11:38:34 -0500
Message-ID: <1520354314-8244-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH v2] video-graphics-test: bump SRCREV to pick up the latest version
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
X-List-Received-Date: Tue, 06 Mar 2018 16:39:22 -0000
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
index c19af16..ec676e7 100644
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
-SRCREV = "3b3007680845d39784146396a2dd2a68aa1a2283"
+SRCREV = "bdfbc4179d8d176feec1df148728b1882fca7416"
 
 SRC_URI = "git://git.ti.com/sitara-linux/video-graphics-test.git;protocol=git;branch=${BRANCH} \
 "
-- 
1.9.1


