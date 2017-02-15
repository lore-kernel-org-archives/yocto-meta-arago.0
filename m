Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id B374052996
	for <meta-arago@arago-project.org>;
	Wed, 15 Feb 2017 20:00:55 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v1FK0elT022524;
	Wed, 15 Feb 2017 14:00:40 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1FK0ZwI017631;
	Wed, 15 Feb 2017 14:00:35 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 15 Feb 2017 14:00:35 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1FK0Yl5031705;
	Wed, 15 Feb 2017 14:00:35 -0600
Date: Wed, 15 Feb 2017 15:00:34 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Douglas Royds <douglas.royds@taitradio.com>
Message-ID: <20170215200034.GA19009@edge>
References: <20170209211933.DE7C352A62@arago-project.org>
MIME-Version: 1.0
In-Reply-To: <20170209211933.DE7C352A62@arago-project.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] mtd-utils: Install renamed ubifs test scripts
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
X-List-Received-Date: Wed, 15 Feb 2017 20:00:56 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks, merged.

On Fri, Feb 10, 2017 at 10:19:26AM +1300, Douglas Royds wrote:
> When upstream moved over to the autotools, they also renamed
> tests/ubi-tests/runtests.sh and tests/ubi-tests/stress-test.sh,
> and made them autotools macro files.
> 
> See http://git.infradead.org/mtd-utils.git/commitdiff/8a00021b2ab5529640e5acaca30a27cdaca04178
> 
> Signed-off-by: Douglas Royds <douglas@taitradio.com>
> ---
>  meta-arago-extras/recipes-devtools/mtd/mtd-utils_git.bbappend | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-devtools/mtd/mtd-utils_git.bbappend b/meta-arago-extras/recipes-devtools/mtd/mtd-utils_git.bbappend
> index 5a1ad05..aadca84 100644
> --- a/meta-arago-extras/recipes-devtools/mtd/mtd-utils_git.bbappend
> +++ b/meta-arago-extras/recipes-devtools/mtd/mtd-utils_git.bbappend
> @@ -19,8 +19,8 @@ do_install_append() {
>  	install -m 0755 mkvol_bad ${D}${sbindir}/
>  	install -m 0755 mkvol_paral ${D}${sbindir}/
>  	install -m 0755 rsvol ${D}${sbindir}/
> -	install -m 0755 tests/ubi-tests/runtests.sh ${D}${sbindir}/
> -	install -m 0755 tests/ubi-tests/stress-test.sh ${D}${sbindir}/
> +	install -m 0755 tests/ubi-tests/runubitests.sh ${D}${sbindir}/
> +	install -m 0755 tests/ubi-tests/ubi-stress-test.sh ${D}${sbindir}/
>  }
> 
>  PACKAGES =+ "mtd-utils-ubifs-tests"
> @@ -36,6 +36,6 @@ ${sbindir}/mkvol_basic \
>  ${sbindir}/mkvol_bad \
>  ${sbindir}/mkvol_paral \
>  ${sbindir}/rsvol \
> -${sbindir}/runtests.sh \
> -${sbindir}/stress-test.sh \
> +${sbindir}/runubitests.sh \
> +${sbindir}/ubi-stress-test.sh \
>  "
> --
> 2.7.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

