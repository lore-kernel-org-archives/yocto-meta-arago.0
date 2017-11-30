Return-Path: <manishalocal@uda0393239>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 0340052985
	for <meta-arago@arago-project.org>;
	Fri,  1 Dec 2017 02:27:21 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id vAUMXHSF009874
	for <meta-arago@arago-project.org>; Thu, 30 Nov 2017 16:33:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1512081197;
	bh=65nhKWSJS+CAewRg2ZKx0lIZLmzI/eY4jKK/2raUgeA=;
	h=From:To:CC:Subject:Date;
	b=JwZz5rF/RuixBRXEyAYJFPly8jGbGBRmnYzHrSJsD5VhPuFOwgtlcWfhT5YV8UFwQ
	dj+OB3L0PgrzCDBDMR2XS7+xnJLj5X49V50ywLV1leyLFs8TcL9AdEjgKAY/T8zDnL
	DqC+Zb8/j5zkU6OzWV7GIJcBiZwmv9IsJVbytqDs=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vAUMXHqt018956
	for <meta-arago@arago-project.org>; Thu, 30 Nov 2017 16:33:17 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 30 Nov 2017 16:33:17 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 30 Nov 2017 16:33:17 -0600
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vAUMXH9G004820;
	Thu, 30 Nov 2017 16:33:17 -0600
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1eKXOP-0008GY-2N; Thu, 30 Nov 2017 16:33:17 -0600
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 30 Nov 2017 16:33:08 -0600
Message-ID: <20171130223308.31738-1-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v1] recipes-multimedia : video-graphics-test : fix make install error
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
X-List-Received-Date: Fri, 01 Dec 2017 02:27:23 -0000
Content-Type: text/plain

Recipe update with commit id having fix for make install error

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb b/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb
index 28aacdf..c19af16 100644
--- a/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb
+++ b/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb
@@ -9,7 +9,7 @@ DEPENDS += "libdrm"
 PR = "r0"
 
 BRANCH = "master"
-SRCREV = "ebc7ab44d05fc726b0ddc7f4b45d71d7509313f5"
+SRCREV = "3b3007680845d39784146396a2dd2a68aa1a2283"
 
 SRC_URI = "git://git.ti.com/sitara-linux/video-graphics-test.git;protocol=git;branch=${BRANCH} \
 "
-- 
2.13.0


