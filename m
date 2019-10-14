Return-Path: <jake@udc0866934>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id ED976529A9
	for <meta-arago@arago-project.org>;
	Mon, 14 Oct 2019 16:12:16 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9EGB16l037703
	for <meta-arago@arago-project.org>; Mon, 14 Oct 2019 11:11:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1571069461;
	bh=UWjGmCpYtB/jnwEv3zx97lUTt+zTyENmCFpt6mmaO0E=;
	h=From:To:CC:Subject:Date;
	b=q82LiFNufVoy/L7ITguBI06PC9Q1cP9RYJI8kgk0tC+79OqXTLm/F4cqeYS/0kel+
	8UM3hzLcRAmZdPLeaNjLxvri98rTOyG0Cp6kkenUGZOTc9MUY0GWGcMC0I+Yw05Gjp
	OyPZ0tPlM/01vv6XWXWljrtuJk6Tgkhwq8gi6/+M=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9EGB1ts123727
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 14 Oct 2019 11:11:01 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 14 Oct 2019 11:11:01 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 14 Oct 2019 11:10:55 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9EGB1F2090761;
	Mon, 14 Oct 2019 11:11:01 -0500
Received: from jake by udc0866934 with local (Exim 4.82)
	(envelope-from <jake@udc0866934>)
	id 1iK2w0-0000cZ-Ro; Mon, 14 Oct 2019 12:11:00 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 14 Oct 2019 12:10:57 -0400
Message-ID: <1571069457-2314-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH] tisdk-server-rootfs-image: add packagegroup-arago-test-addons
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
X-List-Received-Date: Mon, 14 Oct 2019 16:12:17 -0000
Content-Type: text/plain

* This was missed when dropping tisdk-server-extra-rootfs-image.
* See 6fd2672b9034d1bc5e4890924a70fdc4d4eb09b8

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
index 09d9f9d..7c52e39 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
@@ -15,6 +15,7 @@ IMAGE_INSTALL += "\
     packagegroup-arago-tisdk-matrix-extra \
     packagegroup-arago-base-tisdk-server-extra \
     packagegroup-arago-tisdk-connectivity \
+    packagegroup-arago-test-addons \
 "
 
 export IMAGE_BASENAME = "tisdk-server-rootfs-image"
-- 
1.9.1


