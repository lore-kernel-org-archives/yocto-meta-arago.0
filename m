Return-Path: <h-gou@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 9DED752983
	for <meta-arago@arago-project.org>;
	Tue,  9 Jan 2018 21:48:54 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w09LmlFf018259
	for <meta-arago@arago-project.org>; Tue, 9 Jan 2018 15:48:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1515534527;
	bh=WtBmN3Ih4NggCWkNUc6HEsG8va9Mr2BhuhjznWnA9Ec=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=A0lvPax1p8aR41EagyGus47ZhErC+b7612mRaOmPtLlRSj5rjV8e2JyUlOlOGbQ0x
	bE3MLefKDv89n1qCfR3LSxTXO90990vudN3hOQ6XPlip9RO9oeELuVwxDWTPROS5JC
	tIcD5ZiHQmXtVY3r3lHeiWztUEICGLa7uykt0hEQ=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w09Lml13022441
	for <meta-arago@arago-project.org>; Tue, 9 Jan 2018 15:48:47 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 9 Jan 2018 15:48:47 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 9 Jan 2018 15:48:47 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w09LmkRX011305;
	Tue, 9 Jan 2018 15:48:47 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 9 Jan 2018 16:48:40 -0500
Message-ID: <1515534524-21325-2-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1515534524-21325-1-git-send-email-a0271529@ti.com>
References: <1515534524-21325-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 1/5] ccief-basic: upstreamed to meta-arago
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
X-List-Received-Date: Tue, 09 Jan 2018 21:48:55 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-support/cclink/ccief-basic_git.bbappend | 3 ---
 1 file changed, 3 deletions(-)
 delete mode 100644 recipes-support/cclink/ccief-basic_git.bbappend

diff --git a/recipes-support/cclink/ccief-basic_git.bbappend b/recipes-support/cclink/ccief-basic_git.bbappend
deleted file mode 100644
index 2d3f0ab..0000000
--- a/recipes-support/cclink/ccief-basic_git.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-PR_append = ".tisdk0"
-
-CCIEF-BASIC_SRCREV = "ec2a42e61c85c6a5e858438c590b052f2e780d6f"
-- 
1.9.1


