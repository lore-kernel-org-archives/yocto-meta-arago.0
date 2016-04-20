Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 85FB852AA9
	for <meta-arago@arago-project.org>;
	Wed, 20 Apr 2016 19:33:54 +0000 (UTC)
Received: from vz-proxy-l008.mx.aol.com ([64.236.82.153])
	by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5Y005ED6BZM580@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 20 Apr 2016 14:33:35 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=t7CeM3EgAAAA:8 a=KiMCiSwjAAAA:8
	a=izCdmynFnr7_J5V0HeEA:9	a=fCPNkx0P2NuqFmCx:21 a=JfOXgj23NChH1aM7:21
Received: by 100.15.86.14 with SMTP id 4e1b468e; Wed, 20 Apr 2016 19:33:35 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id DD255161FC2;	Wed,
	20 Apr 2016 15:33:32 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 20 Apr 2016 15:33:24 -0400
Message-id: <1461180805-25733-16-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1461180805-25733-1-git-send-email-denis@denix.org>
References: <1461180805-25733-1-git-send-email-denis@denix.org>
Subject: [PATCH 15/16] strongswan: version 5.3.2 available in meta-oe, drop locally
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
X-List-Received-Date: Wed, 20 Apr 2016 19:33:55 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../strongswan/files/fix-funtion-parameter.patch   | 98 ----------------------
 .../recipes-support/strongswan/strongswan_5.3.2.bb | 45 ----------
 2 files changed, 143 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-support/strongswan/files/fix-funtion-parameter.patch
 delete mode 100644 meta-arago-extras/recipes-support/strongswan/strongswan_5.3.2.bb

diff --git a/meta-arago-extras/recipes-support/strongswan/files/fix-funtion-parameter.patch b/meta-arago-extras/recipes-support/strongswan/files/fix-funtion-parameter.patch
deleted file mode 100644
index da96983..0000000
--- a/meta-arago-extras/recipes-support/strongswan/files/fix-funtion-parameter.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-fix the function parameter
-
-Upstream-Status: pending
-
-Original openssl_diffie_hellman_create has three parameters, but
-it is reassigned a function pointer which has one parameter, and
-is called with one parameter, which will lead to segment fault
-on PPC, Now we simply correct the number of parameters.
-
-    #0  0x484d4aa0 in __GI_raise (sig=6)
-         at ../nptl/sysdeps/unix/sysv/linux/raise.c:64
-    #1  0x484d9930 in __GI_abort () at abort.c:91
-    #2  0x10002064 in segv_handler (signal=11) at charon.c:224
-    #3  <signal handler called>
-    #4  0x48d89630 in openssl_diffie_hellman_create (group=MODP_1024_BIT, g=...,
-         p=<error reading variable: Cannot access memory at address 0x0>)
-         at openssl_diffie_hellman.c:143
-    #5  0x482c54f8 in create_dh (this=0x11ac6e68, group=MODP_1024_BIT)
-         at crypto/crypto_factory.c:358
-    #6  0x48375884 in create_dh (this=<optimized out>, group=<optimized out>)
-         at sa/keymat.c:132
-    #7  0x483843b8 in process_payloads (this=0x51400a78, message=<optimized
-    out>)
-         at sa/tasks/ike_init.c:200
-    #8  0x483844d0 in process_r (this=0x51400a78, message=0x51500778)
-         at sa/tasks/ike_init.c:319
-    #9  0x48374c9c in process_request (message=0x51500778, this=0x51400d20)
-         at sa/task_manager.c:870
-    #10 process_message (this=0x51400d20, msg=0x51500778) at
-    sa/task_manager.c:925
-    #11 0x4836c378 in process_message (this=0x514005f0, message=0x51500778)
-         at sa/ike_sa.c:1317
-    #12 0x48362270 in execute (this=0x515008d0)
-         at processing/jobs/process_message_job.c:74 
-
-Signed-off-by: Roy.Li <rongqing.li@windriver.com>
----
- src/libstrongswan/plugins/openssl/openssl_diffie_hellman.c | 8 +++++++-
- src/libstrongswan/plugins/openssl/openssl_diffie_hellman.h | 4 +++-
- src/libstrongswan/plugins/openssl/openssl_plugin.c         | 1 +
- 3 files changed, 11 insertions(+), 2 deletions(-)
-
-diff --git a/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.c b/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.c
-index ff33824..bd21446 100644
---- a/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.c
-+++ b/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.c
-@@ -142,7 +142,7 @@ METHOD(diffie_hellman_t, destroy, void,
- /*
-  * Described in header.
-  */
--openssl_diffie_hellman_t *openssl_diffie_hellman_create(
-+openssl_diffie_hellman_t *openssl_diffie_hellman_create_custom(
- 							diffie_hellman_group_t group, chunk_t g, chunk_t p)
- {
- 	private_openssl_diffie_hellman_t *this;
-@@ -197,5 +197,11 @@ openssl_diffie_hellman_t *openssl_diffie_hellman_create(
- 
- 	return &this->public;
- }
-+openssl_diffie_hellman_t *openssl_diffie_hellman_create( diffie_hellman_group_t group)
-+{
-+	chunk_t g;
-+	chunk_t p;
-+	openssl_diffie_hellman_create_custom(group, g, p);
-+}
- 
- #endif /* OPENSSL_NO_DH */
-diff --git a/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.h b/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.h
-index 53dc59c..eb69eaa 100644
---- a/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.h
-+++ b/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.h
-@@ -44,8 +44,10 @@ struct openssl_diffie_hellman_t {
-  * @param p				custom prime, if MODP_CUSTOM
-  * @return				openssl_diffie_hellman_t object, NULL if not supported
-  */
--openssl_diffie_hellman_t *openssl_diffie_hellman_create(
-+openssl_diffie_hellman_t *openssl_diffie_hellman_create_custom(
- 							diffie_hellman_group_t group, chunk_t g, chunk_t p);
-+openssl_diffie_hellman_t *openssl_diffie_hellman_create(
-+							diffie_hellman_group_t group);
- 
- #endif /** OPENSSL_DIFFIE_HELLMAN_H_ @}*/
- 
-diff --git a/src/libstrongswan/plugins/openssl/openssl_plugin.c b/src/libstrongswan/plugins/openssl/openssl_plugin.c
-index ff25086..c76873d 100644
---- a/src/libstrongswan/plugins/openssl/openssl_plugin.c
-+++ b/src/libstrongswan/plugins/openssl/openssl_plugin.c
-@@ -388,6 +388,7 @@ METHOD(plugin_t, get_features, int,
- 			PLUGIN_PROVIDE(DH, MODP_1024_BIT),
- 			PLUGIN_PROVIDE(DH, MODP_1024_160),
- 			PLUGIN_PROVIDE(DH, MODP_768_BIT),
-+		PLUGIN_REGISTER(DH, openssl_diffie_hellman_create_custom),
- 			PLUGIN_PROVIDE(DH, MODP_CUSTOM),
- #endif
- #ifndef OPENSSL_NO_RSA
--- 
-1.8.3
-
diff --git a/meta-arago-extras/recipes-support/strongswan/strongswan_5.3.2.bb b/meta-arago-extras/recipes-support/strongswan/strongswan_5.3.2.bb
deleted file mode 100644
index a231a90..0000000
--- a/meta-arago-extras/recipes-support/strongswan/strongswan_5.3.2.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-DESCRIPTION = "strongSwan is an OpenSource IPsec implementation for the \
-Linux operating system."
-SUMMARY = "strongSwan is an OpenSource IPsec implementation"
-HOMEPAGE = "http://www.strongswan.org"
-SECTION = "net"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-DEPENDS = "gmp openssl flex-native flex bison-native"
-
-SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
-        file://fix-funtion-parameter.patch \
-"
-
-SRC_URI[md5sum] = "fab014be1477ef4ebf9a765e10f8802c"
-SRC_URI[sha256sum] = "a4a9bc8c4e42bdc4366a87a05a02bf9f425169a7ab0c6f4482d347e44acbf225"
-
-EXTRA_OECONF = "--enable-gmp \
-        --enable-openssl \
-        --without-lib-prefix \
-"
-
-EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
-
-PACKAGECONFIG ??= "sqlite3 curl \
-        ${@base_contains('DISTRO_FEATURES', 'ldap', 'ldap', '', d)} \
-"
-PACKAGECONFIG[sqlite3] = "--enable-sqlite,--disable-sqlite,sqlite3,"
-PACKAGECONFIG[ldap] = "--enable-ldap,--disable-ldap,openldap,"
-PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl,"
-PACKAGECONFIG[soup] = "--enable-soup,--disable-soup,libsoup-2.4,"
-PACKAGECONFIG[mysql] = "--enable-mysql,--disable-mysql,mysql5,"
-
-inherit autotools systemd pkgconfig
-
-RRECOMMENDS_${PN} = "kernel-module-ipsec"
-
-FILES_${PN} += "${libdir}/ipsec/lib*${SOLIBS} ${libdir}/ipsec/plugins/*.so"
-FILES_${PN}-dbg += "${libdir}/ipsec/.debug ${libdir}/ipsec/plugins/.debug ${libexecdir}/ipsec/.debug"
-FILES_${PN}-dev += "${libdir}/ipsec/lib*${SOLIBSDEV} ${libdir}/ipsec/*.la ${libdir}/ipsec/plugins/*.la"
-FILES_${PN}-staticdev += "${libdir}/ipsec/*.a ${libdir}/ipsec/plugins/*.a"
-
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "${BPN}.service"
-- 
2.2.0


