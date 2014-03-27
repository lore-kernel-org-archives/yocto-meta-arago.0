Return-Path: <trini@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 418E452986
	for <meta-arago@arago-project.org>;
	Thu, 27 Mar 2014 19:15:52 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s2RJFpfK004387;
	Thu, 27 Mar 2014 14:15:51 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2RJFpOQ003891;
	Thu, 27 Mar 2014 14:15:51 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 27 Mar 2014 14:15:51 -0500
Received: from [172.22.154.203] (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2RJFl3v015430;
	Thu, 27 Mar 2014 14:15:48 -0500
Message-ID: <533478D7.3060602@ti.com>
From: Tom Rini <trini@ti.com>
Organization: Texas Instruments
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@arago-project.org>
References: <1395947192-8849-1-git-send-email-denis@denix.org>
In-Reply-To: <1395947192-8849-1-git-send-email-denis@denix.org>
X-Enigmail-Version: 1.6
X-Mailman-Approved-At: Thu, 05 Jun 2014 15:53:33 +0000
Subject: Re: [PATCH] packagegroup-arago-tisdk-addons: add u-boot-fw-utils package on the target
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
Date: Thu, 27 Mar 2014 19:15:52 -0000
X-Original-Date: Thu, 27 Mar 2014 15:15:35 -0400
X-List-Received-Date: Thu, 27 Mar 2014 19:15:52 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 03/27/2014 03:06 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> Cc: Tom Rini <trini@ti.com>

Acked-by: Tom Rini <trini@ti.com>

Thanks!

> ---
>  .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb      | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index f3c20f5..0781b1b 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to install additional utilities/demos for SDKs"
>  LICENSE = "MIT"
> -PR = "r13"
> +PR = "r14"
>  
>  inherit packagegroup
>  
> @@ -17,6 +17,7 @@ UTILS = " \
>      dropbear \
>      openssh-sftp-server \
>      ptpd \
> +    u-boot-fw-utils \
>  "
>  
>  UTILS_append_ti33x = " mmc-utils"
> 


- -- 
Tom
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJTNHjXAAoJENk4IS6UOR1W8V4QAK5EmwpkJzMqV1jucR1XneX2
9RK0wqk2/NzalQ0qPAWFiBt+2rTtlHYcdgSsJbLb2bMb3lO1UuRjM3AtV7xPC6NA
AF6QgFsz0TxuDITEMS85stLyoO8nT/rJvAMCBYJrYzgJNliNFTWuSriPgSpYAWQ3
1zhLiaD05EnEW4Nao563iIiewqyW8JSgUzkUHN/0+RbwQwSHBU5vp/pAoZIU5AMz
vqJ9TFtO638rMdpOu2+p+whYrJxs4tgv1ZbavBrz/fUuT+jcicCzs82zWGohqy+S
2YiauC67I2RUFQeVviouTCiJl4bTDpxIXRFf870eZwWDqGVg7Lf2+dXJcXSyacWN
O7v9xvYKrVjX+UGYkESKGhMqT2z0QZ2gE2OWQHD6ZWtM2VBmhsSxxi/sJzr1/3Zg
3z7A4QgsUcjNaIyrsfhoFTHboevTLJxkStHfcwLu6jBC7J0fwzbo+XdMsmhLK4et
lbYkMS6x9OeEnH2FbCNLr+rJ3NwGri8Q8zl3JaEybJwbNNY0QFewtT+Phib2N0Ph
XRlwUAfNjkqXP4sEEjhUavZVVuxdv9HinqTNpzkcwMlKT7YYNeNlKY1sCXGKXWMQ
HX5KXVWgGOGMC2UfZEKUcfJ8PTxmpevIpHub6dFXd2SXrAO6s4jdu5+I4pANC1My
WXWqYUBWLb4by2NFOL6j
=NVXU
-----END PGP SIGNATURE-----

