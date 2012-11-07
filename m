Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 1DCC952A0E
	for <meta-arago@arago-project.org>;
	Wed,  7 Nov 2012 23:42:56 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so2086261oag.38
	for <meta-arago@arago-project.org>;
	Wed, 07 Nov 2012 15:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=8nd4GMXyFt6E+g0w9OhhQKQ7hINkqXNWg6gkMVAtYAQ=;
	b=rF+B1uY9JlLrBq61p7rHYtYL9L695J1Wqf/EcRnmf3ltZwLIufthOqbfjg5cLmlFLs
	sLXxAaLC8Eq7YPQ2sYA8syZdzH1cswD57I5Kcx8nekCN9Wi5Am2Sha4XHabl9f3ChPqy
	x4K8FTvypC3vSrp5+r3G6EasgdPrh+ZmpkfvmwjEQ8FAHWRefJf0unBCFlqR/stH3kEc
	Zk7/76+6FPKb4Eon2DgcXdkTBhqlequoyZ06A3dXwQ+zU0H5Vuxs042LuBUdDOzX7Dgp
	54jsnErgiOURcrGTrHYW9zZ03MvQ4SYT6eQMSlOesaf774O9J5pCCgDesilD4xBN0Sjn
	0Heg==
Received: by 10.60.10.37 with SMTP id f5mr3450695oeb.2.1352331775420;
	Wed, 07 Nov 2012 15:42:55 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id zy9sm2152353oeb.4.2012.11.07.15.42.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Nov 2012 15:42:54 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Wed,  7 Nov 2012 17:42:50 -0600
Message-Id: <1352331770-27964-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH][for-comment] external-arago-toolchain: de-bashify
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
X-List-Received-Date: Wed, 07 Nov 2012 23:42:56 -0000

From: Franklin Cooper <fcooper@ubuntu.(none)>

* In dash shells bracket expansion is not supported. Replacing bracket
  expansion with logically equivalent statements.

Signed-off-by: Franklin Cooper <fcooper@ubuntu.(none)>
---
 .../recipes-core/meta/external-arago-toolchain.bb  |   21 +++++++++++++------
 1 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/external-arago-toolchain.bb b/meta-arago-extras/recipes-core/meta/external-arago-toolchain.bb
index 26b9a6e..a73dc40 100644
--- a/meta-arago-extras/recipes-core/meta/external-arago-toolchain.bb
+++ b/meta-arago-extras/recipes-core/meta/external-arago-toolchain.bb
@@ -2,7 +2,7 @@ require recipes-core/eglibc/eglibc-package.inc
 
 require external-arago-toolchain.inc
 
-PR = "r2"
+PR = "r3"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
@@ -234,15 +234,22 @@ do_install() {
 	install -d ${D}${includedir}
 
 	cp -a ${TOOLCHAIN_PATH}/${ARAGO_TARGET_SYS}${datadir}/* ${D}${datadir}
-	cp -a ${TOOLCHAIN_PATH}/${ARAGO_TARGET_SYS}${base_libdir}/{lib*,ld*} ${D}${base_libdir}
+	cd ${TOOLCHAIN_PATH}/${ARAGO_TARGET_SYS}${base_libdir}/
+	cp -a lib* ld* ${D}${base_libdir}
 	cp -a ${TOOLCHAIN_PATH}/${ARAGO_TARGET_SYS}${base_sbindir}/ldconfig ${D}${base_sbindir}
-	cp -a ${TOOLCHAIN_PATH}/${ARAGO_TARGET_SYS}${bindir}/{gdbserver,gencat,getconf,getent,iconv,locale,mtrace,pcprofiledump,rpcgen,sprof,tzselect,xtrace} ${D}${bindir}
-	cp -a ${TOOLCHAIN_PATH}/${ARAGO_TARGET_SYS}${sbindir}/{iconvconfig,rpcinfo,zdump,zic} ${D}${sbindir}
-	cp -a ${TOOLCHAIN_PATH}/${ARAGO_TARGET_SYS}${includedir}/{arpa,asm*,bits,drm,gnu,linux,mtd,net*,nfs,protocols,rdma,rpc*,scsi,sound,sys*,video,*.h} ${D}${includedir}
-	cp -a ${TOOLCHAIN_PATH}/${ARAGO_TARGET_SYS}${libdir}/{?crt1.o,crt?.o,libBrokenLocale*,libanl*,libc.*,libc_*,libcrypt.*,libcidn.*,libdl.*,libg.*,libieee.*,libm.*,libmcheck.*,libnsl*,libnss*,libpthread*,libresolv*,librt*,libstdc*,libsupc*,libthread*,libutil*} ${D}${libdir}
+	cd ${TOOLCHAIN_PATH}/${ARAGO_TARGET_SYS}${bindir}/
+	cp -a gdbserver gencat getconf getent iconv locale mtrace pcprofiledump rpcgen sprof tzselect xtrace ${D}${bindir}
+	cd ${TOOLCHAIN_PATH}/${ARAGO_TARGET_SYS}${sbindir}/
+	cp -a iconvconfig rpcinfo zdump zic ${D}${sbindir}
+	cd ${TOOLCHAIN_PATH}/${ARAGO_TARGET_SYS}${includedir}/
+	cp -a arpa asm* bits drm gnu linux mtd net* nfs protocols rdma rpc* scsi sound sys* video *.h ${D}${includedir}
+	cd ${TOOLCHAIN_PATH}/${ARAGO_TARGET_SYS}${libdir}/
+	cp -a ?crt1.o crt?.o libBrokenLocale* libanl* libc.* libc_* libcrypt.* libcidn.* libdl.* libg.* libieee.* libm.* libmcheck.* libnsl* libnss* libpthread* libresolv* librt* libstdc* libsupc* libthread* libutil* ${D}${libdir}
+
 	rm -rf ${D}${base_libdir}/*.la
 	rm -rf ${D}${libdir}/*.la
-	rm -rf ${D}${includedir}/{zconf,zlib}.h
+	rm -rf ${D}${includedir}/zlib.h
+	rm -rf ${D}${includedir}/zconf.h
 
 	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-arago-toolchain', '', 'rm -rf ${D}${includedir}/linux', d)}
 
-- 
1.7.0.4


