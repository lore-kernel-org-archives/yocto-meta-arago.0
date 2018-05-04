Return-Path: <jjhiblot@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id D189452090
	for <meta-arago@arago-project.org>;
	Fri,  4 May 2018 09:09:42 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w4499cYJ015186;
	Fri, 4 May 2018 04:09:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1525424978;
	bh=HI9nKJr2tNLDNHOcLlfZfdGxz/d1AeHpsBC7gQIsAsY=;
	h=From:To:CC:Subject:Date;
	b=Qv+JbSkK699x84j5XW2HEhXjjqsbdp/oe8tCpbtR8+Doi4aLjuMoDETnCeSvQrQiU
	FqrBvUcvqr9kfVXF32oda8cjHrFMKrT+4+b5KLyW6tlhxr+hOpvyQd3jhJJZDnsaeD
	rIc+QHnLrhpJN6riwjOKiNOCiGt/rL0CrkD/SkzI=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4499cVw028845;
	Fri, 4 May 2018 04:09:38 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 4 May 2018 04:09:38 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 4 May 2018 04:09:38 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4499brW000884;
	Fri, 4 May 2018 04:09:38 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <denis@denix.org>
Date: Fri, 4 May 2018 11:09:31 +0200
Message-ID: <1525424972-26338-1-git-send-email-jjhiblot@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [rocko/master][PATCH 1/2] netboot-initd: Fix parsing error in init script
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
X-List-Received-Date: Fri, 04 May 2018 09:09:43 -0000
Content-Type: text/plain

The init script parses the kernel command line to extract information to
mount the NFS root filesystem. If a parameter starts with 'root', 'ip' or
'nfsroot' but is not one of those parameters (for example rootwait starts
with 'root' but is not the 'root' parameter), then the parsing fails.
Fix this by also looking for the '=' sign after the parameter name.

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
---
 meta-arago-distro/recipes-bsp/netboot-initrd/files/init-netboot.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-bsp/netboot-initrd/files/init-netboot.sh b/meta-arago-distro/recipes-bsp/netboot-initrd/files/init-netboot.sh
index ebfb7db..3da1507 100644
--- a/meta-arago-distro/recipes-bsp/netboot-initrd/files/init-netboot.sh
+++ b/meta-arago-distro/recipes-bsp/netboot-initrd/files/init-netboot.sh
@@ -13,8 +13,8 @@ beginswith() { case $2 in "$1"*) true;; *) false;; esac; }
 
 read_args() {
     for arg in $2; do
-        optarg=`expr "x$arg" : 'x[^=]*=\(.*\)'`
-        if beginswith $1 $arg ; then
+        if beginswith "$1=" $arg ; then
+		optarg=`expr "x$arg" : 'x[^=]*=\(.*\)'`
 		echo  $optarg
 		break
 	fi
-- 
2.7.4


