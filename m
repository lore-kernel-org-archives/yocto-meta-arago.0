Return-Path: <g-tammana@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 57B0C52970
	for <meta-arago@arago-project.org>;
	Thu, 17 Sep 2020 15:06:15 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08HF3Jbs093889
	for <meta-arago@arago-project.org>; Thu, 17 Sep 2020 10:03:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1600354999;
	bh=VaTEzgoaNJA+gXAnmlIdjRfj9Jp3Jkb5CkeDIyA+nbg=;
	h=From:To:CC:Subject:Date;
	b=YLSE9ZqxEPbF72KeinR4khhSAhneRWFo9YOpDFuVvhVX780croXPMTcG1ulv+j9Eb
	Pkg2/t/UFNnGj9763VVy96w/8FQsc54mEf5T6FYwr/UZR9MWMY5AtbJAbDxi9zcIVT
	hPXeM3GTDflN6vL7huzubiCiZJsl/TizB6LAkzy4=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08HF3JH6101100
	for <meta-arago@arago-project.org>; Thu, 17 Sep 2020 10:03:19 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 17 Sep 2020 10:03:18 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 17 Sep 2020 10:03:18 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com
	[10.247.120.73])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08HF3I33032640;
	Thu, 17 Sep 2020 10:03:18 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.77.45])
	by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id
	08HF3IuB034703; Thu, 17 Sep 2020 10:03:18 -0500
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Denys Dmytriyenko <denys@ti.com>
Date: Thu, 17 Sep 2020 10:03:11 -0500
Message-ID: <20200917150311.22391-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [dunfell/master][PATCH] meta-toolchain-arago: Add pkgconfig datadir to pkg config path
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
X-List-Received-Date: Thu, 17 Sep 2020 15:06:15 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Some of the pkgconfig files are installed in the datadir, include that
in the PKG_CONFIG_PATH setting.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index bdaf9ccb..9a236006 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -40,7 +40,7 @@ toolchain_create_sdk_env_script () {
 	echo 'export PATH=$SDK_PATH_NATIVE${bindir_nativesdk}:$SDK_PATH_NATIVE${bindir_nativesdk}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}:$PATH' >> $script
 	echo 'export CPATH=$SDK_PATH_TARGET/usr/include:$CPATH' >> $script
 	echo 'export PKG_CONFIG_SYSROOT_DIR=$SDK_PATH_TARGET' >> $script
-	echo 'export PKG_CONFIG_PATH=$SDK_PATH_TARGET${libdir}/pkgconfig' >> $script
+	echo 'export PKG_CONFIG_PATH=$SDK_PATH_TARGET${libdir}/pkgconfig:$SDK_PATH_TARGET${datadir}/pkgconfig' >> $script
 	echo 'export PKG_CONFIG_ALLOW_SYSTEM_LIBS=1' >> $script
 	echo 'export CONFIG_SITE=$SDK_PATH/site-config-$REAL_MULTIMACH_TARGET_SYS' >> $script
 	printf 'export CC="\x24{TOOLCHAIN_PREFIX}gcc --sysroot=$SDK_PATH_TARGET"\n' >> $script
-- 
2.28.0


