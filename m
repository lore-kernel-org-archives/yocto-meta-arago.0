Return-Path: <a0389345@dta0389345ub>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 7E2E752A42
	for <meta-arago@arago-project.org>;
	Fri,  3 Jul 2020 17:16:17 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 063HDc7V023912
	for <meta-arago@arago-project.org>; Fri, 3 Jul 2020 12:13:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1593796418;
	bh=ggI+Wnqy94IcVqNbYjPnKB4SZIZIUrLnHa/vxjMVKgc=;
	h=From:To:CC:Subject:Date;
	b=bI1ho7dTBOh2A65A/uELH6Qa2GK5Tcr/+jSgSSZLmU5MTIdwaFFwHLNvGOcIQsdlR
	LH5flp/dweyol9q3wh3wrEUNITc5avNExd46FYTrzkq4GR4uRc3cTR4wCJtbJYJ+Fk
	V/bdPDgzYCxmp7ad3sIwR7cjtsLHt7Qi1vTsB5Sk=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 063HDclH117224
	for <meta-arago@arago-project.org>; Fri, 3 Jul 2020 12:13:38 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Fri, 3 Jul 2020 12:13:38 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Fri, 3 Jul 2020 12:13:38 -0500
Received: from dta0389345ub (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 063HDcRs127693;
	Fri, 3 Jul 2020 12:13:38 -0500
Received: from a0389345 by dta0389345ub with local (Exim 4.90_1)
	(envelope-from <a0389345@dta0389345ub>)
	id 1jrPFq-000284-BZ; Fri, 03 Jul 2020 12:13:38 -0500
From: <prao@ti.com>
To: <meta-arago@arago-project.org>, <denys@ti.com>, <j-stiffler@ti.com>,
	<nikhil.nd@ti.com>
Date: Fri, 3 Jul 2020 12:13:35 -0500
Message-ID: <20200703171335.8138-1-prao@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Praveen Rao <prao@ti.com>
Subject: [tisdk-setup-scripts] setup-targetfs-nfs: Update the rootfs to default
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
X-List-Received-Date: Fri, 03 Jul 2020 17:16:17 -0000
Content-Type: text/plain

From: Praveen Rao <prao@ti.com>

The filesystem has change to tisdk-default-image.tar.xz

Signed-off-by: Praveen Rao <prao@ti.com>
---
 setup-targetfs-nfs.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/setup-targetfs-nfs.sh b/setup-targetfs-nfs.sh
index 8f7fbb1..c3062e9 100644
--- a/setup-targetfs-nfs.sh
+++ b/setup-targetfs-nfs.sh
@@ -59,19 +59,19 @@ extract_fs() {
     fstar=""
     while [ -z "$fstar" ]
     do
-        numfs=`ls $cwd/../filesystem | grep "tisdk.*rootfs" | grep 'tar.xz' | grep -n '' | grep '2:' | awk {'print $1'}`
+        numfs=`ls $cwd/../filesystem | grep "tisdk.*default" | grep 'tar.xz' | grep -n '' | grep '2:' | awk {'print $1'}`
         if [ -n "$numfs" ]
         then
             echo
             echo "Multiple filesystems found."
-            ls --sort=size $cwd/../filesystem | grep "tisdk.*rootfs" | grep 'tar.xz' | grep -n '' | awk {'print "       " , $1'}
+            ls --sort=size $cwd/../filesystem | grep "tisdk.*default" | grep 'tar.xz' | grep -n '' | awk {'print "       " , $1'}
             echo
             read -p "Enter Number of rootfs Tarball: [1] " fsnum
             [ -n "$fsnum" ] || fsnum=1
             echo
-            fstar=`ls --sort=size $cwd/../filesystem | grep "tisdk.*rootfs" | grep 'tar.xz' | grep -n '' | grep "^$fsnum:" | cut -c3- | awk {'print$1'}`
+            fstar=`ls --sort=size $cwd/../filesystem | grep "tisdk.*default" | grep 'tar.xz' | grep -n '' | grep "^$fsnum:" | cut -c3- | awk {'print$1'}`
         else
-            fstar=`ls  $cwd/../filesystem | grep "tisdk.*rootfs" | grep 'tar.xz' | awk {'print $1'}`
+            fstar=`ls  $cwd/../filesystem | grep "tisdk.*default" | grep 'tar.xz' | awk {'print $1'}`
         fi
         if [ -z "$fstar" ]
         then
-- 
2.17.1


