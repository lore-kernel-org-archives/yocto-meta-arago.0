Return-Path: <jake@udc0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 2CCF552A4F
	for <meta-arago@arago-project.org>;
	Thu, 19 Nov 2015 17:32:46 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id tAJHWjw5026366
	for <meta-arago@arago-project.org>; Thu, 19 Nov 2015 11:32:45 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAJHWjrJ008427
	for <meta-arago@arago-project.org>; Thu, 19 Nov 2015 11:32:45 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 19 Nov 2015 11:32:45 -0600
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAJHWiLw023342	for
	<meta-arago@arago-project.org>; Thu, 19 Nov 2015 11:32:44 -0600
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1ZzT4e-0006wd-CL	for meta-arago@arago-project.org;
	Thu, 19 Nov 2015 12:32:44 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 19 Nov 2015 12:32:10 -0500
Message-ID: <1447954331-26663-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/2] strongswan: upgrade to 5.3.2
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
X-List-Received-Date: Thu, 19 Nov 2015 17:32:47 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

based on commit b6d299ce9d320f080a24c26b87acb44e24412923 in meta-openembedded/master

5.3.2 includes the fixes for CVE-2015-3991 and CVE-2015-4171

Signed-off-by: Roy Li <rongqing.li@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
[j-stiffler@ti.com: Copied from meta-openembedded master branch]
Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../strongswan/files/fix-funtion-parameter.patch   | 98 ++++++++++++++++++++++
 .../recipes-support/strongswan/strongswan_5.3.2.bb | 45 ++++++++++
 2 files changed, 143 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/strongswan/files/fix-funtion-parameter.patch
 create mode 100644 meta-arago-extras/recipes-support/strongswan/strongswan_5.3.2.bb

diff --git a/meta-arago-extras/recipes-support/strongswan/files/fix-funtion-parameter.patch b/meta-arago-extras/recipes-support/strongswan/files/fix-funtion-parameter.patch
new file mode 100644
index 0000000..da96983
--- /dev/null
+++ b/meta-arago-extras/recipes-support/strongswan/files/fix-funtion-parameter.patch
@@ -0,0 +1,98 @@
+fix the function parameter
+
+Upstream-Status: pending
+
+Original openssl_diffie_hellman_create has three parameters, but
+it is reassigned a function pointer which has one parameter, and
+is called with one parameter, which will lead to segment fault
+on PPC, Now we simply correct the number of parameters.
+
+    #0  0x484d4aa0 in __GI_raise (sig=6)
+         at ../nptl/sysdeps/unix/sysv/linux/raise.c:64
+    #1  0x484d9930 in __GI_abort () at abort.c:91
+    #2  0x10002064 in segv_handler (signal=11) at charon.c:224
+    #3  <signal handler called>
+    #4  0x48d89630 in openssl_diffie_hellman_create (group=MODP_1024_BIT, g=...,
+         p=<error reading variable: Cannot access memory at address 0x0>)
+         at openssl_diffie_hellman.c:143
+    #5  0x482c54f8 in create_dh (this=0x11ac6e68, group=MODP_1024_BIT)
+         at crypto/crypto_factory.c:358
+    #6  0x48375884 in create_dh (this=<optimized out>, group=<optimized out>)
+         at sa/keymat.c:132
+    #7  0x483843b8 in process_payloads (this=0x51400a78, message=<optimized
+    out>)
+         at sa/tasks/ike_init.c:200
+    #8  0x483844d0 in process_r (this=0x51400a78, message=0x51500778)
+         at sa/tasks/ike_init.c:319
+    #9  0x48374c9c in process_request (message=0x51500778, this=0x51400d20)
+         at sa/task_manager.c:870
+    #10 process_message (this=0x51400d20, msg=0x51500778) at
+    sa/task_manager.c:925
+    #11 0x4836c378 in process_message (this=0x514005f0, message=0x51500778)
+         at sa/ike_sa.c:1317
+    #12 0x48362270 in execute (this=0x515008d0)
+         at processing/jobs/process_message_job.c:74 
+
+Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+---
+ src/libstrongswan/plugins/openssl/openssl_diffie_hellman.c | 8 +++++++-
+ src/libstrongswan/plugins/openssl/openssl_diffie_hellman.h | 4 +++-
+ src/libstrongswan/plugins/openssl/openssl_plugin.c         | 1 +
+ 3 files changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.c b/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.c
+index ff33824..bd21446 100644
+--- a/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.c
++++ b/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.c
+@@ -142,7 +142,7 @@ METHOD(diffie_hellman_t, destroy, void,
+ /*
+  * Described in header.
+  */
+-openssl_diffie_hellman_t *openssl_diffie_hellman_create(
++openssl_diffie_hellman_t *openssl_diffie_hellman_create_custom(
+ 							diffie_hellman_group_t group, chunk_t g, chunk_t p)
+ {
+ 	private_openssl_diffie_hellman_t *this;
+@@ -197,5 +197,11 @@ openssl_diffie_hellman_t *openssl_diffie_hellman_create(
+ 
+ 	return &this->public;
+ }
++openssl_diffie_hellman_t *openssl_diffie_hellman_create( diffie_hellman_group_t group)
++{
++	chunk_t g;
++	chunk_t p;
++	openssl_diffie_hellman_create_custom(group, g, p);
++}
+ 
+ #endif /* OPENSSL_NO_DH */
+diff --git a/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.h b/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.h
+index 53dc59c..eb69eaa 100644
+--- a/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.h
++++ b/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.h
+@@ -44,8 +44,10 @@ struct openssl_diffie_hellman_t {
+  * @param p				custom prime, if MODP_CUSTOM
+  * @return				openssl_diffie_hellman_t object, NULL if not supported
+  */
+-openssl_diffie_hellman_t *openssl_diffie_hellman_create(
++openssl_diffie_hellman_t *openssl_diffie_hellman_create_custom(
+ 							diffie_hellman_group_t group, chunk_t g, chunk_t p);
++openssl_diffie_hellman_t *openssl_diffie_hellman_create(
++							diffie_hellman_group_t group);
+ 
+ #endif /** OPENSSL_DIFFIE_HELLMAN_H_ @}*/
+ 
+diff --git a/src/libstrongswan/plugins/openssl/openssl_plugin.c b/src/libstrongswan/plugins/openssl/openssl_plugin.c
+index ff25086..c76873d 100644
+--- a/src/libstrongswan/plugins/openssl/openssl_plugin.c
++++ b/src/libstrongswan/plugins/openssl/openssl_plugin.c
+@@ -388,6 +388,7 @@ METHOD(plugin_t, get_features, int,
+ 			PLUGIN_PROVIDE(DH, MODP_1024_BIT),
+ 			PLUGIN_PROVIDE(DH, MODP_1024_160),
+ 			PLUGIN_PROVIDE(DH, MODP_768_BIT),
++		PLUGIN_REGISTER(DH, openssl_diffie_hellman_create_custom),
+ 			PLUGIN_PROVIDE(DH, MODP_CUSTOM),
+ #endif
+ #ifndef OPENSSL_NO_RSA
+-- 
+1.8.3
+
diff --git a/meta-arago-extras/recipes-support/strongswan/strongswan_5.3.2.bb b/meta-arago-extras/recipes-support/strongswan/strongswan_5.3.2.bb
new file mode 100644
index 0000000..a231a90
--- /dev/null
+++ b/meta-arago-extras/recipes-support/strongswan/strongswan_5.3.2.bb
@@ -0,0 +1,45 @@
+DESCRIPTION = "strongSwan is an OpenSource IPsec implementation for the \
+Linux operating system."
+SUMMARY = "strongSwan is an OpenSource IPsec implementation"
+HOMEPAGE = "http://www.strongswan.org"
+SECTION = "net"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+DEPENDS = "gmp openssl flex-native flex bison-native"
+
+SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
+        file://fix-funtion-parameter.patch \
+"
+
+SRC_URI[md5sum] = "fab014be1477ef4ebf9a765e10f8802c"
+SRC_URI[sha256sum] = "a4a9bc8c4e42bdc4366a87a05a02bf9f425169a7ab0c6f4482d347e44acbf225"
+
+EXTRA_OECONF = "--enable-gmp \
+        --enable-openssl \
+        --without-lib-prefix \
+"
+
+EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
+
+PACKAGECONFIG ??= "sqlite3 curl \
+        ${@base_contains('DISTRO_FEATURES', 'ldap', 'ldap', '', d)} \
+"
+PACKAGECONFIG[sqlite3] = "--enable-sqlite,--disable-sqlite,sqlite3,"
+PACKAGECONFIG[ldap] = "--enable-ldap,--disable-ldap,openldap,"
+PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl,"
+PACKAGECONFIG[soup] = "--enable-soup,--disable-soup,libsoup-2.4,"
+PACKAGECONFIG[mysql] = "--enable-mysql,--disable-mysql,mysql5,"
+
+inherit autotools systemd pkgconfig
+
+RRECOMMENDS_${PN} = "kernel-module-ipsec"
+
+FILES_${PN} += "${libdir}/ipsec/lib*${SOLIBS} ${libdir}/ipsec/plugins/*.so"
+FILES_${PN}-dbg += "${libdir}/ipsec/.debug ${libdir}/ipsec/plugins/.debug ${libexecdir}/ipsec/.debug"
+FILES_${PN}-dev += "${libdir}/ipsec/lib*${SOLIBSDEV} ${libdir}/ipsec/*.la ${libdir}/ipsec/plugins/*.la"
+FILES_${PN}-staticdev += "${libdir}/ipsec/*.a ${libdir}/ipsec/plugins/*.a"
+
+RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "${BPN}.service"
-- 
1.9.1


