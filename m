Return-Path: <a0389345@dta0389345ub>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 25E7F52A4C
	for <meta-arago@arago-project.org>;
	Fri,  3 Jul 2020 18:04:55 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 063I2G48088895
	for <meta-arago@arago-project.org>; Fri, 3 Jul 2020 13:02:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1593799336;
	bh=gbMbFbHEmFkROrVGH7XFqHunxGSDT4eLyrblCdzeg84=;
	h=From:To:CC:Subject:Date;
	b=iVrfDo4oYUsR2wpou/1ObLfLTYr7ARjXnHyR2k81QRv2/Yx03nhlaBwxgoihqKEwL
	LZbB39QszGqpsTvkwg8bBXIJUCvpgr2X58z+wDF7J7CtBqL/bnlcoFzoxxh06JZ98y
	GjmjpwWMsJn3jzS3kbPBkNmVCseMOBXqrQrdCXo8=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 063I2G3n098639
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 3 Jul 2020 13:02:16 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Fri, 3 Jul 2020 13:02:16 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Fri, 3 Jul 2020 13:02:16 -0500
Received: from dta0389345ub (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 063I2GFm078341;
	Fri, 3 Jul 2020 13:02:16 -0500
Received: from a0389345 by dta0389345ub with local (Exim 4.90_1)
	(envelope-from <a0389345@dta0389345ub>)
	id 1jrQ0u-0003Ve-6O; Fri, 03 Jul 2020 13:02:16 -0500
From: <prao@ti.com>
To: <meta-arago@arago-project.org>, <denys@ti.com>, <j-stiffler@ti.com>,
	<nikhil.nd@ti.com>
Date: Fri, 3 Jul 2020 13:02:09 -0500
Message-ID: <20200703180209.13444-1-prao@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Praveen Rao <prao@ti.com>
Subject: [master/dunfell] meta-toolchain-arago: update script for handling filenames with spaces
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
X-List-Received-Date: Fri, 03 Jul 2020 18:04:55 -0000
Content-Type: text/plain

From: Praveen Rao <prao@ti.com>

Update the script that replace the prefix in all test files include files
having a space in its name

Signed-off-by: Praveen Rao <prao@ti.com>
---
 meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index 74d1303e..bdaf9ccb 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -324,7 +324,7 @@ if [ $relocate = 1 ] ; then
 fi
 
 # replace ${SDKPATH} with the new prefix in all text files: configs/scripts/etc
-$SUDO_EXEC find $native_sysroot -type f -exec file '{}' \;|grep ":.*\(ASCII\|script\|source\).*text"|cut -d':' -f1|$SUDO_EXEC xargs sed -i -e "s:$TMPSDKPATH:$target_sdk_dir:g"
+$SUDO_EXEC find $native_sysroot -type f -exec file '{}' \;|grep ":.*\(ASCII\|script\|source\).*text"|awk -F":" '{print "\""$1"\""}'|$SUDO_EXEC xargs sed -i -e "s:$TMPSDKPATH:$target_sdk_dir:g"
 
 # change all symlinks pointing to ${SDKPATH}
 for l in $($SUDO_EXEC find $native_sysroot -type l); do
-- 
2.17.1


