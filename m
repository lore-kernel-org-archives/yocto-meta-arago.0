Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 2096852A5F
	for <meta-arago@arago-project.org>;
	Thu,  5 Feb 2015 15:16:55 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t15FGsph011908
	for <meta-arago@arago-project.org>; Thu, 5 Feb 2015 09:16:54 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t15FGrZu010517
	for <meta-arago@arago-project.org>; Thu, 5 Feb 2015 09:16:53 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 5 Feb 2015 09:16:53 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t15FGqSa023104;
	Thu, 5 Feb 2015 09:16:53 -0600
Date: Thu, 5 Feb 2015 10:16:52 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150205151652.GF9943@edge>
References: <1423057901-5767-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1423057901-5767-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v2] perl-native: Fix for when shebang is too many characters.
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
X-List-Received-Date: Thu, 05 Feb 2015 15:16:55 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Feb 04, 2015 at 08:51:41AM -0500, Jacob Stiffler wrote:
> * Currently perl-native is installing perl scripts with the
>   absolute path to the native  perl interpreter in the shebang.
> * Due to the directory structure of Yocto, this path may exceed
>   the shebang character limit in bash.
> * This is a workaround to get the correct perl interpreter from
>   the environment.
> * This solution has been obtained from:
>   http://patchwork.openembedded.org/patch/79251/
> * This may be dropped after migrating to dizzy as this has been
>   upstreamed: http://cgit.openembedded.org/openembedded-core/commit/?id=83dec26849a120d0f1de64e63025354fa7108491

Looks good, thanks.


> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../perl/perl-native_5.14.3.bbappend               |    9 +++++++++
>  1 file changed, 9 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-devtools/perl/perl-native_5.14.3.bbappend
> 
> diff --git a/meta-arago-extras/recipes-devtools/perl/perl-native_5.14.3.bbappend b/meta-arago-extras/recipes-devtools/perl/perl-native_5.14.3.bbappend
> new file mode 100644
> index 0000000..2b16416
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/perl/perl-native_5.14.3.bbappend
> @@ -0,0 +1,9 @@
> +
> +PR_append = "a"
> +
> +do_install_append() {
> +	for f in `grep -Il '#! *${bindir}/perl' ${D}/${bindir}/*`; do
> +		sed -i -e 's|${bindir}/perl|/usr/bin/env nativeperl|' $f
> +	done
> +}
> +
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

