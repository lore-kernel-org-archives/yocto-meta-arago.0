Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id B4723529EF
	for <meta-arago@arago-project.org>;
	Thu,  8 Nov 2012 04:25:51 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id qA84Pokl020213;
	Wed, 7 Nov 2012 22:25:50 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qA84PoWr031367;
	Wed, 7 Nov 2012 22:25:50 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Wed, 7 Nov 2012 22:25:50 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH][for-comment] external-arago-toolchain:
	de-bashify
Thread-Index: AQHNvUGfJOc3aQlaMkyrVR2xZqp+qZffVmgw
Date: Thu, 8 Nov 2012 04:25:48 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C31B00A@DFLE09.ent.ti.com>
References: <1352331770-27964-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1352331770-27964-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH][for-comment] external-arago-toolchain:	de-bashify
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
X-List-Received-Date: Thu, 08 Nov 2012 04:25:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This patch fixed my build failure when building external-arago-toolchain. T=
he issue is with all the bracket expansion statements in the do_install tas=
k. However, in later recipes I was getting several toolchain errors complai=
ning about missing files.

I reverted this patch and simply switched my shell form dash to bash to fix=
 the build issue with this recipe.

-----Original Message-----
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Franklin S. Cooper Jr
Sent: Wednesday, November 07, 2012 5:43 PM
To: meta-arago@arago-project.org
Subject: [meta-arago] [PATCH][for-comment] external-arago-toolchain: de-bas=
hify

From: Franklin Cooper <fcooper@ubuntu.(none)>

* In dash shells bracket expansion is not supported. Replacing bracket
  expansion with logically equivalent statements.

Signed-off-by: Franklin Cooper <fcooper@ubuntu.(none)>
---
 .../recipes-core/meta/external-arago-toolchain.bb  |   21 +++++++++++++---=
---
 1 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/external-arago-toolchain.b=
b b/meta-arago-extras/recipes-core/meta/external-arago-toolchain.bb
index 26b9a6e..a73dc40 100644
--- a/meta-arago-extras/recipes-core/meta/external-arago-toolchain.bb
+++ b/meta-arago-extras/recipes-core/meta/external-arago-toolchain.bb
@@ -2,7 +2,7 @@ require recipes-core/eglibc/eglibc-package.inc
=20
 require external-arago-toolchain.inc
=20
-PR =3D "r2"
+PR =3D "r3"
=20
 INHIBIT_DEFAULT_DEPS =3D "1"
=20
@@ -234,15 +234,22 @@ do_install() {
 	install -d ${D}${includedir}
=20
 	cp -a ${TOOLCHAIN_PATH}/${ARAGO_TARGET_SYS}${datadir}/* ${D}${datadir}
-	cp -a ${TOOLCHAIN_PATH}/${ARAGO_TARGET_SYS}${base_libdir}/{lib*,ld*} ${D}=
${base_libdir}
+	cd ${TOOLCHAIN_PATH}/${ARAGO_TARGET_SYS}${base_libdir}/
+	cp -a lib* ld* ${D}${base_libdir}
 	cp -a ${TOOLCHAIN_PATH}/${ARAGO_TARGET_SYS}${base_sbindir}/ldconfig ${D}$=
{base_sbindir}
-	cp -a ${TOOLCHAIN_PATH}/${ARAGO_TARGET_SYS}${bindir}/{gdbserver,gencat,ge=
tconf,getent,iconv,locale,mtrace,pcprofiledump,rpcgen,sprof,tzselect,xtrace=
} ${D}${bindir}
-	cp -a ${TOOLCHAIN_PATH}/${ARAGO_TARGET_SYS}${sbindir}/{iconvconfig,rpcinf=
o,zdump,zic} ${D}${sbindir}
-	cp -a ${TOOLCHAIN_PATH}/${ARAGO_TARGET_SYS}${includedir}/{arpa,asm*,bits,=
drm,gnu,linux,mtd,net*,nfs,protocols,rdma,rpc*,scsi,sound,sys*,video,*.h} $=
{D}${includedir}
-	cp -a ${TOOLCHAIN_PATH}/${ARAGO_TARGET_SYS}${libdir}/{?crt1.o,crt?.o,libB=
rokenLocale*,libanl*,libc.*,libc_*,libcrypt.*,libcidn.*,libdl.*,libg.*,libi=
eee.*,libm.*,libmcheck.*,libnsl*,libnss*,libpthread*,libresolv*,librt*,libs=
tdc*,libsupc*,libthread*,libutil*} ${D}${libdir}
+	cd ${TOOLCHAIN_PATH}/${ARAGO_TARGET_SYS}${bindir}/
+	cp -a gdbserver gencat getconf getent iconv locale mtrace pcprofiledump r=
pcgen sprof tzselect xtrace ${D}${bindir}
+	cd ${TOOLCHAIN_PATH}/${ARAGO_TARGET_SYS}${sbindir}/
+	cp -a iconvconfig rpcinfo zdump zic ${D}${sbindir}
+	cd ${TOOLCHAIN_PATH}/${ARAGO_TARGET_SYS}${includedir}/
+	cp -a arpa asm* bits drm gnu linux mtd net* nfs protocols rdma rpc* scsi =
sound sys* video *.h ${D}${includedir}
+	cd ${TOOLCHAIN_PATH}/${ARAGO_TARGET_SYS}${libdir}/
+	cp -a ?crt1.o crt?.o libBrokenLocale* libanl* libc.* libc_* libcrypt.* li=
bcidn.* libdl.* libg.* libieee.* libm.* libmcheck.* libnsl* libnss* libpthr=
ead* libresolv* librt* libstdc* libsupc* libthread* libutil* ${D}${libdir}
+
 	rm -rf ${D}${base_libdir}/*.la
 	rm -rf ${D}${libdir}/*.la
-	rm -rf ${D}${includedir}/{zconf,zlib}.h
+	rm -rf ${D}${includedir}/zlib.h
+	rm -rf ${D}${includedir}/zconf.h
=20
 	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-ar=
ago-toolchain', '', 'rm -rf ${D}${includedir}/linux', d)}
=20
--=20
1.7.0.4

_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

