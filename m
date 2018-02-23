Return-Path: <jjhiblot@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 55CFF52986
	for <meta-arago@arago-project.org>;
	Fri, 23 Feb 2018 14:58:26 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w1NEvwVI025047
	for <meta-arago@arago-project.org>; Fri, 23 Feb 2018 08:57:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1519397878;
	bh=jZP6wJ40babsVBOwR3vzpv8rKDIC7UKjzRoMCFi901Y=;
	h=From:To:CC:Subject:Date;
	b=rnMIFOV95jH76QPkpTmh4E5fsN5NMuwIPGkej66xmKxG3kvlfsEpwpMAfpBc3bltN
	3EgfLB7WtK6opUNLynFko4DT081528nLWYw+lQW951AUjNgxS+NzgYcgcDtuESOWvT
	T1HyfSgsCiw03gNmRpVYRKuG6RHhXnjhDQw17ln0=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1NEvw0k004932
	for <meta-arago@arago-project.org>; Fri, 23 Feb 2018 08:57:58 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 23 Feb 2018 08:57:57 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 23 Feb 2018 08:57:57 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1NEvuZQ014595;
	Fri, 23 Feb 2018 08:57:57 -0600
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <meta-arago@arago-project.org>, <denys@ti.com>
Date: Fri, 23 Feb 2018 15:57:57 +0100
Message-ID: <1519397877-15873-1-git-send-email-jjhiblot@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] ltp-ddt: Add missing run-time dependency
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
X-List-Received-Date: Fri, 23 Feb 2018 14:58:27 -0000
Content-Type: text/plain

Some LTP tests make use of pthread_cancel(). This function requires that
libgcc is installed. Otherwise it will fail and print out the following
message is printed out: "libgcc_s.so.1 must be installed for pthread_cancel
to work".

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
---
 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170929.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170929.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170929.bb
index 240e665..3626175 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170929.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170929.bb
@@ -33,6 +33,7 @@ RDEPENDS_${PN} = "\
     unzip \
     util-linux \
     which \
+    libgcc\
 "
 
 inherit autotools-brokensep
-- 
1.9.1


