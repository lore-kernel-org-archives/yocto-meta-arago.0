Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 742A7C433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 18:28:15 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.13162.1647628093827365394
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 11:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Peoc32fA;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22IIS7Nx041489;
	Fri, 18 Mar 2022 13:28:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647628087;
	bh=4Ui87slazmqtAWSOuGKFLeFmj5evEicc3AsBw7Lxm+Y=;
	h=From:To:CC:Subject:Date;
	b=Peoc32fAbgEuCu7gt2axdJr/crDLh388J/tGH0cojp6BmRLZFjW7Ptp/5k0+zURo9
	 uKd+aRMDtzsD3LXFIKHQtK9ryC+625BYCfz61Lj8rBTLaYQCL0Ww0VomL7OYLSHrS4
	 i0IO9T8esKAnrzw0xQWK8+BrPUFIzXBm3WVGfZ0g=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22IIS76O065171
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Mar 2022 13:28:07 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 18
 Mar 2022 13:28:07 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 18 Mar 2022 13:28:07 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22IIS7Jt080117;
	Fri, 18 Mar 2022 13:28:07 -0500
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Nishanth Menon <nm@ti.com>
Subject: [oe-layersetup PATCH] oe-layertool-setup.sh: Provide valid image
 names
Date: Fri, 18 Mar 2022 13:28:05 -0500
Message-ID: <20220318182805.6734-1-nm@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 18 Mar 2022 18:28:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13659

Instead of providing generic image names that could change in the
future, lets try and parse the possible valid image names that users can
potentially use.

Signed-off-by: Nishanth Menon <nm@ti.com>
---

example output (with dunfell-config.txt):
	https://gist.github.com/nmenon/7c79070e048dda2397581ba8a72a1cdf

 oe-layertool-setup.sh | 37 +++++++++++++++++++++++++++++++------
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index 85be8b03f7d0..92945209771c 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -773,6 +773,35 @@ EOM
     sed -i "s|^DL_DIR.*|DL_DIR = \"${dldir}\"|" $confdir/local.conf
 }
 
+print_image_names() {
+    SOURCES="${1}"
+    FOLDERS=`find "${SOURCES}" -type d -a -iname images|grep recipes-core|sed -e "s/.*sources\///g"|cut -d '/' -f1|sort -u -r`
+    IMAGES=""
+    for FOLDER in ${FOLDERS}
+    do
+        RECO=""
+        if [ "${FOLDER}" == "meta-arago" ]; then
+            RECO="[recommended]"
+        fi
+        echo "From ${FOLDER}${RECO}:"
+        F_IMAGE_FOLDERS=`find "${SOURCES}/${FOLDER}" -type d -a -iname images|grep recipes-core`
+        for IMG_FOLDER in ${F_IMAGE_FOLDERS}
+        do
+            F_IMAGES=`find "${IMG_FOLDER}" -iname *.bb`
+            if [ -n "${F_IMAGES}" ]; then
+                for img in ${F_IMAGES}
+                do
+                    name=`basename "${img}"|sed 's/\.bb$//g'`
+                    summary=`grep SUMMARY "${img}"|cut -d '=' -f2| sed 's/["/]//g'|xargs  echo`
+                    if [ -z "${summary}" ]; then
+                        summary="No Summary available"
+                    fi
+                    echo -e "\t${name}: ${summary}"
+                done
+            fi
+        done
+    done
+}
 
 create_setenv_file() {
 cat << EOM
@@ -792,13 +821,9 @@ For example:
     MACHINE=xxxxx bitbake <target>
 
 Common targets are:
-    core-image-minimal
-    core-image-sato
-    meta-toolchain
-    meta-toolchain-sdk
-    adt-installer
-    meta-ide-support
 EOM
+print_image_names ${sourcedir}
+
 
     # Write the setenv file
 cat > $confdir/setenv << EOM
-- 
2.17.1


