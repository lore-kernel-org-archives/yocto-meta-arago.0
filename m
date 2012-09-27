Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 3B5D452A6F
	for <meta-arago@arago-project.org>;
	Thu, 27 Sep 2012 05:01:18 +0000 (UTC)
Received: by oagn12 with SMTP id n12so1432549oag.38
	for <meta-arago@arago-project.org>;
	Wed, 26 Sep 2012 22:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=1c/jHr/Xzps36Iz8LkJ1l9ySd3tOG75tRtSN0QewKfI=;
	b=ixiF6D3VE4xH3aymQJVpmUa+WlXVodnqph0U5rY5XfAdHKkvneFVFG2OOsOSlyL3oQ
	eDV9Rhggmp7AZZWmalJQiEdXpCnXP153AZoUtOB4yJ3IHjOwrqPt94APpAovim90MF9I
	U/8QvOZHBEZp7++w7IhYd1U2gnzXpiYJ026beoqpGfeI7tK8fISlPSCmV6WVZ7YMbu89
	XnaCT0SOq4oMZmt1+ETLovUZGUzs52HmHQIcluZTQs1L5iqG9oDfzktxkPL/S8F95ZOH
	KwxVPaYv5UaYeR49ObzIeRka77oQwU9IUZn8qaQ6QaBg6vvcMp7lclCWH07FWk0fKekl
	ExJQ==
Received: by 10.60.11.1 with SMTP id m1mr2200596oeb.47.1348722077520;
	Wed, 26 Sep 2012 22:01:17 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id 2sm4856729obi.20.2012.09.26.22.01.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Sep 2012 22:01:17 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 27 Sep 2012 00:26:38 -0500
Message-Id: <1348723598-9521-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [meta-arago-extras][PATCH] python-m2crypto: Port python-m2crypto recipe
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
X-List-Received-Date: Thu, 27 Sep 2012 05:01:18 -0000

* Port python-m2crypto recipe from oe-classic.
* This recipe will be submitted to oe-core. If accepted in oe-core this recipe
  should be removed from this layer.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../python/python-m2crypto/install.patch           |   24 +
 .../m2crypto-0.20.2-openssl-1.0.0.patch            |  713 ++++++++++++++++++++
 .../python/python-m2crypto_0.20.2.bb               |   29 +
 3 files changed, 766 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-devtools/python/python-m2crypto/install.patch
 create mode 100644 meta-arago-extras/recipes-devtools/python/python-m2crypto/m2crypto-0.20.2-openssl-1.0.0.patch
 create mode 100644 meta-arago-extras/recipes-devtools/python/python-m2crypto_0.20.2.bb

diff --git a/meta-arago-extras/recipes-devtools/python/python-m2crypto/install.patch b/meta-arago-extras/recipes-devtools/python/python-m2crypto/install.patch
new file mode 100644
index 0000000..0ee354e
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/python/python-m2crypto/install.patch
@@ -0,0 +1,24 @@
+Index: m2crypto-0.18.2/setup.py
+===================================================================
+--- m2crypto-0.18.2.orig/setup.py
++++ m2crypto-0.18.2/setup.py
+@@ -38,7 +38,7 @@ class _M2CryptoBuildExt(build_ext.build_
+             self.openssl = 'c:\\pkg'
+         else:
+             self.libraries = ['ssl', 'crypto']
+-            self.openssl = '/usr'
++            self.openssl = os.environ.get( "STAGING_DIR" )
+
+
+     def finalize_options(self):
+@@ -47,8 +47,8 @@ class _M2CryptoBuildExt(build_ext.build_
+
+         build_ext.build_ext.finalize_options(self)
+
+-        opensslIncludeDir = os.path.join(self.openssl, 'include')
+-        opensslLibraryDir = os.path.join(self.openssl, 'lib')
++        opensslIncludeDir = os.environ.get( "STAGING_INCDIR" )
++        opensslLibraryDir = os.environ.get( "STAGING_LIBDIR" )
+
+         self.swig_opts = ['-I%s' % i for i in self.include_dirs + \
+                           [opensslIncludeDir]]
diff --git a/meta-arago-extras/recipes-devtools/python/python-m2crypto/m2crypto-0.20.2-openssl-1.0.0.patch b/meta-arago-extras/recipes-devtools/python/python-m2crypto/m2crypto-0.20.2-openssl-1.0.0.patch
new file mode 100644
index 0000000..710b7a5
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/python/python-m2crypto/m2crypto-0.20.2-openssl-1.0.0.patch
@@ -0,0 +1,713 @@
+--- SWIG/_aes.i
++++ SWIG/_aes.i
+@@ -76,7 +76,7 @@
+         AES_encrypt((const unsigned char *)in, out, key);
+     else
+         AES_decrypt((const unsigned char *)in, out, key);
+-    return PyString_FromStringAndSize(out, outlen);
++    return PyString_FromStringAndSize((char*)out, outlen);
+ }
+
+ int AES_type_check(AES_KEY *key) {
+--- SWIG/_evp.i
++++ SWIG/_evp.i
+@@ -4,6 +4,9 @@
+
+ Portions Copyright (c) 2004-2007 Open Source Applications Foundation.
+ Author: Heikki Toivonen
++
++Copyright (c) 2009-2010 Heikki Toivonen. All rights reserved.
++
+ */
+
+ %include <openssl/opensslconf.h>
+@@ -180,7 +183,7 @@
+
+     PKCS5_PBKDF2_HMAC_SHA1(passbuf, passlen, saltbuf, saltlen, iter,
+                            keylen, key);
+-    ret = PyString_FromStringAndSize(key, keylen);
++    ret = PyString_FromStringAndSize((char*)key, keylen);
+     OPENSSL_cleanse(key, keylen);
+     return ret;
+ }
+@@ -339,7 +342,7 @@
+     klen = EVP_BytesToKey(cipher, md, (unsigned char *)sbuf,
+         (unsigned char *)dbuf, dlen, iter,
+         key, NULL); /* Since we are not returning IV no need to derive it */
+-    ret = PyString_FromStringAndSize(key, klen);
++    ret = PyString_FromStringAndSize((char*)key, klen);
+     return ret;
+ }
+
+@@ -435,7 +438,7 @@
+         PyErr_SetString(_evp_err, ERR_reason_error_string(ERR_get_error()));
+         return NULL;
+     }
+-    ret = PyString_FromStringAndSize(sigbuf, siglen);
++    ret = PyString_FromStringAndSize((char*)sigbuf, siglen);
+     OPENSSL_cleanse(sigbuf, siglen);
+     OPENSSL_free(sigbuf);
+     return ret;
+@@ -513,7 +516,7 @@
+         PyErr_SetString(PyExc_ValueError, "EVP_PKEY as DER failed");
+         return NULL;
+     }
+-    der = PyString_FromStringAndSize(pp, len);
++    der = PyString_FromStringAndSize((char*)pp, len);
+     OPENSSL_free(pp);
+     return der;
+ }
+--- SWIG/_m2crypto.i
++++ SWIG/_m2crypto.i
+@@ -3,6 +3,9 @@
+  *
+  * Portions created by Open Source Applications Foundation (OSAF) are
+  * Copyright (C) 2004-2006 OSAF. All Rights Reserved.
++ *
++ * Copyright (c) 2009-2010 Heikki Toivonen. All rights reserved.
++ *
+  */
+
+ %module(threads=1) _m2crypto
+@@ -38,6 +41,19 @@
+ #define CONST098
+ #endif
+
++/* Bring in STACK_OF macro definition */
++%include <openssl/safestack.h>
++
++/* Bring in LHASH_OF macro definition */
++/* XXX Can't include lhash.h where LHASH_OF is defined, because it includes
++   XXX stdio.h etc. which we fail to include. So we have to (re)define
++   XXX LHASH_OF here instead.
++%include <openssl/lhash.h>
++*/
++#if OPENSSL_VERSION_NUMBER >= 0x10000000L
++#define LHASH_OF(type) struct lhash_st_##type
++#endif
++
+ %include constraints.i
+ %include _threads.i
+ %include _lib.i
+--- SWIG/_pkcs7.i
++++ SWIG/_pkcs7.i
+@@ -12,7 +12,7 @@
+ %apply Pointer NONNULL { EVP_CIPHER * };
+ %apply Pointer NONNULL { EVP_PKEY * };
+ %apply Pointer NONNULL { PKCS7 * };
+-%apply Pointer NONNULL { STACK * };
++%apply Pointer NONNULL { STACK_OF(X509) * };
+ %apply Pointer NONNULL { X509 * };
+
+ %rename(pkcs7_new) PKCS7_new;
+@@ -54,8 +54,8 @@
+
+ %threadallow pkcs7_encrypt;
+ %inline %{
+-PKCS7 *pkcs7_encrypt(STACK *stack, BIO *bio, EVP_CIPHER *cipher, int flags) {
+-    return PKCS7_encrypt((STACK_OF(X509) *)stack, bio, cipher, flags);
++PKCS7 *pkcs7_encrypt(STACK_OF(X509) *stack, BIO *bio, EVP_CIPHER *cipher, int flags) {
++    return PKCS7_encrypt(stack, bio, cipher, flags);
+ }
+
+ PyObject *pkcs7_decrypt(PKCS7 *pkcs7, EVP_PKEY *pkey, X509 *cert, int flags) {
+@@ -96,14 +96,14 @@
+
+ %threadallow pkcs7_sign1;
+ %inline %{
+-PKCS7 *pkcs7_sign1(X509 *x509, EVP_PKEY *pkey, STACK *stack, BIO *bio, int flags) {
+-    return PKCS7_sign(x509, pkey, (STACK_OF(X509) *)stack, bio, flags);
++PKCS7 *pkcs7_sign1(X509 *x509, EVP_PKEY *pkey, STACK_OF(X509) *stack, BIO *bio, int flags) {
++    return PKCS7_sign(x509, pkey, stack, bio, flags);
+ }
+ %}
+
+ %threadallow pkcs7_verify1;
+ %inline %{
+-PyObject *pkcs7_verify1(PKCS7 *pkcs7, STACK *stack, X509_STORE *store, BIO *data, int flags) {
++PyObject *pkcs7_verify1(PKCS7 *pkcs7, STACK_OF(X509) *stack, X509_STORE *store, BIO *data, int flags) {
+     int outlen;
+     char *outbuf;
+     BIO *bio;
+@@ -113,7 +113,7 @@
+         PyErr_SetString(PyExc_MemoryError, "pkcs7_verify1");
+         return NULL;
+     }
+-    if (!PKCS7_verify(pkcs7, (STACK_OF(X509) *)stack, store, data, bio, flags)) {
++    if (!PKCS7_verify(pkcs7, stack, store, data, bio, flags)) {
+         PyErr_SetString(_pkcs7_err, ERR_reason_error_string(ERR_get_error()));
+         BIO_free(bio);
+         return NULL;
+@@ -131,7 +131,7 @@
+     return ret;
+ }
+
+-PyObject *pkcs7_verify0(PKCS7 *pkcs7, STACK *stack, X509_STORE *store, int flags) {
++PyObject *pkcs7_verify0(PKCS7 *pkcs7, STACK_OF(X509) *stack, X509_STORE *store, int flags) {
+     return pkcs7_verify1(pkcs7, stack, store, NULL, flags);
+ }
+ %}
+@@ -229,7 +229,7 @@
+ }
+
+ /* return STACK_OF(X509)* */
+-STACK *pkcs7_get0_signers(PKCS7 *p7, STACK *certs, int flags) {
++STACK_OF(X509) *pkcs7_get0_signers(PKCS7 *p7, STACK_OF(X509) *certs, int flags) {
+     return PKCS7_get0_signers(p7, certs, flags);
+ }
+
+--- SWIG/_rand.i
++++ SWIG/_rand.i
+@@ -87,7 +87,7 @@
+         Py_INCREF(Py_None);
+         return Py_None;
+     } else {
+-        PyTuple_SET_ITEM(tuple, 0, PyString_FromStringAndSize(blob, n));
++        PyTuple_SET_ITEM(tuple, 0, PyString_FromStringAndSize((char*)blob, n));
+         PyMem_Free(blob);
+         PyTuple_SET_ITEM(tuple, 1, PyInt_FromLong((long)ret));
+         return tuple;
+--- SWIG/_ssl.i
++++ SWIG/_ssl.i
+@@ -3,6 +3,9 @@
+ /*
+ ** Portions created by Open Source Applications Foundation (OSAF) are
+ ** Copyright (C) 2004-2005 OSAF. All Rights Reserved.
++**
++** Copyright (c) 2009-2010 Heikki Toivonen. All rights reserved.
++**
+ */
+ /* $Id: m2crypto-0.20.2-openssl-1.0.0.patch,v 1.1 2010/04/30 18:21:16 arfrever Exp $ */
+
+@@ -17,13 +20,17 @@
+ %apply Pointer NONNULL { SSL_CTX * };
+ %apply Pointer NONNULL { SSL * };
+ %apply Pointer NONNULL { SSL_CIPHER * };
+-%apply Pointer NONNULL { STACK * };
++%apply Pointer NONNULL { STACK_OF(SSL_CIPHER) * };
++%apply Pointer NONNULL { STACK_OF(X509) * };
+ %apply Pointer NONNULL { BIO * };
+ %apply Pointer NONNULL { DH * };
+ %apply Pointer NONNULL { RSA * };
+ %apply Pointer NONNULL { EVP_PKEY *};
+ %apply Pointer NONNULL { PyObject *pyfunc };
+
++%rename(ssl_get_ciphers) SSL_get_ciphers;
++extern STACK_OF(SSL_CIPHER) *SSL_get_ciphers(const SSL *ssl);
++
+ %rename(ssl_get_version) SSL_get_version;
+ extern const char *SSL_get_version(CONST SSL *);
+ %rename(ssl_get_error) SSL_get_error;
+@@ -668,28 +675,24 @@
+     return SSL_CIPHER_get_bits(c, NULL);
+ }
+
+-STACK *ssl_get_ciphers(SSL *ssl) {
+-    return (STACK *)SSL_get_ciphers(ssl);
+-}
+-
+-int sk_ssl_cipher_num(STACK *stack) {
+-    return sk_num(stack);
++int sk_ssl_cipher_num(STACK_OF(SSL_CIPHER) *stack) {
++    return sk_SSL_CIPHER_num(stack);
+ }
+
+-SSL_CIPHER *sk_ssl_cipher_value(STACK *stack, int idx) {
+-    return (SSL_CIPHER *)sk_value(stack, idx);
++SSL_CIPHER *sk_ssl_cipher_value(STACK_OF(SSL_CIPHER) *stack, int idx) {
++    return sk_SSL_CIPHER_value(stack, idx);
+ }
+
+-STACK *ssl_get_peer_cert_chain(SSL *ssl) {
+-    return (STACK *)SSL_get_peer_cert_chain(ssl);
++STACK_OF(X509) *ssl_get_peer_cert_chain(SSL *ssl) {
++    return SSL_get_peer_cert_chain(ssl);
+ }
+
+-int sk_x509_num(STACK *stack) {
+-    return sk_num(stack);
++int sk_x509_num(STACK_OF(X509) *stack) {
++    return sk_X509_num(stack);
+ }
+
+-X509 *sk_x509_value(STACK *stack, int idx) {
+-    return (X509 *)sk_value(stack, idx);
++X509 *sk_x509_value(STACK_OF(X509) *stack, int idx) {
++    return sk_X509_value(stack, idx);
+ }
+ %}
+
+--- SWIG/_util.i
++++ SWIG/_util.i
+@@ -48,7 +48,7 @@
+         PyErr_SetString(_util_err, ERR_reason_error_string(ERR_get_error()));
+         return NULL;
+     }
+-    obj = PyString_FromStringAndSize(ret, len);
++    obj = PyString_FromStringAndSize((char*)ret, len);
+     OPENSSL_free(ret);
+     return obj;
+ }
+--- SWIG/_x509.i
++++ SWIG/_x509.i
+@@ -3,6 +3,9 @@
+ /*
+ ** Portions created by Open Source Applications Foundation (OSAF) are
+ ** Copyright (C) 2004-2005 OSAF. All Rights Reserved.
++**
++** Copyright (c) 2009-2010 Heikki Toivonen. All rights reserved.
++**
+ */
+ /* $Id: m2crypto-0.20.2-openssl-1.0.0.patch,v 1.1 2010/04/30 18:21:16 arfrever Exp $   */
+
+@@ -148,8 +151,15 @@
+ extern int X509_NAME_print_ex(BIO *, X509_NAME *, int, unsigned long);
+ %rename(x509_name_print_ex_fp) X509_NAME_print_ex_fp;
+ extern int X509_NAME_print_ex_fp(FILE *, X509_NAME *, int, unsigned long);
++
++#if OPENSSL_VERSION_NUMBER >= 0x10000000L
++%rename(x509_name_hash) X509_NAME_hash_old;
++extern unsigned long X509_NAME_hash_old(X509_NAME *);
++#else
+ %rename(x509_name_hash) X509_NAME_hash;
+ extern unsigned long X509_NAME_hash(X509_NAME *);
++#endif
++
+ %rename(x509_name_get_index_by_nid) X509_NAME_get_index_by_NID;
+ extern int X509_NAME_get_index_by_NID(X509_NAME *, int, int);
+
+@@ -171,7 +181,7 @@
+     if (PyString_Check($input)) {
+         Py_ssize_t len;
+
+-        $1 = PyString_AsString($input);
++        $1 = (unsigned char *)PyString_AsString($input);
+         len = PyString_Size($input);
+         if (len > INT_MAX) {
+             PyErr_SetString(PyExc_ValueError, "object too large");
+@@ -184,7 +194,7 @@
+     }
+ }
+ %rename(x509_name_entry_set_data) X509_NAME_ENTRY_set_data;
+-extern int X509_NAME_ENTRY_set_data( X509_NAME_ENTRY *, int, CONST unsigned char *, int);
++extern int X509_NAME_ENTRY_set_data(X509_NAME_ENTRY *, int, CONST unsigned char *, int);
+ %typemap(in) (CONST unsigned char *, int);
+
+ %rename(x509_req_new) X509_REQ_new;
+@@ -230,7 +240,7 @@
+ %rename(x509_store_ctx_free) X509_STORE_CTX_free;
+ extern void X509_STORE_CTX_free(X509_STORE_CTX *);
+ %rename(x509_store_ctx_get1_chain) X509_STORE_CTX_get1_chain;
+-extern STACK *X509_STORE_CTX_get1_chain(X509_STORE_CTX *);
++extern STACK_OF(X509) *X509_STORE_CTX_get1_chain(X509_STORE_CTX *);
+
+ %rename(x509_extension_get_critical) X509_EXTENSION_get_critical;
+ extern int X509_EXTENSION_get_critical(X509_EXTENSION *);
+@@ -348,7 +358,7 @@
+         PyErr_SetString(_x509_err, ERR_reason_error_string(ERR_get_error()));
+     }
+     else {
+-        ret = PyString_FromStringAndSize(buf, len);
++        ret = PyString_FromStringAndSize((char*)buf, len);
+         OPENSSL_free(buf);
+     }
+     return ret;
+@@ -435,12 +445,12 @@
+ }
+
+ int x509_name_set_by_nid(X509_NAME *name, int nid, PyObject *obj) {
+-    return X509_NAME_add_entry_by_NID(name, nid, MBSTRING_ASC, PyString_AsString(obj), -1, -1, 0);
++    return X509_NAME_add_entry_by_NID(name, nid, MBSTRING_ASC, (unsigned char *)PyString_AsString(obj), -1, -1, 0);
+ }
+
+ /* x509_name_add_entry_by_txt */
+ int x509_name_add_entry_by_txt(X509_NAME *name, char *field, int type, char *bytes, int len, int loc, int set) {
+-    return X509_NAME_add_entry_by_txt(name, field, type, bytes, len, loc, set);
++    return X509_NAME_add_entry_by_txt(name, field, type, (unsigned char *)bytes, len, loc, set);
+ }
+
+ PyObject *x509_name_get_der(X509_NAME *name)
+@@ -450,23 +460,23 @@
+ }
+
+ /* sk_X509_new_null() is a macro returning "STACK_OF(X509) *". */
+-STACK *sk_x509_new_null(void) {
+-    return (STACK *)sk_X509_new_null();
++STACK_OF(X509) *sk_x509_new_null(void) {
++    return sk_X509_new_null();
+ }
+
+ /* sk_X509_free() is a macro. */
+-void sk_x509_free(STACK *stack) {
+-    sk_X509_free((STACK_OF(X509) *)stack);
++void sk_x509_free(STACK_OF(X509) *stack) {
++    sk_X509_free(stack);
+ }
+
+ /* sk_X509_push() is a macro. */
+-int sk_x509_push(STACK *stack, X509 *x509) {
+-    return sk_X509_push((STACK_OF(X509) *)stack, x509);
++int sk_x509_push(STACK_OF(X509) *stack, X509 *x509) {
++    return sk_X509_push(stack, x509);
+ }
+
+ /* sk_X509_pop() is a macro. */
+-X509 *sk_x509_pop(STACK *stack) {
+-    return sk_X509_pop((STACK_OF(X509) *)stack);
++X509 *sk_x509_pop(STACK_OF(X509) *stack) {
++    return sk_X509_pop(stack);
+ }
+
+ int x509_store_load_locations(X509_STORE *store, const char *file) {
+@@ -493,21 +503,29 @@
+     return X509_REQ_set_version(x, version);
+ }
+
+-int x509_req_add_extensions(X509_REQ *req, STACK *exts) {
+-    return X509_REQ_add_extensions(req, (STACK_OF(X509_EXTENSION) *)exts);
++int x509_req_add_extensions(X509_REQ *req, STACK_OF(X509_EXTENSION) *exts) {
++    return X509_REQ_add_extensions(req, exts);
+ }
+
+-X509_NAME_ENTRY *x509_name_entry_create_by_txt( X509_NAME_ENTRY **ne, char *field, int type, char *bytes, int len) {
+-    return X509_NAME_ENTRY_create_by_txt( ne, field, type, bytes, len);
++X509_NAME_ENTRY *x509_name_entry_create_by_txt(X509_NAME_ENTRY **ne, char *field, int type, char *bytes, int len) {
++    return X509_NAME_ENTRY_create_by_txt( ne, field, type, (unsigned char *)bytes, len);
+ }
+
+-LHASH *
+-x509v3_lhash(){
+-       return lh_new(NULL,NULL);
++#if OPENSSL_VERSION_NUMBER >= 0x10000000L
++LHASH_OF(CONF_VALUE)
++#else
++LHASH
++#endif
++*x509v3_lhash() {
++    return lh_new(NULL, NULL); /* Should probably be lh_CONF_VALUE_new but won't compile. */
+ }
+
+ X509V3_CTX *
+-x509v3_set_conf_lhash(LHASH * lhash){
++#if OPENSSL_VERSION_NUMBER >= 0x10000000L
++x509v3_set_conf_lhash(LHASH_OF(CONF_VALUE) * lhash) {
++#else
++x509v3_set_conf_lhash(LHASH                * lhash) {
++#endif
+       X509V3_CTX * ctx;
+       if (!(ctx=(X509V3_CTX *)PyMem_Malloc(sizeof(X509V3_CTX)))) {
+           PyErr_SetString(PyExc_MemoryError, "x509v3_set_conf_lhash");
+@@ -517,11 +535,20 @@
+       return ctx;
+ }
+
+-X509_EXTENSION *x509v3_ext_conf(LHASH *conf, X509V3_CTX *ctx, char *name, char *value) {
++X509_EXTENSION *
++#if OPENSSL_VERSION_NUMBER >= 0x10000000L
++x509v3_ext_conf(LHASH_OF(CONF_VALUE) *conf, X509V3_CTX *ctx, char *name, char *value) {
++#else
++x509v3_ext_conf(LHASH                *conf, X509V3_CTX *ctx, char *name, char *value) {
++#endif
+       X509_EXTENSION * ext = NULL;
+       ext = X509V3_EXT_conf(conf, ctx, name, value);
+       PyMem_Free(ctx);
++#if OPENSSL_VERSION_NUMBER >= 0x10000000L
++      lh_CONF_VALUE_free(conf);
++#else
+       lh_free(conf);
++#endif
+       return ext;
+ }
+
+@@ -543,33 +570,33 @@
+ }
+
+ /* sk_X509_EXTENSION_new_null is a macro. */
+-STACK *sk_x509_extension_new_null(void) {
+-    return (STACK *)sk_X509_EXTENSION_new_null();
++STACK_OF(X509_EXTENSION) *sk_x509_extension_new_null(void) {
++    return sk_X509_EXTENSION_new_null();
+ }
+
+ /* sk_X509_EXTENSION_free() is a macro. */
+-void sk_x509_extension_free(STACK *stack) {
+-    sk_X509_EXTENSION_free((STACK_OF(X509_EXTENSION) *)stack);
++void sk_x509_extension_free(STACK_OF(X509_EXTENSION) *stack) {
++    sk_X509_EXTENSION_free(stack);
+ }
+
+ /* sk_X509_EXTENSION_push() is a macro. */
+-int sk_x509_extension_push(STACK *stack, X509_EXTENSION *x509_ext) {
+-    return sk_X509_EXTENSION_push((STACK_OF(X509_EXTENSION) *)stack, x509_ext);
++int sk_x509_extension_push(STACK_OF(X509_EXTENSION) *stack, X509_EXTENSION *x509_ext) {
++    return sk_X509_EXTENSION_push(stack, x509_ext);
+ }
+
+ /* sk_X509_EXTENSION_pop() is a macro. */
+-X509_EXTENSION *sk_x509_extension_pop(STACK *stack) {
+-    return sk_X509_EXTENSION_pop((STACK_OF(X509_EXTENSION) *)stack);
++X509_EXTENSION *sk_x509_extension_pop(STACK_OF(X509_EXTENSION) *stack) {
++    return sk_X509_EXTENSION_pop(stack);
+ }
+
+ /* sk_X509_EXTENSION_num() is a macro. */
+-int sk_x509_extension_num(STACK *stack) {
+-    return sk_X509_EXTENSION_num((STACK_OF(X509_EXTENSION) *)stack);
++int sk_x509_extension_num(STACK_OF(X509_EXTENSION) *stack) {
++    return sk_X509_EXTENSION_num(stack);
+ }
+
+ /* sk_X509_EXTENSION_value() is a macro. */
+-X509_EXTENSION *sk_x509_extension_value(STACK *stack, int i) {
+-    return sk_X509_EXTENSION_value((STACK_OF(X509_EXTENSION) *)stack, i);
++X509_EXTENSION *sk_x509_extension_value(STACK_OF(X509_EXTENSION) *stack, int i) {
++    return sk_X509_EXTENSION_value(stack, i);
+ }
+
+ /* X509_STORE_CTX_get_app_data is a macro. */
+@@ -590,7 +617,7 @@
+ #define I2DTYPE int (*)()
+ #endif
+
+-STACK *
++STACK_OF(X509) *
+ make_stack_from_der_sequence(PyObject * pyEncodedString){
+     STACK_OF(X509) *certs;
+     Py_ssize_t encoded_string_len;
+@@ -606,7 +633,7 @@
+         return NULL;
+     }
+
+-    certs = ASN1_seq_unpack((unsigned char *)encoded_string, encoded_string_len, (D2ITYPE)d2i_X509, (void(*)())X509_free );
++    certs = ASN1_seq_unpack_X509((unsigned char *)encoded_string, encoded_string_len, d2i_X509, X509_free );
+     if (!certs) {
+        PyErr_SetString(_x509_err, ERR_reason_error_string(ERR_get_error()));
+        return NULL;
+@@ -616,13 +643,13 @@
+ }
+
+ PyObject *
+-get_der_encoding_stack(STACK * stack){
++get_der_encoding_stack(STACK_OF(X509) *stack){
+     PyObject * encodedString;
+
+     unsigned char * encoding;
+     int len;
+
+-    encoding = ASN1_seq_pack((STACK_OF(X509)*) stack, (I2DTYPE)i2d_X509, NULL, &len);
++    encoding = ASN1_seq_pack_X509(stack, i2d_X509, NULL, &len);
+     if (!encoding) {
+        PyErr_SetString(_x509_err, ERR_reason_error_string(ERR_get_error()));
+        return NULL;
+--- tests/alltests.py
++++ tests/alltests.py
+@@ -37,6 +37,7 @@
+         'tests.test_rc4',
+         'tests.test_rsa',
+         'tests.test_smime',
++        'tests.test_ssl_offline',
+         'tests.test_threading',
+         'tests.test_x509']
+     if os.name == 'posix':
+--- tests/test_smime.py
++++ tests/test_smime.py
+@@ -37,7 +37,7 @@
+         buf = BIO.MemoryBuffer(self.cleartext)
+         s = SMIME.SMIME()
+         s.load_key('tests/signer_key.pem', 'tests/signer.pem')
+-        p7 = s.sign(buf)
++        p7 = s.sign(buf, SMIME.PKCS7_DETACHED)
+         assert len(buf) == 0
+         assert p7.type() == SMIME.PKCS7_SIGNED, p7.type()
+         assert isinstance(p7, SMIME.PKCS7), p7
+@@ -73,9 +73,8 @@
+
+         p7, data = SMIME.smime_load_pkcs7_bio(self.signed)
+
+-        assert data.read() == self.cleartext
+         assert isinstance(p7, SMIME.PKCS7), p7
+-        v = s.verify(p7)
++        v = s.verify(p7, data)
+         assert v == self.cleartext
+
+         t = p7.get0_signers(sk)
+@@ -95,7 +94,6 @@
+         s.set_x509_store(st)
+
+         p7, data = SMIME.smime_load_pkcs7_bio(self.signed)
+-        assert data.read() == self.cleartext
+         assert isinstance(p7, SMIME.PKCS7), p7
+         self.assertRaises(SMIME.PKCS7_Error, s.verify, p7) # Bad signer
+
+@@ -169,7 +167,7 @@
+         s.set_cipher(SMIME.Cipher('des_ede3_cbc'))
+
+         tmp = BIO.MemoryBuffer()
+-        s.write(tmp, p7, buf)
++        s.write(tmp, p7)
+
+         p7 = s.encrypt(tmp)
+
+@@ -211,6 +209,7 @@
+         assert p7.write(f) == 1
+         f.close()
+
++        p7 = s.sign(BIO.MemoryBuffer('some text'), SMIME.PKCS7_DETACHED)
+         self.filenameSmime = 'tests/sig.p7s'
+         f = BIO.openfile(self.filenameSmime, 'wb')
+         assert s.write(f, p7, BIO.MemoryBuffer('some text')) == 1
+@@ -220,7 +219,7 @@
+         buf = BIO.MemoryBuffer()
+         assert SMIME.load_pkcs7(self.filename).write_der(buf) == 1
+         s = buf.read()
+-        assert len(s) == 1204, len(s)
++        assert len(s) in (1204, 1243), len(s)
+
+     def test_load_pkcs7(self):
+         assert SMIME.load_pkcs7(self.filename).type() == SMIME.PKCS7_SIGNED
+--- tests/test_ssl_offline.py
++++ tests/test_ssl_offline.py
+@@ -0,0 +1,60 @@
++"""Unit tests for M2Crypto.SSL offline parts
++
++Copyright (C) 2006 Open Source Applications Foundation. All Rights Reserved.
++
++Copyright (C) 2009-2010 Heikki Toivonen. All Rights Reserved.
++"""
++
++import unittest, doctest
++from M2Crypto.SSL import Checker
++from M2Crypto import X509
++from M2Crypto import SSL
++from test_ssl import srv_host
++
++
++class CheckerTestCase(unittest.TestCase):
++    def test_checker(self):
++
++        check = Checker.Checker(host=srv_host,
++                                peerCertHash='7B754EFA41A264AAD370D43460BC8229F9354ECE')
++        x509 = X509.load_cert('tests/server.pem')
++        assert check(x509, srv_host)
++        self.assertRaises(Checker.WrongHost, check, x509, 'example.com')
++
++        doctest.testmod(Checker)
++
++
++class ContextTestCase(unittest.TestCase):
++    def test_ctx_load_verify_locations(self):
++        ctx = SSL.Context()
++        self.assertRaises(ValueError, ctx.load_verify_locations, None, None)
++
++    def test_map(self):
++        from M2Crypto.SSL.Context import map, _ctxmap
++        assert isinstance(map(), _ctxmap)
++        ctx = SSL.Context()
++        assert map()
++        ctx.close()
++        assert map() is _ctxmap.singleton
++
++    def test_certstore(self):
++        ctx = SSL.Context()
++        ctx.set_verify(SSL.verify_peer | SSL.verify_fail_if_no_peer_cert, 9)
++        ctx.load_verify_locations('tests/ca.pem')
++        ctx.load_cert('tests/x509.pem')
++
++        store = ctx.get_cert_store()
++        assert isinstance(store, X509.X509_Store)
++
++
++def suite():
++    suite = unittest.TestSuite()
++    suite.addTest(unittest.makeSuite(CheckerTestCase))
++    suite.addTest(unittest.makeSuite(ContextTestCase))
++    return suite
++
++
++if __name__ == '__main__':
++    Rand.load_file('randpool.dat', -1)
++    unittest.TextTestRunner().run(suite())
++    Rand.save_file('randpool.dat')
+--- tests/test_ssl.py
++++ tests/test_ssl.py
+@@ -2,7 +2,10 @@
+
+ """Unit tests for M2Crypto.SSL.
+
+-Copyright (c) 2000-2004 Ng Pheng Siong. All rights reserved."""
++Copyright (c) 2000-2004 Ng Pheng Siong. All rights reserved.
++
++Copyright (c) 2009-2010 Heikki Toivonen. All rights reserved.
++"""
+
+ """
+ TODO
+@@ -405,8 +408,11 @@
+         try:
+             ctx = SSL.Context('sslv23', weak_crypto=1)
+             s = SSL.Connection(ctx)
+-            s.connect(self.srv_addr)
+-            self.failUnlessEqual(s.get_version(), 'SSLv2')
++            if m2.OPENSSL_VERSION_NUMBER < 0x10000000: # SSLv2 ciphers disabled by default in newer OpenSSL
++                s.connect(self.srv_addr)
++                self.failUnlessEqual(s.get_version(), 'SSLv2')
++            else:
++                self.assertRaises(SSL.SSLError, s.connect, self.srv_addr)
+             s.close()
+         finally:
+             self.stop_server(pid)
+@@ -1032,45 +1038,6 @@
+         # XXX need server to test against
+
+
+-class CheckerTestCase(unittest.TestCase):
+-    def test_checker(self):
+-        from M2Crypto.SSL import Checker
+-        from M2Crypto import X509
+-
+-        check = Checker.Checker(host=srv_host,
+-                                peerCertHash='7B754EFA41A264AAD370D43460BC8229F9354ECE')
+-        x509 = X509.load_cert('tests/server.pem')
+-        assert check(x509, srv_host)
+-        self.assertRaises(Checker.WrongHost, check, x509, 'example.com')
+-
+-        import doctest
+-        doctest.testmod(Checker)
+-
+-
+-class ContextTestCase(unittest.TestCase):
+-    def test_ctx_load_verify_locations(self):
+-        ctx = SSL.Context()
+-        self.assertRaises(ValueError, ctx.load_verify_locations, None, None)
+-
+-    def test_map(self):
+-        from M2Crypto.SSL.Context import map, _ctxmap
+-        assert isinstance(map(), _ctxmap)
+-        ctx = SSL.Context()
+-        assert map()
+-        ctx.close()
+-        assert map() is _ctxmap.singleton
+-
+-    def test_certstore(self):
+-        ctx = SSL.Context()
+-        ctx.set_verify(SSL.verify_peer | SSL.verify_fail_if_no_peer_cert, 9)
+-        ctx.load_verify_locations('tests/ca.pem')
+-        ctx.load_cert('tests/x509.pem')
+-
+-        from M2Crypto import X509
+-        store = ctx.get_cert_store()
+-        assert isinstance(store, X509.X509_Store)
+-
+-
+ class SessionTestCase(unittest.TestCase):
+     def test_session_load_bad(self):
+         self.assertRaises(SSL.SSLError, SSL.Session.load_session,
+@@ -1086,8 +1053,6 @@
+
+ def suite():
+     suite = unittest.TestSuite()
+-    suite.addTest(unittest.makeSuite(CheckerTestCase))
+-    suite.addTest(unittest.makeSuite(ContextTestCase))
+     suite.addTest(unittest.makeSuite(SessionTestCase))
+     suite.addTest(unittest.makeSuite(XmlRpcLibTestCase))
+     suite.addTest(unittest.makeSuite(FtpsLibTestCase))
diff --git a/meta-arago-extras/recipes-devtools/python/python-m2crypto_0.20.2.bb b/meta-arago-extras/recipes-devtools/python/python-m2crypto_0.20.2.bb
new file mode 100644
index 0000000..b7e03bb
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/python/python-m2crypto_0.20.2.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "A Python crypto and SSL toolkit"
+SECTION = "devel/python"
+HOMEPAGE = "http://chandlerproject.org/bin/view/Projects/MeTooCrypto"
+PRIORITY = "optional"
+DEPENDS = "openssl swig-native"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=8064d5f6760668814ca309788894e713"
+
+SRCNAME = "M2Crypto"
+PR = "r0"
+
+SRC_URI = "\
+  http://pypi.python.org/packages/source/M/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
+  file://install.patch \
+  file://m2crypto-0.20.2-openssl-1.0.0.patch;striplevel=0 \
+"
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+export STAGING_DIR
+export STAGING_INCDIR
+export STAGING_LIBDIR
+
+SRC_URI[md5sum] = "f93d8462ff7646397a9f77a2fe602d17"
+SRC_URI[sha256sum] = "25b94498505c2d800ee465db0cc1aff097b1615adc3ac042a1c85ceca264fc0a"
+
+NATIVE_INSTALL_WORKS = "1"
+BBCLASSEXTEND = "native"
-- 
1.7.0.4


