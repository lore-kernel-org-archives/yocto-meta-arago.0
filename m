Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 078B052990
	for <meta-arago@arago-project.org>;
	Sat, 14 Dec 2013 08:36:49 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rBE8anNL011608;
	Sat, 14 Dec 2013 02:36:49 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rBE8amOg018298;
	Sat, 14 Dec 2013 02:36:48 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Sat, 14 Dec 2013 02:36:48 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [meta-arago] [PATCH 2/3] openssl: add cryptodev support and
	enable asm-optimized algos for ARM
Thread-Index: AQHO+J1nYcpfriP8FUG3FfsDGHwtGJpTXgdm
Date: Sat, 14 Dec 2013 08:36:48 +0000
Message-ID: <2962011F-57F2-4C6D-B5FF-86A6574D3AC2@ti.com>
References: <1387005788-16338-1-git-send-email-denis@denix.org>,
	<1387005788-16338-2-git-send-email-denis@denix.org>
In-Reply-To: <1387005788-16338-2-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Fernandes,
	Joel" <joelf@ti.com>
Subject: Re: [PATCH 2/3] openssl: add cryptodev support and enable asm-optimized algos for ARM
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
X-List-Received-Date: Sat, 14 Dec 2013 08:36:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This patch is adding af_alg directly to OpenSSL.

I'm not sure why this is needed since we are using cryptodev based on your =
patch set. Cryptodev and af_alg are two approaches trying to solve the same=
 issue similar to ocf_linux.

I believe "Sample AF_ALG openssl.cnf" patch would end up forcing OpenSSL to=
 use af_alg by default for some algorithms and the config doesn't include a=
ll the hardware accelerated crypto algorithms useable by 335 and 437x.=20

To add af_alg support to OpenSSL the recommended approach is to build it as=
 a separate library (recipe) and simply update the OpenSSL config file.

I have a recipe that does this but I haven't submitted since we decided to =
use cryptodev.

So for atleast this patch set I would recommend dropping all af_alg changes=
.



> On Dec 14, 2013, at 3:23 PM, "Denys Dmytriyenko" <denis@denix.org> wrote:
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Mark resulting package as machine-specific, as some machines are built wi=
th
> cryptodev enabled, while others still require ocf-linux.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
> ...1-Add-AF_ALG-interface-support-to-OpenSSL.patch | 578 ++++++++++++++++=
+++++
> ...1-eng_cryptodev.c-update-to-cryptodev-1.6.patch | 435 ++++++++++++++++
> .../openssl/0004-Sample-AF_ALG-openssl.cnf.patch   |  36 ++
> ...ev-Add-SHA224-initialization-to-cryptodev.patch |  26 +
> ...dd-AES-CBC-CTR-modes-for-128-192-256-bit-.patch | 142 +++++
> .../openssl/openssl_1.0.1e.bbappend                | 111 +++-
> 6 files changed, 1326 insertions(+), 2 deletions(-)
> create mode 100644 meta-arago-distro/recipes-connectivity/openssl/openssl=
/0001-Add-AF_ALG-interface-support-to-OpenSSL.patch
> create mode 100644 meta-arago-distro/recipes-connectivity/openssl/openssl=
/0001-eng_cryptodev.c-update-to-cryptodev-1.6.patch
> create mode 100644 meta-arago-distro/recipes-connectivity/openssl/openssl=
/0004-Sample-AF_ALG-openssl.cnf.patch
> create mode 100644 meta-arago-distro/recipes-connectivity/openssl/openssl=
/0009-eng_cryptodev-Add-SHA224-initialization-to-cryptodev.patch
> create mode 100644 meta-arago-distro/recipes-connectivity/openssl/openssl=
/0011-cryptodev-Add-AES-CBC-CTR-modes-for-128-192-256-bit-.patch
>=20
> diff --git a/meta-arago-distro/recipes-connectivity/openssl/openssl/0001-=
Add-AF_ALG-interface-support-to-OpenSSL.patch b/meta-arago-distro/recipes-c=
onnectivity/openssl/openssl/0001-Add-AF_ALG-interface-support-to-OpenSSL.pa=
tch
> new file mode 100644
> index 0000000..f10bc5d
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/openssl/openssl/0001-Add-AF_=
ALG-interface-support-to-OpenSSL.patch
> @@ -0,0 +1,578 @@
> +From 71ca205e8798c04b39b8a9981a05d6ec97b4df2c Mon Sep 17 00:00:00 2001
> +From: Joel A Fernandes <joelagnel@ti.com>
> +Date: Fri, 29 Mar 2013 07:58:44 -0500
> +Subject: [PATCH 01/11] Add AF_ALG interface support to OpenSSL.
> +
> +Kernel uses AF_ALG interface to directly talk to crypto API as an altern=
ative to the
> +out-of-kernel-tree OCF/cryptodev interfaces. Add af_alg engine support t=
o OpenSSL.
> +
> +Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
> +---
> + engines/Makefile   |   8 +-
> + engines/e_af_alg.c | 521 ++++++++++++++++++++++++++++++++++++++++++++++=
+++++++
> + 2 files changed, 526 insertions(+), 3 deletions(-)
> + create mode 100644 engines/e_af_alg.c
> +
> +diff --git a/engines/Makefile b/engines/Makefile
> +index 2fa9534..f46c9f5 100644
> +--- a/engines/Makefile
> ++++ b/engines/Makefile
> +@@ -26,7 +26,7 @@ TEST=3D
> + APPS=3D
> +=20
> + LIB=3D$(TOP)/libcrypto.a
> +-LIBNAMES=3D 4758cca aep atalla cswift gmp chil nuron sureware ubsec pad=
lock capi
> ++LIBNAMES=3D 4758cca aep atalla cswift gmp chil nuron sureware ubsec pad=
lock capi af_alg
> +=20
> + LIBSRC=3D    e_4758cca.c \
> +    e_aep.c \
> +@@ -38,7 +38,8 @@ LIBSRC=3D    e_4758cca.c \
> +    e_sureware.c \
> +    e_ubsec.c \
> +    e_padlock.c \
> +-    e_capi.c
> ++    e_capi.c \
> ++    e_af_alg.c
> + LIBOBJ=3D e_4758cca.o \
> +    e_aep.o \
> +    e_atalla.o \
> +@@ -49,7 +50,8 @@ LIBOBJ=3D e_4758cca.o \
> +    e_sureware.o \
> +    e_ubsec.o \
> +    e_padlock.o \
> +-    e_capi.o
> ++    e_capi.o \
> ++    e_af_alg.o
> +=20
> + SRC=3D $(LIBSRC)
> +=20
> +diff --git a/engines/e_af_alg.c b/engines/e_af_alg.c
> +new file mode 100644
> +index 0000000..e253e07
> +--- /dev/null
> ++++ b/engines/e_af_alg.c
> +@@ -0,0 +1,521 @@
> ++/* Written by Markus Koetter (nepenthesdev@gmail.com) for the OpenSSL
> ++ * project.
> ++ */
> ++/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ++ * Copyright (c) 2011 The OpenSSL Project.  All rights reserved.
> ++ *
> ++ * Redistribution and use in source and binary forms, with or without
> ++ * modification, are permitted provided that the following conditions
> ++ * are met:
> ++ *
> ++ * 1. Redistributions of source code must retain the above copyright
> ++ *    notice, this list of conditions and the following disclaimer.=20
> ++ *
> ++ * 2. Redistributions in binary form must reproduce the above copyright
> ++ *    notice, this list of conditions and the following disclaimer in
> ++ *    the documentation and/or other materials provided with the
> ++ *    distribution.
> ++ *
> ++ * 3. All advertising materials mentioning features or use of this
> ++ *    software must display the following acknowledgment:
> ++ *    "This product includes software developed by the OpenSSL Project
> ++ *    for use in the OpenSSL Toolkit. (http://www.OpenSSL.org/)"
> ++ *
> ++ * 4. The names "OpenSSL Toolkit" and "OpenSSL Project" must not be use=
d to
> ++ *    endorse or promote products derived from this software without
> ++ *    prior written permission. For written permission, please contact
> ++ *    licensing@OpenSSL.org.
> ++ *
> ++ * 5. Products derived from this software may not be called "OpenSSL"
> ++ *    nor may "OpenSSL" appear in their names without prior written
> ++ *    permission of the OpenSSL Project.
> ++ *
> ++ * 6. Redistributions of any form whatsoever must retain the following
> ++ *    acknowledgment:
> ++ *    "This product includes software developed by the OpenSSL Project
> ++ *    for use in the OpenSSL Toolkit (http://www.OpenSSL.org/)"
> ++ *
> ++ * THIS SOFTWARE IS PROVIDED BY THE OpenSSL PROJECT ``AS IS'' AND ANY
> ++ * EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
> ++ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
> ++ * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE OpenSSL PROJECT OR
> ++ * ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
> ++ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
> ++ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
> ++ * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
> ++ * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
> ++ * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
> ++ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
> ++ * OF THE POSSIBILITY OF SUCH DAMAGE.
> ++ * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ++ */
> ++
> ++#include <stdio.h>
> ++#include <stdlib.h>
> ++#include <stdint.h>
> ++#include <assert.h>
> ++#include <memory.h>
> ++#include <openssl/aes.h>
> ++#include <openssl/engine.h>
> ++#include <sys/socket.h>
> ++#include <linux/if_alg.h>
> ++#include <unistd.h>
> ++#include <sys/param.h>
> ++#include <ctype.h>
> ++#include <stdbool.h>
> ++
> ++#ifndef AF_ALG
> ++#define AF_ALG 38
> ++#endif
> ++
> ++#ifndef SOL_ALG
> ++#define SOL_ALG 279
> ++#endif
> ++
> ++/* Socket options */
> ++#define ALG_SET_KEY            1
> ++#define ALG_SET_IV            2
> ++#define ALG_SET_OP            3
> ++
> ++/* Operations */
> ++#define ALG_OP_DECRYPT            0
> ++#define ALG_OP_ENCRYPT            1
> ++
> ++#define AES_KEY_SIZE_128        16
> ++#define AES_KEY_SIZE_192        24
> ++#define AES_KEY_SIZE_256        32
> ++
> ++static int af_alg_ciphers (ENGINE *e, const EVP_CIPHER **cipher, const =
int **nids, int nid);
> ++static int af_alg_aes_ciphers(EVP_CIPHER_CTX *ctx, unsigned char *out_a=
rg, const unsigned char *in_arg, unsigned int nbytes);
> ++
> ++static int af_alg_digests(ENGINE *e, const EVP_MD **digest, const int *=
*nids, int nid);
> ++
> ++#define DYNAMIC_ENGINE
> ++#define AF_ALG_ENGINE_ID    "af_alg"
> ++#define AF_ALG_ENGINE_NAME    "use AF_ALG for AES crypto"
> ++
> ++#define EVP_CIPHER_block_size_CBC    AES_BLOCK_SIZE
> ++
> ++static bool nid_in_nids(int nid, int nids[], int num)
> ++{
> ++    int i=3D0;
> ++    for( i=3D0;i<num;i++ )
> ++        if( nids[i] =3D=3D nid )
> ++            return true;
> ++    return false;
> ++}
> ++
> ++struct af_alg_cipher_data
> ++{
> ++    int tfmfd;
> ++    int op;
> ++    __u32 type;
> ++};
> ++
> ++static int af_alg_cipher_all_nids[] =3D {
> ++    NID_aes_128_cbc,
> ++    NID_aes_192_cbc,
> ++    NID_aes_256_cbc,
> ++};
> ++static int af_alg_cipher_all_nids_num =3D (sizeof(af_alg_cipher_all_nid=
s)/sizeof(af_alg_cipher_all_nids[0]));
> ++static int *af_alg_digest_nids =3D NULL;
> ++static int af_alg_digest_nids_num =3D 0;
> ++
> ++static int af_alg_digest_all_nids[] =3D {
> ++    NID_sha1,
> ++};
> ++static int af_alg_digest_all_nids_num =3D sizeof(af_alg_digest_all_nids=
)/sizeof(af_alg_digest_all_nids[0]);
> ++static int *af_alg_cipher_nids =3D NULL;
> ++static int af_alg_cipher_nids_num =3D 0;
> ++
> ++
> ++int af_alg_init(ENGINE * engine)
> ++{
> ++    int sock;
> ++    if((sock =3D socket(AF_ALG, SOCK_SEQPACKET, 0)) =3D=3D -1)
> ++        return 0;
> ++    close(sock);
> ++    return 1;
> ++}
> ++
> ++int af_alg_finish(ENGINE * engine)
> ++{
> ++    return 1;
> ++}
> ++/* The definitions for control commands specific to this engine */
> ++#define AF_ALG_CMD_CIPHERS    ENGINE_CMD_BASE
> ++#define AF_ALG_CMD_DIGESTS    (ENGINE_CMD_BASE + 1)
> ++
> ++static const ENGINE_CMD_DEFN af_alg_cmd_defns[] =3D {
> ++    {AF_ALG_CMD_CIPHERS,"CIPHERS","which ciphers to run",ENGINE_CMD_FLA=
G_STRING},
> ++    {AF_ALG_CMD_DIGESTS,"DIGESTS","which digests to run",ENGINE_CMD_FLA=
G_STRING},
> ++    {0, NULL, NULL, 0}
> ++};
> ++static int cipher_nid(const EVP_CIPHER *c)
> ++{
> ++    return EVP_CIPHER_nid(c);
> ++}
> ++static int digest_nid(const EVP_MD *d)
> ++{
> ++    return EVP_MD_type(d);
> ++}
> ++static bool names_to_nids(const char *names, const void*(*by_name)(cons=
t char *), int (*to_nid)(const void *), int **rnids, int *rnum, int *nids, =
int num)
> ++{
> ++    char *str, *r;
> ++    char *c =3D NULL;
> ++    r =3D str =3D strdup(names);
> ++    while( (c =3D strtok_r(r, " ", &r)) !=3D NULL )
> ++    {
> ++        const void *ec =3D by_name(c);
> ++        if( ec =3D=3D NULL )
> ++            /* the cipher/digest is unknown */
> ++            return false;
> ++
> ++        if( nid_in_nids(to_nid(ec), nids, num) =3D=3D false )
> ++            /* we do not support the cipher */
> ++            return false;
> ++
> ++        if((*rnids =3D realloc(*rnids, (*rnum+1)*sizeof(int))) =3D=3D N=
ULL)
> ++            return false;
> ++        (*rnids)[*rnum]=3Dto_nid(ec);
> ++        *rnum =3D *rnum+1;
> ++    }
> ++    return true;
> ++}
> ++
> ++static int af_alg_ctrl(ENGINE *e, int cmd, long i, void *p, void (*f)()=
)
> ++{
> ++    OpenSSL_add_all_algorithms();
> ++    switch( cmd )
> ++    {
> ++    case AF_ALG_CMD_CIPHERS:
> ++        if( p =3D=3D NULL )
> ++            return 1;
> ++        if( names_to_nids(p, (void *)EVP_get_cipherbyname, (void *)ciph=
er_nid, &af_alg_cipher_nids, &af_alg_cipher_nids_num, af_alg_cipher_all_nid=
s, af_alg_cipher_all_nids_num) =3D=3D false )
> ++            return 0;
> ++        ENGINE_unregister_ciphers(e);
> ++        ENGINE_register_ciphers(e);
> ++        return 1;
> ++    case AF_ALG_CMD_DIGESTS:
> ++        if( p =3D=3D NULL )
> ++            return 1;
> ++        if( names_to_nids(p, (void *)EVP_get_digestbyname, (void *)dige=
st_nid, &af_alg_digest_nids, &af_alg_digest_nids_num, af_alg_digest_all_nid=
s, af_alg_digest_all_nids_num) =3D=3D false )
> ++            return 0;
> ++        ENGINE_unregister_digests(e);
> ++        ENGINE_register_digests(e);
> ++        return 1;
> ++    default:
> ++        break;
> ++    }
> ++    return 0;
> ++}
> ++
> ++static int af_alg_bind_helper(ENGINE * e)
> ++{
> ++    if( !ENGINE_set_id(e, AF_ALG_ENGINE_ID) ||
> ++        !ENGINE_set_init_function(e, af_alg_init) ||
> ++        !ENGINE_set_finish_function(e, af_alg_finish) ||
> ++        !ENGINE_set_name(e, AF_ALG_ENGINE_NAME) ||
> ++        !ENGINE_set_ciphers (e, af_alg_ciphers) ||
> ++        !ENGINE_set_digests (e, af_alg_digests) ||
> ++        !ENGINE_set_ctrl_function(e, af_alg_ctrl) ||
> ++        !ENGINE_set_cmd_defns(e, af_alg_cmd_defns))
> ++        return 0;
> ++    return 1;
> ++}
> ++
> ++ENGINE *ENGINE_af_alg(void)
> ++{
> ++    ENGINE *eng =3D ENGINE_new();
> ++    if( !eng )
> ++        return NULL;
> ++
> ++    if( !af_alg_bind_helper(eng) )
> ++    {
> ++        ENGINE_free(eng);
> ++        return NULL;
> ++    }
> ++    return eng;
> ++}
> ++
> ++static int af_alg_bind_fn(ENGINE *e, const char *id)
> ++{
> ++    if( id && (strcmp(id, AF_ALG_ENGINE_ID) !=3D 0) )
> ++        return 0;
> ++
> ++    if( !af_alg_bind_helper(e) )
> ++        return 0;
> ++
> ++    return 1;
> ++}
> ++
> ++IMPLEMENT_DYNAMIC_CHECK_FN()
> ++IMPLEMENT_DYNAMIC_BIND_FN(af_alg_bind_fn)
> ++
> ++static int af_alg_aes_init_key (EVP_CIPHER_CTX *ctx, const unsigned cha=
r *key, const unsigned char *iv, int enc)
> ++{
> ++    int keylen =3D EVP_CIPHER_CTX_key_length(ctx);
> ++    struct af_alg_cipher_data *acd =3D (struct af_alg_cipher_data *)ctx=
->cipher_data;
> ++   =20
> ++    struct sockaddr_alg sa =3D {
> ++        .salg_family =3D AF_ALG,
> ++        .salg_type =3D "skcipher",
> ++        .salg_name =3D "cbc(aes)",
> ++    };
> ++
> ++    acd->op =3D -1;
> ++
> ++    if( ctx->encrypt )
> ++        acd->type =3D ALG_OP_ENCRYPT;
> ++    else
> ++        acd->type =3D ALG_OP_DECRYPT;
> ++
> ++    if((acd->tfmfd =3D socket(AF_ALG, SOCK_SEQPACKET, 0)) =3D=3D -1)
> ++        return 0;
> ++   =20
> ++    if( bind(acd->tfmfd, (struct sockaddr*)&sa, sizeof(sa)) =3D=3D -1 )
> ++        return 0;
> ++
> ++    if (setsockopt(acd->tfmfd, SOL_ALG, ALG_SET_KEY, key, keylen) =3D=
=3D -1)
> ++        return 0;
> ++
> ++    return 1;
> ++}
> ++
> ++int af_alg_aes_cleanup_key(EVP_CIPHER_CTX *ctx)
> ++{
> ++    struct af_alg_cipher_data *acd =3D (struct af_alg_cipher_data *)ctx=
->cipher_data;
> ++    if( acd->tfmfd !=3D -1 )
> ++        close(acd->tfmfd);
> ++    if( acd->op !=3D -1 )
> ++        close(acd->op);
> ++    return 1;
> ++}
> ++
> ++#define    DECLARE_AES_EVP(ksize,lmode,umode)                  \
> ++static const EVP_CIPHER af_alg_aes_##ksize##_##lmode =3D {    \
> ++    .nid =3D NID_aes_##ksize##_##lmode,                       \
> ++    .block_size =3D EVP_CIPHER_block_size_##umode, \
> ++    .key_len =3D AES_KEY_SIZE_##ksize,                        \
> ++    .iv_len =3D AES_BLOCK_SIZE,                               \
> ++    .flags =3D 0 | EVP_CIPH_##umode##_MODE,                   \
> ++    .init =3D af_alg_aes_init_key,                            \
> ++    .do_cipher =3D af_alg_aes_ciphers,                        \
> ++    .cleanup =3D af_alg_aes_cleanup_key,                      \
> ++    .ctx_size =3D sizeof(struct af_alg_cipher_data),          \
> ++    .set_asn1_parameters =3D EVP_CIPHER_set_asn1_iv,          \
> ++    .get_asn1_parameters =3D EVP_CIPHER_get_asn1_iv,          \
> ++    .ctrl =3D NULL,                                           \
> ++    .app_data =3D NULL                                        \
> ++}
> ++
> ++DECLARE_AES_EVP(128,cbc,CBC);
> ++DECLARE_AES_EVP(192,cbc,CBC);
> ++DECLARE_AES_EVP(256,cbc,CBC);
> ++
> ++static int af_alg_aes_ciphers(EVP_CIPHER_CTX *ctx, unsigned char *out_a=
rg, const unsigned char *in_arg, unsigned int nbytes)
> ++{
> ++    struct af_alg_cipher_data *acd =3D (struct af_alg_cipher_data *)ctx=
->cipher_data;
> ++    struct msghdr msg =3D {};
> ++    struct cmsghdr *cmsg;
> ++    struct af_alg_iv *ivm;
> ++    struct iovec iov;
> ++    char buf[CMSG_SPACE(sizeof(acd->type)) + CMSG_SPACE(offsetof(struct=
 af_alg_iv, iv) + AES_BLOCK_SIZE)];
> ++    ssize_t len;
> ++    unsigned char save_iv[AES_BLOCK_SIZE];
> ++
> ++    memset(buf, 0, sizeof(buf));
> ++
> ++    msg.msg_control =3D buf;
> ++    msg.msg_controllen =3D 0;
> ++    msg.msg_controllen =3D sizeof(buf);
> ++    if( acd->op =3D=3D -1 )
> ++    {
> ++        if((acd->op =3D accept(acd->tfmfd, NULL, 0)) =3D=3D -1)
> ++            return 0;
> ++    }
> ++    /* set operation type encrypt|decrypt */
> ++    cmsg =3D CMSG_FIRSTHDR(&msg);
> ++    cmsg->cmsg_level =3D SOL_ALG;
> ++    cmsg->cmsg_type =3D ALG_SET_OP;
> ++    cmsg->cmsg_len =3D CMSG_LEN(4);
> ++    memcpy(CMSG_DATA(cmsg),&acd->type, 4);
> ++
> ++    /* set IV - or update if it was set before */
> ++    if(!ctx->encrypt)
> ++        memcpy(save_iv, in_arg + nbytes - AES_BLOCK_SIZE, AES_BLOCK_SIZ=
E);
> ++
> ++    cmsg =3D CMSG_NXTHDR(&msg, cmsg);
> ++    cmsg->cmsg_level =3D SOL_ALG;
> ++    cmsg->cmsg_type =3D ALG_SET_IV;
> ++    cmsg->cmsg_len =3D CMSG_LEN(offsetof(struct af_alg_iv, iv) + AES_BL=
OCK_SIZE);
> ++    ivm =3D (void*)CMSG_DATA(cmsg);
> ++    ivm->ivlen =3D AES_BLOCK_SIZE;
> ++    memcpy(ivm->iv, ctx->iv, AES_BLOCK_SIZE);
> ++
> ++    msg.msg_iov =3D &iov;
> ++    msg.msg_iovlen =3D 1;
> ++
> ++    unsigned int todo =3D nbytes;
> ++    unsigned int done =3D 0;
> ++    while( todo-done > 0 )
> ++    {
> ++        iov.iov_base =3D (void *)(in_arg + done);
> ++        iov.iov_len =3D todo-done;
> ++
> ++        if((len =3D sendmsg(acd->op, &msg, 0)) =3D=3D -1)
> ++            return 0;
> ++
> ++        if (read(acd->op, out_arg+done, len) !=3D len)
> ++            return 0;
> ++       =20
> ++        /* do not update IV for following chunks */
> ++        msg.msg_controllen =3D 0;
> ++        done +=3D len;
> ++    }
> ++
> ++    /* copy IV for next iteration */
> ++    if(ctx->encrypt)
> ++        memcpy(ctx->iv, out_arg + done - AES_BLOCK_SIZE, AES_BLOCK_SIZE=
);
> ++    else
> ++        memcpy(ctx->iv, save_iv, AES_BLOCK_SIZE);
> ++    return 1;
> ++}
> ++
> ++static int af_alg_ciphers(ENGINE *e, const EVP_CIPHER **cipher, const i=
nt **nids, int nid)
> ++{
> ++    if( !cipher )
> ++    {
> ++        *nids =3D af_alg_cipher_nids;
> ++        return af_alg_cipher_nids_num;
> ++    }
> ++
> ++    if( ! nid_in_nids(nid, af_alg_cipher_nids, af_alg_cipher_nids_num) =
)
> ++        return 0;
> ++
> ++    switch( nid )
> ++    {
> ++    case NID_aes_128_cbc:
> ++        *cipher =3D &af_alg_aes_128_cbc;
> ++        break;
> ++    case NID_aes_192_cbc:
> ++        *cipher =3D &af_alg_aes_192_cbc;
> ++        break;
> ++    case NID_aes_256_cbc:
> ++        *cipher =3D &af_alg_aes_256_cbc;
> ++        break;
> ++    default:
> ++        *cipher =3D NULL;
> ++    }
> ++    return(*cipher !=3D 0);
> ++}
> ++
> ++struct af_alg_digest_data
> ++{
> ++    int tfmfd;
> ++    int opfd;
> ++};
> ++
> ++#define DIGEST_DATA(ctx) ((struct af_alg_digest_data*)(ctx->md_data))
> ++
> ++static int af_alg_sha1_init(EVP_MD_CTX *ctx)
> ++{
> ++    struct af_alg_digest_data *ddata =3D DIGEST_DATA(ctx);
> ++    struct sockaddr_alg sa =3D {
> ++        .salg_family =3D AF_ALG,
> ++        .salg_type =3D "hash",
> ++        .salg_name =3D "sha1"
> ++    };
> ++
> ++    if( (ddata->tfmfd =3D socket(AF_ALG, SOCK_SEQPACKET, 0)) =3D=3D -1 =
)
> ++        return 0;
> ++
> ++    if( bind(ddata->tfmfd, (struct sockaddr *)&sa, sizeof(sa)) !=3D 0 )
> ++        return 0;
> ++
> ++    if( (ddata->opfd =3D accept(ddata->tfmfd,NULL,0)) =3D=3D -1 )
> ++        return 0;
> ++
> ++    return 1;
> ++}
> ++
> ++static int af_alg_sha1_update(EVP_MD_CTX *ctx, const void *data, size_t=
 length)
> ++{
> ++    struct af_alg_digest_data *ddata =3D DIGEST_DATA(ctx);
> ++    ssize_t r;
> ++    r =3D send(ddata->opfd, data, length, MSG_MORE);
> ++    if( r < 0 || (size_t)r < length )
> ++        return 0;
> ++    return 1;
> ++}
> ++
> ++static int af_alg_sha1_final(EVP_MD_CTX *ctx, unsigned char *md)
> ++{
> ++    struct af_alg_digest_data *ddata =3D DIGEST_DATA(ctx);
> ++    if( read(ddata->opfd, md, SHA_DIGEST_LENGTH) !=3D SHA_DIGEST_LENGTH=
 )
> ++        return 0;
> ++
> ++    return 1;
> ++}
> ++
> ++static int af_alg_sha1_copy(EVP_MD_CTX *_to,const EVP_MD_CTX *_from)
> ++{
> ++    struct af_alg_digest_data *from =3D DIGEST_DATA(_from);
> ++    struct af_alg_digest_data *to =3D DIGEST_DATA(_to);
> ++    if( (to->opfd =3D accept(from->opfd, NULL, 0)) =3D=3D -1 )
> ++        return 0;
> ++    if( (to->tfmfd =3D accept(from->tfmfd, NULL, 0)) =3D=3D -1 )
> ++        return 0;
> ++    return 1;
> ++}
> ++
> ++static int af_alg_sha1_cleanup(EVP_MD_CTX *ctx)
> ++{
> ++    struct af_alg_digest_data *ddata =3D DIGEST_DATA(ctx);
> ++    if( ddata->opfd !=3D -1 )
> ++        close(ddata->opfd);
> ++    if( ddata->tfmfd !=3D -1 )
> ++        close(ddata->tfmfd);
> ++    return 0;
> ++}
> ++
> ++#define    DECLARE_MD_SHA(digest) \
> ++static const EVP_MD af_alg_##digest##_md =3D {    \
> ++    NID_##digest,                               \
> ++    NID_##digest##WithRSAEncryption, \
> ++    SHA_DIGEST_LENGTH,                          \
> ++    0,                                          \
> ++    af_alg_##digest##_init,                     \
> ++    af_alg_##digest##_update,                   \
> ++    af_alg_##digest##_final,                    \
> ++    af_alg_##digest##_copy,                     \
> ++    af_alg_##digest##_cleanup,                  \
> ++    EVP_PKEY_RSA_method,                        \
> ++    SHA_CBLOCK,                                 \
> ++    sizeof(struct af_alg_digest_data),          \
> ++};
> ++
> ++DECLARE_MD_SHA(sha1)
> ++
> ++static int af_alg_digests(ENGINE *e, const EVP_MD **digest, const int *=
*nids, int nid)
> ++{
> ++    if( !digest )
> ++    {
> ++        *nids =3D af_alg_digest_nids;
> ++        return af_alg_digest_nids_num;
> ++    }
> ++
> ++    if( nid_in_nids(nid, af_alg_digest_nids, af_alg_digest_nids_num) =
=3D=3D false )
> ++        return 0;
> ++
> ++    switch( nid )
> ++    {
> ++    case NID_sha1:
> ++        *digest =3D &af_alg_sha1_md;
> ++        break;
> ++    default:
> ++        *digest =3D NULL;
> ++    }
> ++    return (*digest !=3D NULL);
> ++}
> ++
> +--=20
> +1.8.3.2
> +
> diff --git a/meta-arago-distro/recipes-connectivity/openssl/openssl/0001-=
eng_cryptodev.c-update-to-cryptodev-1.6.patch b/meta-arago-distro/recipes-c=
onnectivity/openssl/openssl/0001-eng_cryptodev.c-update-to-cryptodev-1.6.pa=
tch
> new file mode 100644
> index 0000000..dc1b0bf
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/openssl/openssl/0001-eng_cry=
ptodev.c-update-to-cryptodev-1.6.patch
> @@ -0,0 +1,435 @@
> +From 5dedfbae28442c26203b73c2504f9dca3e6149eb Mon Sep 17 00:00:00 2001
> +From: Denys Dmytriyenko <denys@ti.com>
> +Date: Fri, 13 Dec 2013 14:08:12 -0500
> +Subject: [PATCH] eng_cryptodev.c: update to cryptodev-1.6
> +
> +Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> +---
> + crypto/engine/eng_cryptodev.c | 193 ++++++++++++++++++++++++++++++-----=
-------
> + 1 file changed, 141 insertions(+), 52 deletions(-)
> +
> +diff --git a/crypto/engine/eng_cryptodev.c b/crypto/engine/eng_cryptodev=
.c
> +index b28834b..9bbc6fb 100644
> +--- a/crypto/engine/eng_cryptodev.c
> ++++ b/crypto/engine/eng_cryptodev.c
> +@@ -2,6 +2,7 @@
> +  * Copyright (c) 2002 Bob Beck <beck@openbsd.org>
> +  * Copyright (c) 2002 Theo de Raadt
> +  * Copyright (c) 2002 Markus Friedl
> ++ * Copyright (c) 2012 Nikos Mavrogiannopoulos
> +  * All rights reserved.
> +  *
> +  * Redistribution and use in source and binary forms, with or without
> +@@ -76,8 +77,6 @@ struct dev_crypto_state {
> +    int d_fd;
> +=20
> + #ifdef USE_CRYPTODEV_DIGESTS
> +-    char dummy_mac_key[HASH_MAX_LEN];
> +-
> +    unsigned char digest_res[HASH_MAX_LEN];
> +    char *mac_data;
> +    int mac_len;
> +@@ -159,15 +158,21 @@ static struct {
> + static struct {
> +    int    id;
> +    int    nid;
> +-    int    keylen;
> ++    int    digestlen;
> + } digests[] =3D {
> ++#if 0
> ++        /* HMAC is not supported */
> +    { CRYPTO_MD5_HMAC,        NID_hmacWithMD5,    16},
> +    { CRYPTO_SHA1_HMAC,        NID_hmacWithSHA1,    20},
> +-    { CRYPTO_RIPEMD160_HMAC,    NID_ripemd160,        16/*?*/},
> +-    { CRYPTO_MD5_KPDK,        NID_undef,        0},
> +-    { CRYPTO_SHA1_KPDK,        NID_undef,        0},
> ++    { CRYPTO_SHA2_256_HMAC,        NID_hmacWithSHA256,    32},
> ++    { CRYPTO_SHA2_384_HMAC,        NID_hmacWithSHA384,    48},
> ++    { CRYPTO_SHA2_512_HMAC,        NID_hmacWithSHA512,    64},
> ++#endif
> +    { CRYPTO_MD5,            NID_md5,        16},
> +    { CRYPTO_SHA1,            NID_sha1,        20},
> ++    { CRYPTO_SHA2_256,        NID_sha256,        32},
> ++    { CRYPTO_SHA2_384,        NID_sha384,        48},
> ++    { CRYPTO_SHA2_512,        NID_sha512,        64},
> +    { 0,                NID_undef,        0},
> + };
> + #endif
> +@@ -245,13 +250,14 @@ get_cryptodev_ciphers(const int **cnids)
> +    static int nids[CRYPTO_ALGORITHM_MAX];
> +    struct session_op sess;
> +    int fd, i, count =3D 0;
> ++    unsigned char fake_key[CRYPTO_CIPHER_MAX_KEY_LEN];
> +=20
> +    if ((fd =3D get_dev_crypto()) < 0) {
> +        *cnids =3D NULL;
> +        return (0);
> +    }
> +    memset(&sess, 0, sizeof(sess));
> +-    sess.key =3D (caddr_t)"123456789abcdefghijklmno";
> ++    sess.key =3D (void*)fake_key;
> +=20
> +    for (i =3D 0; ciphers[i].id && count < CRYPTO_ALGORITHM_MAX; i++) {
> +        if (ciphers[i].nid =3D=3D NID_undef)
> +@@ -283,6 +289,7 @@ static int
> + get_cryptodev_digests(const int **cnids)
> + {
> +    static int nids[CRYPTO_ALGORITHM_MAX];
> ++    unsigned char fake_key[CRYPTO_CIPHER_MAX_KEY_LEN];
> +    struct session_op sess;
> +    int fd, i, count =3D 0;
> +=20
> +@@ -291,12 +298,12 @@ get_cryptodev_digests(const int **cnids)
> +        return (0);
> +    }
> +    memset(&sess, 0, sizeof(sess));
> +-    sess.mackey =3D (caddr_t)"123456789abcdefghijklmno";
> ++    sess.mackey =3D fake_key;
> +    for (i =3D 0; digests[i].id && count < CRYPTO_ALGORITHM_MAX; i++) {
> +        if (digests[i].nid =3D=3D NID_undef)
> +            continue;
> +        sess.mac =3D digests[i].id;
> +-        sess.mackeylen =3D digests[i].keylen;
> ++        sess.mackeylen =3D 8;
> +        sess.cipher =3D 0;
> +        if (ioctl(fd, CIOCGSESSION, &sess) !=3D -1 &&
> +            ioctl(fd, CIOCFSESSION, &sess.ses) !=3D -1)
> +@@ -384,14 +391,14 @@ cryptodev_cipher(EVP_CIPHER_CTX *ctx, unsigned cha=
r *out,
> +    cryp.ses =3D sess->ses;
> +    cryp.flags =3D 0;
> +    cryp.len =3D inl;
> +-    cryp.src =3D (caddr_t) in;
> +-    cryp.dst =3D (caddr_t) out;
> ++    cryp.src =3D (void*) in;
> ++    cryp.dst =3D (void*) out;
> +    cryp.mac =3D 0;
> +=20
> +    cryp.op =3D ctx->encrypt ? COP_ENCRYPT : COP_DECRYPT;
> +=20
> +    if (ctx->cipher->iv_len) {
> +-        cryp.iv =3D (caddr_t) ctx->iv;
> ++        cryp.iv =3D (void*) ctx->iv;
> +        if (!ctx->encrypt) {
> +            iiv =3D in + inl - ctx->cipher->iv_len;
> +            memcpy(save_iv, iiv, ctx->cipher->iv_len);
> +@@ -442,7 +449,7 @@ cryptodev_init_key(EVP_CIPHER_CTX *ctx, const unsign=
ed char *key,
> +    if ((state->d_fd =3D get_dev_crypto()) < 0)
> +        return (0);
> +=20
> +-    sess->key =3D (caddr_t)key;
> ++    sess->key =3D (void*)key;
> +    sess->keylen =3D ctx->key_len;
> +    sess->cipher =3D cipher;
> +=20
> +@@ -662,18 +669,6 @@ digest_nid_to_cryptodev(int nid)
> + }
> +=20
> +=20
> +-static int
> +-digest_key_length(int nid)
> +-{
> +-    int i;
> +-
> +-    for (i =3D 0; digests[i].id; i++)
> +-        if (digests[i].nid =3D=3D nid)
> +-            return digests[i].keylen;
> +-    return (0);
> +-}
> +-
> +-
> + static int cryptodev_digest_init(EVP_MD_CTX *ctx)
> + {
> +    struct dev_crypto_state *state =3D ctx->md_data;
> +@@ -684,7 +679,6 @@ static int cryptodev_digest_init(EVP_MD_CTX *ctx)
> +        printf("cryptodev_digest_init: Can't get digest \n");
> +        return (0);
> +    }
> +-
> +    memset(state, 0, sizeof(struct dev_crypto_state));
> +=20
> +    if ((state->d_fd =3D get_dev_crypto()) < 0) {
> +@@ -692,8 +686,8 @@ static int cryptodev_digest_init(EVP_MD_CTX *ctx)
> +        return (0);
> +    }
> +=20
> +-    sess->mackey =3D state->dummy_mac_key;
> +-    sess->mackeylen =3D digest_key_length(ctx->digest->type);
> ++    sess->mackey =3D NULL;
> ++    sess->mackeylen =3D 0;
> +    sess->mac =3D digest;
> +=20
> +    if (ioctl(state->d_fd, CIOCGSESSION, sess) < 0) {
> +@@ -709,8 +703,8 @@ static int cryptodev_digest_init(EVP_MD_CTX *ctx)
> + static int cryptodev_digest_update(EVP_MD_CTX *ctx, const void *data,
> +        size_t count)
> + {
> +-    struct crypt_op cryp;
> +    struct dev_crypto_state *state =3D ctx->md_data;
> ++    struct crypt_op cryp;
> +    struct session_op *sess =3D &state->d_sess;
> +=20
> +    if (!data || state->d_fd < 0) {
> +@@ -719,7 +713,7 @@ static int cryptodev_digest_update(EVP_MD_CTX *ctx, =
const void *data,
> +    }
> +=20
> +    if (!count) {
> +-        return (0);
> ++        return (1);
> +    }
> +=20
> + #ifndef OPENSSL_CRYPTODEF_HASH_NO_ONESHOT
> +@@ -744,9 +738,9 @@ static int cryptodev_digest_update(EVP_MD_CTX *ctx, =
const void *data,
> +    cryp.ses =3D sess->ses;
> +    cryp.flags =3D 0;
> +    cryp.len =3D count;
> +-    cryp.src =3D (caddr_t) data;
> ++    cryp.src =3D (void*) data;
> +    cryp.dst =3D NULL;
> +-    cryp.mac =3D (caddr_t) state->digest_res;
> ++    cryp.mac =3D (void*) state->digest_res;
> +    if (ioctl(state->d_fd, CIOCCRYPT, &cryp) < 0) {
> +        printf("cryptodev_digest_update: digest failed\n");
> +        return (0);
> +@@ -761,8 +755,6 @@ static int cryptodev_digest_final(EVP_MD_CTX *ctx, u=
nsigned char *md)
> +    struct dev_crypto_state *state =3D ctx->md_data;
> +    struct session_op *sess =3D &state->d_sess;
> +=20
> +-    int ret =3D 1;
> +-
> +    if (!md || state->d_fd < 0) {
> +        printf("cryptodev_digest_final: illegal input\n");
> +        return(0);
> +@@ -777,7 +769,7 @@ static int cryptodev_digest_final(EVP_MD_CTX *ctx, u=
nsigned char *md)
> +        cryp.len =3D state->mac_len;
> +        cryp.src =3D state->mac_data;
> +        cryp.dst =3D NULL;
> +-        cryp.mac =3D (caddr_t)md;
> ++        cryp.mac =3D (void*)md;
> +        if (ioctl(state->d_fd, CIOCCRYPT, &cryp) < 0) {
> +            printf("cryptodev_digest_final: digest failed\n");
> +            return (0);
> +@@ -789,7 +781,7 @@ static int cryptodev_digest_final(EVP_MD_CTX *ctx, u=
nsigned char *md)
> +=20
> +    memcpy(md, state->digest_res, ctx->digest->md_size);
> +=20
> +-    return (ret);
> ++    return 1;
> + }
> +=20
> +=20
> +@@ -841,8 +833,8 @@ static int cryptodev_digest_copy(EVP_MD_CTX *to,cons=
t EVP_MD_CTX *from)
> +=20
> +    digest =3D digest_nid_to_cryptodev(to->digest->type);
> +=20
> +-    sess->mackey =3D dstate->dummy_mac_key;
> +-    sess->mackeylen =3D digest_key_length(to->digest->type);
> ++    sess->mackey =3D NULL;
> ++    sess->mackeylen =3D 0;
> +    sess->mac =3D digest;
> +=20
> +    dstate->d_fd =3D get_dev_crypto();
> +@@ -867,34 +859,117 @@ static int cryptodev_digest_copy(EVP_MD_CTX *to,c=
onst EVP_MD_CTX *from)
> + }
> +=20
> +=20
> +-const EVP_MD cryptodev_sha1 =3D {
> ++static const EVP_MD cryptodev_sha1 =3D {
> +    NID_sha1,
> +-    NID_undef,=20
> ++    NID_sha1WithRSAEncryption,
> +    SHA_DIGEST_LENGTH,=20
> ++#if defined(EVP_MD_FLAG_PKEY_METHOD_SIGNATURE) && defined(EVP_MD_FLAG_D=
IGALGID_ABSENT)
> ++    EVP_MD_FLAG_PKEY_METHOD_SIGNATURE|
> ++    EVP_MD_FLAG_DIGALGID_ABSENT|
> ++#endif
> +    EVP_MD_FLAG_ONESHOT,
> +    cryptodev_digest_init,
> +    cryptodev_digest_update,
> +    cryptodev_digest_final,
> +    cryptodev_digest_copy,
> +    cryptodev_digest_cleanup,
> +-    EVP_PKEY_NULL_method,
> ++    EVP_PKEY_RSA_method,
> +    SHA_CBLOCK,
> +-    sizeof(struct dev_crypto_state),
> ++    sizeof(EVP_MD *)+sizeof(struct dev_crypto_state),
> ++};
> ++
> ++static const EVP_MD cryptodev_sha256 =3D {
> ++    NID_sha256,
> ++    NID_sha256WithRSAEncryption,
> ++    SHA256_DIGEST_LENGTH,=20
> ++#if defined(EVP_MD_FLAG_PKEY_METHOD_SIGNATURE) && defined(EVP_MD_FLAG_D=
IGALGID_ABSENT)
> ++    EVP_MD_FLAG_PKEY_METHOD_SIGNATURE|
> ++    EVP_MD_FLAG_DIGALGID_ABSENT|
> ++#endif
> ++    EVP_MD_FLAG_ONESHOT,
> ++    cryptodev_digest_init,
> ++    cryptodev_digest_update,
> ++    cryptodev_digest_final,
> ++    cryptodev_digest_copy,
> ++    cryptodev_digest_cleanup,
> ++    EVP_PKEY_RSA_method,
> ++    SHA256_CBLOCK,
> ++    sizeof(EVP_MD *)+sizeof(struct dev_crypto_state),
> ++};
> ++static const EVP_MD cryptodev_sha224 =3D {
> ++    NID_sha224,
> ++    NID_sha224WithRSAEncryption,=20
> ++    SHA224_DIGEST_LENGTH,=20
> ++#if defined(EVP_MD_FLAG_PKEY_METHOD_SIGNATURE) && defined(EVP_MD_FLAG_D=
IGALGID_ABSENT)
> ++    EVP_MD_FLAG_PKEY_METHOD_SIGNATURE|
> ++    EVP_MD_FLAG_DIGALGID_ABSENT|
> ++#endif
> ++    EVP_MD_FLAG_ONESHOT,
> ++    cryptodev_digest_init,
> ++    cryptodev_digest_update,
> ++    cryptodev_digest_final,
> ++    cryptodev_digest_copy,
> ++    cryptodev_digest_cleanup,
> ++    EVP_PKEY_RSA_method,
> ++    SHA256_CBLOCK,
> ++    sizeof(EVP_MD *)+sizeof(struct dev_crypto_state),
> ++};
> ++
> ++static const EVP_MD cryptodev_sha384 =3D {
> ++    NID_sha384,
> ++    NID_sha384WithRSAEncryption,=20
> ++    SHA384_DIGEST_LENGTH,=20
> ++#if defined(EVP_MD_FLAG_PKEY_METHOD_SIGNATURE) && defined(EVP_MD_FLAG_D=
IGALGID_ABSENT)
> ++    EVP_MD_FLAG_PKEY_METHOD_SIGNATURE|
> ++    EVP_MD_FLAG_DIGALGID_ABSENT|
> ++#endif
> ++    EVP_MD_FLAG_ONESHOT,
> ++    cryptodev_digest_init,
> ++    cryptodev_digest_update,
> ++    cryptodev_digest_final,
> ++    cryptodev_digest_copy,
> ++    cryptodev_digest_cleanup,
> ++    EVP_PKEY_RSA_method,
> ++    SHA512_CBLOCK,
> ++    sizeof(EVP_MD *)+sizeof(struct dev_crypto_state),
> ++};
> ++
> ++static const EVP_MD cryptodev_sha512 =3D {
> ++    NID_sha512,
> ++    NID_sha512WithRSAEncryption,=20
> ++    SHA512_DIGEST_LENGTH,=20
> ++#if defined(EVP_MD_FLAG_PKEY_METHOD_SIGNATURE) && defined(EVP_MD_FLAG_D=
IGALGID_ABSENT)
> ++    EVP_MD_FLAG_PKEY_METHOD_SIGNATURE|
> ++    EVP_MD_FLAG_DIGALGID_ABSENT|
> ++#endif
> ++    EVP_MD_FLAG_ONESHOT,
> ++    cryptodev_digest_init,
> ++    cryptodev_digest_update,
> ++    cryptodev_digest_final,
> ++    cryptodev_digest_copy,
> ++    cryptodev_digest_cleanup,
> ++    EVP_PKEY_RSA_method,
> ++    SHA512_CBLOCK,
> ++    sizeof(EVP_MD *)+sizeof(struct dev_crypto_state),
> + };
> +=20
> +-const EVP_MD cryptodev_md5 =3D {
> ++static const EVP_MD cryptodev_md5 =3D {
> +    NID_md5,
> +-    NID_undef,=20
> ++    NID_md5WithRSAEncryption,=20
> +    16 /* MD5_DIGEST_LENGTH */,=20
> ++#if defined(EVP_MD_FLAG_PKEY_METHOD_SIGNATURE) && defined(EVP_MD_FLAG_D=
IGALGID_ABSENT)
> ++    EVP_MD_FLAG_PKEY_METHOD_SIGNATURE|
> ++    EVP_MD_FLAG_DIGALGID_ABSENT|
> ++#endif
> +    EVP_MD_FLAG_ONESHOT,
> +    cryptodev_digest_init,
> +    cryptodev_digest_update,
> +    cryptodev_digest_final,
> +    cryptodev_digest_copy,
> +    cryptodev_digest_cleanup,
> +-    EVP_PKEY_NULL_method,
> ++    EVP_PKEY_RSA_method,
> +    64 /* MD5_CBLOCK */,
> +-    sizeof(struct dev_crypto_state),
> ++    sizeof(EVP_MD *)+sizeof(struct dev_crypto_state),
> + };
> +=20
> + #endif /* USE_CRYPTODEV_DIGESTS */
> +@@ -915,6 +990,18 @@ cryptodev_engine_digests(ENGINE *e, const EVP_MD **=
digest,
> +    case NID_sha1:
> +        *digest =3D &cryptodev_sha1;
> +          break;
> ++    case NID_sha224:
> ++        *digest =3D &cryptodev_sha224;
> ++        break;
> ++    case NID_sha256:
> ++        *digest =3D &cryptodev_sha256;
> ++        break;
> ++    case NID_sha384:
> ++        *digest =3D &cryptodev_sha384;
> ++        break;
> ++    case NID_sha512:
> ++        *digest =3D &cryptodev_sha512;
> ++        break;
> +    default:
> + #endif /* USE_CRYPTODEV_DIGESTS */
> +        *digest =3D NULL;
> +@@ -946,7 +1033,7 @@ bn2crparam(const BIGNUM *a, struct crparam *crp)
> +        return (1);
> +    memset(b, 0, bytes);
> +=20
> +-    crp->crp_p =3D (caddr_t) b;
> ++    crp->crp_p =3D (void*) b;
> +    crp->crp_nbits =3D bits;
> +=20
> +    for (i =3D 0, j =3D 0; i < a->top; i++) {
> +@@ -1199,7 +1286,7 @@ cryptodev_dsa_do_sign(const unsigned char *dgst, i=
nt dlen, DSA *dsa)
> +    kop.crk_op =3D CRK_DSA_SIGN;
> +=20
> +    /* inputs: dgst dsa->p dsa->q dsa->g dsa->priv_key */
> +-    kop.crk_param[0].crp_p =3D (caddr_t)dgst;
> ++    kop.crk_param[0].crp_p =3D (void*)dgst;
> +    kop.crk_param[0].crp_nbits =3D dlen * 8;
> +    if (bn2crparam(dsa->p, &kop.crk_param[1]))
> +        goto err;
> +@@ -1239,7 +1326,7 @@ cryptodev_dsa_verify(const unsigned char *dgst, in=
t dlen,
> +    kop.crk_op =3D CRK_DSA_VERIFY;
> +=20
> +    /* inputs: dgst dsa->p dsa->q dsa->g dsa->pub_key sig->r sig->s */
> +-    kop.crk_param[0].crp_p =3D (caddr_t)dgst;
> ++    kop.crk_param[0].crp_p =3D (void*)dgst;
> +    kop.crk_param[0].crp_nbits =3D dlen * 8;
> +    if (bn2crparam(dsa->p, &kop.crk_param[1]))
> +        goto err;
> +@@ -1317,9 +1404,10 @@ cryptodev_dh_compute_key(unsigned char *key, cons=
t BIGNUM *pub_key, DH *dh)
> +        goto err;
> +    kop.crk_iparams =3D 3;
> +=20
> +-    kop.crk_param[3].crp_p =3D (caddr_t) key;
> +-    kop.crk_param[3].crp_nbits =3D keylen * 8;
> ++    kop.crk_param[3].crp_p =3D (void*) key;
> ++    kop.crk_param[3].crp_nbits =3D keylen;
> +    kop.crk_oparams =3D 1;
> ++    dhret =3D keylen/8;
> +=20
> +    if (ioctl(fd, CIOCKEY, &kop) =3D=3D -1) {
> +        const DH_METHOD *meth =3D DH_OpenSSL();
> +@@ -1384,6 +1472,7 @@ ENGINE_load_cryptodev(void)
> +     * find out what asymmetric crypto algorithms we support
> +     */
> +    if (ioctl(fd, CIOCASYMFEAT, &cryptodev_asymfeat) =3D=3D -1) {
> ++        printf("ioctl to check algs failed\n");
> +        put_dev_crypto(fd);
> +        ENGINE_free(engine);
> +        return;
> +@@ -1391,7 +1480,7 @@ ENGINE_load_cryptodev(void)
> +    put_dev_crypto(fd);
> +=20
> +    if (!ENGINE_set_id(engine, "cryptodev") ||
> +-        !ENGINE_set_name(engine, "BSD cryptodev engine") ||
> ++        !ENGINE_set_name(engine, "cryptodev engine") ||
> +        !ENGINE_set_ciphers(engine, cryptodev_engine_ciphers) ||
> +        !ENGINE_set_digests(engine, cryptodev_engine_digests) ||
> +        !ENGINE_set_ctrl_function(engine, cryptodev_ctrl) ||
> +--=20
> +1.8.3.2
> +
> diff --git a/meta-arago-distro/recipes-connectivity/openssl/openssl/0004-=
Sample-AF_ALG-openssl.cnf.patch b/meta-arago-distro/recipes-connectivity/op=
enssl/openssl/0004-Sample-AF_ALG-openssl.cnf.patch
> new file mode 100644
> index 0000000..d223375
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/openssl/openssl/0004-Sample-=
AF_ALG-openssl.cnf.patch
> @@ -0,0 +1,36 @@
> +From a790ddb9694aff023fdcdbcfadf0b11ee9781b87 Mon Sep 17 00:00:00 2001
> +From: Joel A Fernandes <joelagnel@ti.com>
> +Date: Sun, 31 Mar 2013 07:33:27 -0500
> +Subject: [PATCH 04/11] Sample AF_ALG openssl.cnf To be copied to
> + /usr/lib/ssl/openssl.cnf
> +
> +Specifies which algorithms to register for AF_ALG
> +
> +Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
> +---
> + engines/af_alg_openssl.cnf | 13 +++++++++++++
> + 1 file changed, 13 insertions(+)
> + create mode 100644 engines/af_alg_openssl.cnf
> +
> +diff --git a/engines/af_alg_openssl.cnf b/engines/af_alg_openssl.cnf
> +new file mode 100644
> +index 0000000..138ed16
> +--- /dev/null
> ++++ b/engines/af_alg_openssl.cnf
> +@@ -0,0 +1,13 @@
> ++openssl_conf =3D openssl_def
> ++
> ++[openssl_def]
> ++engines =3D openssl_engines
> ++
> ++[openssl_engines]
> ++af_alg =3D af_alg_engine
> ++
> ++[af_alg_engine]
> ++default_algorithms =3D ALL
> ++CIPHERS=3Daes-128-cbc
> ++DIGESTS=3Dsha1
> ++
> +--=20
> +1.8.3.2
> +
> diff --git a/meta-arago-distro/recipes-connectivity/openssl/openssl/0009-=
eng_cryptodev-Add-SHA224-initialization-to-cryptodev.patch b/meta-arago-dis=
tro/recipes-connectivity/openssl/openssl/0009-eng_cryptodev-Add-SHA224-init=
ialization-to-cryptodev.patch
> new file mode 100644
> index 0000000..ae55a1a
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/openssl/openssl/0009-eng_cry=
ptodev-Add-SHA224-initialization-to-cryptodev.patch
> @@ -0,0 +1,26 @@
> +From 3b8c75093561d2f4b06b1b9efc7689971c9a1709 Mon Sep 17 00:00:00 2001
> +From: Joel A Fernandes <joelagnel@ti.com>
> +Date: Fri, 19 Apr 2013 03:19:11 -0500
> +Subject: [PATCH 09/11] eng_cryptodev: Add SHA224 initialization to crypt=
odev
> + engine.
> +
> +Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
> +---
> + crypto/engine/eng_cryptodev.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/crypto/engine/eng_cryptodev.c b/crypto/engine/eng_cryptodev=
.c
> +index 00580a5..d095a58 100644
> +--- a/crypto/engine/eng_cryptodev.c
> ++++ b/crypto/engine/eng_cryptodev.c
> +@@ -170,6 +170,7 @@ static struct {
> + #endif
> +    { CRYPTO_MD5,            NID_md5,        16},
> +    { CRYPTO_SHA1,            NID_sha1,        20},
> ++    { CRYPTO_SHA2_224,        NID_sha224,        28},
> +    { CRYPTO_SHA2_256,        NID_sha256,        32},
> +    { CRYPTO_SHA2_384,        NID_sha384,        48},
> +    { CRYPTO_SHA2_512,        NID_sha512,        64},
> +--=20
> +1.8.3.2
> +
> diff --git a/meta-arago-distro/recipes-connectivity/openssl/openssl/0011-=
cryptodev-Add-AES-CBC-CTR-modes-for-128-192-256-bit-.patch b/meta-arago-dis=
tro/recipes-connectivity/openssl/openssl/0011-cryptodev-Add-AES-CBC-CTR-mod=
es-for-128-192-256-bit-.patch
> new file mode 100644
> index 0000000..fb43b16
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/openssl/openssl/0011-cryptod=
ev-Add-AES-CBC-CTR-modes-for-128-192-256-bit-.patch
> @@ -0,0 +1,142 @@
> +From 26384c393fed398ebaddcdcfd54ac12242808bba Mon Sep 17 00:00:00 2001
> +From: Joel Fernandes <joelf@ti.com>
> +Date: Fri, 6 Dec 2013 16:15:40 +0530
> +Subject: [PATCH 11/11] cryptodev: Add AES CBC & CTR modes for 128/192/25=
6 bit
> + key sizes
> +
> +Signed-off-by: Joel Fernandes <joelf@ti.com>
> +---
> + crypto/engine/eng_cryptodev.c | 103 +++++++++++++++++++++++++++++++++++=
+++++++
> + 1 file changed, 103 insertions(+)
> +
> +diff --git a/crypto/engine/eng_cryptodev.c b/crypto/engine/eng_cryptodev=
.c
> +index d095a58..565ed26 100644
> +--- a/crypto/engine/eng_cryptodev.c
> ++++ b/crypto/engine/eng_cryptodev.c
> +@@ -148,6 +148,12 @@ static struct {
> +    { CRYPTO_AES_CBC,        NID_aes_128_cbc,    16,    16, },
> +    { CRYPTO_AES_CBC,        NID_aes_192_cbc,    16,    24, },
> +    { CRYPTO_AES_CBC,        NID_aes_256_cbc,    16,    32, },
> ++    { CRYPTO_AES_ECB,        NID_aes_128_ecb,    16,    16, },
> ++    { CRYPTO_AES_ECB,        NID_aes_192_ecb,    16,    24, },
> ++    { CRYPTO_AES_ECB,        NID_aes_256_ecb,    16,    32, },
> ++    { CRYPTO_AES_CTR,        NID_aes_128_ctr,    16,    16, },
> ++    { CRYPTO_AES_CTR,        NID_aes_192_ctr,    16,    24, },
> ++    { CRYPTO_AES_CTR,        NID_aes_256_ctr,    16,    32, },
> +    { CRYPTO_BLF_CBC,        NID_bf_cbc,        8,    16, },
> +    { CRYPTO_CAST_CBC,        NID_cast5_cbc,        8,    16, },
> +    { CRYPTO_SKIPJACK_CBC,        NID_undef,        0,     0, },
> +@@ -610,6 +616,85 @@ const EVP_CIPHER cryptodev_aes_256_cbc =3D {
> +    NULL
> + };
> +=20
> ++const EVP_CIPHER cryptodev_aes_ecb =3D {
> ++    NID_aes_128_ecb,
> ++    16, 16, 16,
> ++    EVP_CIPH_ECB_MODE,
> ++    cryptodev_init_key,
> ++    cryptodev_cipher,
> ++    cryptodev_cleanup,
> ++    sizeof(struct dev_crypto_state),
> ++    EVP_CIPHER_set_asn1_iv,
> ++    EVP_CIPHER_get_asn1_iv,
> ++    NULL
> ++};
> ++
> ++const EVP_CIPHER cryptodev_aes_192_ecb =3D {
> ++    NID_aes_192_ecb,
> ++    16, 24, 16,
> ++    EVP_CIPH_ECB_MODE,
> ++    cryptodev_init_key,
> ++    cryptodev_cipher,
> ++    cryptodev_cleanup,
> ++    sizeof(struct dev_crypto_state),
> ++    EVP_CIPHER_set_asn1_iv,
> ++    EVP_CIPHER_get_asn1_iv,
> ++    NULL
> ++};
> ++
> ++const EVP_CIPHER cryptodev_aes_256_ecb =3D {
> ++    NID_aes_256_ecb,
> ++    16, 32, 16,
> ++    EVP_CIPH_ECB_MODE,
> ++    cryptodev_init_key,
> ++    cryptodev_cipher,
> ++    cryptodev_cleanup,
> ++    sizeof(struct dev_crypto_state),
> ++    EVP_CIPHER_set_asn1_iv,
> ++    EVP_CIPHER_get_asn1_iv,
> ++    NULL
> ++};
> ++
> ++const EVP_CIPHER cryptodev_aes_ctr =3D {
> ++    NID_aes_128_ctr,
> ++    16, 16, 16,
> ++    EVP_CIPH_CTR_MODE,
> ++    cryptodev_init_key,
> ++    cryptodev_cipher,
> ++    cryptodev_cleanup,
> ++    sizeof(struct dev_crypto_state),
> ++    EVP_CIPHER_set_asn1_iv,
> ++    EVP_CIPHER_get_asn1_iv,
> ++    NULL
> ++};
> ++
> ++const EVP_CIPHER cryptodev_aes_192_ctr =3D {
> ++    NID_aes_192_ctr,
> ++    16, 24, 16,
> ++    EVP_CIPH_CTR_MODE,
> ++    cryptodev_init_key,
> ++    cryptodev_cipher,
> ++    cryptodev_cleanup,
> ++    sizeof(struct dev_crypto_state),
> ++    EVP_CIPHER_set_asn1_iv,
> ++    EVP_CIPHER_get_asn1_iv,
> ++    NULL
> ++};
> ++
> ++const EVP_CIPHER cryptodev_aes_256_ctr =3D {
> ++    NID_aes_256_ctr,
> ++    16, 32, 16,
> ++    EVP_CIPH_CTR_MODE,
> ++    cryptodev_init_key,
> ++    cryptodev_cipher,
> ++    cryptodev_cleanup,
> ++    sizeof(struct dev_crypto_state),
> ++    EVP_CIPHER_set_asn1_iv,
> ++    EVP_CIPHER_get_asn1_iv,
> ++    NULL
> ++};
> ++
> ++
> + /*
> +  * Registered by the ENGINE when used to find out how to deal with
> +  * a particular NID in the ENGINE. this says what we'll do at the
> +@@ -647,6 +732,24 @@ cryptodev_engine_ciphers(ENGINE *e, const EVP_CIPHE=
R **cipher,
> +    case NID_aes_256_cbc:
> +        *cipher =3D &cryptodev_aes_256_cbc;
> +        break;
> ++    case NID_aes_128_ecb:
> ++        *cipher =3D &cryptodev_aes_ecb;
> ++        break;
> ++    case NID_aes_192_ecb:
> ++        *cipher =3D &cryptodev_aes_192_ecb;
> ++        break;
> ++    case NID_aes_256_ecb:
> ++        *cipher =3D &cryptodev_aes_256_ecb;
> ++        break;
> ++    case NID_aes_128_ctr:
> ++        *cipher =3D &cryptodev_aes_ctr;
> ++        break;
> ++    case NID_aes_192_ctr:
> ++        *cipher =3D &cryptodev_aes_192_ctr;
> ++        break;
> ++    case NID_aes_256_ctr:
> ++        *cipher =3D &cryptodev_aes_256_ctr;
> ++        break;
> +    default:
> +        *cipher =3D NULL;
> +        break;
> +--=20
> +1.8.3.2
> +
> diff --git a/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.1=
e.bbappend b/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.1e.=
bbappend
> index ecc4c31..25a665a 100644
> --- a/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.1e.bbapp=
end
> +++ b/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.1e.bbapp=
end
> @@ -10,6 +10,113 @@
>=20
> FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
>=20
> -PR_append =3D "-arago6"
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>=20
> -SRC_URI +=3D "file://0002-Modify-eng_cryptodev.c-to-make-SHA1-and-MD5-wo=
rk-wit.patch"
> +PR_append =3D "-arago7"
> +
> +DEPENDS_append_ti33x_class-target =3D " cryptodev"
> +DEPENDS_append_ti43x_class-target =3D " cryptodev"
> +DEPENDS_append_dra7xx-evm_class-target =3D " cryptodev"
> +
> +python __anonymous () {
> +    crypdep =3D d.getVar("DEPENDS").replace("ocf-linux ", "")
> +    d.setVar("DEPENDS_ti33x_class-target", crypdep)
> +    d.setVar("DEPENDS_ti43x_class-target", crypdep)
> +    d.setVar("DEPENDS_dra7xx_class-target", crypdep)
> +}
> +
> +CRYPTODEV_AFALG_PATCHES =3D " \
> +    file://0001-Add-AF_ALG-interface-support-to-OpenSSL.patch \
> +    file://0002-Modify-eng_cryptodev.c-to-make-SHA1-and-MD5-work-wit.pat=
ch \
> +    file://0004-Sample-AF_ALG-openssl.cnf.patch \
> +    file://0001-eng_cryptodev.c-update-to-cryptodev-1.6.patch \
> +    file://0009-eng_cryptodev-Add-SHA224-initialization-to-cryptodev.pat=
ch \
> +    file://0011-cryptodev-Add-AES-CBC-CTR-modes-for-128-192-256-bit-.pat=
ch \
> +"
> +
> +SRC_URI_append_ti33x_class-target =3D "${CRYPTODEV_AFALG_PATCHES}"
> +SRC_URI_append_ti43x_class-target =3D "${CRYPTODEV_AFALG_PATCHES}"
> +SRC_URI_append_dra7xx-evm_class-target =3D "${CRYPTODEV_AFALG_PATCHES}"
> +
> +# Override do_configure to replace target with linux-armv4 to enable ASM=
 code
> +# optimization for ARM arch (including armv7) for extra performance
> +do_configure () {
> +    cd util
> +    perl perlpath.pl ${STAGING_BINDIR_NATIVE}
> +    cd ..
> +    ln -sf apps/openssl.pod crypto/crypto.pod ssl/ssl.pod doc/
> +
> +    os=3D${HOST_OS}
> +    if [ "x$os" =3D "xlinux-uclibc" ]; then
> +        os=3Dlinux
> +    elif [ "x$os" =3D "xlinux-uclibceabi" ]; then
> +        os=3Dlinux
> +    elif [ "x$os" =3D "xlinux-gnueabi" ]; then
> +        os=3Dlinux
> +    fi
> +    target=3D"$os-${HOST_ARCH}"
> +    case $target in
> +    linux-arm)
> +        # target=3Dlinux-elf-arm
> +        target=3Dlinux-armv4
> +        ;;
> +    linux-armeb)
> +        target=3Dlinux-elf-armeb
> +        ;;
> +    linux-sh3)
> +        target=3Ddebian-sh3
> +        ;;
> +    linux-sh4)
> +        target=3Ddebian-sh4
> +        ;;
> +    linux-i486)
> +        target=3Ddebian-i386-i486
> +        ;;
> +    linux-i586 | linux-viac3)
> +        target=3Ddebian-i386-i586
> +        ;;
> +    linux-i686)
> +        target=3Ddebian-i386-i686/cmov
> +        ;;
> +    linux-gnux32-x86_64)
> +        target=3Dlinux-x32
> +        ;;
> +    linux-gnu64-x86_64)
> +        target=3Dlinux-x86_64
> +        ;;
> +    linux-mips)
> +        target=3Ddebian-mips
> +        ;;
> +    linux-mipsel)
> +        target=3Ddebian-mipsel
> +        ;;
> +    linux-*-mips64)
> +        target=3Dlinux-mips
> +        ;;
> +    linux-powerpc)
> +        target=3Dlinux-ppc
> +        ;;
> +    linux-gnuspe-powerpc)
> +        target=3Dlinux-ppc
> +        ;;
> +    linux-powerpc64)
> +        target=3Dlinux-ppc64
> +        ;;
> +    linux-supersparc)
> +        target=3Dlinux-sparcv8
> +        ;;
> +    linux-sparc)
> +        target=3Dlinux-sparcv8
> +        ;;
> +    darwin-i386)
> +        target=3Ddarwin-i386-cc
> +        ;;
> +    esac
> +    # inject machine-specific flags
> +    sed -i -e "s|^\(\"$target\",\s*\"[^:]\+\):\([^:]\+\)|\1:${CFLAG}|g" =
Configure
> +    useprefix=3D${prefix}
> +    if [ "x$useprefix" =3D "x" ]; then
> +        useprefix=3D/
> +    fi
> +    perl ./Configure ${EXTRA_OECONF} shared --prefix=3D$useprefix --open=
ssldir=3D${libdir}/ssl --libdir=3D`basename ${libdir}` $target
> +}
> --=20
> 1.8.3.2
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

