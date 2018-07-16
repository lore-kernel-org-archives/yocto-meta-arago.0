Return-Path: <jake@udc0866934>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 5B1B0529BC
	for <meta-arago@arago-project.org>;
	Mon, 16 Jul 2018 16:05:18 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6GG5Bjv130847
	for <meta-arago@arago-project.org>; Mon, 16 Jul 2018 11:05:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531757111;
	bh=56Wyn2dIth3D56olcbXBmr50tx/Y7je7xMQlOBq0zXs=;
	h=From:To:CC:Subject:Date;
	b=Dmh38U6siSB7+jmR8PGHfcgMAFkkOPdhBqOkQBGSCakFuQPpYamuFmhlBvyUr5p3v
	q+JkUN8H2a72nrfvTgJnYccz2ZhqY4RTg5BX1tfRCiEpwWYJ2um/Ic7czuAlH7pXSY
	3ZCcbZNHa1oa1ypiunZ0K0id3Pxhe69OAT3/bA1Q=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6GG5Bii018407
	for <meta-arago@arago-project.org>; Mon, 16 Jul 2018 11:05:11 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 16 Jul 2018 11:05:11 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 16 Jul 2018 11:05:11 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6GG5AQF015957;
	Mon, 16 Jul 2018 11:05:11 -0500
Received: from jake by udc0866934 with local (Exim 4.82)
	(envelope-from <jake@udc0866934>)
	id 1ff5zq-00070p-Hn; Mon, 16 Jul 2018 12:05:10 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 16 Jul 2018 12:05:07 -0400
Message-ID: <1531757107-26910-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [tisdk-setup-scripts][PATCH] setup-package-install: add lzop to list of packages
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
X-List-Received-Date: Mon, 16 Jul 2018 16:05:18 -0000
Content-Type: text/plain

* lzop is used within the kernel and U-Boot builds.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 setup-package-install.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/setup-package-install.sh b/setup-package-install.sh
index c5c134f..77f235a 100644
--- a/setup-package-install.sh
+++ b/setup-package-install.sh
@@ -56,7 +56,7 @@ cwd=`dirname $0`
 
 entry_header
 
-packages_to_install="xinetd tftpd nfs-kernel-server minicom build-essential libncurses5-dev autoconf automake dos2unix screen lrzsz"
+packages_to_install="xinetd tftpd nfs-kernel-server minicom build-essential libncurses5-dev autoconf automake dos2unix screen lrzsz lzop"
 
 get_host_type host
 
-- 
1.9.1


