Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 0736C529E0
	for <meta-arago@arago-project.org>;
	Tue,  6 Jan 2015 18:16:02 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t06IG2ac030017
	for <meta-arago@arago-project.org>; Tue, 6 Jan 2015 12:16:02 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t06IG1Nv013777
	for <meta-arago@arago-project.org>; Tue, 6 Jan 2015 12:16:02 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 6 Jan 2015 12:16:01 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t06IG1dm008416;
	Tue, 6 Jan 2015 12:16:01 -0600
Date: Tue, 6 Jan 2015 13:16:01 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150106181600.GU4759@edge>
References: <1420554312-19580-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1420554312-19580-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] perl-native: Fix for when shebang is too many characters.
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
X-List-Received-Date: Tue, 06 Jan 2015 18:16:03 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jan 06, 2015 at 09:25:12AM -0500, Jacob Stiffler wrote:
>  * Solution obtained from http://patchwork.openembedded.org/patch/79251/

Thanks. The patch itself is fine, I just wanted to see a bit more description, 
maybe even mentioning that it got accepted upstream and this bbappend should 
be dropped once we migrate to dizzy:

http://cgit.openembedded.org/openembedded-core/commit/?id=83dec26849a120d0f1de64e63025354fa7108491


> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../perl/perl-native_5.14.3.bbappend               |    9 +++++++++
>  1 file changed, 9 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-devtools/perl/perl-native_5.14.3.bbappend
> 
> diff --git a/meta-arago-extras/recipes-devtools/perl/perl-native_5.14.3.bbappend b/meta-arago-extras/recipes-devtools/perl/perl-native_5.14.3.bbappend
> new file mode 100644
> index 0000000..8639d5b
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/perl/perl-native_5.14.3.bbappend
> @@ -0,0 +1,9 @@
> +
> +PR_append = "-arago0"
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

