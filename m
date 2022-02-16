Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.9287.1644996947034646846
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 15 Feb 2022 23:35:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=f7yB2Ccl;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: a-m1@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21G7ZjdO102560
	for <meta-arago@lists.yoctoproject.org>; Wed, 16 Feb 2022 01:35:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1644996945;
	bh=ffcauneWZPgBqMC1mLTcNWkrRNOA4OhHvqdQ3tsqLv8=;
	h=From:To:CC:Subject:Date;
	b=f7yB2CclC7u0MWvmiJWdJTFkgoH5ap5FhgVHrqxcKF9wzEqBw1bj7jl+o6P6L34uJ
	 XkRnexetW/kMMnWlQJqqUm4SGE1TKM+cC17aB2DrMlIMbfNdcVb280Ncion2ercU4l
	 etA+Vuq5noQKzqV8IO71Cj2I9xDeA2MVg2nEnM9c=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21G7ZjMY091596
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 16 Feb 2022 01:35:45 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 16
 Feb 2022 01:35:45 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 16 Feb 2022 01:35:45 -0600
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21G7ZgUY032373;
	Wed, 16 Feb 2022 01:35:43 -0600
From: "Aparna M" <a-m1@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <yogeshs@ti.com>, <praneeth@ti.com>
CC: <nikhil.nd@ti.com>, <nsekhar@ti.com>, Aparna M <a-m1@ti.com>
Subject: [meta-arago][tisdk-setup-scripts][master][PATCH] setup-targetfs-nfs: Modify script to search for tisdk-default-image
Date: Wed, 16 Feb 2022 13:05:39 +0530
Message-ID: <20220216073539.25993-1-a-m1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

The tisdk-rootfs-image has been renamed to tisdk-default-image. Modify
the script to search for the renamed default rootfs so the customer can
pick the preferred rootfs to be installed.

Signed-off-by: Aparna M <a-m1@ti.com>
---
 setup-targetfs-nfs.sh | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/setup-targetfs-nfs.sh b/setup-targetfs-nfs.sh
index 8f7fbb1..8f89f0d 100644
--- a/setup-targetfs-nfs.sh
+++ b/setup-targetfs-nfs.sh
@@ -59,19 +59,19 @@ extract_fs() {
     fstar=""
     while [ -z "$fstar" ]
     do
-        numfs=`ls $cwd/../filesystem | grep "tisdk.*rootfs" | grep 'tar.xz' | grep -n '' | grep '2:' | awk {'print $1'}`
+        numfs=`ls $cwd/../filesystem | grep "tisdk.*rootfs\|tisdk.*default" | grep 'tar.xz' | grep -n '' | grep '2:' | awk {'print $1'}`
         if [ -n "$numfs" ]
         then
             echo
             echo "Multiple filesystems found."
-            ls --sort=size $cwd/../filesystem | grep "tisdk.*rootfs" | grep 'tar.xz' | grep -n '' | awk {'print "       " , $1'}
+            ls --sort=size $cwd/../filesystem | grep "tisdk.*rootfs\|tisdk.*default" | grep 'tar.xz' | grep -n '' | awk {'print "       " , $1'}
             echo
-            read -p "Enter Number of rootfs Tarball: [1] " fsnum
+            read -p "Enter Number of rootfs Tarball: [1 or 2] " fsnum
             [ -n "$fsnum" ] || fsnum=1
             echo
-            fstar=`ls --sort=size $cwd/../filesystem | grep "tisdk.*rootfs" | grep 'tar.xz' | grep -n '' | grep "^$fsnum:" | cut -c3- | awk {'print$1'}`
+            fstar=`ls --sort=size $cwd/../filesystem | grep "tisdk.*rootfs\|tisdk.*default" | grep 'tar.xz' | grep -n '' | grep "^$fsnum:" | cut -c3- | awk {'print$1'}`
         else
-            fstar=`ls  $cwd/../filesystem | grep "tisdk.*rootfs" | grep 'tar.xz' | awk {'print $1'}`
+            fstar=`ls  $cwd/../filesystem | grep "tisdk.*rootfs\|tisdk.*default" | grep 'tar.xz' | awk {'print $1'}`
         fi
         if [ -z "$fstar" ]
         then
-- 
2.17.1

