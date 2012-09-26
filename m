Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by arago-project.org (Postfix) with ESMTP id 6BBBD529A4
	for <meta-arago@arago-project.org>;
	Wed, 26 Sep 2012 19:13:16 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MAZ0032U1DAP7B0@vms173013.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 26 Sep 2012 14:12:53 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 728CF202A9; Wed,
	26 Sep 2012 15:12:46 -0400 (EDT)
Date: Wed, 26 Sep 2012 15:12:46 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
Message-id: <20120926191246.GH4278@denix.org>
References: <1348587310-25357-1-git-send-email-fcooper@ti.com>
MIME-version: 1.0
In-reply-to: <1348587310-25357-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] openssl: Add SHA and MD5 large file patch
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
X-List-Received-Date: Wed, 26 Sep 2012 19:13:16 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Sep 25, 2012 at 10:35:10AM -0500, Franklin S. Cooper Jr wrote:
> * Add patch that allows SHA and MD5 operations to work with large files
> * Change from PR_INC to PR_append using meta-arago-distro append naming
>   convention.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  ...cryptodev.c-to-make-SHA1-and-MD5-work-wit.patch |   59 ++++++++++++++++++++
>  .../openssl/openssl_1.0.0i.bbappend                |    8 +-
>  2 files changed, 63 insertions(+), 4 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-connectivity/openssl/openssl/0002-Modify-eng_cryptodev.c-to-make-SHA1-and-MD5-work-wit.patch
> 
> diff --git a/meta-arago-distro/recipes-connectivity/openssl/openssl/0002-Modify-eng_cryptodev.c-to-make-SHA1-and-MD5-work-wit.patch b/meta-arago-distro/recipes-connectivity/openssl/openssl/0002-Modify-eng_cryptodev.c-to-make-SHA1-and-MD5-work-wit.patch
> new file mode 100644
> index 0000000..9f3d1cb
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/openssl/openssl/0002-Modify-eng_cryptodev.c-to-make-SHA1-and-MD5-work-wit.patch
> @@ -0,0 +1,59 @@
> +From 6c7f195aadd770476b714f5c3075fbc74366d535 Mon Sep 17 00:00:00 2001
> +From: Greg Turner <gregturner@ti.com>
> +Date: Wed, 7 Mar 2012 15:45:53 -0600
> +Subject: [PATCH 2/2] Modify eng_cryptodev.c to make SHA1 and MD5 work with big file sizes
> +
> +Upstream-Status: pending
> +	* Will be submitted upstream
> +
> +---
> + crypto/engine/eng_cryptodev.c |    6 ++++++
> + 1 files changed, 6 insertions(+), 0 deletions(-)
> +
> +diff --git a/crypto/engine/eng_cryptodev.c b/crypto/engine/eng_cryptodev.c
> +index 52f4ca3..44f3c10 100644
> +--- a/crypto/engine/eng_cryptodev.c
> ++++ b/crypto/engine/eng_cryptodev.c
> +@@ -42,6 +42,8 @@
> + # endif
> + #endif
> +
> ++#define OPENSSL_CRYPTODEF_HASH_NO_ONESHOT 1
> ++
> + #ifndef HAVE_CRYPTODEV
> +
> + void
> +@@ -711,6 +713,7 @@ static int cryptodev_digest_update(EVP_MD_CTX *ctx, const void *data,
> +		return (0);
> +	}
> +
> ++#ifndef OPENSSL_CRYPTODEF_HASH_NO_ONESHOT
> +	if (!(ctx->flags & EVP_MD_CTX_FLAG_ONESHOT)) {
> +		/* if application doesn't support one buffer */
> +		state->mac_data = OPENSSL_realloc(state->mac_data, state->mac_len + count);
> +@@ -725,6 +728,7 @@ static int cryptodev_digest_update(EVP_MD_CTX *ctx, const void *data,
> +
> +		return (1);
> +	}
> ++#endif
> +
> +	memset(&cryp, 0, sizeof(cryp));
> +
> +@@ -755,6 +759,7 @@ static int cryptodev_digest_final(EVP_MD_CTX *ctx, unsigned char *md)
> +		return(0);
> +	}
> +
> ++#ifndef OPENSSL_CRYPTODEF_HASH_NO_ONESHOT
> +	if (! (ctx->flags & EVP_MD_CTX_FLAG_ONESHOT) ) {
> +		/* if application doesn't support one buffer */
> +		memset(&cryp, 0, sizeof(cryp));
> +@@ -773,6 +778,7 @@ static int cryptodev_digest_final(EVP_MD_CTX *ctx, unsigned char *md)
> +
> +		return 1;
> +	}
> ++#endif
> +
> +	memcpy(md, state->digest_res, ctx->digest->md_size);
> +
> +--
> +1.7.0.4
> diff --git a/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.0i.bbappend b/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.0i.bbappend
> index 3536316..d7c677d 100644
> --- a/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.0i.bbappend
> +++ b/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.0i.bbappend
> @@ -10,11 +10,11 @@
>  
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
> -PR = "${INC_PR}.4"

The recipe in the repository has .3 above and don't see any other patches 
pending for openssl...


> +PR_append = "-arago5"
>  
> -SRC_URI += " \
> -            file://find.pl \
> -            "
> +SRC_URI += "file://find.pl \
> +            file://0002-Modify-eng_cryptodev.c-to-make-SHA1-and-MD5-work-wit.patch \
> +"
>  
>  do_configure_prepend() {
>    cp ${WORKDIR}/find.pl ${S}/util/find.pl
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

