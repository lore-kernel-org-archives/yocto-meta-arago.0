Return-Path: <nikhil.nd@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id D29CC52986
	for <meta-arago@arago-project.org>;
	Mon,  9 Dec 2019 08:36:51 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB98ZHp2085688
	for <meta-arago@arago-project.org>; Mon, 9 Dec 2019 02:35:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1575880517;
	bh=AoUeG6Uh1BxW70tiuswUyasCL3qjIkkSglGiAQcncC4=;
	h=From:To:CC:Subject:Date;
	b=eQ4m/640ATJ3hP5AB+NJyTtzlB6dokbRPGOGnmHn08Jsv7xHYiVsj9SG5q95//z4i
	aojtwCvz58cYf/iZIJvJdpQjNnfexz1Fr3As2e7OSPDXdVZcoPUVMUXNosnxMsiO3O
	YMBUACN0nyURPijzX57tfuKOpJWWYvHf092IASG8=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB98ZHbI053436
	for <meta-arago@arago-project.org>; Mon, 9 Dec 2019 02:35:17 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Mon, 9 Dec 2019 02:35:17 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Mon, 9 Dec 2019 02:35:17 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB98ZFmT086919; 
	Mon, 9 Dec 2019 02:35:16 -0600
From: Nikhil Devshatwar <a0132237@ti.com>
To: <meta-arago@arago-project.org>, <j-stiffler@ti.com>
Date: Mon, 9 Dec 2019 14:04:43 +0530
Message-ID: <20191209083443.3598-1-a0132237@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Nikhil Devshatwar <a0132237@ti.com>
Subject: [tisdk-setup-scripts][PATCH v1] setup-targetfs-nfs: Update command to replace Rules.make variables
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
X-List-Received-Date: Mon, 09 Dec 2019 08:36:52 -0000
Content-Type: text/plain

Update the setup-targetfs-nfs.sh to replace Rules.make variables
so that they are initialized conditionally.

Signed-off-by: Nikhil Devshatwar <a0132237@ti.com>
---
 setup-targetfs-nfs.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/setup-targetfs-nfs.sh b/setup-targetfs-nfs.sh
index 60817ca..ac1611c 100644
--- a/setup-targetfs-nfs.sh
+++ b/setup-targetfs-nfs.sh
@@ -145,10 +145,10 @@ echo "EXEC_DIR or DESTDIR variable (depending on your SDK)."
 echo
 read -p "Press return to continue" REPLY
 
-sed -i "s=EXEC_DIR\=.*$=EXEC_DIR\=$dst/home/root/$platform=g" $cwd/../Rules.make
+sed -i "s=EXEC_DIR ?\=.*$=EXEC_DIR ?\=$dst/home/root/$platform=g" $cwd/../Rules.make
 check_status
 
-sed -i "s=DESTDIR\=.*$=DESTDIR\=$dst=g" $cwd/../Rules.make
+sed -i "s=DESTDIR ?\=.*$=DESTDIR ?\=$dst=g" $cwd/../Rules.make
 check_status
 
 echo "Rules.make edited successfully.."
-- 
2.17.1


